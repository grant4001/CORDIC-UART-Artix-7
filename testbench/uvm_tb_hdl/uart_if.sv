//
// File:        uart_if.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: This interface file captures the signals necessary for a UART interface. 
//

interface uart_if (input logic baud_clk, logic clk, logic rst_n);
    timeunit 1ns; timeprecision 1ps;
    
    // Bus
    logic rx=1'b1;
    logic tx=1'b1;
    
    // Byte-level helper transfer task
    task transfer_byte(bit[10:0] i_byte);
        //$display($sformatf("Transferring:\n %0x\n", i_byte[8:1]));
        for (int i = 0; i < 11; i++) begin
            automatic int idx = i;
            @(posedge baud_clk);
            #1;
            rx <= i_byte[idx];
        end
    endtask: transfer_byte
    
    // Input pin wiggle sniffer used by monitor
    task sniff_rx_byte(output bit[10:0] o_byte);
        @(negedge rx);
        //$display("rx has went low at %d ns", $time);
        // delay half baudper
        #166.6666;
        for (int i = 0; i < 11; i++) begin
            automatic int idx = i;
            o_byte[idx] = rx;
            //$display("rx value sampled is %b at %d ns, index %d. %b", rx, $time, i, o_byte);
            // delay whole baud per
            if (i != 10)
                #333.3333;
        end
    endtask
    
    // Output pin wiggle sniffer used by monitor
    task sniff_tx_byte(output bit[10:0] o_byte);
        @(negedge tx);
        // delay half baudper
        #166.6666;
        for (int i = 0; i < 11; i++) begin
            automatic int idx = i;
            o_byte[idx] = tx;
            // delay whole baud per
            if (i != 10)
                #333.3333;
        end
    endtask

endinterface