// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
// Date        : Mon Jul 14 22:38:32 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               D:/TP_P_F_485T/TopoQPLL_80GTs_v3.7_485UpdateAlignmentModCRCFix/TopoGTH_QPLL_AV2.srcs/sources_1/ip/vio_128_bit_align_debug/vio_128_bit_align_debug_stub.v
// Design      : vio_128_bit_align_debug
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "vio,Vivado 2014.2" *)
module vio_128_bit_align_debug(clk, probe_in0, probe_in1, probe_in2, probe_out0, probe_out1, probe_out2, probe_out3, probe_out4, probe_out5, probe_out6)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[3:0],probe_in1[4:0],probe_in2[15:0],probe_out0[1:0],probe_out1[1:0],probe_out2[1:0],probe_out3[1:0],probe_out4[0:0],probe_out5[6:0],probe_out6[2:0]" */;
  input clk;
  input [3:0]probe_in0;
  input [4:0]probe_in1;
  input [15:0]probe_in2;
  output [1:0]probe_out0;
  output [1:0]probe_out1;
  output [1:0]probe_out2;
  output [1:0]probe_out3;
  output [0:0]probe_out4;
  output [6:0]probe_out5;
  output [2:0]probe_out6;
endmodule
