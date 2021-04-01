//
// File:        cordic_monitor.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: UVM monitor component.
//

class cordic_monitor extends uvm_monitor;

    // Register this class in the UVM factory
  `uvm_component_utils(cordic_monitor)
    
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    // Virtual interface
    virtual interface uart_if vif;
    
    // Analysis ports
    uvm_analysis_port #(cordic_input_tx) dut_in_tx_port;
    uvm_analysis_port #(cordic_output_tx) dut_out_tx_port;
    cordic_agent_cfg agent_cfg;
  
    // Build phase
    virtual function void build_phase(uvm_phase phase);
        // Build analysis ports
        dut_in_tx_port = new("dut_in_tx_port", this);
        dut_out_tx_port = new("dut_out_tx_port", this);

        if (!uvm_config_db #(cordic_agent_cfg)::get(this, "", "agent_cfg", agent_cfg))
            `uvm_fatal(get_type_name(), "Failed to get agent_cfg from uvm_config_db.")
        vif = agent_cfg.vif;

    endfunction: build_phase
  
    virtual task run_phase(uvm_phase phase);
        fork
            get_inputs();
            get_outputs();
        join
    endtask: run_phase
    
    task get_an_input(cordic_input_tx input_trans);
        automatic bit [10:0] i_byte;
        automatic int idx, jdx;
    
        // Sniff header byte
        vif.sniff_rx_byte(i_byte);
        input_trans.msg_header = i_byte;
        //`uvm_info("MON", $sformatf("sniffed input header byte = %b", i_byte), UVM_DEBUG)
        
        // Sniff cmd byte
        vif.sniff_rx_byte(i_byte);
        input_trans.msg_cmd = i_byte;
        //`uvm_info("MON", $sformatf("sniffed input cmd byte = %b", i_byte), UVM_DEBUG)
        
        unique case (input_trans.msg_cmd[8:1])
            CMD_SINGLE_TRANS:   begin 
                                    for (int i = 0; i < 6; i++) begin
                                        idx = i;
                                        vif.sniff_rx_byte(i_byte);
                                        input_trans.msg_theta[0][idx] = i_byte;
                                    end
                                end
            CMD_BURST_TRANS:    begin
                                    // Sniff burst cnt
                                    vif.sniff_rx_byte(i_byte);
                                    input_trans.msg_burst_cnt = i_byte;
                                    for (int i = 0; i < input_trans.msg_burst_cnt[8:1]; i++) begin
                                        idx = i;
                                        for (int j = 0; j < 6; j++) begin
                                            jdx = j;
                                            vif.sniff_rx_byte(i_byte);
                                            input_trans.msg_theta[idx][jdx] = i_byte;
                                        end
                                    end
                                end
            CMD_DISABLE:        begin end      
            CMD_ENABLE:         begin end
        endcase
        
        // Sniff crc byte
        vif.sniff_rx_byte(i_byte);
        input_trans.msg_crc_8 = i_byte;
    endtask
    
    task get_an_output(cordic_output_tx output_trans);
        automatic bit [10:0] o_byte;
        automatic int idx, jdx;
    
        // Sniff header byte
        vif.sniff_tx_byte(o_byte);
        output_trans.msg_header = o_byte;
        //`uvm_info("MON", $sformatf("sniffed output header byte = {%b, %b, %x, %b}", o_byte[10], o_byte[9], o_byte[8:1], o_byte[0]), UVM_DEBUG)
        
        // Sniff cmd byte
        vif.sniff_tx_byte(o_byte);
        output_trans.msg_cmd = o_byte;
        //`uvm_info("MON", $sformatf("sniffed output cmd byte = {%b, %b, %x, %b}", o_byte[10], o_byte[9], o_byte[8:1], o_byte[0]), UVM_DEBUG)
        
        unique case (output_trans.msg_cmd[8:1])
            CMD_SINGLE_TRANS:   begin 
                                    for (int i = 0; i < 6; i++) begin
                                        idx = i;
                                        vif.sniff_tx_byte(o_byte);
                                        output_trans.msg_cos_theta[0][idx] = o_byte;
                                    end
                                    for (int i = 0; i < 6; i++) begin
                                        idx = i;
                                        vif.sniff_tx_byte(o_byte);
                                        output_trans.msg_sin_theta[0][idx] = o_byte;
                                    end
                                end
            CMD_BURST_TRANS:    begin
                                    // Sniff burst cnt
                                    vif.sniff_tx_byte(o_byte);
                                    output_trans.msg_burst_cnt = o_byte;
                                    //`uvm_info("MON", $sformatf("sniffed output burst cnt byte = {%b, %b, %x, %b}", o_byte[10], o_byte[9], o_byte[8:1], o_byte[0]), UVM_DEBUG)

                                    for (int i = 0; i < output_trans.msg_burst_cnt[8:1]; i++) begin
                                        idx = i;
                                        for (int j = 0; j < 6; j++) begin
                                            jdx = j;
                                            vif.sniff_tx_byte(o_byte);
                                            output_trans.msg_cos_theta[idx][jdx] = o_byte;
                                            //`uvm_info("MON", $sformatf("sniffed output cos byte = {%b, %b, %x, %b}", o_byte[10], o_byte[9], o_byte[8:1], o_byte[0]), UVM_DEBUG)
                                        end
                                        for (int j = 0; j < 6; j++) begin
                                            jdx = j;
                                            vif.sniff_tx_byte(o_byte);
                                            output_trans.msg_sin_theta[idx][jdx] = o_byte;
                                            //`uvm_info("MON", $sformatf("sniffed output sin byte = {%b, %b, %x, %b}", o_byte[10], o_byte[9], o_byte[8:1], o_byte[0]), UVM_DEBUG)
                                        end
                                    end
                                    
                                end
            CMD_DISABLE:        begin end      
            CMD_ENABLE:         begin end
        endcase

        // Sniff crc byte
        vif.sniff_tx_byte(o_byte);
        output_trans.msg_crc_8 = o_byte;
        //`uvm_info("MON", $sformatf("sniffed output crc byte = {%b, %b, %x, %b}", o_byte[10], o_byte[9], o_byte[8:1], o_byte[0]), UVM_DEBUG)
    endtask
    
    task get_inputs();
        cordic_input_tx input_tx;
        automatic bit DUT_disabled = 0;
        forever begin
            input_tx = cordic_input_tx::type_id::create("input_tx");
            get_an_input(input_tx);
            `uvm_info("INPUT_TX", input_tx.convert2string(), UVM_DEBUG)
            if (! (DUT_disabled && (input_tx.msg_cmd[8:1] inside {CMD_SINGLE_TRANS, CMD_BURST_TRANS}) )) begin
                dut_in_tx_port.write(input_tx);
                `uvm_info("INPUT_TX", "Broadcasting input tx.", UVM_DEBUG);
            end else begin
                `uvm_info("INPUT_TX", "Not broadcasting input tx.", UVM_DEBUG);
            end
            DUT_disabled =  (input_tx.msg_cmd[8:1] == CMD_DISABLE) ? 1 :
                            (input_tx.msg_cmd[8:1] == CMD_ENABLE)  ? 0 : 
                            DUT_disabled;
        end
    endtask
    
    task get_outputs();
        cordic_output_tx output_tx;
        forever begin
            output_tx = cordic_output_tx::type_id::create("output_tx");
            get_an_output(output_tx);
            `uvm_info("OUTPUT_TX", output_tx.convert2string(), UVM_DEBUG)
            dut_out_tx_port.write(output_tx);
        end
    endtask
  
endclass: cordic_monitor