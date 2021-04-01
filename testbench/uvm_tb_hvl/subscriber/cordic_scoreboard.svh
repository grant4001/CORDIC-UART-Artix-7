//
// File:        cordic_scoreboard.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: UVM scoreboard component.
//

`uvm_analysis_imp_decl(_dut_in)
`uvm_analysis_imp_decl(_dut_out)

class cordic_scoreboard extends uvm_scoreboard;

    // Register this class in the UVM factory
  `uvm_component_utils(cordic_scoreboard)
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    // Subcomponents
    cordic_predictor pred;
    cordic_evaluator eval;

    // Analysis ports
    uvm_analysis_export #(cordic_input_tx) dut_in_export;    // export to imp export in predictor
    uvm_analysis_export #(cordic_output_tx) dut_out_export;  // export to imp export in evaluator
  
    // Build phase
    virtual function void build_phase(uvm_phase phase);
        // Build analysis ports
        dut_in_export = new("dut_in_export", this);
        dut_out_export = new("dut_out_export", this);
        // Build predictor and evaluator
        pred = cordic_predictor::type_id::create("pred", this);
        eval = cordic_evaluator::type_id::create("eval", this);
    endfunction: build_phase
  
    virtual function void connect_phase(uvm_phase phase);
        dut_in_export.connect(pred.analysis_export);
        pred.expected_port.connect(eval.expected_export);
        dut_out_export.connect(eval.actual_export); 
    endfunction: connect_phase
    
  
endclass: cordic_scoreboard