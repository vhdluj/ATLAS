// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Wed Oct 08 12:44:21 2014
// Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/Grzegorz/Desktop/virtex7_sources/rod_src/ipcores/ring_buffer_128b_256W/ring_buffer_128b_256W_stub.v
// Design      : ring_buffer_128b_256W
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2014.2" *)
module ring_buffer_128b_256W(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[7:0],dina[127:0],clkb,addrb[7:0],doutb[127:0]" */;
  input clka;
  input [0:0]wea;
  input [7:0]addra;
  input [127:0]dina;
  input clkb;
  input [7:0]addrb;
  output [127:0]doutb;
endmodule
