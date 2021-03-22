interface uart_if (input baud_clk, clk, rst_n);
    
    logic rx;
    logic tx;
    
    modport tb_mp (input clk, input rst_n, input tx, output rx);
    modport dut_mp (input clk, input rst_n, input rx, output tx);

endinterface