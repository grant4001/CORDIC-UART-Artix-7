//
// File:        pkg_msg.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Data package for the messaging scheme.
//

package pkg_msg;

parameter bit [7:0] POLY = 8'h9b;
parameter bit [7:0] BYTE_HEADER         = 8'h5a;
parameter bit [7:0] CMD_SINGLE_TRANS    = 8'hd1;
parameter bit [7:0] CMD_BURST_TRANS     = 8'hd2;
parameter bit [7:0] CMD_DISABLE         = 8'he1;
parameter bit [7:0] CMD_ENABLE          = 8'he2;

endpackage