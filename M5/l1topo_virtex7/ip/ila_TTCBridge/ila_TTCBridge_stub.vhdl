-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
-- Date        : Mon Sep 29 17:11:08 2014
-- Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/Grzegorz/Desktop/virtex7_sources/ProcessorU2_140926/TopoGTH_QPLL_AV2.srcs/sources_1/ip/ila_TTCBridge/ila_TTCBridge_stub.vhdl
-- Design      : ila_TTCBridge
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_TTCBridge is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe3 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end ila_TTCBridge;

architecture stub of ila_TTCBridge is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[3:0],probe1[3:0],probe2[1:0],probe3[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2014.2";
begin
end;
