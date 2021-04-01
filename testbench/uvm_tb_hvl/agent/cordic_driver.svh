//
// File:        cordic_driver.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: UVM driver component.
//

class cordic_driver extends uvm_driver #(cordic_input_tx);

    // Register this class in the UVM factory
  `uvm_component_utils(cordic_driver)
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    // Virtual interface
    virtual interface uart_if vif;
    
    // Transfer task called by the driver
    task transfer(cordic_input_tx input_tx);
    
        automatic int idx;
        automatic int jdx;
        //`uvm_info("DRIVER TRANSFER", $sformatf("\n\nTransferring:\n %s\n\n", input_tx.convert2string()), UVM_DEBUG);
        // Header byte
        vif.transfer_byte(input_tx.msg_header);
        // Command byte
        vif.transfer_byte(input_tx.msg_cmd);
        
        // Branch
        unique case (input_tx.msg_cmd[8:1])
            CMD_SINGLE_TRANS:   for (int i = 0; i < 6; i++) begin
                                    idx = i;
                                    vif.transfer_byte(input_tx.msg_theta[0][idx]);
                                end
            CMD_BURST_TRANS:    begin
                                    vif.transfer_byte(input_tx.msg_burst_cnt);
                                    for (int i = 0; i < input_tx.msg_burst_cnt[8:1]; i++) begin
                                        idx = i;
                                        for (int j = 0; j < 6; j++) begin
                                            jdx = j;
                                            vif.transfer_byte(input_tx.msg_theta[idx][jdx]);
                                        end
                                    end
                                end
            CMD_DISABLE:        begin end       
            CMD_ENABLE:         begin end 
        endcase
        
        // CRC-8 byte
        vif.transfer_byte(input_tx.msg_crc_8);
        
    endtask: transfer
  
  task wait_for_output();

    automatic bit [10:0] o_byte, header, cmd, burst_cnt;
    
    // Sniff header byte
    vif.sniff_tx_byte(o_byte);
    header = o_byte;
    //`uvm_info("DRV", $sformatf("sniffed output header byte = %b", header), UVM_DEBUG)
    
    // Sniff cmd byte
    vif.sniff_tx_byte(o_byte);
    cmd = o_byte;
    //`uvm_info("DRV", $sformatf("sniffed output cmd byte = %b", cmd), UVM_DEBUG)
    
    unique case (cmd[8:1])
        CMD_SINGLE_TRANS:   for (int i = 0; i < 12; i++)
                                // Sniff cos and sin
                                vif.sniff_tx_byte(o_byte);
        CMD_BURST_TRANS:    begin 
                                // Sniff burst cnt
                                vif.sniff_tx_byte(o_byte);
                                burst_cnt = o_byte;
                                for (int i = 0; i < burst_cnt[8:1]; i++)
                                    for (int j = 0; j < 12; j++)
                                        // Sniff cos and sin
                                        vif.sniff_tx_byte(o_byte);
                            end
        CMD_DISABLE:        begin end      
        CMD_ENABLE:         begin end
    endcase
    // Sniff crc byte
    vif.sniff_tx_byte(o_byte);
  endtask
  
  // Build phase
  virtual function void build_phase(uvm_phase phase);
    cordic_agent_cfg agent_cfg;
    if (!uvm_config_db #(cordic_agent_cfg)::get(this, "", "agent_cfg", agent_cfg))
        `uvm_fatal(get_type_name(), "Failed to get agent_cfg from uvm_config_db.")
    vif = agent_cfg.vif;
    
  endfunction: build_phase
  
  // Run phase
  virtual task run_phase(uvm_phase phase);
    cordic_input_tx input_tx;
    automatic bit DUT_disabled = 0;
    forever begin
        seq_item_port.get_next_item(input_tx);
        `uvm_info("DRIVER", $sformatf("\n\nGot item to drive:\n %s\n\n", input_tx.convert2string()), UVM_DEBUG);
        fork 
            transfer(input_tx);
            if (! (DUT_disabled && (input_tx.msg_cmd[8:1] inside {CMD_SINGLE_TRANS, CMD_BURST_TRANS}) )) begin
                wait_for_output();
                `uvm_info("DRIVER", "Waiting for output.", UVM_DEBUG);
            end else begin
                `uvm_info("DRIVER", "Not waiting for output.", UVM_DEBUG);
            end
        join
        DUT_disabled = (input_tx.msg_cmd[8:1] == CMD_DISABLE) ? 1 :
                       (input_tx.msg_cmd[8:1] == CMD_ENABLE)  ? 0 : 
                       DUT_disabled;
        seq_item_port.item_done();
    end
  endtask: run_phase
  
endclass: cordic_driver