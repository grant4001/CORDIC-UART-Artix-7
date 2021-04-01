//
// File:        design.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Design files conglomerate for edaplayground
//

`include "pkg_cordic_sincos.sv"
`include "cordic_sincos_preprocess.sv"
`include "cordic_sincos_stage.sv"
`include "cordic_sincos.sv"
`include "lfsr.sv"
`include "bram.sv"
`include "sync_fifo.sv"
`include "pkg_msg.sv"
`include "uart_rx_msg.sv"
`include "uart_tx_msg.sv"
`include "uart_rx.sv"
`include "uart_tx.sv"
`include "top_module.sv"