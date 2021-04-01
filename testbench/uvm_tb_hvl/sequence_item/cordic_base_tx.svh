//
// File:        cordic_base_tx.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Base transaction class. This class contains the basic UART message fields.
//

class cordic_base_tx extends uvm_sequence_item;

    // Register object in factory
    `uvm_object_utils(cordic_base_tx)
    
    // Constructor
    function new(string name = "cordic_base_tx");
        super.new(name);
    endfunction: new
    
    // Data members
    rand bit [10:0]  msg_header;
    rand bit [10:0]  msg_cmd;
    rand bit [10:0]  msg_burst_cnt;
    rand bit [10:0]  msg_crc_8;
    
    // Transaction methods
    virtual function void do_copy(uvm_object rhs);
        cordic_base_tx cordic_base_rhs;
        if (!$cast(cordic_base_rhs, rhs))
            `uvm_fatal(get_type_name(), "Illegal RHS argument.")
            
        super.do_copy(rhs);
        this.msg_header = cordic_base_rhs.msg_header;
        this.msg_cmd = cordic_base_rhs.msg_cmd;
        this.msg_burst_cnt = cordic_base_rhs.msg_burst_cnt;
        this.msg_crc_8  = cordic_base_rhs.msg_crc_8;
    
    endfunction
    
    virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
        cordic_base_tx cordic_base_rhs;
        if (!$cast(cordic_base_rhs, rhs))
            `uvm_fatal(get_type_name(), "Illegal RHS argument.")
            
        return (super.do_compare(rhs, comparer) &&
                (this.msg_header    === cordic_base_rhs.msg_header) &&
                (this.msg_cmd       === cordic_base_rhs.msg_cmd) &&
                (this.msg_burst_cnt === cordic_base_rhs.msg_burst_cnt) &&
                (this.msg_crc_8     === cordic_base_rhs.msg_crc_8));
    endfunction
    
    virtual function string convert2string();
        string s = super.convert2string();
        $sformat(s, "%s\n CORDIC tx_item values are:", s);
        $sformat(s, "%s\n   msg_header    = { %x, %x, 0x%x, %x}",     s, msg_header[10],    msg_header[9],      msg_header[8:1],    msg_header[0]);
        $sformat(s, "%s\n   msg_cmd       = { %x, %x, 0x%x, %x}",     s, msg_cmd[10],       msg_cmd[9],         msg_cmd[8:1],       msg_cmd[0]);
        $sformat(s, "%s\n   msg_burst_cnt = { %x, %x, 0x%x, %x}",     s, msg_burst_cnt[10], msg_burst_cnt[9],   msg_burst_cnt[8:1], msg_burst_cnt[0]);
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

endclass: cordic_base_tx