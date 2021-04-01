//
// File:        single_cmd_sequence.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Sequence of input commands that send a single theta to the CORDIC
//

class single_cmd_sequence extends uvm_sequence #(cordic_input_tx);

    // Register this class in the UVM factory
  `uvm_object_utils(single_cmd_sequence)
    
  function new (string name = "single_cmd_sequence");
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
    `uvm_info("SINGLE_CMD_SEQUENCE", "\n\n**Generating single cmd transactions**\n\n", UVM_MEDIUM);
    repeat (agent_cfg.num_sing_cmd_items) begin
      // Alternate disable and enable transactions
      tx_in = cordic_input_tx::type_id::create("tx_in");
      start_item(tx_in);
      if (!tx_in.randomize() with {msg_cmd[8:1] == CMD_SINGLE_TRANS;})
        `uvm_fatal(get_type_name(), "Randomization failed.")
      finish_item(tx_in);
    end

    // Directed testing vectors to maximize coverage
    // theta = 2pi
    tx_in = cordic_input_tx::type_id::create("tx_in");
    start_item(tx_in);
    if (!tx_in.randomize() with {{msg_theta[0][5][8:1],
                                  msg_theta[0][4][8:1],
                                  msg_theta[0][3][8:1],
                                  msg_theta[0][2][8:1],
                                  msg_theta[0][1][8:1],
                                  msg_theta[0][0][8:1]} == PI_MULT_2; msg_cmd[8:1] == CMD_SINGLE_TRANS;})
      `uvm_fatal(get_type_name(), "Randomization failed.")
    finish_item(tx_in);

    tx_in = cordic_input_tx::type_id::create("tx_in");
    start_item(tx_in);
    if (!tx_in.randomize() with {{msg_theta[0][5][8:1],
                                  msg_theta[0][4][8:1],
                                  msg_theta[0][3][8:1],
                                  msg_theta[0][2][8:1],
                                  msg_theta[0][1][8:1],
                                  msg_theta[0][0][8:1]} == -PI_MULT_2; msg_cmd[8:1] == CMD_SINGLE_TRANS;})
      `uvm_fatal(get_type_name(), "Randomization failed.")
    finish_item(tx_in);
    
  endtask: body

endclass: single_cmd_sequence