-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
-- Date        : Wed Jul 16 15:12:12 2014
-- Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/TP_P_F_485T/TopoQPLL_80GTs_v3.8_AlignMod4B_CRCFix_CMX_ILA_BER/TopoGTH_QPLL_AV2.srcs/sources_1/ip/vio_0/vio_0_stub.vhdl
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in5 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in6 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in7 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_in8 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_in9 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in10 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_in11 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    probe_out8 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    probe_out9 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end vio_0;

architecture stub of vio_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[31:0],probe_in1[3:0],probe_in2[31:0],probe_in3[3:0],probe_in4[7:0],probe_in5[31:0],probe_in6[31:0],probe_in7[31:0],probe_in8[127:0],probe_in9[0:0],probe_in10[15:0],probe_in11[31:0],probe_out0[3:0],probe_out1[2:0],probe_out2[2:0],probe_out3[7:0],probe_out4[1:0],probe_out5[7:0],probe_out6[0:0],probe_out7[1:0],probe_out8[2:0],probe_out9[0:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "vio,Vivado 2014.2";
begin
end;
