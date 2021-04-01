//
// File:        cordic_sincos_preprocess.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Data preprocessing pipeline stage for the input theta. Includes
//              angle and sign correction as well as initial register settings.
//

`default_nettype none
import pkg_cordic_sincos::*;

module cordic_sincos_preprocess #(
  parameter STAGES,
  parameter BITS
) 
(
  input wire                    i_clk,
  input wire                    i_rst_n,
  input wire                    i_pipeline_en,
  input wire                    i_start,
  input wire signed [BITS-1:0]  i_theta,
  output wire                   o_valid,
  output wire                   o_sign,
  output wire signed [BITS-1:0] o_cos,
  output wire signed [BITS-1:0] o_sin,
  output wire signed [BITS-1:0] o_theta
);

  // Full range of input is [-2pi, 2pi]. The max rotation range is +/- pi/2, so the input
  // angle must be corrected should it be beyond this limit.
  
  // If input is in range [-pi/2, pi/2], no angle correction needed.
  // If input is in range (pi/2, 3pi/2], subtract input angle by pi and invert sign of results
  // If input is in range (3pi/2, 2pi], subtract input angle by 2pi
  // If input is in range [-3pi/2, -pi/2), add pi to input angle and invert sign of results
  // If input is in range [-2pi, -3pi/2), add 2pi to input angle
  
  // PRE-PROCESSING PIPELINE STAGE 1
  logic valid_p1;
  logic signed [BITS-1:0] theta_p1;
  
  always_ff @(posedge i_clk or negedge i_rst_n)
    if (!i_rst_n) begin
      valid_p1  <= 1'b0;
      theta_p1  <= '0;
    end else if (i_pipeline_en) begin           
      valid_p1  <= i_start;
      theta_p1  <= i_theta;
    end

  // PRE-PROCESSING PIPELINE STAGE 2
  logic valid_p2;
  logic signed [BITS-1:0] theta_p2;
  logic sign_p2;

  logic signed [BITS-1:0] PI_DIV_2_n, PI_n, PI_MULT_3_DIV_2_n, PI_MULT_2_n;
  assign PI_DIV_2_n         = round(PI_DIV_2, BITS)         >>> (MAX_D_WIDTH - BITS);
  assign PI_n               = round(PI, BITS)               >>> (MAX_D_WIDTH - BITS);
  assign PI_MULT_3_DIV_2_n  = round(PI_MULT_3_DIV_2, BITS)  >>> (MAX_D_WIDTH - BITS);
  assign PI_MULT_2_n        = round(PI_MULT_2, BITS)        >>> (MAX_D_WIDTH - BITS);
  
  logic signed [BITS-1:0] theta_w2;
  assign theta_w2 = ( theta_p1 > PI_MULT_3_DIV_2_n )    ?   theta_p1 - PI_MULT_2 :
                    ( theta_p1 > PI_DIV_2_n )           ?   theta_p1 - PI :
                    ( theta_p1 < -PI_MULT_3_DIV_2_n )   ?   theta_p1 + PI_MULT_2 :
                    ( theta_p1 < -PI_DIV_2_n )          ?   theta_p1 + PI :
                                                            theta_p1;

  logic sign_w2;
  assign sign_w2 =  ( theta_p1 > PI_MULT_3_DIV_2_n )    ?   1'b0 :
                    ( theta_p1 > PI_DIV_2_n )           ?   1'b1 :
                    ( theta_p1 < -PI_MULT_3_DIV_2_n )   ?   1'b0 :
                    ( theta_p1 < -PI_DIV_2_n )          ?   1'b1 :
                                                            1'b0;
    
  always_ff @(posedge i_clk or negedge i_rst_n)
    if (!i_rst_n) begin
      valid_p2  <= 1'b0;
      theta_p2  <= '0;
      sign_p2   <= 1'b0;
    end else if (i_pipeline_en) begin           
      valid_p2  <= valid_p1;
      theta_p2  <= theta_w2;
      sign_p2   <= sign_w2;
    end
    
  // Assign preprocessing outputs (ready for the main CORDIC stages!)
  assign o_valid    = valid_p2;
  assign o_sign     = sign_p2;
  assign o_cos      = round(K[STAGES-1], BITS) >>> (MAX_D_WIDTH - BITS);
  assign o_sin      = '0;
  assign o_theta    = theta_p2 << 2;
  
endmodule