//
// File:        lfsr.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Generic Galois-type LFSR with parametrized generator polynomial and 
//              flow control signals including a load and count_enable signal.
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
  
  always_ff @(posedge i_clk)
    if (!i_rst_n)           o_lfsr  <= '0;
    else if (i_load)        o_lfsr  <= i_seed;
    else if (i_count_en)    o_lfsr  <= {o_lfsr[N-2:0], 1'b0} ^ (poly & {N{o_lfsr[N-1]}});
 
endmodule