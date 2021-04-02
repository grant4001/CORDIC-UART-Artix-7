//
// File:        top_module.sv
// Author:      Grant Yu
// Date:        04/2021
// Description: Top-level echo test module
//

`default_nettype none

module top_module #(CLK_FREQ, BAUD_RATE)
  (
    input wire i_clk,
    input wire i_rst_n,
    input wire i_rx,
    output wire o_tx
  );
  
  logic [7:0] rx_byte;
  logic rx_byte_valid, rx_err;
  
  // UART RX
  uart_rx #(
    .CLK_FREQ_MHZ   (CLK_FREQ),
    .BAUD_RATE      (BAUD_RATE),
    .OVERSAMPLE_RATE(16),
    .NUM_DATA_BITS  (8),
    .PARITY_ON      (1),
    .PARITY_EO      (1)
  ) uart_rx_module (
    .i_clk,
    .i_rst_n,
    .i_rx,
    .o_rx_byte      (rx_byte),
    .o_rx_byte_valid(rx_byte_valid),
    .o_rx_err       (rx_err)
  );
  
  logic [7:0] tx_byte;
  logic tx_byte_valid;
  
  // Echo
  assign tx_byte = rx_byte + 1;
  assign tx_byte_valid = rx_byte_valid;
  
  logic fifo_wr_en, fifo_rd_en, fifo_full, fifo_empty;
  logic [7:0] fifo_wr_data, fifo_rd_data;
  
  assign fifo_wr_en = ((tx_byte_valid)&&(!fifo_full));
  assign fifo_wr_data = tx_byte;
  
  // FIFO between TX MSG and TX
  sync_fifo #(
    .WIDTH  (8),
    .DEPTH  (64)
  ) sync_fifo_inst (
    .i_clk,
    .i_rst_n,
    .i_wr_en    (fifo_wr_en),
    .i_rd_en    (fifo_rd_en),
    .i_wr_data  (fifo_wr_data),
    .o_rd_data  (fifo_rd_data),
    .o_full     (fifo_full),
    .o_empty    (fifo_empty)
  );
  
  // UART TX
  uart_tx #(
    .CLK_FREQ_MHZ     (CLK_FREQ),
    .BAUD_RATE        (BAUD_RATE),
    .NUM_DATA_BITS    (8),
    .PARITY_ON        (1),
    .PARITY_EO        (1),
    .NUM_STOP_BITS    (1)
  ) uart_tx_module (
    .i_clk,
    .i_rst_n,
    .i_fifo_empty     (fifo_empty),
    .i_fifo_rd_data   (fifo_rd_data),
    .o_fifo_rd_en     (fifo_rd_en),
    .o_tx
  );
    
endmodule