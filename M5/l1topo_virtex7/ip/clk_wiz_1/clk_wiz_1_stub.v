// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
// Date        : Thu Jul 10 21:05:55 2014
// Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               D:/TP_P_F_690T/TopoQPLL_80GTs_v3.7_485Update/TopoGTH_QPLL_AV2.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_stub.v
// Design      : clk_wiz_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_1(LHCClkIn_p, LHCClkIn_n, SysClk40, SysClk80, SysClk160, SysClk320, locked)
/* synthesis syn_black_box black_box_pad_pin="LHCClkIn_p,LHCClkIn_n,SysClk40,SysClk80,SysClk160,SysClk320,locked" */;
  input LHCClkIn_p;
  input LHCClkIn_n;
  output SysClk40;
  output SysClk80;
  output SysClk160;
  output SysClk320;
  output locked;
endmodule
