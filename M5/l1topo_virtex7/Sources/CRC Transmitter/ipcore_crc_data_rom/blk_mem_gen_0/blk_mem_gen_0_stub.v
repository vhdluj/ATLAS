// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (lin64) Build 881834 Fri Apr  4 14:00:25 MDT 2014
// Date        : Thu May 22 14:19:14 2014
// Host        : wetap129 running 64-bit Debian GNU/Linux 7.4 (wheezy)
// Command     : write_verilog -force -mode synth_stub
//               /net/fs01/vol/ma06/homes/seartz/workspace-vivado/CRC_Transmitter/CRC_Transmitter.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_stub.v
// Design      : blk_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.1" *)
module blk_mem_gen_0(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[7:0],douta[127:0]" */;
  input clka;
  input [7:0]addra;
  output [127:0]douta;
endmodule
