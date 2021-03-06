//
// File:        uart_tx_msg.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: This module transmits UART messages based on a custom messaging protocol used to communicate
//              with the CORDIC module realized in the FPGA.
//
// Copyright (C) 2021, Grant Yu
//
// This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
// 
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
// 
//    You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

`default_nettype none

import pkg_msg::*;

module uart_tx_msg (
    input wire      i_clk,
    input wire      i_rst_n,
    
    // from uart_rx_msg
    input wire [7:0]    i_cmd_reg,
    input wire          i_cmd_valid,
    input wire [7:0]    i_burst_cnt,
    input wire          i_burst_cnt_valid,
    input wire          i_rx_msg_err,
    
    // from cordic
    input wire [47:0]   i_cordic_sin_theta,
    input wire [47:0]   i_cordic_cos_theta,
    input wire          i_cordic_done,
    
    // to uart tx
    output reg [7:0]    o_tx_byte,
    output reg          o_tx_byte_valid
  );
  
  // LFSR to calculate CRC8
  logic lfsr_count_en, lfsr_load;
  logic [7:0] lfsr_seed, lfsr_reg;
  
  lfsr #(
    .N      (8),
    .poly   (POLY)
  ) lfsr_inst (
    .i_clk,
    .i_rst_n,
    .i_count_en (lfsr_count_en),
    .i_load     (lfsr_load),
    .i_seed     (lfsr_seed),
    .o_lfsr     (lfsr_reg)
  );
  
  // LFSR control FSM
  typedef enum {LFSR_STATE_LOAD, 
                LFSR_STATE_COUNT,
                LFSR_DONE} lfsr_state_t;
  lfsr_state_t lfsr_state;
  logic [3:0] count2eight;
  logic crc_byte_done;
    
  always_ff @(posedge i_clk)
    if (!i_rst_n) begin
        count2eight         <= '0;
        crc_byte_done       <= 1'b0;
        lfsr_load           <= 1'b0;
        lfsr_count_en       <= 1'b0;
        lfsr_seed           <= '0;
        lfsr_state          <= LFSR_STATE_LOAD;
    end else begin
      
      crc_byte_done     <= 1'b0;
      lfsr_load         <= 1'b0;
      lfsr_count_en     <= 1'b0;
      
      case (lfsr_state) 
        LFSR_STATE_LOAD: begin
          if (o_tx_byte_valid) begin
            lfsr_load   <= 1'b1;
            lfsr_seed   <= lfsr_reg^o_tx_byte;
            lfsr_state  <= LFSR_STATE_COUNT;
          end
        end
        LFSR_STATE_COUNT: begin
          lfsr_count_en <= 1'b1;
          count2eight   <= count2eight + 1;
          if (count2eight == 7) begin
            count2eight     <= '0;
            lfsr_state      <= LFSR_DONE;
          end
        end
        LFSR_DONE: begin
            crc_byte_done   <= 1'b1;
            lfsr_state      <= LFSR_STATE_LOAD;
        end
        default: begin
          crc_byte_done     <= 1'b0;
          count2eight       <= '0;
          lfsr_load         <= 1'b0;
          lfsr_count_en     <= 1'b0;
          lfsr_seed         <= '0;
          lfsr_state        <= LFSR_STATE_LOAD;
        end

      endcase
      
      if (i_rx_msg_err) begin
          crc_byte_done     <= 1'b0;
          count2eight       <= '0;
          lfsr_load         <= 1'b0;
          lfsr_count_en     <= 1'b0;
          lfsr_seed         <= '0;
          lfsr_state        <= LFSR_STATE_LOAD;
      end
    end
  
  // FSM to recognize current operating cmd (length of operands needed for range cmd)
  // Once cmd is recognized, accept cordic outputs and transmit byte-wise to uart_tx along w/ crc
  typedef enum {STATE_IDLE,
                STATE_SINGLE_TRANS,
                STATE_SINGLE_TRANS_II,
                STATE_SINGLE_TRANS_III,
                STATE_BURST_TRANS,
                STATE_BURST_TRANS_II,
                STATE_BURST_TRANS_III,
                STATE_BURST_TRANS_IV,
                STATE_BURST_TRANS_V,
                STATE_DISABLE,
                STATE_DISABLE_II,
                STATE_ENABLE,
                STATE_ENABLE_II,
                STATE_TX_CRC8
               } tx_msg_state_t;
  tx_msg_state_t tx_msg_state;

  logic [7:0] bytes2send [12];
  logic [3:0] byte_cnt;
  logic [7:0] burst_cnt;
  
  always_ff @(posedge i_clk)
    if (!i_rst_n) begin
      tx_msg_state      <= STATE_IDLE;
      bytes2send        <= '{default:'0};
      byte_cnt          <= '0;
      burst_cnt         <= '0;
      o_tx_byte_valid   <= 1'b0;
      o_tx_byte         <= '0;
    end else begin
    
        o_tx_byte_valid <= 1'b0;
        o_tx_byte       <= '0;
    
      case (tx_msg_state)
        STATE_IDLE: begin
            if (i_cmd_valid) begin
                case (i_cmd_reg) 
                    CMD_SINGLE_TRANS:   tx_msg_state  <= STATE_SINGLE_TRANS;
                    CMD_BURST_TRANS:    tx_msg_state  <= STATE_BURST_TRANS;
                    CMD_DISABLE:        tx_msg_state  <= STATE_DISABLE;
                    CMD_ENABLE:         tx_msg_state  <= STATE_ENABLE;
                    default:            tx_msg_state  <= STATE_IDLE;
                endcase
            end
        end
        STATE_SINGLE_TRANS: begin
            byte_cnt            <= 12;
            if (i_cordic_done) begin
                for (int i = 0; i < 6; i++) begin
                    bytes2send[i]       <= i_cordic_cos_theta[(8*i)+7 -: 8];
                    bytes2send[i+6]     <= i_cordic_sin_theta[(8*i)+7 -: 8];
                end
                o_tx_byte_valid     <= 1'b1;
                o_tx_byte           <= BYTE_HEADER;
                tx_msg_state        <= STATE_SINGLE_TRANS_II;
            end

            if (i_cmd_valid) begin
                case (i_cmd_reg) 
                    CMD_SINGLE_TRANS:   tx_msg_state  <= STATE_SINGLE_TRANS;
                    CMD_BURST_TRANS:    tx_msg_state  <= STATE_BURST_TRANS;
                    CMD_DISABLE:        tx_msg_state  <= STATE_DISABLE;
                    CMD_ENABLE:         tx_msg_state  <= STATE_ENABLE;
                    default:            tx_msg_state  <= STATE_IDLE;
                endcase
            end
        end
        STATE_SINGLE_TRANS_II: begin
            if (crc_byte_done) begin
                o_tx_byte_valid         <= 1'b1;
                o_tx_byte               <= CMD_SINGLE_TRANS;
                tx_msg_state            <= STATE_SINGLE_TRANS_III;
            end
        end
        STATE_SINGLE_TRANS_III: begin
            o_tx_byte_valid         <= 1'b0;
            o_tx_byte               <= '0;
            if (crc_byte_done) begin
                o_tx_byte_valid     <= 1'b1;
                o_tx_byte           <= bytes2send[12 - byte_cnt];
                byte_cnt            <= byte_cnt - 1;
                if (byte_cnt == 1) begin
                    tx_msg_state    <= STATE_TX_CRC8;
                end
            end
        end
        STATE_BURST_TRANS: begin
            if (i_burst_cnt_valid) begin
                burst_cnt       <= i_burst_cnt;
            end
            byte_cnt            <= 12;
            if (i_cordic_done) begin
                for (int i = 0; i < 6; i++) begin
                    bytes2send[i]       <= i_cordic_cos_theta[(8*i)+7 -: 8];
                    bytes2send[i+6]     <= i_cordic_sin_theta[(8*i)+7 -: 8];
                end
                o_tx_byte_valid     <= 1'b1;
                o_tx_byte           <= BYTE_HEADER;
                tx_msg_state        <= STATE_BURST_TRANS_II;
            end

            if (i_cmd_valid) begin
                case (i_cmd_reg) 
                    CMD_SINGLE_TRANS:   tx_msg_state  <= STATE_SINGLE_TRANS;
                    CMD_BURST_TRANS:    tx_msg_state  <= STATE_BURST_TRANS;
                    CMD_DISABLE:        tx_msg_state  <= STATE_DISABLE;
                    CMD_ENABLE:         tx_msg_state  <= STATE_ENABLE;
                    default:            tx_msg_state  <= STATE_IDLE;
                endcase
            end
        end
        STATE_BURST_TRANS_II: begin
            if (crc_byte_done) begin
                o_tx_byte_valid         <= 1'b1;
                o_tx_byte               <= CMD_BURST_TRANS;
                tx_msg_state            <= STATE_BURST_TRANS_III;
            end
        end
        STATE_BURST_TRANS_III: begin
            if (crc_byte_done) begin
                o_tx_byte_valid         <= 1'b1;
                o_tx_byte               <= burst_cnt;
                tx_msg_state            <= STATE_BURST_TRANS_V;
            end
        end
        STATE_BURST_TRANS_IV: begin
            byte_cnt            <= 11;
            if (i_cordic_done) begin
                for (int i = 0; i < 6; i++) begin
                    bytes2send[i]       <= i_cordic_cos_theta[(8*i)+7 -: 8];
                    bytes2send[i+6]     <= i_cordic_sin_theta[(8*i)+7 -: 8];
                end
                o_tx_byte_valid     <= 1'b1;
                o_tx_byte           <= i_cordic_cos_theta[7:0];
                tx_msg_state        <= STATE_BURST_TRANS_V;
            end
        end
        STATE_BURST_TRANS_V: begin
            if (crc_byte_done) begin
                o_tx_byte_valid     <= 1'b1;
                o_tx_byte           <= bytes2send[12 - byte_cnt];
                byte_cnt            <= byte_cnt - 1;
                if (byte_cnt == 1) begin
                    burst_cnt           <= burst_cnt - 1;
                    if (burst_cnt == 1)
                        tx_msg_state    <= STATE_TX_CRC8;
                    else
                        tx_msg_state    <= STATE_BURST_TRANS_IV;
                end
            end
        end
        STATE_DISABLE: begin
            o_tx_byte_valid     <= 1'b1;
            o_tx_byte           <= BYTE_HEADER;
            tx_msg_state        <= STATE_DISABLE_II;
        end
        STATE_DISABLE_II: begin
            if (crc_byte_done) begin
                o_tx_byte_valid     <= 1'b1;
                o_tx_byte           <= CMD_DISABLE;
                tx_msg_state        <= STATE_TX_CRC8;
            end
        end
        STATE_ENABLE: begin
            o_tx_byte_valid     <= 1'b1;
            o_tx_byte           <= BYTE_HEADER;
            tx_msg_state        <= STATE_ENABLE_II;
        end
        STATE_ENABLE_II: begin
            if (crc_byte_done) begin
                o_tx_byte_valid     <= 1'b1;
                o_tx_byte           <= CMD_ENABLE;
                tx_msg_state        <= STATE_TX_CRC8;
            end
        end
        STATE_TX_CRC8: begin
            if (crc_byte_done) begin
                o_tx_byte_valid     <= 1'b1;
                o_tx_byte           <= lfsr_reg;
                tx_msg_state        <= STATE_IDLE;
            end
        end
        default: begin
              tx_msg_state      <= STATE_IDLE;
              o_tx_byte_valid   <= 1'b0;
              o_tx_byte         <= '0;
              bytes2send        <= '{default:'0};
              byte_cnt          <= '0;
              burst_cnt         <= '0;
        end
      endcase
      
      if (i_rx_msg_err) begin
          tx_msg_state      <= STATE_IDLE;
          bytes2send        <= '{default:'0};
          byte_cnt          <= '0;
          burst_cnt         <= '0;
          o_tx_byte_valid   <= 1'b0;
          o_tx_byte         <= '0;
      end
      
    end
  
endmodule