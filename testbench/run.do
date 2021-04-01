#
# File:        run.do
# Author:      Grant Yu
# Date:        03/2021
# Description: TCL script for running the cordic UVM TB on QuestaSim. Credits to this file go to Siemens EDA.
#
.main clear
quietly set debugop ""
quietly set ipargs ""
quietly set vsimarg ""
quietly set labname ""
while {$argc > 0} {
    quietly set iparg $1
    lappend ipargs $iparg
	shift
   }

foreach i $ipargs {
    if {$i == "classdbg"} {
      puts "Running vsim with debug: -classdebug -uvmcontrol=all -msgmode both"
      set debugop "$space -gui -msgmode both -classdebug -uvmcontrol=all"
	  set do_args "onfinish stop; run 0"
     } else {
	  lappend vsimarg $i
	 }
}

quietly set totargs "$vsimarg $debugop"
quietly set testname [lindex $totargs 0]
quietly set simargs [lrange $totargs 1 end]

puts "Compiling and running batch with test name $testname"

# Delete the work library to make sure a compile error prevents vsim from running
file delete -force work

# Create empty Questa library
if {[catch {vlib work} ]} {
   puts "vlib exited with errors $errmsg, exiting VLIB"
   break
} 

# Compile the SystemVerilog code
if {[catch {vlog -f run.f} errmsg ]} {
   puts "vlog exited with errors $errmsg, exiting VLOG"
   break
} 

# Optimize the dual-top design with debug access 
if {[catch {vopt +acc top_hdl top_tb -o top_opt} errmsg ]} {
   puts "vopt exited with errors $errmsg, exiting VLOG"
   break
} 

# Simulate the optimized dual-top design
vsim {*}$simargs +UVM_TESTNAME=$testname +UVM_VERBOSITY=UVM_DEBUG +UVM_NO_RELNOTES top_opt \
    +uvm_set_config_int=uvm_test_top,num_dis_en_items,5 \
    +uvm_set_config_int=uvm_test_top,num_sing_cmd_items,50 \
    +uvm_set_config_int=uvm_test_top,num_burst_cmd_items,50 

add wave -group top_hdl/
add wave -group top_hdl/ -radix hexadecimal /top_hdl/*

add wave -group top_hdl/DUT/
add wave -group top_hdl/DUT/ -radix hexadecimal /top_hdl/DUT/*

add wave -group top_hdl/DUT/uart_rx_module
add wave -group top_hdl/DUT/uart_rx_module -radix hexadecimal /top_hdl/DUT/uart_rx_module/*

add wave -group top_hdl/DUT/uart_rx_msg_module
add wave -group top_hdl/DUT/uart_rx_msg_module -radix hexadecimal /top_hdl/DUT/uart_rx_msg_module/*

add wave -group top_hdl/DUT/uart_tx_msg_module
add wave -group top_hdl/DUT/uart_tx_msg_module -radix hexadecimal /top_hdl/DUT/uart_tx_msg_module/*

add wave -group top_hdl/DUT/uart_tx_module
add wave -group top_hdl/DUT/uart_tx_module -radix hexadecimal /top_hdl/DUT/uart_tx_module/*

run -all