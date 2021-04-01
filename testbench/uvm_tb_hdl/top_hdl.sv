//
// File:        top_hdl.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: 1 of the 2 top-level UVM TB modules in a dual-top TB structure. The top_hdl is the wrapper
//              for the DUT as well as the interface.
//

module top_hdl();

    timeunit 1ns; timeprecision 1ps;
    import uvm_pkg::*;
    
    logic clk, baud_clk, rst_n;
    
    // UART Interface
    uart_if m_uart_if ( .* );
    
    // DUT
    top_module DUT (
        .i_clk  (clk),
        .i_rst_n(rst_n),
        .i_rx   (m_uart_if.rx),
        .o_tx   (m_uart_if.tx)
    );
    
    // Set the VIF in the UVM config database
    initial uvm_config_db #(virtual interface uart_if)::set(null, "uvm_test_top", "vif", m_uart_if);

    initial clk         <= 1'b0;
    always #5 clk       <= !clk;
    
    initial baud_clk            <= 1'b0;
    always #166.6666 baud_clk   <= !baud_clk;
    
    initial begin
        rst_n       <= 1'b0;
        #10 rst_n   <= 1'b1;
    end

endmodule: top_hdl