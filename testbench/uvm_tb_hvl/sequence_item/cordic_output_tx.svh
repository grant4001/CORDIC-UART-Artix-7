//
// File:        cordic_output_tx.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Output transaction class (response message coming from the DUT).
//

class cordic_output_tx extends cordic_base_tx;

    // Factory registration
    `uvm_object_utils(cordic_output_tx)
    
    // Constructor
    function new(string name = "cordic_output_tx");
        super.new(name);
    endfunction: new
    
    // Data members
    bit [5:0][10:0]    msg_cos_theta[8];
    bit [5:0][10:0]    msg_sin_theta[8];
  
  	// Transaction methods
  	virtual function void do_copy(uvm_object rhs);
      cordic_output_tx cordic_output_rhs;
      if (!$cast(cordic_output_rhs, rhs))
        `uvm_fatal(get_type_name(), "Illegal RHS argument.")
      super.do_copy(rhs);
      this.msg_cos_theta    = cordic_output_rhs.msg_cos_theta;
      this.msg_sin_theta    = cordic_output_rhs.msg_sin_theta;
    endfunction
  
    virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
      cordic_output_tx cordic_output_rhs;
      if (!$cast(cordic_output_rhs, rhs))
        `uvm_fatal(get_type_name(), "Illegal RHS argument.")
        return ( super.do_compare(rhs, comparer) &&
                (this.msg_cos_theta === cordic_output_rhs.msg_cos_theta) &&
                (this.msg_sin_theta === cordic_output_rhs.msg_sin_theta));
    endfunction
  
    virtual function string convert2string();
        string s = super.convert2string();
        $sformat(s, "%s\n   msg_cos_theta = ",    s);
        for (int i = 0; i < 8; i++) begin
        $sformat(s, "%s\n                       0x%x%x%x%x%x%x", s, msg_cos_theta[i][5][8:1],
                                                                    msg_cos_theta[i][4][8:1],
                                                                    msg_cos_theta[i][3][8:1],
                                                                    msg_cos_theta[i][2][8:1],
                                                                    msg_cos_theta[i][1][8:1],
                                                                    msg_cos_theta[i][0][8:1]);
        end
        $sformat(s, "%s\n   msg_sin_theta = ",    s);
        for (int i = 0; i < 8; i++) begin
        $sformat(s, "%s\n                       0x%x%x%x%x%x%x", s, msg_sin_theta[i][5][8:1],
                                                                    msg_sin_theta[i][4][8:1],
                                                                    msg_sin_theta[i][3][8:1],
                                                                    msg_sin_theta[i][2][8:1],
                                                                    msg_sin_theta[i][1][8:1],
                                                                    msg_sin_theta[i][0][8:1]);
        end
        $sformat(s, "%s\n   msg_crc_8     = 0x%x" , s, msg_crc_8[8:1]);
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
    
endclass: cordic_output_tx
