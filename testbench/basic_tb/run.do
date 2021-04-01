vlib work
vlog -sv ../hdl/cordic_sincos/pkg_cordic_sincos.sv \
         ../hdl/cordic_sincos/cordic_sincos_preprocess.sv \
         ../hdl/cordic_sincos/cordic_sincos_stage.sv \
         ../hdl/cordic_sincos/cordic_sincos.sv \
         ../hdl/utils/lfsr.sv \
         ../hdl/utils/bram.sv \
         ../hdl/utils/sync_fifo.sv \
         ../hdl/utils/uart_rx.sv \
         ../hdl/utils/uart_tx.sv \
         ../hdl/utils/uart_rx_msg.sv \
         ../hdl/utils/uart_tx_msg.sv \
         ../hdl/utils/top_module.sv \
         testbench.sv
vsim work.testbench
add wave -group testbench
add wave -group testbench -radix hexadecimal testbench/*
add wave -group testbench/dut
add wave -group testbench/dut -radix hexadecimal testbench/dut/*
add wave -group testbench/dut/uart_rx_module
add wave -group testbench/dut/uart_rx_module -radix hexadecimal testbench/dut/uart_rx_module/*
add wave -group testbench/dut/uart_rx_msg_module
add wave -group testbench/dut/uart_rx_msg_module -radix hexadecimal testbench/dut/uart_rx_msg_module/*
add wave -group testbench/dut/cordic_sincos_module
add wave -group testbench/dut/cordic_sincos_module -radix hexadecimal testbench/dut/cordic_sincos_module/*
add wave -group testbench/dut/uart_tx_msg_module
add wave -group testbench/dut/uart_tx_msg_module -radix hexadecimal testbench/dut/uart_tx_msg_module/*
add wave -group testbench/dut/sync_fifo_inst
add wave -group testbench/dut/sync_fifo_inst -radix hexadecimal testbench/dut/sync_fifo_inst/*
add wave -group testbench/dut/uart_tx_module
add wave -group testbench/dut/uart_tx_module -radix hexadecimal testbench/dut/uart_tx_module/*
run -all