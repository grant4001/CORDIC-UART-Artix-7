module cordic_top_hdl;

    initial $timeformat(-9, -12, " ns");

    bit clk, baud_clk, rst_n;
    initial clk         <= 1'b0;
    always #5 clk       <= !clk;
    
    initial baud_clk            <= 1'b0;
    always #166.6666 baud_clk   <= !baud_clk;
    
    initial begin
        rst_n       <= 1'b0;
        #10 rst_n   <= 1'b1;
    end
    
    uart_if vif ( .* );
    
    top_module DUT (
        .i_clk  (vif.dut_mp.clk),
        .i_rst_n(vif.dut_mp.rst_n),
        .i_rx   (vif.dut_mp.rx),
        .o_tx   (vif.dut_mp.tx)
    );

endmodule
