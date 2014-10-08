-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.1 (win64) Build 881834 Fri Apr  4 14:12:35 MDT 2014
-- Date        : Wed Apr 30 16:12:17 2014
-- Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/GTHFirstSteps/TopoGTH_QPLL_AV2/TopoGTH_QPLL_AV2.srcs/sources_1/ip/vio_gtx/vio_gtx_stub.vhdl
-- Design      : vio_gtx
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_gtx is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end vio_gtx;

architecture stub of vio_gtx is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[7:0],probe_out0[3:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "vio,Vivado 2014.1";
begin
end;
