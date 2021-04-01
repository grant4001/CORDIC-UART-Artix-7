//
// File:        top_tb.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: 1 of the 2 top-level UVM TB modules in a dual-top TB structure. The top_tb kicks off the
//              UVM test.
//

module top_tb();
    
    timeunit 1ns; timeprecision 1ps;
    import uvm_pkg::*;
    import cordic_uvm_pkg::*;
    
    initial begin
        run_test();
    end

endmodule: top_tb