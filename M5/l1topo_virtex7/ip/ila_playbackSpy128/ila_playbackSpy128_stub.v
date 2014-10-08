// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Mon Sep 29 17:19:40 2014
// Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/Grzegorz/Desktop/virtex7_sources/ProcessorU2_140926/TopoGTH_QPLL_AV2.srcs/sources_1/ip/ila_playbackSpy128/ila_playbackSpy128_stub.v
// Design      : ila_playbackSpy128
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2014.2" *)
module ila_playbackSpy128(clk, probe0, probe1, probe2, probe3, probe4, probe5, probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[31:0],probe1[31:0],probe2[0:0],probe3[0:0],probe4[31:0],probe5[0:0],probe6[127:0],probe7[127:0],probe8[0:0],probe9[0:0],probe10[0:0],probe11[0:0],probe12[31:0],probe13[31:0],probe14[9:0]" */;
  input clk;
  input [31:0]probe0;
  input [31:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [31:0]probe4;
  input [0:0]probe5;
  input [127:0]probe6;
  input [127:0]probe7;
  input [0:0]probe8;
  input [0:0]probe9;
  input [0:0]probe10;
  input [0:0]probe11;
  input [31:0]probe12;
  input [31:0]probe13;
  input [9:0]probe14;
endmodule
