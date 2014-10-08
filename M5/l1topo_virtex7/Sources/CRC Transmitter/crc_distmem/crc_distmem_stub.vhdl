-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.1 (lin64) Build 881834 Fri Apr  4 14:00:25 MDT 2014
-- Date        : Fri May 16 16:34:12 2014
-- Host        : wetap129 running 64-bit Debian GNU/Linux 7.4 (wheezy)
-- Command     : write_vhdl -force -mode synth_stub
--               /net/fs01/vol/ma06/homes/seartz/workspace-vivado/CRC_Transmitter/CRC_Transmitter.srcs/sources_1/new/crc_distmem/crc_distmem_stub.vhdl
-- Design      : crc_distmem
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity crc_distmem is
  Port ( 
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end crc_distmem;

architecture stub of crc_distmem is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "a[7:0],spo[11:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dist_mem_gen_v8_0,Vivado 2014.1";
begin
end;
