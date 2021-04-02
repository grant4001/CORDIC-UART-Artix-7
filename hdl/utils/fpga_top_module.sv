//
// File:        fpga_top_module.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: FPGA top-level wrapping the top module of the design blocks and FPGA-related resources
//              like clocking and LEDs
//

`default_nettype none

module fpga_top_module 
  (
    input wire i_clk,
    input wire i_rst_n,
    input wire i_rx,
    output wire o_tx,
    output wire [3:0] led
  );

  logic pll_clk, pll_locked, o_rx_err, o_rx_msg_err;
  logic o_cordic_pipeline_en;

  // LEDs
  assign led = {o_cordic_pipeline_en, o_rx_msg_err, o_rx_err, sync_rst_n};

  // Reset synchronizer for PLL
  logic [1:0] sync_reg;
  logic sync_rst_n;

  always_ff @(posedge i_clk or negedge i_rst_n)
    if (!i_rst_n) sync_reg <= 2'b00;
    else          sync_reg <= {sync_reg[0], 1'b1};

  assign sync_rst_n = sync_reg[1];

  clk_wiz_0 clk_wiz_0_inst (
      .clk_in1  (i_clk),
      .resetn   (sync_rst_n),
      .clk_out1 (pll_clk),
      .locked   (pll_locked)
  );

  top_module #( .CLK_FREQ ( 100_000_000 ),
                .BAUD_RATE( 3_000_000 ) )
  top_module_inst (
      .i_clk    (pll_clk),
      .i_rst_n  (i_rst_n),
      .i_rx     (i_rx),
      .o_tx     (o_tx),
      .o_rx_err (o_rx_err),
      .o_rx_msg_err (o_rx_msg_err),
      .o_cordic_pipeline_en (o_cordic_pipeline_en)
  );

endmodule