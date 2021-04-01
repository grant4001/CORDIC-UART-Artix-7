//
// File:        cordic_vseq.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Virtual sequence object
//

class cordic_vseq extends uvm_sequence;

    // Register this class in the UVM factory
  `uvm_object_utils(cordic_vseq)
    
  function new (string name = "cordic_vseq");
    super.new(name);
  endfunction: new
  
  // Agent cfg object
  cordic_agent_cfg agent_cfg;
  
  // init_start task to get the handle to the sequencer
  virtual task init_start(input cordic_agent_cfg agent_cfg);
    this.agent_cfg = agent_cfg;
    this.start(agent_cfg.sqr);
  endtask: init_start
  
  virtual task body();
    // Declare handles to composite sequences
  	disable_enable_sequence	dis_en_seq;
    single_cmd_sequence		sing_cmd_seq;
    burst_cmd_sequence		burst_cmd_seq;
    
    // Set arbitration scheme of sequencer
    agent_cfg.sqr.set_arbitration(SEQ_ARB_WEIGHTED);
    
    // Create the sequences
    dis_en_seq = disable_enable_sequence::type_id::create("dis_en_seq");
    sing_cmd_seq = single_cmd_sequence::type_id::create("sing_cmd_seq");
    burst_cmd_seq = burst_cmd_sequence::type_id::create("burst_cmd_seq");
    
    // Print start message
    `uvm_info("VSEQ", "\n\n**STARTING VIRTUAL SEQUENCE.**\n\n", UVM_NONE)
    
    // Start
    fork
      sing_cmd_seq.init_start(agent_cfg, 100);
      burst_cmd_seq.init_start(agent_cfg, 100);
      dis_en_seq.init_start(agent_cfg, 30);
    join
   
  endtask: body

endclass: cordic_vseq