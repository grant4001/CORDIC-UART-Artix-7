//
// File:        cordic_uvm_pkg.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Wrapper for UVM classes.
//

package cordic_uvm_pkg;

    // UVM includes/imports
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    
    // DUT data package includes/imports
    import pkg_cordic_sincos::*;
    import pkg_msg::*;
    
	// Sequence item
    `include "../uvm_tb_hvl/sequence_item/cordic_base_tx.svh"
    `include "../uvm_tb_hvl/sequence_item/cordic_input_tx.svh"
    `include "../uvm_tb_hvl/sequence_item/cordic_output_tx.svh"

	// Agent
    `include "../uvm_tb_hvl/agent/cordic_agent_cfg.svh"
    `include "../uvm_tb_hvl/agent/cordic_coverage.svh"
    `include "../uvm_tb_hvl/agent/cordic_driver.svh"
    `include "../uvm_tb_hvl/agent/cordic_monitor.svh"
    `include "../uvm_tb_hvl/agent/cordic_agent.svh"

	// Sequence
	`include "../uvm_tb_hvl/sequence/disable_enable_sequence.svh"
	`include "../uvm_tb_hvl/sequence/single_cmd_sequence.svh"
	`include "../uvm_tb_hvl/sequence/burst_cmd_sequence.svh"
	`include "../uvm_tb_hvl/sequence/cordic_vseq.svh"
    
    // Subscriber
    `include "../uvm_tb_hvl/subscriber/cordic_predictor.svh"
    `include "../uvm_tb_hvl/subscriber/cordic_evaluator.svh"
    `include "../uvm_tb_hvl/subscriber/cordic_scoreboard.svh"

	// Environment
	`include "../uvm_tb_hvl/environment/cordic_env_cfg.svh"
	`include "../uvm_tb_hvl/environment/cordic_env.svh"

	// Test
    `include "../uvm_tb_hvl/test/cordic_base_test.svh"
	`include "../uvm_tb_hvl/test/cordic_vseq_test.svh"

endpackage