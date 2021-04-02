//
// File:        cordic_sincos.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Top-level wrapper for a pipelined CORDIC block
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
import pkg_cordic_sincos::*;

module cordic_sincos #(
  parameter STAGES,    // # of pipeline stages = [1,48]
  parameter BITS       // # datapath bitwidth  = [4,48]
)
(
  input wire                        i_clk,
  input wire                        i_rst_n,
  input wire                        i_pipeline_en,
  input wire                        i_start,
  input wire signed     [BITS-1:0]  i_theta,            // -2pi to 2pi (upper 4b are signed integer)
  output wire                       o_done,
  output wire signed    [BITS-1:0]  o_sin_theta,        // -1 to 1-(2^BITS) (upper 2b are signed integer)
  output wire signed    [BITS-1:0]  o_cos_theta         // -1 to 1-(2^BITS) (upper 2b are signed integer)
);

  logic signed              valid   [STAGES + 1];
  logic signed              sign    [STAGES + 1];
  logic signed [BITS-1:0]   cos     [STAGES + 1];
  logic signed [BITS-1:0]   sin     [STAGES + 1];
  logic signed [BITS-1:0]   theta   [STAGES + 1];
  
  // CORDIC PREPROCESSING STAGE
  cordic_sincos_preprocess #(
    .STAGES     (STAGES),
    .BITS       (BITS)
  ) 
  cordic_preprocess_inst (
    .i_clk,
    .i_rst_n,
    .i_pipeline_en,
    .i_start,
    .i_theta,
    .o_valid    ( valid [0]),
    .o_sign     ( sign  [0]),
    .o_cos      ( cos   [0]),
    .o_sin      ( sin   [0]),
    .o_theta    ( theta [0])
  );
  
  // CORDIC PIPELINE STAGES
  genvar i;
  generate
    for (i = 0; i < STAGES; i++) begin : CORDIC_STAGES_GEN 
        cordic_sincos_stage #(
          .BITS     (BITS),
          .STAGE    (i)
        )
        cordic_inst_i (
          .i_clk,
          .i_rst_n,
          .i_pipeline_en,
          .i_valid  ( valid  [i]),
          .i_sign   ( sign   [i]),
          .i_cos    ( cos    [i]),
          .i_sin    ( sin    [i]),
          .i_theta  ( theta  [i]),
          .o_valid  ( valid  [i+1]),
          .o_sign   ( sign   [i+1]),
          .o_cos    ( cos    [i+1]),
          .o_sin    ( sin    [i+1]),
          .o_theta  ( theta  [i+1])
        );
    end
  endgenerate
    
  // OUTPUTS
  assign o_done         = valid [STAGES];
  assign o_sin_theta    = sin   [STAGES];
  assign o_cos_theta    = cos   [STAGES];

endmodule