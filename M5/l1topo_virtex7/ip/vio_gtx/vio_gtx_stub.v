// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (win64) Build 881834 Fri Apr  4 14:12:35 MDT 2014
// Date        : Wed Apr 30 16:12:17 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               d:/GTHFirstSteps/TopoGTH_QPLL_AV2/TopoGTH_QPLL_AV2.srcs/sources_1/ip/vio_gtx/vio_gtx_stub.v
// Design      : vio_gtx
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "vio,Vivado 2014.1" *)
module vio_gtx(clk, probe_in0, probe_out0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[7:0],probe_out0[3:0]" */;
  input clk;
  input [7:0]probe_in0;
  output [3:0]probe_out0;
endmodule
