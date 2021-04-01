//
// File:        cordic_env_cfg.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: UVM environment configuration object.
//

class cordic_env_cfg extends uvm_object;

    // Register this class in the UVM factory
  `uvm_object_utils(cordic_env_cfg)
    
  function new (string name="cordic_env_cfg");
    super.new(name);
  endfunction: new
  
  cordic_agent_cfg agent_cfg;
  bit enable_scb = 1;
  
endclass: cordic_env_cfg