`default_nettype none

module uart_tx_msg (
    input wire		i_clk,
    input wire		i_rst_n,
    
    // from uart_rx_msg
    input wire [7:0]	i_cmd_reg,
    input wire			i_cmd_valid,
    input wire [7:0]	i_burst_cnt,
  	input wire			i_rx_msg_err,
    
    // from cordic
    input wire [47:0]	i_cordic_sin_theta,
    input wire [47:0]	i_cordic_cos_theta,
    input wire			i_cordic_done,
    
    // to uart tx
    output reg [7:0]	o_tx_byte,
    output reg			o_tx_byte_valid
  );
  
  // FSM to recognize current operating cmd (length of operands needed for range cmd)
  // Once cmd is recognized, accept cordic outputs and transmit byte-wise to uart_tx along w/ crc
  typedef enum {IDLE,
                SEND
               } tx_msg_state_t;
  tx_msg_state_t tx_msg_state;
  
  always_ff @(posedge i_clk or negedge i_rst_n)
    if (!i_rst_n) begin
      tx_msg_state	<= IDLE;
    end else begin
      case (tx_msg_state)
        IDLE: begin
        end
        SEND: begin
        end
        default: begin
        end
      endcase
  	end
  
endmodule