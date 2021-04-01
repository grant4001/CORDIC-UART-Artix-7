//
// File:        cordic_vseq_test.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Virtual sequence UVM test component.
//

class cordic_vseq_test extends cordic_base_test;

    // Register this class in the UVM factory
  `uvm_component_utils(cordic_vseq_test)
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
  
  // Build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    void'(uvm_config_db #(uvm_bitstream_t)::get(this, "", "num_dis_en_items", agent_cfg.num_dis_en_items));
    void'(uvm_config_db #(uvm_bitstream_t)::get(this, "", "num_sing_cmd_items", agent_cfg.num_sing_cmd_items));
    void'(uvm_config_db #(uvm_bitstream_t)::get(this, "", "num_burst_cmd_items", agent_cfg.num_burst_cmd_items));
    `uvm_info(get_type_name(), $sformatf("\nnum_dis_en_items=%0d, num_sing_cmd_items=%0d, num_burst_cmd_items=%0d\n", 
                                         agent_cfg.num_dis_en_items, 
                                         agent_cfg.num_sing_cmd_items,
                                         agent_cfg.num_burst_cmd_items), UVM_LOW)
  endfunction: build_phase
  
  virtual task run_phase(uvm_phase phase);
    cordic_vseq vseq;
    super.run_phase(phase);
    
    // Print vseq test start message
    `uvm_info("TEST", "\n\n**STARTING TEST cordic_vseq_test**\n\n", UVM_NONE)
    
    vseq = cordic_vseq::type_id::create("vseq");
    
    // Raise/drop objection
    phase.raise_objection(this, "Test objects to run phase ending.");
    vseq.init_start(agent_cfg);
    phase.drop_objection(this, "Test drops objection to run phase ending.");
  endtask: run_phase

endclass: cordic_vseq_test