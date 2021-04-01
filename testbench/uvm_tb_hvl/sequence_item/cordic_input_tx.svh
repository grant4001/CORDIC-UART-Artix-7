//
// File:        cordic_input_tx.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Input transaction class with UART message fields specific to input messages.
//

class cordic_input_tx extends cordic_base_tx;

    // Factory registration
    `uvm_object_utils(cordic_input_tx)
    
    // Constructor
    function new(string name = "cordic_input_tx");
        super.new(name);
    endfunction: new
  
  	// Data members
    rand bit [5:0][10:0]    msg_theta[8];
    
    // CRC-8 single byte calculator, shift register implementation
    function bit [7:0] crc_8_byte(  input bit [7:0] crc_8_in,
                                    input bit [7:0] byte_in, 
                                    input bit [7:0] poly_in);
        // XOR in the byte
        crc_8_byte = crc_8_in;
        crc_8_byte ^= byte_in;
        
        // Calculate CRC-8
        for (int i = 0; i < 8; i++) begin
            if (crc_8_byte[7])  crc_8_byte = (crc_8_byte << 1) ^ poly_in;
            else                crc_8_byte = (crc_8_byte << 1);
        end
        
    endfunction: crc_8_byte;
    
    // CRC-8 calculator
    function bit [7:0] calc_crc_8(  input bit [7:0] poly,
                                    input bit [10:0] header, 
                                    input bit [10:0] cmd, 
                                    input bit [10:0] burst_cnt,
                                    input bit [5:0][10:0] theta[8] );
    
        // Initialize the crc-8 to zero
        calc_crc_8 = '0;
        
        // Shift in header byte
        calc_crc_8 = crc_8_byte(calc_crc_8, header[8:1], poly);
        // Shift in cmd byte
        calc_crc_8 = crc_8_byte(calc_crc_8, cmd[8:1], poly);
        
        // Branch based on the command
        unique case (cmd[8:1])
            CMD_SINGLE_TRANS:   for (int i = 0; i < 6; i++)
                                    calc_crc_8 = crc_8_byte(calc_crc_8, theta[0][i][8:1], poly);
            CMD_BURST_TRANS:    begin
                                    calc_crc_8 = crc_8_byte(calc_crc_8, burst_cnt[8:1], poly);
                                    for (int i = 0; i < burst_cnt[8:1]; i++)
                                        for (int j = 0; j < 6; j++)
                                            calc_crc_8 = crc_8_byte(calc_crc_8, theta[i][j][8:1], poly);
                                end
            CMD_DISABLE:        begin end
            CMD_ENABLE:         begin end
        endcase
        
    endfunction: calc_crc_8
    
    // Constraints
    constraint c_msg_header { msg_header[0]   == 1'b0;
                              msg_header[8:1] == BYTE_HEADER;
                              msg_header[9]   == ~^msg_header[8:1];
                              msg_header[10]  == 1'b1; }
    
    // CMD frame should abide by UART protocol
    constraint c_msg_cmd {  msg_cmd[0]   == 1'b0;
                            msg_cmd[8:1] inside { CMD_SINGLE_TRANS, CMD_BURST_TRANS, CMD_DISABLE, CMD_ENABLE };
                            msg_cmd[9]   == ~^msg_cmd[8:1];
                            msg_cmd[10]  == 1'b1; }
    
    // Burst count should abide by UART protocol
    constraint c_msg_burst_cnt {    msg_burst_cnt[0]   == 1'b0;
                                    msg_burst_cnt[8:1] inside {[1:8]};
                                    msg_burst_cnt[9]   == ~^msg_burst_cnt[8:1];
                                    msg_burst_cnt[10]  == 1'b1; }

    // CRC-8 frame should abide by UART protocol
    constraint c_msg_crc8 { msg_crc_8[0]   == 1'b0;
                            msg_crc_8[8:1] == calc_crc_8(POLY, msg_header, msg_cmd, msg_burst_cnt, msg_theta);
                            msg_crc_8[9]   == ~^msg_crc_8[8:1];
                            msg_crc_8[10]  == 1'b1; }
                                       
    // Theta frame should abide by UART protocol                                                
    constraint c_msg_theta_uart_frame { foreach (msg_theta[i]) {
                                            foreach (msg_theta[i][j]) {
                                                msg_theta[i][j][0]  == 1'b0;
                                                msg_theta[i][j][9]  == ~^msg_theta[i][j][8:1];
                                                msg_theta[i][j][10] == 1'b1;
                                            } 
                                        } }
                                        
    // Constrain theta to be in range [-2pi,2pi]                                    
    constraint c_msg_theta_vals { foreach (msg_theta[i]) {
                                    signed'({msg_theta[i][5][8:1],
                                             msg_theta[i][4][8:1],
                                             msg_theta[i][3][8:1],
                                             msg_theta[i][2][8:1],
                                             msg_theta[i][1][8:1],
                                             msg_theta[i][0][8:1]}) <= PI_MULT_2; // 2pi
                                    signed'({msg_theta[i][5][8:1],
                                             msg_theta[i][4][8:1],
                                             msg_theta[i][3][8:1],
                                             msg_theta[i][2][8:1],
                                             msg_theta[i][1][8:1],
                                             msg_theta[i][0][8:1]}) >= -PI_MULT_2; // -2pi
                                    } }
    
    // Transaction methods
    virtual function void do_copy(uvm_object rhs);
        cordic_input_tx cordic_input_rhs;
        if (!$cast(cordic_input_rhs, rhs))
            `uvm_fatal(get_type_name(), "Illegal RHS argument.")
            
        super.do_copy(rhs);
        this.msg_theta = cordic_input_rhs.msg_theta;
    
    endfunction
    
    virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        cordic_input_tx cordic_input_rhs;
        if (!$cast(cordic_input_rhs, rhs))
            `uvm_fatal(get_type_name(), "Illegal RHS argument.")
            
        return (super.do_compare(rhs, comparer) &&
                (this.msg_theta  === cordic_input_rhs.msg_theta));
    endfunction
    
    virtual function string convert2string();
        string s = super.convert2string();
        $sformat(s, "%s\n   msg_theta     =      ",    s);
      for (int i = 0; i < 8; i++) begin
        $sformat(s, "%s\n                       0x%x%x%x%x%x%x", s, msg_theta[i][5][8:1],
                                                                    msg_theta[i][4][8:1],
                                                                    msg_theta[i][3][8:1],
                                                                    msg_theta[i][2][8:1],
                                                                    msg_theta[i][1][8:1],
                                                                    msg_theta[i][0][8:1]);
        end
        $sformat(s, "%s\n   msg_crc_8     = 0x%x",     s, msg_crc_8[8:1]);
        
        return s;
    endfunction
    
    virtual function void do_print(uvm_printer printer);
        printer.m_string = convert2string();
    endfunction
    
    virtual function void do_pack(uvm_packer packer);
        return;
    endfunction
    
    virtual function void do_unpack(uvm_packer packer);
        return;
    endfunction
    
    virtual function void do_record(uvm_recorder recorder);
        return;
    endfunction

endclass: cordic_input_tx