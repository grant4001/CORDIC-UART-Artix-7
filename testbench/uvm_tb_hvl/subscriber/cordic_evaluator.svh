//
// File:        cordic_evaluator.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Evaluator module within the cordic_scoreboard
//

class cordic_evaluator extends uvm_component;

    // Factory reg and constructor
    `uvm_component_utils(cordic_evaluator)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    
    // Port to accept predicted result
    uvm_analysis_export #(cordic_output_tx) expected_export;
    uvm_tlm_analysis_fifo #(cordic_output_tx) expected_fifo; // Store predicted result
    
    // Port to accept actual result
    uvm_analysis_export #(cordic_output_tx) actual_export;
    uvm_tlm_analysis_fifo #(cordic_output_tx) actual_fifo; // Store actual result
    
    // Metrics
    int match, mismatch;
    
    virtual function void build_phase(uvm_phase phase);
        expected_export = new("expected_export", this);
        expected_fifo = new("expected_fifo", this);
        actual_export = new("actual_export", this);
        actual_fifo = new("actual_fifo", this);
    endfunction
    
    virtual function void connect_phase(uvm_phase phase);
        expected_export.connect(expected_fifo.analysis_export);
        actual_export.connect(actual_fifo.analysis_export);
    endfunction    
    
    virtual task run_phase(uvm_phase phase);
        cordic_output_tx actual, expected;
        forever begin
            expected_fifo.get(expected);
            `uvm_info("SCB", $sformatf("Got expected from FIFO."), UVM_LOW)
            actual_fifo.get(actual);
            `uvm_info("SCB", $sformatf("Got actual from FIFO."), UVM_LOW)
            if (actual.compare(expected)) begin
                match++;
                //`uvm_info("SCB", $sformatf("Expected %s\n\nmatches actual\n\n%s", expected.convert2string(),
                //                                                                        actual.convert2string()), UVM_MEDIUM)
            end else begin
                mismatch++;
                `uvm_error("SCB", $sformatf("\n\nExpected %s\n\ndoes not match actual\n\n%s", expected.convert2string(),
                                                                                              actual.convert2string()))
            end
        end
    endtask
    
    // Report
    virtual function void report_phase(uvm_phase phase);
        `uvm_info("SCB", $sformatf("\nPassed = %0d.\nFailed = %0d.\n", match, mismatch), UVM_LOW)
    endfunction: report_phase

endclass