// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
// Date        : Wed Jul 16 15:12:12 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               D:/TP_P_F_485T/TopoQPLL_80GTs_v3.8_AlignMod4B_CRCFix_CMX_ILA_BER/TopoGTH_QPLL_AV2.srcs/sources_1/ip/vio_0/vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "vio,Vivado 2014.2" *)
module vio_0(clk, probe_in0, probe_in1, probe_in2, probe_in3, probe_in4, probe_in5, probe_in6, probe_in7, probe_in8, probe_in9, probe_in10, probe_in11, probe_out0, probe_out1, probe_out2, probe_out3, probe_out4, probe_out5, probe_out6, probe_out7, probe_out8, probe_out9)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[31:0],probe_in1[3:0],probe_in2[31:0],probe_in3[3:0],probe_in4[7:0],probe_in5[31:0],probe_in6[31:0],probe_in7[31:0],probe_in8[127:0],probe_in9[0:0],probe_in10[15:0],probe_in11[31:0],probe_out0[3:0],probe_out1[2:0],probe_out2[2:0],probe_out3[7:0],probe_out4[1:0],probe_out5[7:0],probe_out6[0:0],probe_out7[1:0],probe_out8[2:0],probe_out9[0:0]" */;
  input clk;
  input [31:0]probe_in0;
  input [3:0]probe_in1;
  input [31:0]probe_in2;
  input [3:0]probe_in3;
  input [7:0]probe_in4;
  input [31:0]probe_in5;
  input [31:0]probe_in6;
  input [31:0]probe_in7;
  input [127:0]probe_in8;
  input [0:0]probe_in9;
  input [15:0]probe_in10;
  input [31:0]probe_in11;
  output [3:0]probe_out0;
  output [2:0]probe_out1;
  output [2:0]probe_out2;
  output [7:0]probe_out3;
  output [1:0]probe_out4;
  output [7:0]probe_out5;
  output [0:0]probe_out6;
  output [1:0]probe_out7;
  output [2:0]probe_out8;
  output [0:0]probe_out9;
endmodule
