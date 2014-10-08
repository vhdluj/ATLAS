// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
// Date        : Wed Oct 08 12:44:41 2014
// Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/Grzegorz/Desktop/virtex7_sources/rod_src/ipcores/l0a_trigger_fifo/l0a_trigger_fifo_stub.v
// Design      : l0a_trigger_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v12_0,Vivado 2014.2" *)
module l0a_trigger_fifo(rst, wr_clk, rd_clk, din, wr_en, rd_en, prog_full_thresh, dout, full, empty, prog_full)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[31:0],wr_en,rd_en,prog_full_thresh[7:0],dout[31:0],full,empty,prog_full" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [31:0]din;
  input wr_en;
  input rd_en;
  input [7:0]prog_full_thresh;
  output [31:0]dout;
  output full;
  output empty;
  output prog_full;
endmodule
