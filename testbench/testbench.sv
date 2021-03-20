`timescale 1ns/1ps

module testbench;

    logic i_clk;
    logic i_rst_n;
    logic i_rx;
    logic o_tx;
    
    logic baud_clk;
    
    initial begin
        i_rst_n <= 1;
        #10
        i_rst_n <= 0;
        #10
        i_rst_n <= 1;
    end
    
    initial i_clk <= 0;
    always #5 i_clk <= !i_clk;
    
    initial baud_clk <= 0;
    always #166.66667 baud_clk <= !baud_clk;
    
    logic [7:0] byte_arr [9];
    initial byte_arr = {
        8'h5a,
        8'hd1,
        8'h17,
        8'h22,
        8'haa,
        8'hfd,
        8'h90,
        8'h0c,
        8'h34};

    logic [15:0] byte_count, bit_count;
    initial byte_count = 0; 
    initial bit_count = 0;
    initial i_rx = 1;
    
    logic [1:0] state;
    initial state = 0;
    
    logic parity;
    initial parity = 0;
    
    always @(posedge baud_clk) begin
        case (state)
            0: begin
                if (bit_count == 0) begin
                    i_rx            <= 0;
                    bit_count       <= bit_count + 1;
                end else if (bit_count == 9) begin
                    i_rx            <= ~parity;
                    bit_count       <= bit_count + 1;
                end else if (bit_count == 10) begin
                    i_rx            <= 1;
                    parity          <= 0;
                    bit_count       <= 0;
                    byte_count      <= byte_count + 1;
                    if (byte_count == 8) begin
                        state       <= 1;
                    end
                end else begin
                    i_rx            <= byte_arr[byte_count][bit_count-1];
                    bit_count       <= bit_count + 1; 
                    parity          <= parity ^ byte_arr[byte_count][bit_count-1];
                end
            end
            1: begin
                #50000
                $finish();
            end
            default:
                state <= 0;
        endcase
    end

    top_module dut ( .* );

endmodule