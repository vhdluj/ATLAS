// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (win64) Build 881834 Fri Apr  4 14:12:35 MDT 2014
// Date        : Wed Jun 04 16:31:56 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               d:/GTHFirstSteps/TopoGTH_QPLL_AV2_Multi80MGTs_v3.2_CRC/TopoGTH_QPLL_AV2.srcs/sources_1/ip/ila_40MHz/ila_40MHz_stub.v
// Design      : ila_40MHz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2014.1" *)
module ila_40MHz(clk, probe0, probe1, probe2)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[127:0],probe1[15:0],probe2[0:0]" */;
  input clk;
  input [127:0]probe0;
  input [15:0]probe1;
  input [0:0]probe2;
endmodule
