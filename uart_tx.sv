`default_nettype none

module uart_tx #(
  parameter CLK_FREQ_MHZ 	= 100_000_000,
  parameter BAUD_RATE		=   3_000_000,
  parameter NUM_DATA_BITS	=			8, // Within 5-9
  parameter PARITY_ON		=			1, // 0: Parity disabled. 1: Parity enabled.
  parameter PARITY_EO		=			1, // 0: Even parity. 1: Odd parity.
  parameter NUM_STOP_BITS	=			1  // Within 1-2
)
  (
    input wire 		  				i_clk,
    input wire 		  				i_rst_n,
    input wire						i_tx_byte_valid,
    input wire	[NUM_DATA_BITS-1:0] i_tx_byte,
    output reg 		  				o_tx
  );
  
  // Parity even/odd encoding
  localparam EVEN_PAR = 0;
  localparam ODD_PAR  = 1;

  // Baudperiod counter
  localparam BAUDPER_CNT_MAX = int'(real'(CLK_FREQ_MHZ) / real'(BAUD_RATE));
  logic [$clog2(BAUDPER_CNT_MAX)-1:0] baudper_cnt;
  
  // TX byte register
  logic [NUM_DATA_BITS-1:0] tx_byte;
  
  // Byte index register
  logic [$clog2(NUM_DATA_BITS)-1:0] idx;
  
  // Stop bit counter
  logic stop_b_cnt;
  
  // Control FSM
  typedef enum {TX_IDLE, 
                TX_START, 
                TX_DATA, 
                TX_PARITY, 
                TX_STOP} state_t;
  state_t state;
  
  always_ff @(posedge i_clk or negedge i_rst_n)
    if (!i_rst_n) begin
      tx_byte			<= '0;
      baudper_cnt		<= '0;
      idx				<= '0;
      o_tx				<= 1'b1;
      stop_b_cnt		<= 1'b0;
      state				<= TX_IDLE;
    end else begin
      case (state)
        TX_IDLE: begin
          
          if (i_tx_byte_valid) begin
            tx_byte		<= i_tx_byte;
            o_tx		<= 1'b0;
            state		<= TX_START;
          end
        
        end
        TX_START: begin
          
          baudper_cnt	<= baudper_cnt + 1;
          if (baudper_cnt == BAUDPER_CNT_MAX - 1) begin
            baudper_cnt	<= '0;
            o_tx		<= tx_byte[0];
            state		<= TX_DATA;
          end
                   
        end
        TX_DATA: begin
          
          baudper_cnt	<= baudper_cnt + 1;
          if (baudper_cnt == BAUDPER_CNT_MAX - 1) begin
            baudper_cnt	<= '0;
            o_tx		<= tx_byte[1];
            tx_byte		<= tx_byte >> 1;
            idx			<= idx + 1;
            if (idx == NUM_DATA_BITS - 1) begin
              idx		<= '0;
              if (PARITY_ON) begin
                state		<= TX_PARITY;
                if (PARITY_EO==EVEN_PAR)
                  o_tx		<= ^tx_byte;
                else if (PARITY_EO==ODD_PAR)
                  o_tx		<= ~^tx_byte;
              end else begin
                state		<= TX_STOP;
                o_tx		<= 1'b1;
              end
            end
          end
          
        end
        TX_PARITY: begin
          
          baudper_cnt	<= baudper_cnt + 1;
          if (baudper_cnt == BAUDPER_CNT_MAX - 1) begin
            baudper_cnt	<= '0;
            o_tx		<= 1'b1;
            state		<= TX_STOP;
          end
          
        end
        TX_STOP: begin
          
          baudper_cnt	<= baudper_cnt + 1;
          if (baudper_cnt == BAUDPER_CNT_MAX - 1) begin
            baudper_cnt	<= '0;
            stop_b_cnt	<= ~stop_b_cnt;	
            if (stop_b_cnt == NUM_STOP_BITS - 1) begin
              stop_b_cnt<= '0;
              o_tx		<= 1'b1;
              state		<= TX_IDLE;
            end
          end
          
        end
        default: begin
          
          tx_byte			<= '0;
          baudper_cnt		<= '0;
          idx				<= '0;
          o_tx				<= 1'b1;
          stop_b_cnt		<= 1'b0;
          state				<= TX_IDLE;
          
        end
          
      endcase
    end
  
  
endmodule