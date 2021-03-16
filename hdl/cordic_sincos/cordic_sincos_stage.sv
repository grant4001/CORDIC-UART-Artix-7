`default_nettype none
import pkg_cordic_sincos::*;

module cordic_sincos_stage #(
  parameter BITS,
  parameter STAGE
) 
(
  input wire                    i_clk,
  input wire                    i_rst_n,
  input wire                    i_pipeline_en,
  input wire                    i_valid,
  input wire                    i_sign,
  input wire signed [BITS-1:0]  i_cos,
  input wire signed [BITS-1:0]  i_sin,
  input wire signed [BITS-1:0]  i_theta,
  output reg                    o_valid,
  output reg                    o_sign,
  output reg signed [BITS-1:0]  o_cos,
  output reg signed [BITS-1:0]  o_sin,
  output reg signed [BITS-1:0]  o_theta
);
  
  logic signed [BITS-1:0] delta_cos, delta_sin, delta_theta;
  assign delta_cos   = ( i_theta[BITS-1] ?  i_sin : -i_sin ) >>> STAGE;
  assign delta_sin   = ( i_theta[BITS-1] ? -i_cos :  i_cos ) >>> STAGE;
  assign delta_theta = ( i_theta[BITS-1] ? round( ATAN[STAGE], BITS) >>> (MAX_D_WIDTH - BITS) : 
                                           round(-ATAN[STAGE], BITS) >>> (MAX_D_WIDTH - BITS) );

  generate

    if ( STAGE == MAX_STAGES-1 ) begin
    
      logic [BITS-1:0] cos_sign_check, sin_sign_check;
      assign cos_sign_check = ( i_sign ? -(i_cos + delta_cos) : (i_cos + delta_cos) );
      assign sin_sign_check = ( i_sign ? -(i_sin + delta_sin) : (i_sin + delta_sin) );
      
      always_ff @(posedge i_clk or negedge i_rst_n)
        if (!i_rst_n) begin
          o_valid	<= 1'b0;
          o_sign	<= 1'b0;
          o_cos		<= '0;
          o_sin		<= '0;
          o_theta	<= '0;
        end else if (i_pipeline_en) begin 			
          o_valid	<= i_valid;
          o_sign	<= i_sign;
          o_cos		<= cos_sign_check;
          o_sin		<= sin_sign_check;
          o_theta	<= i_theta + delta_theta;
        end
        
    end else
    
      always_ff @(posedge i_clk or negedge i_rst_n)
        if (!i_rst_n) begin
          o_valid	<= 1'b0;
          o_sign	<= 1'b0;
          o_cos		<= '0;
          o_sin		<= '0;
          o_theta	<= '0;
        end else if (i_pipeline_en) begin 			
          o_valid	<= i_valid;
          o_sign	<= i_sign;
          o_cos		<= i_cos + delta_cos;
          o_sin		<= i_sin + delta_sin;
          o_theta	<= i_theta + delta_theta;
        end
        
    endgenerate

endmodule