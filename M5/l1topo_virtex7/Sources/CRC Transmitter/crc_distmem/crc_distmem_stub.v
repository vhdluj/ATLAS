// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (lin64) Build 881834 Fri Apr  4 14:00:25 MDT 2014
// Date        : Fri May 16 16:34:11 2014
// Host        : wetap129 running 64-bit Debian GNU/Linux 7.4 (wheezy)
// Command     : write_verilog -force -mode synth_stub
//               /net/fs01/vol/ma06/homes/seartz/workspace-vivado/CRC_Transmitter/CRC_Transmitter.srcs/sources_1/new/crc_distmem/crc_distmem_stub.v
// Design      : crc_distmem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0,Vivado 2014.1" *)
module crc_distmem(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],spo[11:0]" */;
  input [7:0]a;
  output [11:0]spo;
endmodule
