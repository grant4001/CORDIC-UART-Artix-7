//
// File:        burst_cmd_sequence.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Sequence of burst commands that send multiple thetas to the CORDIC
//

class burst_cmd_sequence extends uvm_sequence #(cordic_input_tx);

    // Register this class in the UVM factory
  `uvm_object_utils(burst_cmd_sequence)
    
  function new (string name = "burst_cmd_sequence");
    super.new(name);
  endfunction: new
  
  cordic_agent_cfg agent_cfg;
  
  task init_start(cordic_agent_cfg agent_cfg, int priority_val);
    this.agent_cfg = agent_cfg;
    this.start(agent_cfg.sqr, null, priority_val);
  endtask
  
  virtual task body();
    cordic_input_tx tx_in;
    
    // Print transaction start message
    `uvm_info("BURST_CMD_SEQUENCE", "\n\n**Generating burst cmd transactions**\n\n", UVM_MEDIUM);
    
    repeat (agent_cfg.num_burst_cmd_items) begin
      tx_in = cordic_input_tx::type_id::create("tx_in");
      start_item(tx_in);
      if (!tx_in.randomize() with {msg_cmd[8:1] == CMD_BURST_TRANS;})
        `uvm_fatal(get_type_name(), "Randomization failed.")
      finish_item(tx_in);
    end
    
  endtask: body

endclass: burst_cmd_sequence