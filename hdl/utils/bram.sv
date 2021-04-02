//
// File:        bram.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Generic parametrized block RAM with synchronous read and write
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

always_ff @(posedge i_clk_rd)
    if (!i_rst_n) o_rd_data <= '0;
    else          o_rd_data <= mem[i_rd_addr];
    
endmodule