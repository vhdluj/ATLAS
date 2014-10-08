-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
-- Date        : Mon Sep 29 17:15:32 2014
-- Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/Grzegorz/Desktop/virtex7_sources/ProcessorU2_140926/TopoGTH_QPLL_AV2.srcs/sources_1/ip/ila_ipbusBridge/ila_ipbusBridge_stub.vhdl
-- Design      : ila_ipbusBridge
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ila_ipbusBridge is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe4 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    probe5 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    probe6 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe7 : in STD_LOGIC_VECTOR ( 39 downto 0 );
    probe8 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe9 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    probe10 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe11 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe12 : in STD_LOGIC_VECTOR ( 13 downto 0 );
    probe13 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe14 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe15 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe16 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe17 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe18 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe19 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe20 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe21 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe22 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe23 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe24 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe25 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe26 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe27 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    probe28 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe29 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe30 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe31 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe32 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    probe33 : in STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end ila_ipbusBridge;

architecture stub of ila_ipbusBridge is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[31:0],probe1[0:0],probe2[0:0],probe3[13:0],probe4[23:0],probe5[2:0],probe6[1:0],probe7[39:0],probe8[31:0],probe9[31:0],probe10[0:0],probe11[0:0],probe12[13:0],probe13[4:0],probe14[4:0],probe15[3:0],probe16[3:0],probe17[3:0],probe18[3:0],probe19[3:0],probe20[4:0],probe21[0:0],probe22[0:0],probe23[0:0],probe24[0:0],probe25[0:0],probe26[0:0],probe27[1:0],probe28[4:0],probe29[4:0],probe30[4:0],probe31[4:0],probe32[4:0],probe33[4:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2014.2";
begin
end;
