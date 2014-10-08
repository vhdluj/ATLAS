-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
-- Date        : Mon Jul 14 22:38:32 2014
-- Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/TP_P_F_485T/TopoQPLL_80GTs_v3.7_485UpdateAlignmentModCRCFix/TopoGTH_QPLL_AV2.srcs/sources_1/ip/vio_128_bit_align_debug/vio_128_bit_align_debug_stub.vhdl
-- Design      : vio_128_bit_align_debug
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_128_bit_align_debug is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 6 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );

end vio_128_bit_align_debug;

architecture stub of vio_128_bit_align_debug is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[3:0],probe_in1[4:0],probe_in2[15:0],probe_out0[1:0],probe_out1[1:0],probe_out2[1:0],probe_out3[1:0],probe_out4[0:0],probe_out5[6:0],probe_out6[2:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "vio,Vivado 2014.2";
begin
end;
