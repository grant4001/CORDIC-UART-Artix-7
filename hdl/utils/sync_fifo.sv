//
// File:        sync_fifo.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Generic parametrized synchronous FIFO using a block RAM implementation. Has access
//              to 2^WIDTH memory slots and internal write/read pointer widths of WIDTH+1.
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

module sync_fifo #(
    parameter WIDTH = 8,
    parameter DEPTH = 64
)
(
    input wire i_clk,
    input wire i_rst_n,
    input wire i_wr_en,
    input wire i_rd_en,
    input wire [WIDTH-1:0] i_wr_data,
    output reg [WIDTH-1:0] o_rd_data,
    output wire o_full,
    output wire o_empty
);

localparam ADDR_WIDTH = $clog2(DEPTH);

// pointers
logic [ADDR_WIDTH:0] rd_ptr, wr_ptr;

// ram write enable
logic ram_wr_en;

// block ram instance
bram #(
    .ADDR_WIDTH (ADDR_WIDTH),
    .DEPTH      (DEPTH),
    .DATA_WIDTH (WIDTH)
) bram_inst (
    .i_clk_wr   (i_clk),
    .i_clk_rd   (i_clk),
    .i_rst_n    (i_rst_n),
    .i_wr_en    (ram_wr_en),
    .i_wr_data  (i_wr_data),
    .i_wr_addr  (wr_ptr[ADDR_WIDTH-1:0]),
    .i_rd_addr  (rd_ptr[ADDR_WIDTH-1:0]),
    .o_rd_data  (o_rd_data)
);

assign ram_wr_en    = ((i_wr_en)&&(!o_full));
assign o_empty      = (wr_ptr==rd_ptr);
assign o_full       = (wr_ptr=={~rd_ptr[ADDR_WIDTH],
                                 rd_ptr[ADDR_WIDTH-1:0]});

always_ff @(posedge i_clk)
    if (~i_rst_n) begin
        rd_ptr  <= '0;
        wr_ptr  <= '0;
    end else begin
        if (i_wr_en) wr_ptr  <= wr_ptr + 1;
        if (i_rd_en) rd_ptr  <= rd_ptr + 1;
    end

endmodule