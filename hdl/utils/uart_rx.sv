//
// File:        uart_rx.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Generic parametrized UART receiver module 
//

`default_nettype none

module uart_rx #(
  parameter CLK_FREQ_MHZ    = 100_000_000,
  parameter BAUD_RATE       =   3_000_000,
  parameter OVERSAMPLE_RATE =          16, // Common choices: 8 or 16
  parameter NUM_DATA_BITS   =           8, // Within 5-9
  parameter PARITY_ON       =           1, // 0: Parity disabled. 1: Parity enabled.
  parameter PARITY_EO       =           1  // 0: Even parity. 1: Odd parity.
)
  (
    input wire                      i_clk,
    input wire                      i_rst_n,
    input wire                      i_rx,
    output reg  [NUM_DATA_BITS-1:0] o_rx_byte,
    output reg                      o_rx_byte_valid,
    output reg                      o_rx_err
  );
  
  // Parity even/odd encoding
  localparam EVEN_PAR = 0;
  localparam ODD_PAR  = 1;
  
  // Synchronize rx line into FPGA clock domain
  logic [2:0] rx_sync;
  logic rx;
  
  assign rx = rx_sync[2];
  
  always @(posedge i_clk)
    if (!i_rst_n) rx_sync <= 3'b000;
    else          rx_sync <= {rx_sync[1:0], i_rx};
  
  // Oversample pulse generation
  localparam OVERSAMP_PULSEGEN_MAX = int'(real'(CLK_FREQ_MHZ) / (real'(BAUD_RATE)*real'(OVERSAMPLE_RATE)));  
  logic [$clog2(OVERSAMP_PULSEGEN_MAX)-1:0] oversamp_pulsegen;
  
  // Oversample counter
  localparam OVERSAMP_CNT_MAX = OVERSAMPLE_RATE;
  logic [$clog2(OVERSAMP_CNT_MAX)-1:0] oversamp_cnt;
  
  // Byte index register
  logic [$clog2(NUM_DATA_BITS)-1:0] idx;
  
  // Control FSM
  typedef enum {RX_START, 
                RX_DATA, 
                RX_PARITY,
                RX_STOP} state_t;
  state_t state;
  
  always_ff @(posedge i_clk)
    if (!i_rst_n) begin
      oversamp_pulsegen <= '0;
      oversamp_cnt      <= '0;
      idx               <= '0;
      o_rx_byte         <= '0;
      o_rx_err          <= 1'b0;
      o_rx_byte_valid   <= 1'b0;
      state             <= RX_START;
    end else begin
      case (state)
      
        RX_START: begin
          
          o_rx_err          <= 1'b0;
          o_rx_byte_valid   <= 1'b0;
          
          if (!rx) begin
            oversamp_pulsegen   <= oversamp_pulsegen + 1;
            if (oversamp_pulsegen == OVERSAMP_PULSEGEN_MAX - 1) begin
              oversamp_pulsegen <= '0;
              oversamp_cnt      <= oversamp_cnt + 1;
              if (oversamp_cnt == OVERSAMP_CNT_MAX/2 - 1) begin
                oversamp_cnt    <= '0;
                state           <= RX_DATA;
              end
            end
          end else begin
            oversamp_pulsegen   <= '0;  
            oversamp_cnt        <= '0;
          end
                        
        end
        
        RX_DATA: begin
          
          o_rx_err          <= 1'b0;
          o_rx_byte_valid   <= 1'b0;
          
          oversamp_pulsegen     <= oversamp_pulsegen + 1;
          if (oversamp_pulsegen == OVERSAMP_PULSEGEN_MAX - 1) begin
              oversamp_pulsegen <= '0;
              oversamp_cnt      <= oversamp_cnt + 1;
              if (oversamp_cnt == OVERSAMP_CNT_MAX - 1) begin
                oversamp_cnt        <= '0;
                idx                 <= idx + 1;
                o_rx_byte           <= {rx, o_rx_byte[NUM_DATA_BITS-1:1]};
                if (idx == NUM_DATA_BITS - 1)
                  if (PARITY_ON)
                    state           <= RX_PARITY;
                  else
                    state           <= RX_START;
              end
          end
          
        end
        
        RX_PARITY: begin
          
          o_rx_err          <= 1'b0;
          o_rx_byte_valid   <= 1'b0;
          
          oversamp_pulsegen     <= oversamp_pulsegen + 1;
          if (oversamp_pulsegen == OVERSAMP_PULSEGEN_MAX - 1) begin
              oversamp_pulsegen <= '0;
              oversamp_cnt      <= oversamp_cnt + 1;
              if (oversamp_cnt == OVERSAMP_CNT_MAX - 1) begin
                oversamp_cnt    <= '0;
                state           <= RX_STOP;
                o_rx_err        <= ( (PARITY_EO==EVEN_PAR && ((^o_rx_byte) ^ rx)) || 
                                     (PARITY_EO==ODD_PAR  && ~((^o_rx_byte) ^ rx)) );
                o_rx_byte_valid <= ( (PARITY_EO==EVEN_PAR && ~((^o_rx_byte) ^ rx)) || 
                                     (PARITY_EO==ODD_PAR  && ((^o_rx_byte) ^ rx)) );
              end
          end
          
        end
        
        RX_STOP: begin
        
          o_rx_err          <= 1'b0;
          o_rx_byte_valid   <= 1'b0;
          
          oversamp_pulsegen     <= oversamp_pulsegen + 1;
          if (oversamp_pulsegen == OVERSAMP_PULSEGEN_MAX - 1) begin
              oversamp_pulsegen <= '0;
              oversamp_cnt      <= oversamp_cnt + 1;
              if (oversamp_cnt == OVERSAMP_CNT_MAX - 1 && rx) begin
                oversamp_cnt    <= '0;
                state           <= RX_START;
              end
          end
        
        end
        
        default: begin
          
          oversamp_pulsegen <= '0;
          oversamp_cnt      <= '0;
          idx               <= '0;
          o_rx_byte         <= '0;
          o_rx_err          <= 1'b0;
          o_rx_byte_valid   <= 1'b0;
          state             <= RX_START;
          
        end
          
      endcase
    end
  
  
endmodule