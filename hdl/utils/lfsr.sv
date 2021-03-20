`default_nettype none

module lfsr #(
  parameter N = 8,
  parameter [7:0] poly = 8'h9b
)
  (
    input wire i_clk,
    input wire i_rst_n,
    input wire i_count_en,
    input wire i_load,
    input wire [N-1:0] i_seed,
    output reg [N-1:0] o_lfsr
  );
  
  always_ff @(posedge i_clk or negedge i_rst_n)
    if (!i_rst_n)           o_lfsr  <= '0;
    else if (i_load)        o_lfsr  <= i_seed;
    else if (i_count_en)    o_lfsr  <= {o_lfsr[N-2:0], 1'b0} ^ (poly & {N{o_lfsr[N-1]}});
 
endmodule