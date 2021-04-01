//
// File:        cordic_coverage.svh
// Author:      Grant Yu
// Date:        03/2021
// Description: Coverage collector class.
//

class cordic_coverage extends uvm_subscriber #(cordic_input_tx);

    // Factory registration
    `uvm_component_utils(cordic_coverage)
    
    // Transaction item
    cordic_input_tx input_tx;
    
    covergroup cg;
        COMMAND: coverpoint input_tx.msg_cmd[8:1] {
                    bins SINGLE_CMD  = {CMD_SINGLE_TRANS};
                    bins BURST_CMD   = {CMD_BURST_TRANS};
                    bins DISABLE_CMD = {CMD_DISABLE};
                    bins ENABLE_CMD  = {CMD_ENABLE};
                }
        BURST_CNT: coverpoint input_tx.msg_burst_cnt[8:1] {
                    bins ONE = {1};
                    bins MAX = {8};
                    bins TWO_TO_SEVEN = {[2:7]};
                }
        THETA_0: coverpoint signed'({ input_tx.msg_theta[0][5][8:1], input_tx.msg_theta[0][4][8:1], input_tx.msg_theta[0][3][8:1], 
                                      input_tx.msg_theta[0][2][8:1], input_tx.msg_theta[0][1][8:1], input_tx.msg_theta[0][0][8:1] })
                {
                    bins bin_2pi              = {PI_MULT_2};
                    bins range_3pi2_to_2pi    = {[PI_MULT_3_DIV_2   :PI_MULT_2 - 1]};
                    bins range_pi_to_3pi2     = {[PI                :PI_MULT_3_DIV_2 - 1]};
                    bins range_pi2_to_pi      = {[PI_DIV_2          :PI - 1]};
                    bins range_0_to_pi2       = {[0                 :PI_DIV_2 - 1]};
                    bins range_npi2_to_0      = {[-PI_DIV_2         :0 - 1]};
                    bins range_n3pi2_to_npi2  = {[-PI_MULT_3_DIV_2  :-PI_DIV_2 - 1]};
                    bins range_n2pi_to_n3pi2  = {[-PI_MULT_2 + 1    :-PI_MULT_3_DIV_2 - 1]};
                    bins bin_n2pi             = {-PI_MULT_2};
                }
        THETA_1: coverpoint signed'({ input_tx.msg_theta[1][5][8:1], input_tx.msg_theta[1][4][8:1], input_tx.msg_theta[1][3][8:1], 
                                      input_tx.msg_theta[1][2][8:1], input_tx.msg_theta[1][1][8:1], input_tx.msg_theta[1][0][8:1] }) 
                {
                    bins bin_2pi              = {PI_MULT_2};
                    bins range_3pi2_to_2pi    = {[PI_MULT_3_DIV_2   :PI_MULT_2 - 1]};
                    bins range_pi_to_3pi2     = {[PI                :PI_MULT_3_DIV_2 - 1]};
                    bins range_pi2_to_pi      = {[PI_DIV_2          :PI - 1]};
                    bins range_0_to_pi2       = {[0                 :PI_DIV_2 - 1]};
                    bins range_npi2_to_0      = {[-PI_DIV_2         :0 - 1]};
                    bins range_n3pi2_to_npi2  = {[-PI_MULT_3_DIV_2  :-PI_DIV_2 - 1]};
                    bins range_n2pi_to_n3pi2  = {[-PI_MULT_2 + 1    :-PI_MULT_3_DIV_2 - 1]};
                    bins bin_n2pi             = {-PI_MULT_2};
                }
        THETA_2: coverpoint signed'({ input_tx.msg_theta[2][5][8:1], input_tx.msg_theta[2][4][8:1], input_tx.msg_theta[2][3][8:1], 
                                      input_tx.msg_theta[2][2][8:1], input_tx.msg_theta[2][1][8:1], input_tx.msg_theta[2][0][8:1] })
                {
                    bins bin_2pi              = {PI_MULT_2};
                    bins range_3pi2_to_2pi    = {[PI_MULT_3_DIV_2   :PI_MULT_2 - 1]};
                    bins range_pi_to_3pi2     = {[PI                :PI_MULT_3_DIV_2 - 1]};
                    bins range_pi2_to_pi      = {[PI_DIV_2          :PI - 1]};
                    bins range_0_to_pi2       = {[0                 :PI_DIV_2 - 1]};
                    bins range_npi2_to_0      = {[-PI_DIV_2         :0 - 1]};
                    bins range_n3pi2_to_npi2  = {[-PI_MULT_3_DIV_2  :-PI_DIV_2 - 1]};
                    bins range_n2pi_to_n3pi2  = {[-PI_MULT_2 + 1    :-PI_MULT_3_DIV_2 - 1]};
                    bins bin_n2pi             = {-PI_MULT_2};
                }
        THETA_3: coverpoint signed'({ input_tx.msg_theta[3][5][8:1], input_tx.msg_theta[3][4][8:1], input_tx.msg_theta[3][3][8:1], 
                                      input_tx.msg_theta[3][2][8:1], input_tx.msg_theta[3][1][8:1], input_tx.msg_theta[3][0][8:1] } )
                {
                    bins bin_2pi              = {PI_MULT_2};
                    bins range_3pi2_to_2pi    = {[PI_MULT_3_DIV_2   :PI_MULT_2 - 1]};
                    bins range_pi_to_3pi2     = {[PI                :PI_MULT_3_DIV_2 - 1]};
                    bins range_pi2_to_pi      = {[PI_DIV_2          :PI - 1]};
                    bins range_0_to_pi2       = {[0                 :PI_DIV_2 - 1]};
                    bins range_npi2_to_0      = {[-PI_DIV_2         :0 - 1]};
                    bins range_n3pi2_to_npi2  = {[-PI_MULT_3_DIV_2  :-PI_DIV_2 - 1]};
                    bins range_n2pi_to_n3pi2  = {[-PI_MULT_2 + 1    :-PI_MULT_3_DIV_2 - 1]};
                    bins bin_n2pi             = {-PI_MULT_2};
                }
        THETA_4: coverpoint signed'({ input_tx.msg_theta[4][5][8:1], input_tx.msg_theta[4][4][8:1], input_tx.msg_theta[4][3][8:1], 
                                     input_tx.msg_theta[4][2][8:1], input_tx.msg_theta[4][1][8:1], input_tx.msg_theta[4][0][8:1] } )
                {
                    bins bin_2pi              = {PI_MULT_2};
                    bins range_3pi2_to_2pi    = {[PI_MULT_3_DIV_2   :PI_MULT_2 - 1]};
                    bins range_pi_to_3pi2     = {[PI                :PI_MULT_3_DIV_2 - 1]};
                    bins range_pi2_to_pi      = {[PI_DIV_2          :PI - 1]};
                    bins range_0_to_pi2       = {[0                 :PI_DIV_2 - 1]};
                    bins range_npi2_to_0      = {[-PI_DIV_2         :0 - 1]};
                    bins range_n3pi2_to_npi2  = {[-PI_MULT_3_DIV_2  :-PI_DIV_2 - 1]};
                    bins range_n2pi_to_n3pi2  = {[-PI_MULT_2 + 1    :-PI_MULT_3_DIV_2 - 1]};
                    bins bin_n2pi             = {-PI_MULT_2};
                }
        THETA_5: coverpoint signed'({ input_tx.msg_theta[5][5][8:1], input_tx.msg_theta[5][4][8:1], input_tx.msg_theta[5][3][8:1], 
                                     input_tx.msg_theta[5][2][8:1], input_tx.msg_theta[5][1][8:1], input_tx.msg_theta[5][0][8:1] } )
                {
                    bins bin_2pi              = {PI_MULT_2};
                    bins range_3pi2_to_2pi    = {[PI_MULT_3_DIV_2   :PI_MULT_2 - 1]};
                    bins range_pi_to_3pi2     = {[PI                :PI_MULT_3_DIV_2 - 1]};
                    bins range_pi2_to_pi      = {[PI_DIV_2          :PI - 1]};
                    bins range_0_to_pi2       = {[0                 :PI_DIV_2 - 1]};
                    bins range_npi2_to_0      = {[-PI_DIV_2         :0 - 1]};
                    bins range_n3pi2_to_npi2  = {[-PI_MULT_3_DIV_2  :-PI_DIV_2 - 1]};
                    bins range_n2pi_to_n3pi2  = {[-PI_MULT_2 + 1    :-PI_MULT_3_DIV_2 - 1]};
                    bins bin_n2pi             = {-PI_MULT_2};
                }
        THETA_6: coverpoint signed'({ input_tx.msg_theta[6][5][8:1], input_tx.msg_theta[6][4][8:1], input_tx.msg_theta[6][3][8:1], 
                                     input_tx.msg_theta[6][2][8:1], input_tx.msg_theta[6][1][8:1], input_tx.msg_theta[6][0][8:1] } )
                {
                    bins bin_2pi              = {PI_MULT_2};
                    bins range_3pi2_to_2pi    = {[PI_MULT_3_DIV_2   :PI_MULT_2 - 1]};
                    bins range_pi_to_3pi2     = {[PI                :PI_MULT_3_DIV_2 - 1]};
                    bins range_pi2_to_pi      = {[PI_DIV_2          :PI - 1]};
                    bins range_0_to_pi2       = {[0                 :PI_DIV_2 - 1]};
                    bins range_npi2_to_0      = {[-PI_DIV_2         :0 - 1]};
                    bins range_n3pi2_to_npi2  = {[-PI_MULT_3_DIV_2  :-PI_DIV_2 - 1]};
                    bins range_n2pi_to_n3pi2  = {[-PI_MULT_2 + 1    :-PI_MULT_3_DIV_2 - 1]};
                    bins bin_n2pi             = {-PI_MULT_2};
                }
        THETA_7: coverpoint signed'({ input_tx.msg_theta[7][5][8:1], input_tx.msg_theta[7][4][8:1], input_tx.msg_theta[7][3][8:1], 
                                     input_tx.msg_theta[7][2][8:1], input_tx.msg_theta[7][1][8:1], input_tx.msg_theta[7][0][8:1] } )
                {
                    bins bin_2pi              = {PI_MULT_2};
                    bins range_3pi2_to_2pi    = {[PI_MULT_3_DIV_2   :PI_MULT_2 - 1]};
                    bins range_pi_to_3pi2     = {[PI                :PI_MULT_3_DIV_2 - 1]};
                    bins range_pi2_to_pi      = {[PI_DIV_2          :PI - 1]};
                    bins range_0_to_pi2       = {[0                 :PI_DIV_2 - 1]};
                    bins range_npi2_to_0      = {[-PI_DIV_2         :0 - 1]};
                    bins range_n3pi2_to_npi2  = {[-PI_MULT_3_DIV_2  :-PI_DIV_2 - 1]};
                    bins range_n2pi_to_n3pi2  = {[-PI_MULT_2 + 1    :-PI_MULT_3_DIV_2 - 1]};
                    bins bin_n2pi             = {-PI_MULT_2};
                }
        THETA_COMBINED: cross THETA_0, THETA_1, THETA_2, THETA_3, THETA_4, THETA_5, THETA_6, THETA_7 {
            bins all_bin_2pi                = binsof(THETA_0.bin_2pi)             || binsof(THETA_1.bin_2pi)             || binsof(THETA_2.bin_2pi)             || binsof(THETA_3.bin_2pi) ||
                                              binsof(THETA_4.bin_2pi)             || binsof(THETA_5.bin_2pi)             || binsof(THETA_6.bin_2pi)             || binsof(THETA_7.bin_2pi);
            bins all_range_3pi2_to_2pi      = binsof(THETA_0.range_3pi2_to_2pi)   || binsof(THETA_1.range_3pi2_to_2pi)   || binsof(THETA_2.range_3pi2_to_2pi)   || binsof(THETA_3.range_3pi2_to_2pi) ||
                                              binsof(THETA_4.range_3pi2_to_2pi)   || binsof(THETA_5.range_3pi2_to_2pi)   || binsof(THETA_6.range_3pi2_to_2pi)   || binsof(THETA_7.range_3pi2_to_2pi);
            bins all_range_pi_to_3pi2       = binsof(THETA_0.range_pi_to_3pi2)    || binsof(THETA_1.range_pi_to_3pi2)    || binsof(THETA_2.range_pi_to_3pi2)    || binsof(THETA_3.range_pi_to_3pi2) ||
                                              binsof(THETA_4.range_pi_to_3pi2)    || binsof(THETA_5.range_pi_to_3pi2)    || binsof(THETA_6.range_pi_to_3pi2)    || binsof(THETA_7.range_pi_to_3pi2);
            bins all_range_pi2_to_pi        = binsof(THETA_0.range_pi2_to_pi)     || binsof(THETA_1.range_pi2_to_pi)     || binsof(THETA_2.range_pi2_to_pi)     || binsof(THETA_3.range_pi2_to_pi) ||
                                              binsof(THETA_4.range_pi2_to_pi)     || binsof(THETA_5.range_pi2_to_pi)     || binsof(THETA_6.range_pi2_to_pi)     || binsof(THETA_7.range_pi2_to_pi);
            bins all_range_0_to_pi2         = binsof(THETA_0.range_0_to_pi2)      || binsof(THETA_1.range_0_to_pi2)      || binsof(THETA_2.range_0_to_pi2)      || binsof(THETA_3.range_0_to_pi2) ||
                                              binsof(THETA_4.range_0_to_pi2)      || binsof(THETA_5.range_0_to_pi2)      || binsof(THETA_6.range_0_to_pi2)      || binsof(THETA_7.range_0_to_pi2);
            bins all_range_npi2_to_0        = binsof(THETA_0.range_npi2_to_0)     || binsof(THETA_1.range_npi2_to_0)     || binsof(THETA_2.range_npi2_to_0)     || binsof(THETA_3.range_npi2_to_0) ||
                                              binsof(THETA_4.range_npi2_to_0)     || binsof(THETA_5.range_npi2_to_0)     || binsof(THETA_6.range_npi2_to_0)     || binsof(THETA_7.range_npi2_to_0);
            bins all_range_n3pi2_to_npi2    = binsof(THETA_0.range_n3pi2_to_npi2) || binsof(THETA_1.range_n3pi2_to_npi2) || binsof(THETA_2.range_n3pi2_to_npi2) || binsof(THETA_3.range_n3pi2_to_npi2) ||
                                              binsof(THETA_4.range_n3pi2_to_npi2) || binsof(THETA_5.range_n3pi2_to_npi2) || binsof(THETA_6.range_n3pi2_to_npi2) || binsof(THETA_7.range_n3pi2_to_npi2);
            bins all_range_n2pi_to_n3pi2    = binsof(THETA_0.range_n2pi_to_n3pi2) || binsof(THETA_1.range_n2pi_to_n3pi2) || binsof(THETA_2.range_n2pi_to_n3pi2) || binsof(THETA_3.range_n2pi_to_n3pi2) ||
                                              binsof(THETA_4.range_n2pi_to_n3pi2) || binsof(THETA_5.range_n2pi_to_n3pi2) || binsof(THETA_6.range_n2pi_to_n3pi2) || binsof(THETA_7.range_n2pi_to_n3pi2);
            bins all_bin_n2pi               = binsof(THETA_0.bin_n2pi)            || binsof(THETA_1.bin_n2pi)            || binsof(THETA_2.bin_n2pi)            || binsof(THETA_3.bin_n2pi) ||
                                              binsof(THETA_4.bin_n2pi)            || binsof(THETA_5.bin_n2pi)            || binsof(THETA_6.bin_n2pi)            || binsof(THETA_7.bin_n2pi);
            
            ignore_bins ignore              = !binsof(THETA_0.bin_2pi) && !binsof(THETA_1.bin_2pi) && !binsof(THETA_2.bin_2pi) && !binsof(THETA_3.bin_2pi) &&
                                              !binsof(THETA_4.bin_2pi) && !binsof(THETA_5.bin_2pi) && !binsof(THETA_6.bin_2pi) && !binsof(THETA_7.bin_2pi) &&
                                              !binsof(THETA_0.range_3pi2_to_2pi) && !binsof(THETA_1.range_3pi2_to_2pi) && !binsof(THETA_2.range_3pi2_to_2pi) && !binsof(THETA_3.range_3pi2_to_2pi) &&
                                              !binsof(THETA_4.range_3pi2_to_2pi) && !binsof(THETA_5.range_3pi2_to_2pi) && !binsof(THETA_6.range_3pi2_to_2pi) && !binsof(THETA_7.range_3pi2_to_2pi) &&
                                              !binsof(THETA_0.range_pi_to_3pi2) && !binsof(THETA_1.range_pi_to_3pi2) && !binsof(THETA_2.range_pi_to_3pi2) && !binsof(THETA_3.range_pi_to_3pi2) &&
                                              !binsof(THETA_4.range_pi_to_3pi2) && !binsof(THETA_5.range_pi_to_3pi2) && !binsof(THETA_6.range_pi_to_3pi2) && !binsof(THETA_7.range_pi_to_3pi2) &&
                                              !binsof(THETA_0.range_pi2_to_pi) && !binsof(THETA_1.range_pi2_to_pi) && !binsof(THETA_2.range_pi2_to_pi) && !binsof(THETA_3.range_pi2_to_pi) &&
                                              !binsof(THETA_4.range_pi2_to_pi) && !binsof(THETA_5.range_pi2_to_pi) && !binsof(THETA_6.range_pi2_to_pi) && !binsof(THETA_7.range_pi2_to_pi) &&
                                              !binsof(THETA_0.range_0_to_pi2) && !binsof(THETA_1.range_0_to_pi2) && !binsof(THETA_2.range_0_to_pi2) && !binsof(THETA_3.range_0_to_pi2) &&
                                              !binsof(THETA_4.range_0_to_pi2) && !binsof(THETA_5.range_0_to_pi2) && !binsof(THETA_6.range_0_to_pi2) && !binsof(THETA_7.range_0_to_pi2) &&
                                              !binsof(THETA_0.range_npi2_to_0) && !binsof(THETA_1.range_npi2_to_0) && !binsof(THETA_2.range_npi2_to_0) && !binsof(THETA_3.range_npi2_to_0) &&
                                              !binsof(THETA_4.range_npi2_to_0) && !binsof(THETA_5.range_npi2_to_0) && !binsof(THETA_6.range_npi2_to_0) && !binsof(THETA_7.range_npi2_to_0) &&
                                              !binsof(THETA_0.range_n3pi2_to_npi2) && !binsof(THETA_1.range_n3pi2_to_npi2) && !binsof(THETA_2.range_n3pi2_to_npi2) && !binsof(THETA_3.range_n3pi2_to_npi2) &&
                                              !binsof(THETA_4.range_n3pi2_to_npi2) && !binsof(THETA_5.range_n3pi2_to_npi2) && !binsof(THETA_6.range_n3pi2_to_npi2) && !binsof(THETA_7.range_n3pi2_to_npi2) &&
                                              !binsof(THETA_0.range_n2pi_to_n3pi2) && !binsof(THETA_1.range_n2pi_to_n3pi2) && !binsof(THETA_2.range_n2pi_to_n3pi2) && !binsof(THETA_3.range_n2pi_to_n3pi2) &&
                                              !binsof(THETA_4.range_n2pi_to_n3pi2) && !binsof(THETA_5.range_n2pi_to_n3pi2) && !binsof(THETA_6.range_n2pi_to_n3pi2) && !binsof(THETA_7.range_n2pi_to_n3pi2) &&
                                              !binsof(THETA_0.bin_n2pi) && !binsof(THETA_1.bin_n2pi) && !binsof(THETA_2.bin_n2pi) && !binsof(THETA_3.bin_n2pi) &&
                                              !binsof(THETA_4.bin_n2pi) && !binsof(THETA_5.bin_n2pi) && !binsof(THETA_6.bin_n2pi) && !binsof(THETA_7.bin_n2pi);
        
        }
    endgroup
    
    // Imp export
    function void write(cordic_input_tx t);
        this.input_tx = t;
        cg.sample();
    endfunction: write
    
    // Constructor
    function new(string name, uvm_component parent);
        super.new(name, parent);
        cg = new();
    endfunction: new
    
    // report coverage
    virtual function void report_phase(uvm_phase phase);
    `uvm_info("COVERAGE", $sformatf("\n\n\t Functional coverage = %2.2f%%\n",
                                         cg.get_coverage()), UVM_NONE)
    endfunction: report_phase
    
    
endclass: cordic_coverage
