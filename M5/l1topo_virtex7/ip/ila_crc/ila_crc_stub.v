// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
// Date        : Tue Jul 15 15:22:54 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               D:/TP_P_F_485T/TopoQPLL_80GTs_v3.7_AlignMod16BCRCFix_CMX_ILA/TopoGTH_QPLL_AV2.srcs/sources_1/ip/ila_crc/ila_crc_stub.v
// Design      : ila_crc
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2014.2" *)
module ila_crc(clk, probe0, probe1, probe2, probe3, probe4, probe5, probe6, probe7, probe8, probe9)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[31:0],probe1[127:0],probe2[3:0],probe3[15:0],probe4[0:0],probe5[0:0],probe6[0:0],probe7[4:0],probe8[31:0],probe9[3:0]" */;
  input clk;
  input [31:0]probe0;
  input [127:0]probe1;
  input [3:0]probe2;
  input [15:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
  input [0:0]probe6;
  input [4:0]probe7;
  input [31:0]probe8;
  input [3:0]probe9;
endmodule
