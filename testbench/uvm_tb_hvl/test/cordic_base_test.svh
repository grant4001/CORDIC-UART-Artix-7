//
// File:        cordic_base_test.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Base UVM test component.
//

class cordic_base_test extends uvm_test;

    // Register this class in the UVM factory
  `uvm_component_utils(cordic_base_test)
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
  
  // Nested UVM components
  cordic_env env;
  cordic_env_cfg env_cfg;
  cordic_agent_cfg agent_cfg;
  
  // Build phase
  virtual function void build_phase(uvm_phase phase);
    // Create configuration objects
    agent_cfg = cordic_agent_cfg::type_id::create("agent_cfg");
    env_cfg = cordic_env_cfg::type_id::create("env_cfg");
    
    // Initialize env_cfg
    env_cfg.enable_scb	= 1'b1;
    env_cfg.agent_cfg 	= agent_cfg;
    
    // Initialize agent_cfg
    agent_cfg.enable_cov	= 1'b1;
    agent_cfg.active 		= UVM_ACTIVE;
    
    // Grab vif
    if (!uvm_config_db #(virtual interface uart_if)::get(this, "", "vif", agent_cfg.vif))
      `uvm_fatal(get_type_name(), "Failed to get virtual interface vif from the config db.")
      
    uvm_config_db #(cordic_env_cfg)::set(this, "env*", "env_cfg", env_cfg);
    
    // Build environment
    env = cordic_env::type_id::create("env", this);
  endfunction: build_phase
  
  virtual function void end_of_elaboration_phase(uvm_phase phase);
    $display("\n");
    uvm_top.print_topology();
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.phase_done.set_drain_time(this, 1000000);
  endtask

endclass: cordic_base_test