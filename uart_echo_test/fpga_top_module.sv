//
// File:        fpga_top_module.sv
// Author:      Grant Yu
// Date:        04/2021
// Description: FPGA top-level wrapping of echo test
//

`default_nettype none

module fpga_top_module 
  (
    input wire i_clk,
    input wire i_rst_n,
    input wire i_rx,
    output wire o_tx
  );

  logic pll_clk, pll_locked;

  clk_wiz_0 clk_wiz_0_inst (
      .clk_in1  (i_clk),
      .resetn   (i_rst_n),
      .clk_out1 (pll_clk),
      .locked   (pll_locked)
  );

  top_module #( .CLK_FREQ ( 100_000_000 ),
                .BAUD_RATE( 19_200 ) )
  top_module_inst (
      .i_clk    (pll_clk),
      .i_rst_n  (i_rst_n),
      .i_rx     (i_rx),
      .o_tx     (o_tx)
  );

endmodule