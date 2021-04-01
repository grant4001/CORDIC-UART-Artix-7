//
// File:        disable_enable_sequence.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Sequence of input commands that disable and enable the cordic DUT
//

class disable_enable_sequence extends uvm_sequence #(cordic_input_tx);

    // Register this class in the UVM factory
  `uvm_object_utils(disable_enable_sequence)
    
  function new (string name = "disable_enable_sequence");
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
    `uvm_info("DISABLE_ENABLE_SEQUENCE", "\n\n**Generating disable-enable transactions**\n\n", UVM_MEDIUM);
    
    repeat (agent_cfg.num_dis_en_items) begin
      // Alternate disable and enable transactions
      tx_in = cordic_input_tx::type_id::create("tx_in");
      start_item(tx_in);
      if (!tx_in.randomize() with {msg_cmd == { 1'b1, ~^msg_cmd[8:1], CMD_DISABLE, 1'b0};})
        `uvm_fatal(get_type_name(), "Randomization failed.")
      finish_item(tx_in);
      
      tx_in = cordic_input_tx::type_id::create("tx_in");
      start_item(tx_in);
      if (!tx_in.randomize() with {msg_cmd == { 1'b1, ~^msg_cmd[8:1], CMD_ENABLE, 1'b0};})
        `uvm_fatal(get_type_name(), "Randomization failed.")
      finish_item(tx_in);

    end
    
  endtask: body

endclass: disable_enable_sequence