// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (lin64) Build 932637 Wed Jun 11 13:08:52 MDT 2014
// Date        : Tue Sep 16 22:15:28 2014
// Host        : ETAP03-223-ck running 64-bit Ubuntu 12.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/kahra/L1Topo/ProcessorU2_140911/TopoGTH_QPLL_AV2.srcs/sources_1/ip/vio_ipb/vio_ipb_stub.v
// Design      : vio_ipb
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "vio,Vivado 2014.2" *)
module vio_ipb(clk, probe_in0, probe_out0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[24:0],probe_out0[24:0]" */;
  input clk;
  input [24:0]probe_in0;
  output [24:0]probe_out0;
endmodule
