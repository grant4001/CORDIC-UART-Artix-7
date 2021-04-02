//
// File:        pkg_msg.sv
// Author:      Grant Yu
// Date:        03/2021
// Description: Data package for the messaging scheme.
//
// Copyright (C) 2021, Grant Yu
//
// This program is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.
// 
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.
// 
//    You should have received a copy of the GNU General Public License
//     along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

package pkg_msg;

parameter bit [7:0] POLY = 8'h9b;
parameter bit [7:0] BYTE_HEADER         = 8'h5a;
parameter bit [7:0] CMD_SINGLE_TRANS    = 8'hd1;
parameter bit [7:0] CMD_BURST_TRANS     = 8'hd2;
parameter bit [7:0] CMD_DISABLE         = 8'he1;
parameter bit [7:0] CMD_ENABLE          = 8'he2;

endpackage