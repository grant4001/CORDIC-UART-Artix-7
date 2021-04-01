//
// File:        cordic_agent_cfg.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: UVM agent configuration object.
//

class cordic_agent_cfg extends uvm_object;

    // Register this class in the UVM factory
  `uvm_object_utils(cordic_agent_cfg)
    
  function new (string name="cordic_agent_cfg");
    super.new(name);
  endfunction: new
  
  int num_dis_en_items 		= 1;
  int num_sing_cmd_items 	= 1;
  int num_burst_cmd_items 	= 1;
  bit enable_cov = 1;
  uvm_active_passive_enum active = UVM_ACTIVE;
  
  // Virtual interface
  virtual interface uart_if vif;
    
  // Sequencer handle
  uvm_sequencer #(cordic_input_tx) sqr;
  
endclass: cordic_agent_cfg