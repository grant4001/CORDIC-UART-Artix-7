//
// File:        cordic_env.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: UVM environment component.
//

class cordic_env extends uvm_env;

    // Register this class in the UVM factory
  `uvm_component_utils(cordic_env)
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
  
  // Handles to env_cfg object, agent, scb, cov collector
  cordic_env_cfg env_cfg;
  cordic_agent agt;
  cordic_scoreboard scb;

  // Build phase
  virtual function void build_phase(uvm_phase phase);
    agt = cordic_agent::type_id::create("agt", this);
    // Get env config object from database
    if (!uvm_config_db #(cordic_env_cfg)::get(this, "", "env_cfg", env_cfg))
      `uvm_fatal(get_type_name(), "env_cfg not found in the uvm_config_db")
      
    // Extract agent cfg from env cfg
      uvm_config_db #(cordic_agent_cfg)::set(this, "agt*", "agent_cfg", env_cfg.agent_cfg);
    
    if (env_cfg.enable_scb)
      scb = cordic_scoreboard::type_id::create("scb", this);
    
  endfunction: build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    agt.dut_in_tx_port.connect(scb.dut_in_export);
    agt.dut_out_tx_port.connect(scb.dut_out_export);
  endfunction: connect_phase
  
endclass: cordic_env