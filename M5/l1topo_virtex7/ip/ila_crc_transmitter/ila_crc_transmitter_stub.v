// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
// Date        : Tue Jul 15 16:52:32 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               d:/TP_P_F_485T/TopoQPLL_80GTs_v3.7_AlignMod16BCRCFix_CMX_ILA/TopoGTH_QPLL_AV2.srcs/sources_1/ip/ila_crc_transmitter/ila_crc_transmitter_stub.v
// Design      : ila_crc_transmitter
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2014.2" *)
module ila_crc_transmitter(clk, probe0, probe1, probe2, probe3, probe4, probe5, probe6)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[7:0],probe1[1:0],probe2[1:0],probe3[127:0],probe4[31:0],probe5[15:0],probe6[3:0]" */;
  input clk;
  input [7:0]probe0;
  input [1:0]probe1;
  input [1:0]probe2;
  input [127:0]probe3;
  input [31:0]probe4;
  input [15:0]probe5;
  input [3:0]probe6;
endmodule
