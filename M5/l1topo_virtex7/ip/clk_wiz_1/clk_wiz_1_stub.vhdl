-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
-- Date        : Thu Jul 10 21:05:55 2014
-- Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/TP_P_F_690T/TopoQPLL_80GTs_v3.7_485Update/TopoGTH_QPLL_AV2.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_stub.vhdl
-- Design      : clk_wiz_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_1 is
  Port ( 
    LHCClkIn_p : in STD_LOGIC;
    LHCClkIn_n : in STD_LOGIC;
    SysClk40 : out STD_LOGIC;
    SysClk80 : out STD_LOGIC;
    SysClk160 : out STD_LOGIC;
    SysClk320 : out STD_LOGIC;
    locked : out STD_LOGIC
  );

end clk_wiz_1;

architecture stub of clk_wiz_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "LHCClkIn_p,LHCClkIn_n,SysClk40,SysClk80,SysClk160,SysClk320,locked";
begin
end;
