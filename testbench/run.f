//
// File:        run.f
// Author:      Grant Yu
// Date:        03/2021
// Description: UVM TB file compilation list
//

../hdl/cordic_sincos/pkg_cordic_sincos.sv 
../hdl/cordic_sincos/cordic_sincos_preprocess.sv 
../hdl/cordic_sincos/cordic_sincos_stage.sv 
../hdl/cordic_sincos/cordic_sincos.sv 
../hdl/utils/lfsr.sv 
../hdl/utils/bram.sv 
../hdl/utils/sync_fifo.sv 
../hdl/utils/uart_rx.sv 
../hdl/utils/uart_tx.sv 
../hdl/utils/pkg_msg.sv
../hdl/utils/uart_rx_msg.sv 
../hdl/utils/uart_tx_msg.sv 
../hdl/utils/top_module.sv
uvm_tb_hvl/subscriber/cordic_gref.cpp
uvm_tb_hdl/cordic_uvm_pkg.sv
uvm_tb_hdl/uart_if.sv
uvm_tb_hdl/top_hdl.sv
uvm_tb_hdl/top_tb.sv

+UVM_TESTNAME=cordic_vseq_test
+UVM_VERBOSITY=UVM_DEBUG
+UVM_SET_CONFIG_INT=uvm_test_top,num_dis_en_items,1
+UVM_SET_CONFIG_INT=uvm_test_top,num_sing_cmd_items,3
+UVM_SET_CONFIG_INT=uvm_test_top,num_burst_cmd_items,2