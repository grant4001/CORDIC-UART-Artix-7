//
// File:        cordic_agent.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: UVM agent component.
//

class cordic_agent extends uvm_agent;

    // Register this class in the UVM factory
   `uvm_component_utils(cordic_agent)
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    // Analysis ports
    uvm_analysis_port #(cordic_input_tx) dut_in_tx_port;
    uvm_analysis_port #(cordic_output_tx) dut_out_tx_port;
    
    // Other sub-components
    uvm_sequencer #(cordic_input_tx) sqr;
    cordic_driver drv;
    cordic_monitor mon;
    cordic_coverage cov;
    cordic_agent_cfg agent_cfg;
 
    // Build phase
    virtual function void build_phase(uvm_phase phase);
    
        // Build analysis ports
        dut_in_tx_port = new("dut_in_tx_port", this);
        dut_out_tx_port = new("dut_out_tx_port", this);
        
        // Build monitor
        mon = cordic_monitor::type_id::create("mon", this);
        
        if (!uvm_config_db #(cordic_agent_cfg)::get(this, "", "agent_cfg", agent_cfg))
            `uvm_fatal(get_type_name(), "Cannot get agent_cfg from uvm_config_db")
        
        // Build cov collector
        if (agent_cfg.enable_cov)
            cov = cordic_coverage::type_id::create("cov", this);
        
        // If active component, build driver and sequencer
        if (agent_cfg.active == UVM_ACTIVE) begin
            drv = cordic_driver::type_id::create("drv", this);
            sqr = new("sqr", this);
            agent_cfg.sqr = sqr;
        end
    
    endfunction: build_phase
  
    virtual function void connect_phase(uvm_phase phase);
    
        // Connect the monitor's analysis ports to the agent's analysis ports
        mon.dut_in_tx_port.connect(dut_in_tx_port);
        mon.dut_out_tx_port.connect(dut_out_tx_port);
        
        // If active, connect driver to sequencer
        if (agent_cfg.active == UVM_ACTIVE)
            drv.seq_item_port.connect(sqr.seq_item_export);
            
        if (agent_cfg.enable_cov)
            mon.dut_in_tx_port.connect(cov.analysis_export);
    
    endfunction: connect_phase
  
endclass: cordic_agent