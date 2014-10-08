-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (lin64) Build 932637 Wed Jun 11 13:08:52 MDT 2014
-- Date        : Tue Sep 16 22:15:28 2014
-- Host        : ETAP03-223-ck running 64-bit Ubuntu 12.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/kahra/L1Topo/ProcessorU2_140911/TopoGTH_QPLL_AV2.srcs/sources_1/ip/vio_ipb/vio_ipb_stub.vhdl
-- Design      : vio_ipb
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_ipb is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 24 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 24 downto 0 )
  );

end vio_ipb;

architecture stub of vio_ipb is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[24:0],probe_out0[24:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "vio,Vivado 2014.2";
begin
end;
