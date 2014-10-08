// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (win64) Build 881834 Fri Apr  4 14:12:35 MDT 2014
// Date        : Fri May 16 17:54:17 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               d:/GTHFirstSteps/TopoGTH_QPLL_AV2_Multi24MGTs_v3_works_butBERproblem/TopoGTH_QPLL_AV2.srcs/sources_1/ip/ila_ber/ila_ber_stub.v
// Design      : ila_ber
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2014.1" *)
module ila_ber(clk, probe0, probe1, probe2, probe3, probe4, probe5, probe6, probe7, probe8)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[31:0],probe1[3:0],probe2[0:0],probe3[31:0],probe4[0:0],probe5[0:0],probe6[7:0],probe7[7:0],probe8[2:0]" */;
  input clk;
  input [31:0]probe0;
  input [3:0]probe1;
  input [0:0]probe2;
  input [31:0]probe3;
  input [0:0]probe4;
  input [0:0]probe5;
  input [7:0]probe6;
  input [7:0]probe7;
  input [2:0]probe8;
endmodule
