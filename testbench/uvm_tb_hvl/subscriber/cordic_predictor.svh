//
// File:        cordic_predictor.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Predictor module within the cordic_scoreboard
//

import "DPI-C" function void cordic_gref(   input shortint i_header, 
                                            input shortint i_cmd, 
                                            input shortint i_burst_cnt,
                                            input shortint i_theta[48], 
                                            input shortint i_crc_8,
                                            output byte disabled,
                                            output shortint o_header,
                                            output shortint o_cmd,
                                            output shortint o_burst_cnt,
                                            output shortint o_cos_theta[48], 
                                            output shortint o_sin_theta[48],
                                            output shortint o_crc_8);

class cordic_predictor extends uvm_subscriber #(cordic_input_tx);

    // Factory reg and constructor
    `uvm_component_utils(cordic_predictor)
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    // Port to send out predicted result
    uvm_analysis_port #(cordic_output_tx) expected_port;
    
    virtual function void build_phase(uvm_phase phase);
        expected_port = new("expected_port", this);
    endfunction
    
    // Imp export write function
    function void write(cordic_input_tx t);
    
        cordic_output_tx expected_output;
        
        // Format input theta
        automatic shortint theta_in[48];
        automatic shortint cos_theta_out[48];
        automatic shortint sin_theta_out[48];
        automatic byte disabled_flag;
        automatic int idx, jdx;
        
        for (int i = 0; i < 8; i = i + 1) begin
            idx = i;
            for (int j = 0; j < 6; j++) begin
                jdx = j;
                theta_in[idx*6+jdx] = t.msg_theta[idx][jdx];
            end
        end
        
        disabled_flag = 0;
        expected_output = cordic_output_tx::type_id::create("expected_output");
        
        // DPI-C call
        //`uvm_info(get_type_name(),"Entering DPI-C function call.",UVM_DEBUG)
        cordic_gref(t.msg_header, 
                    t.msg_cmd, 
                    t.msg_burst_cnt,
                    theta_in,
                    t.msg_crc_8,
                    disabled_flag,
                    expected_output.msg_header,
                    expected_output.msg_cmd,
                    expected_output.msg_burst_cnt,
                    cos_theta_out,
                    sin_theta_out,
                    expected_output.msg_crc_8);
        //`uvm_info(get_type_name(),"Exiting DPI-C function call.",UVM_DEBUG)            
        // Format output theta
        for (int l = 0; l < 8; l++) begin
            idx = l;
            for (int m = 0; m < 6; m++) begin
                jdx = m;
                expected_output.msg_cos_theta[idx][jdx] = cos_theta_out[idx*6+jdx];
                expected_output.msg_sin_theta[idx][jdx] = sin_theta_out[idx*6+jdx];
            end
        end
        //`uvm_info(get_type_name(),"Write predicted val to FIFO.",UVM_DEBUG) 
        expected_port.write(expected_output);
        
        
    endfunction
        

endclass