`default_nettype none

module bram #(
    parameter ADDR_WIDTH    = 8,
    parameter DEPTH         = 256,
    parameter DATA_WIDTH    = 8
)
(
    input wire                     i_clk_wr, 
    input wire                     i_clk_rd, 
    input wire                     i_rst_n,
    input wire                     i_wr_en, 
    input wire [DATA_WIDTH-1:0]    i_wr_data, 
    input wire [ADDR_WIDTH-1:0]    i_wr_addr, 
    input wire [ADDR_WIDTH-1:0]    i_rd_addr, 
    output reg [DATA_WIDTH-1:0]    o_rd_data
);

logic [DATA_WIDTH-1:0] mem [DEPTH-1:0];

always_ff @(posedge i_clk_wr)
    if (i_wr_en) mem[i_wr_addr]  <= i_wr_data;

always_ff @(posedge i_clk_rd or negedge i_rst_n)
    if (!i_rst_n) o_rd_data <= '0;
    else          o_rd_data <= mem[i_rd_addr];
    
endmodule