-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
-- Date        : Mon Sep 29 16:45:11 2014
-- Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/Grzegorz/Desktop/virtex7_sources/ProcessorU2_140926/TopoGTH_QPLL_AV2.srcs/sources_1/ip/gtwizard_32_Rx/gtwizard_32_Rx_funcsim.vhdl
-- Design      : gtwizard_32_Rx
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx690tffg1927-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0\ is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : out STD_LOGIC;
    I1 : in STD_LOGIC;
    rxpmaresetdone_sss : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gtrxreset_ss : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt3_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0\ is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \n_0_state[0]_i_2__2\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\state[0]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C880C88FCF3FCC0"
    )
    port map (
      I0 => \n_0_state[0]_i_2__2\,
      I1 => Q(2),
      I2 => I1,
      I3 => Q(1),
      I4 => gtrxreset_ss,
      I5 => Q(0),
      O => D(0)
    );
\state[0]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => \^data_out\,
      I1 => rxpmaresetdone_sss,
      O => \n_0_state[0]_i_2__2\
    );
\state[1]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5500FFFF30FF0000"
    )
    port map (
      I0 => I1,
      I1 => \^data_out\,
      I2 => rxpmaresetdone_sss,
      I3 => Q(2),
      I4 => Q(0),
      I5 => Q(1),
      O => D(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_11\ is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : out STD_LOGIC;
    I1 : in STD_LOGIC;
    rxpmaresetdone_sss : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gtrxreset_ss : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt0_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_11\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_11\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_11\ is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \n_0_state[0]_i_2\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C880C88FCF3FCC0"
    )
    port map (
      I0 => \n_0_state[0]_i_2\,
      I1 => Q(2),
      I2 => I1,
      I3 => Q(1),
      I4 => gtrxreset_ss,
      I5 => Q(0),
      O => D(0)
    );
\state[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => \^data_out\,
      I1 => rxpmaresetdone_sss,
      O => \n_0_state[0]_i_2\
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5500FFFF30FF0000"
    )
    port map (
      I0 => I1,
      I1 => \^data_out\,
      I2 => rxpmaresetdone_sss,
      I3 => Q(2),
      I4 => Q(0),
      I5 => Q(1),
      O => D(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_12\ is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_12\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_12\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_12\ is
  signal adapt_count_reset : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \n_0_reset_time_out_i_10__2\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
\FSM_onehot_rx_state[11]_i_13__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0E0E0E0FFE0E0E0"
    )
    port map (
      I0 => Q(5),
      I1 => Q(2),
      I2 => Q(0),
      I3 => I1,
      I4 => Q(1),
      I5 => adapt_count_reset,
      O => O1
    );
\FSM_onehot_rx_state[11]_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => I2,
      I1 => I3,
      I2 => adapt_count_reset,
      I3 => Q(3),
      I4 => Q(6),
      I5 => I4,
      O => O2
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => GT0_QPLLLOCK_IN,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => adapt_count_reset,
      R => '0'
    );
\reset_time_out_i_10__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => I1,
      I1 => adapt_count_reset,
      O => \n_0_reset_time_out_i_10__2\
    );
\reset_time_out_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08000F0008000800"
    )
    port map (
      I0 => I5,
      I1 => \n_0_reset_time_out_i_10__2\,
      I2 => I6,
      I3 => I7,
      I4 => I8,
      I5 => I9,
      O => O3
    );
\reset_time_out_i_7__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444AAF0AA00"
    )
    port map (
      I0 => adapt_count_reset,
      I1 => I1,
      I2 => Q(4),
      I3 => Q(3),
      I4 => I10,
      I5 => Q(1),
      O => O4
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_13\ is
  port (
    data_out : out STD_LOGIC;
    gt3_rxresetdone_out : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_13\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_13\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_13\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt3_rxresetdone_out,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_14\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    I14 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    I16 : in STD_LOGIC;
    I17 : in STD_LOGIC;
    I18 : in STD_LOGIC;
    I19 : in STD_LOGIC;
    I20 : in STD_LOGIC;
    I21 : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    I22 : in STD_LOGIC;
    I23 : in STD_LOGIC;
    rxresetdone_s3 : in STD_LOGIC;
    I24 : in STD_LOGIC;
    I25 : in STD_LOGIC;
    I26 : in STD_LOGIC;
    I27 : in STD_LOGIC;
    I28 : in STD_LOGIC;
    GT3_RX_FSM_RESET_DONE_OUT : in STD_LOGIC;
    GT3_DATA_VALID_IN : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_14\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_14\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_14\ is
  signal \^o1\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal data_valid_sync : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_3__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_7__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_9__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_3__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_9__2\ : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_4__2\ : STD_LOGIC;
  signal reset_time_out : STD_LOGIC;
  signal rx_fsm_reset_done_int : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_2__2\ : label is "soft_lutpair85";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_2__2\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_4__2\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_5__2\ : label is "soft_lutpair85";
begin
  O1 <= \^o1\;
\FSM_onehot_rx_state[11]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFEFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[11]_i_3__2\,
      I1 => I1,
      I2 => I2,
      I3 => I3(0),
      I4 => I4,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_7__2\,
      O => E(0)
    );
\FSM_onehot_rx_state[11]_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0000"
    )
    port map (
      I0 => data_valid_sync,
      I1 => I13,
      I2 => DONT_RESET_ON_DATA_ERROR_IN,
      I3 => I22,
      I4 => I23,
      O => D(1)
    );
\FSM_onehot_rx_state[11]_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => I7,
      I1 => \n_0_FSM_onehot_rx_state[11]_i_9__1\,
      I2 => I8,
      I3 => I9,
      I4 => I10,
      I5 => I11,
      O => \n_0_FSM_onehot_rx_state[11]_i_3__2\
    );
\FSM_onehot_rx_state[11]_i_7__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000222"
    )
    port map (
      I0 => I5,
      I1 => I6,
      I2 => Q(3),
      I3 => data_valid_sync,
      I4 => Q(2),
      O => \n_0_FSM_onehot_rx_state[11]_i_7__2\
    );
\FSM_onehot_rx_state[11]_i_9__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF222"
    )
    port map (
      I0 => Q(3),
      I1 => data_valid_sync,
      I2 => Q(0),
      I3 => rxresetdone_s3,
      I4 => Q(1),
      O => \n_0_FSM_onehot_rx_state[11]_i_9__1\
    );
\FSM_onehot_rx_state[2]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
    port map (
      I0 => I14,
      I1 => \n_0_FSM_onehot_rx_state[2]_i_3__2\,
      I2 => I15,
      I3 => I16,
      I4 => I17,
      I5 => I18,
      O => D(0)
    );
\FSM_onehot_rx_state[2]_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
    port map (
      I0 => Q(1),
      I1 => I21,
      I2 => I6,
      I3 => Q(2),
      I4 => Q(3),
      I5 => \n_0_FSM_onehot_rx_state[2]_i_9__2\,
      O => \n_0_FSM_onehot_rx_state[2]_i_3__2\
    );
\FSM_onehot_rx_state[2]_i_9__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => I22,
      I1 => DONT_RESET_ON_DATA_ERROR_IN,
      I2 => I13,
      I3 => data_valid_sync,
      O => \n_0_FSM_onehot_rx_state[2]_i_9__2\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => GT3_DATA_VALID_IN,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_valid_sync,
      R => '0'
    );
\reset_time_out_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAABAAAAAAA8"
    )
    port map (
      I0 => reset_time_out,
      I1 => I24,
      I2 => I25,
      I3 => I26,
      I4 => I27,
      I5 => I13,
      O => O2
    );
\reset_time_out_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFFFFEEEEFEEE"
    )
    port map (
      I0 => I19,
      I1 => I20,
      I2 => data_valid_sync,
      I3 => Q(2),
      I4 => I6,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_9__1\,
      O => reset_time_out
    );
\rx_fsm_reset_done_int_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABFBFBFAA808080"
    )
    port map (
      I0 => rx_fsm_reset_done_int,
      I1 => I28,
      I2 => \n_0_rx_fsm_reset_done_int_i_4__2\,
      I3 => \^o1\,
      I4 => I23,
      I5 => GT3_RX_FSM_RESET_DONE_OUT,
      O => O3
    );
\rx_fsm_reset_done_int_i_2__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => I12,
      I1 => data_valid_sync,
      I2 => I13,
      I3 => Q(3),
      O => rx_fsm_reset_done_int
    );
\rx_fsm_reset_done_int_i_4__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04044404"
    )
    port map (
      I0 => Q(2),
      I1 => Q(3),
      I2 => data_valid_sync,
      I3 => I12,
      I4 => I13,
      O => \n_0_rx_fsm_reset_done_int_i_4__2\
    );
\rx_fsm_reset_done_int_i_5__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => I22,
      I1 => DONT_RESET_ON_DATA_ERROR_IN,
      I2 => I13,
      I3 => data_valid_sync,
      O => \^o1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_15\ is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : out STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    I1 : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_15\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_15\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_15\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal mmcm_lock_i : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \mmcm_lock_count[9]_i_1__2\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_1__2\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \mmcm_lock_reclocked_i_1__2\ : label is "soft_lutpair87";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => '1',
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => mmcm_lock_i,
      R => '0'
    );
\mmcm_lock_count[9]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => mmcm_lock_i,
      O => SR(0)
    );
\mmcm_lock_reclocked_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
    port map (
      I0 => mmcm_lock_reclocked,
      I1 => I1,
      I2 => mmcm_lock_i,
      O => O1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_16\ is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    gt3_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_16\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_16\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_16\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_17\ is
  port (
    data_out : out STD_LOGIC;
    GT3_RX_FSM_RESET_DONE_OUT : in STD_LOGIC;
    gt3_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_17\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_17\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_17\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => GT3_RX_FSM_RESET_DONE_OUT,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_18\ is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_18\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_18\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_18\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_19\ is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_19\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_19\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_19\ is
  signal adapt_count_reset : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \n_0_reset_time_out_i_10__1\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
\FSM_onehot_rx_state[11]_i_13__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0E0E0E0FFE0E0E0"
    )
    port map (
      I0 => Q(5),
      I1 => Q(2),
      I2 => Q(0),
      I3 => I1,
      I4 => Q(1),
      I5 => adapt_count_reset,
      O => O1
    );
\FSM_onehot_rx_state[11]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => I2,
      I1 => I3,
      I2 => adapt_count_reset,
      I3 => Q(3),
      I4 => Q(6),
      I5 => I4,
      O => O2
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => GT0_QPLLLOCK_IN,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => adapt_count_reset,
      R => '0'
    );
\reset_time_out_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => I1,
      I1 => adapt_count_reset,
      O => \n_0_reset_time_out_i_10__1\
    );
\reset_time_out_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08000F0008000800"
    )
    port map (
      I0 => I5,
      I1 => \n_0_reset_time_out_i_10__1\,
      I2 => I6,
      I3 => I7,
      I4 => I8,
      I5 => I9,
      O => O3
    );
\reset_time_out_i_7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444AAF0AA00"
    )
    port map (
      I0 => adapt_count_reset,
      I1 => I1,
      I2 => Q(4),
      I3 => Q(3),
      I4 => I10,
      I5 => Q(1),
      O => O4
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_20\ is
  port (
    data_out : out STD_LOGIC;
    gt2_rxresetdone_out : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_20\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_20\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_20\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt2_rxresetdone_out,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_21\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    I14 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    I16 : in STD_LOGIC;
    I17 : in STD_LOGIC;
    I18 : in STD_LOGIC;
    I19 : in STD_LOGIC;
    I20 : in STD_LOGIC;
    I21 : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    I22 : in STD_LOGIC;
    I23 : in STD_LOGIC;
    rxresetdone_s3 : in STD_LOGIC;
    I24 : in STD_LOGIC;
    I25 : in STD_LOGIC;
    I26 : in STD_LOGIC;
    I27 : in STD_LOGIC;
    I28 : in STD_LOGIC;
    GT2_RX_FSM_RESET_DONE_OUT : in STD_LOGIC;
    GT2_DATA_VALID_IN : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_21\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_21\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_21\ is
  signal \^o1\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal data_valid_sync : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_3__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_7__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_9__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_3__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_9__1\ : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_4__1\ : STD_LOGIC;
  signal reset_time_out : STD_LOGIC;
  signal rx_fsm_reset_done_int : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_2__1\ : label is "soft_lutpair57";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_2__1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_4__1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_5__1\ : label is "soft_lutpair57";
begin
  O1 <= \^o1\;
\FSM_onehot_rx_state[11]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFEFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[11]_i_3__1\,
      I1 => I1,
      I2 => I2,
      I3 => I3(0),
      I4 => I4,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_7__1\,
      O => E(0)
    );
\FSM_onehot_rx_state[11]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0000"
    )
    port map (
      I0 => data_valid_sync,
      I1 => I13,
      I2 => DONT_RESET_ON_DATA_ERROR_IN,
      I3 => I22,
      I4 => I23,
      O => D(1)
    );
\FSM_onehot_rx_state[11]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => I7,
      I1 => \n_0_FSM_onehot_rx_state[11]_i_9__0\,
      I2 => I8,
      I3 => I9,
      I4 => I10,
      I5 => I11,
      O => \n_0_FSM_onehot_rx_state[11]_i_3__1\
    );
\FSM_onehot_rx_state[11]_i_7__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000222"
    )
    port map (
      I0 => I5,
      I1 => I6,
      I2 => Q(3),
      I3 => data_valid_sync,
      I4 => Q(2),
      O => \n_0_FSM_onehot_rx_state[11]_i_7__1\
    );
\FSM_onehot_rx_state[11]_i_9__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF222"
    )
    port map (
      I0 => Q(3),
      I1 => data_valid_sync,
      I2 => Q(0),
      I3 => rxresetdone_s3,
      I4 => Q(1),
      O => \n_0_FSM_onehot_rx_state[11]_i_9__0\
    );
\FSM_onehot_rx_state[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
    port map (
      I0 => I14,
      I1 => \n_0_FSM_onehot_rx_state[2]_i_3__1\,
      I2 => I15,
      I3 => I16,
      I4 => I17,
      I5 => I18,
      O => D(0)
    );
\FSM_onehot_rx_state[2]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
    port map (
      I0 => Q(1),
      I1 => I21,
      I2 => I6,
      I3 => Q(2),
      I4 => Q(3),
      I5 => \n_0_FSM_onehot_rx_state[2]_i_9__1\,
      O => \n_0_FSM_onehot_rx_state[2]_i_3__1\
    );
\FSM_onehot_rx_state[2]_i_9__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => I22,
      I1 => DONT_RESET_ON_DATA_ERROR_IN,
      I2 => I13,
      I3 => data_valid_sync,
      O => \n_0_FSM_onehot_rx_state[2]_i_9__1\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => GT2_DATA_VALID_IN,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_valid_sync,
      R => '0'
    );
\reset_time_out_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAABAAAAAAA8"
    )
    port map (
      I0 => reset_time_out,
      I1 => I24,
      I2 => I25,
      I3 => I26,
      I4 => I27,
      I5 => I13,
      O => O2
    );
\reset_time_out_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFFFFEEEEFEEE"
    )
    port map (
      I0 => I19,
      I1 => I20,
      I2 => data_valid_sync,
      I3 => Q(2),
      I4 => I6,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_9__0\,
      O => reset_time_out
    );
\rx_fsm_reset_done_int_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABFBFBFAA808080"
    )
    port map (
      I0 => rx_fsm_reset_done_int,
      I1 => I28,
      I2 => \n_0_rx_fsm_reset_done_int_i_4__1\,
      I3 => \^o1\,
      I4 => I23,
      I5 => GT2_RX_FSM_RESET_DONE_OUT,
      O => O3
    );
\rx_fsm_reset_done_int_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => I12,
      I1 => data_valid_sync,
      I2 => I13,
      I3 => Q(3),
      O => rx_fsm_reset_done_int
    );
\rx_fsm_reset_done_int_i_4__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04044404"
    )
    port map (
      I0 => Q(2),
      I1 => Q(3),
      I2 => data_valid_sync,
      I3 => I12,
      I4 => I13,
      O => \n_0_rx_fsm_reset_done_int_i_4__1\
    );
\rx_fsm_reset_done_int_i_5__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => I22,
      I1 => DONT_RESET_ON_DATA_ERROR_IN,
      I2 => I13,
      I3 => data_valid_sync,
      O => \^o1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_22\ is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : out STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    I1 : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_22\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_22\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_22\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal mmcm_lock_i : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \mmcm_lock_count[9]_i_1__1\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_1__1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \mmcm_lock_reclocked_i_1__1\ : label is "soft_lutpair59";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => '1',
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => mmcm_lock_i,
      R => '0'
    );
\mmcm_lock_count[9]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => mmcm_lock_i,
      O => SR(0)
    );
\mmcm_lock_reclocked_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
    port map (
      I0 => mmcm_lock_reclocked,
      I1 => I1,
      I2 => mmcm_lock_i,
      O => O1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_23\ is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    gt2_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_23\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_23\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_23\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_24\ is
  port (
    data_out : out STD_LOGIC;
    GT2_RX_FSM_RESET_DONE_OUT : in STD_LOGIC;
    gt2_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_24\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_24\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_24\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => GT2_RX_FSM_RESET_DONE_OUT,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_25\ is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_25\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_25\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_25\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_26\ is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 6 downto 0 );
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_26\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_26\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_26\ is
  signal adapt_count_reset : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \n_0_reset_time_out_i_10__0\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
\FSM_onehot_rx_state[11]_i_13__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0E0E0E0FFE0E0E0"
    )
    port map (
      I0 => Q(5),
      I1 => Q(2),
      I2 => Q(0),
      I3 => I1,
      I4 => Q(1),
      I5 => adapt_count_reset,
      O => O1
    );
\FSM_onehot_rx_state[11]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => I2,
      I1 => I3,
      I2 => adapt_count_reset,
      I3 => Q(3),
      I4 => Q(6),
      I5 => I4,
      O => O2
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => GT0_QPLLLOCK_IN,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => adapt_count_reset,
      R => '0'
    );
\reset_time_out_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => I1,
      I1 => adapt_count_reset,
      O => \n_0_reset_time_out_i_10__0\
    );
\reset_time_out_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08000F0008000800"
    )
    port map (
      I0 => I5,
      I1 => \n_0_reset_time_out_i_10__0\,
      I2 => I6,
      I3 => I7,
      I4 => I8,
      I5 => I9,
      O => O3
    );
\reset_time_out_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444AAF0AA00"
    )
    port map (
      I0 => adapt_count_reset,
      I1 => I1,
      I2 => Q(4),
      I3 => Q(3),
      I4 => I10,
      I5 => Q(1),
      O => O4
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_27\ is
  port (
    data_out : out STD_LOGIC;
    gt1_rxresetdone_out : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_27\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_27\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_27\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt1_rxresetdone_out,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_28\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    I14 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    I16 : in STD_LOGIC;
    I17 : in STD_LOGIC;
    I18 : in STD_LOGIC;
    I19 : in STD_LOGIC;
    I20 : in STD_LOGIC;
    I21 : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    I22 : in STD_LOGIC;
    I23 : in STD_LOGIC;
    rxresetdone_s3 : in STD_LOGIC;
    I24 : in STD_LOGIC;
    I25 : in STD_LOGIC;
    I26 : in STD_LOGIC;
    I27 : in STD_LOGIC;
    I28 : in STD_LOGIC;
    GT1_RX_FSM_RESET_DONE_OUT : in STD_LOGIC;
    GT1_DATA_VALID_IN : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_28\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_28\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_28\ is
  signal \^o1\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal data_valid_sync : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_3__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_7__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_9\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_3__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_9__0\ : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_4__0\ : STD_LOGIC;
  signal reset_time_out : STD_LOGIC;
  signal rx_fsm_reset_done_int : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_2__0\ : label is "soft_lutpair29";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_2__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_4__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_5__0\ : label is "soft_lutpair29";
begin
  O1 <= \^o1\;
\FSM_onehot_rx_state[11]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFFFEFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[11]_i_3__0\,
      I1 => I1,
      I2 => I2,
      I3 => I3(0),
      I4 => I4,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_7__0\,
      O => E(0)
    );
\FSM_onehot_rx_state[11]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0000"
    )
    port map (
      I0 => data_valid_sync,
      I1 => I13,
      I2 => DONT_RESET_ON_DATA_ERROR_IN,
      I3 => I22,
      I4 => I23,
      O => D(1)
    );
\FSM_onehot_rx_state[11]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => I7,
      I1 => \n_0_FSM_onehot_rx_state[11]_i_9\,
      I2 => I8,
      I3 => I9,
      I4 => I10,
      I5 => I11,
      O => \n_0_FSM_onehot_rx_state[11]_i_3__0\
    );
\FSM_onehot_rx_state[11]_i_7__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000222"
    )
    port map (
      I0 => I5,
      I1 => I6,
      I2 => Q(3),
      I3 => data_valid_sync,
      I4 => Q(2),
      O => \n_0_FSM_onehot_rx_state[11]_i_7__0\
    );
\FSM_onehot_rx_state[11]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF222"
    )
    port map (
      I0 => Q(3),
      I1 => data_valid_sync,
      I2 => Q(0),
      I3 => rxresetdone_s3,
      I4 => Q(1),
      O => \n_0_FSM_onehot_rx_state[11]_i_9\
    );
\FSM_onehot_rx_state[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
    port map (
      I0 => I14,
      I1 => \n_0_FSM_onehot_rx_state[2]_i_3__0\,
      I2 => I15,
      I3 => I16,
      I4 => I17,
      I5 => I18,
      O => D(0)
    );
\FSM_onehot_rx_state[2]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
    port map (
      I0 => Q(1),
      I1 => I21,
      I2 => I6,
      I3 => Q(2),
      I4 => Q(3),
      I5 => \n_0_FSM_onehot_rx_state[2]_i_9__0\,
      O => \n_0_FSM_onehot_rx_state[2]_i_3__0\
    );
\FSM_onehot_rx_state[2]_i_9__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => I22,
      I1 => DONT_RESET_ON_DATA_ERROR_IN,
      I2 => I13,
      I3 => data_valid_sync,
      O => \n_0_FSM_onehot_rx_state[2]_i_9__0\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => GT1_DATA_VALID_IN,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_valid_sync,
      R => '0'
    );
\reset_time_out_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAABAAAAAAA8"
    )
    port map (
      I0 => reset_time_out,
      I1 => I24,
      I2 => I25,
      I3 => I26,
      I4 => I27,
      I5 => I13,
      O => O2
    );
\reset_time_out_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFFFFEEEEFEEE"
    )
    port map (
      I0 => I19,
      I1 => I20,
      I2 => data_valid_sync,
      I3 => Q(2),
      I4 => I6,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_9\,
      O => reset_time_out
    );
\rx_fsm_reset_done_int_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABFBFBFAA808080"
    )
    port map (
      I0 => rx_fsm_reset_done_int,
      I1 => I28,
      I2 => \n_0_rx_fsm_reset_done_int_i_4__0\,
      I3 => \^o1\,
      I4 => I23,
      I5 => GT1_RX_FSM_RESET_DONE_OUT,
      O => O3
    );
\rx_fsm_reset_done_int_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => I12,
      I1 => data_valid_sync,
      I2 => I13,
      I3 => Q(3),
      O => rx_fsm_reset_done_int
    );
\rx_fsm_reset_done_int_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04044404"
    )
    port map (
      I0 => Q(2),
      I1 => Q(3),
      I2 => data_valid_sync,
      I3 => I12,
      I4 => I13,
      O => \n_0_rx_fsm_reset_done_int_i_4__0\
    );
\rx_fsm_reset_done_int_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => I22,
      I1 => DONT_RESET_ON_DATA_ERROR_IN,
      I2 => I13,
      I3 => data_valid_sync,
      O => \^o1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_29\ is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : out STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    I1 : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_29\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_29\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_29\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal mmcm_lock_i : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \mmcm_lock_count[9]_i_1__0\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_1__0\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \mmcm_lock_reclocked_i_1__0\ : label is "soft_lutpair31";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => '1',
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => mmcm_lock_i,
      R => '0'
    );
\mmcm_lock_count[9]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => mmcm_lock_i,
      O => SR(0)
    );
\mmcm_lock_reclocked_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
    port map (
      I0 => mmcm_lock_reclocked,
      I1 => I1,
      I2 => mmcm_lock_i,
      O => O1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_30\ is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    gt1_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_30\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_30\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_30\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_31\ is
  port (
    data_out : out STD_LOGIC;
    GT1_RX_FSM_RESET_DONE_OUT : in STD_LOGIC;
    gt1_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_31\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_31\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_31\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => GT1_RX_FSM_RESET_DONE_OUT,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_32\ is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_32\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_32\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_32\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_33\ is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    mmcm_lock_reclocked : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_33\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_33\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_33\ is
  signal adapt_count_reset : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_13\ : STD_LOGIC;
  signal n_0_reset_time_out_i_10 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_13\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_9__2\ : label is "soft_lutpair0";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
\FSM_onehot_rx_state[11]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => adapt_count_reset,
      I1 => Q(0),
      I2 => I8,
      O => \n_0_FSM_onehot_rx_state[11]_i_13\
    );
\FSM_onehot_rx_state[11]_i_6__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFF8F8F8"
    )
    port map (
      I0 => I6,
      I1 => Q(4),
      I2 => \n_0_FSM_onehot_rx_state[11]_i_13\,
      I3 => mmcm_lock_reclocked,
      I4 => Q(3),
      I5 => I7,
      O => O2
    );
\FSM_onehot_rx_state[11]_i_9__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => Q(0),
      I1 => Q(3),
      I2 => adapt_count_reset,
      I3 => Q(1),
      O => O3
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => GT0_QPLLLOCK_IN,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => adapt_count_reset,
      R => '0'
    );
reset_time_out_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => I8,
      I1 => adapt_count_reset,
      O => n_0_reset_time_out_i_10
    );
reset_time_out_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08000F0008000800"
    )
    port map (
      I0 => I1,
      I1 => n_0_reset_time_out_i_10,
      I2 => I2,
      I3 => I3,
      I4 => I4,
      I5 => I5,
      O => O1
    );
reset_time_out_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444444AAF0AA00"
    )
    port map (
      I0 => adapt_count_reset,
      I1 => I8,
      I2 => Q(2),
      I3 => Q(1),
      I4 => I9,
      I5 => Q(0),
      O => O4
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_34\ is
  port (
    data_out : out STD_LOGIC;
    gt0_rxresetdone_out : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_34\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_34\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_34\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rxresetdone_out,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_35\ is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I3 : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 5 downto 0 );
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    I9 : in STD_LOGIC;
    I10 : in STD_LOGIC;
    I11 : in STD_LOGIC;
    I12 : in STD_LOGIC;
    I13 : in STD_LOGIC;
    I14 : in STD_LOGIC;
    I15 : in STD_LOGIC;
    I16 : in STD_LOGIC;
    I17 : in STD_LOGIC;
    I18 : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    I19 : in STD_LOGIC;
    I20 : in STD_LOGIC;
    rxresetdone_s3 : in STD_LOGIC;
    I21 : in STD_LOGIC;
    I22 : in STD_LOGIC;
    I23 : in STD_LOGIC;
    I24 : in STD_LOGIC;
    I25 : in STD_LOGIC;
    GT0_RX_FSM_RESET_DONE_OUT : in STD_LOGIC;
    GT0_DATA_VALID_IN : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_35\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_35\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_35\ is
  signal \^o1\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal data_valid_sync : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_3\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_7\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_3\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_9\ : STD_LOGIC;
  signal n_0_rx_fsm_reset_done_int_i_4 : STD_LOGIC;
  signal n_0_rx_fsm_reset_done_int_i_5 : STD_LOGIC;
  signal reset_time_out : STD_LOGIC;
  signal rx_fsm_reset_done_int : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_2\ : label is "soft_lutpair2";
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
  attribute SOFT_HLUTNM of rx_fsm_reset_done_int_i_2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of rx_fsm_reset_done_int_i_4 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of rx_fsm_reset_done_int_i_5 : label is "soft_lutpair2";
begin
  O1 <= \^o1\;
\FSM_onehot_rx_state[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEFEE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[11]_i_3\,
      I1 => I1,
      I2 => I2(0),
      I3 => I3,
      I4 => I4,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_7\,
      O => E(0)
    );
\FSM_onehot_rx_state[11]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF222"
    )
    port map (
      I0 => Q(5),
      I1 => data_valid_sync,
      I2 => Q(2),
      I3 => rxresetdone_s3,
      I4 => Q(3),
      O => \^o1\
    );
\FSM_onehot_rx_state[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFF0000"
    )
    port map (
      I0 => data_valid_sync,
      I1 => I11,
      I2 => DONT_RESET_ON_DATA_ERROR_IN,
      I3 => I19,
      I4 => I20,
      O => D(1)
    );
\FSM_onehot_rx_state[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
    port map (
      I0 => I8,
      I1 => Q(4),
      I2 => n_0_rx_fsm_reset_done_int_i_5,
      I3 => Q(0),
      I4 => Q(1),
      I5 => I9,
      O => \n_0_FSM_onehot_rx_state[11]_i_3\
    );
\FSM_onehot_rx_state[11]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFA0008020A"
    )
    port map (
      I0 => I5,
      I1 => data_valid_sync,
      I2 => I6,
      I3 => Q(5),
      I4 => Q(4),
      I5 => I7,
      O => \n_0_FSM_onehot_rx_state[11]_i_7\
    );
\FSM_onehot_rx_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEEE"
    )
    port map (
      I0 => I12,
      I1 => \n_0_FSM_onehot_rx_state[2]_i_3\,
      I2 => I13,
      I3 => I14,
      I4 => I15,
      I5 => I16,
      O => D(0)
    );
\FSM_onehot_rx_state[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
    port map (
      I0 => Q(3),
      I1 => I7,
      I2 => I6,
      I3 => Q(4),
      I4 => Q(5),
      I5 => \n_0_FSM_onehot_rx_state[2]_i_9\,
      O => \n_0_FSM_onehot_rx_state[2]_i_3\
    );
\FSM_onehot_rx_state[2]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => I19,
      I1 => DONT_RESET_ON_DATA_ERROR_IN,
      I2 => I11,
      I3 => data_valid_sync,
      O => \n_0_FSM_onehot_rx_state[2]_i_9\
    );
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => GT0_DATA_VALID_IN,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_valid_sync,
      R => '0'
    );
reset_time_out_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAABAAAAAAA8"
    )
    port map (
      I0 => reset_time_out,
      I1 => I21,
      I2 => I22,
      I3 => I23,
      I4 => I24,
      I5 => I11,
      O => O2
    );
reset_time_out_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEFFFFEEEEFEEE"
    )
    port map (
      I0 => I17,
      I1 => I18,
      I2 => data_valid_sync,
      I3 => Q(4),
      I4 => I6,
      I5 => \^o1\,
      O => reset_time_out
    );
rx_fsm_reset_done_int_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AABFBFBFAA808080"
    )
    port map (
      I0 => rx_fsm_reset_done_int,
      I1 => I25,
      I2 => n_0_rx_fsm_reset_done_int_i_4,
      I3 => n_0_rx_fsm_reset_done_int_i_5,
      I4 => I20,
      I5 => GT0_RX_FSM_RESET_DONE_OUT,
      O => O3
    );
rx_fsm_reset_done_int_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => I10,
      I1 => data_valid_sync,
      I2 => I11,
      I3 => Q(5),
      O => rx_fsm_reset_done_int
    );
rx_fsm_reset_done_int_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04044404"
    )
    port map (
      I0 => Q(4),
      I1 => Q(5),
      I2 => data_valid_sync,
      I3 => I10,
      I4 => I11,
      O => n_0_rx_fsm_reset_done_int_i_4
    );
rx_fsm_reset_done_int_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => I19,
      I1 => DONT_RESET_ON_DATA_ERROR_IN,
      I2 => I11,
      I3 => data_valid_sync,
      O => n_0_rx_fsm_reset_done_int_i_5
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_36\ is
  port (
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    O1 : out STD_LOGIC;
    mmcm_lock_reclocked : in STD_LOGIC;
    I1 : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_36\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_36\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_36\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal mmcm_lock_i : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \mmcm_lock_count[9]_i_1\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of mmcm_lock_reclocked_i_1 : label is "soft_lutpair3";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => '1',
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => mmcm_lock_i,
      R => '0'
    );
\mmcm_lock_count[9]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => mmcm_lock_i,
      O => SR(0)
    );
mmcm_lock_reclocked_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
    port map (
      I0 => mmcm_lock_reclocked,
      I1 => I1,
      I2 => mmcm_lock_i,
      O => O1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_37\ is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_37\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_37\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_37\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_38\ is
  port (
    data_out : out STD_LOGIC;
    GT0_RX_FSM_RESET_DONE_OUT : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_38\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_38\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_38\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => GT0_RX_FSM_RESET_DONE_OUT,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_39\ is
  port (
    data_out : out STD_LOGIC;
    data_in : in STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_39\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_39\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_39\ is
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => data_sync5,
      Q => data_out,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_7\ is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : out STD_LOGIC;
    I1 : in STD_LOGIC;
    rxpmaresetdone_sss : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gtrxreset_ss : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt2_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_7\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_7\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_7\ is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \n_0_state[0]_i_2__1\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\state[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C880C88FCF3FCC0"
    )
    port map (
      I0 => \n_0_state[0]_i_2__1\,
      I1 => Q(2),
      I2 => I1,
      I3 => Q(1),
      I4 => gtrxreset_ss,
      I5 => Q(0),
      O => D(0)
    );
\state[0]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => \^data_out\,
      I1 => rxpmaresetdone_sss,
      O => \n_0_state[0]_i_2__1\
    );
\state[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5500FFFF30FF0000"
    )
    port map (
      I0 => I1,
      I1 => \^data_out\,
      I2 => rxpmaresetdone_sss,
      I3 => Q(2),
      I4 => Q(0),
      I5 => Q(1),
      O => D(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_9\ is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    data_out : out STD_LOGIC;
    I1 : in STD_LOGIC;
    rxpmaresetdone_sss : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gtrxreset_ss : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt1_drpclk_in : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_9\ : entity is "gtwizard_32_Rx_sync_block";
end \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_9\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_9\ is
  signal \^data_out\ : STD_LOGIC;
  signal data_sync1 : STD_LOGIC;
  signal data_sync2 : STD_LOGIC;
  signal data_sync3 : STD_LOGIC;
  signal data_sync4 : STD_LOGIC;
  signal data_sync5 : STD_LOGIC;
  signal \n_0_state[0]_i_2__0\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of data_sync_reg1 : label is std.standard.true;
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of data_sync_reg1 : label is "no";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of data_sync_reg1 : label is "FD";
  attribute box_type : string;
  attribute box_type of data_sync_reg1 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg2 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg2 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg2 : label is "FD";
  attribute box_type of data_sync_reg2 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg3 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg3 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg3 : label is "FD";
  attribute box_type of data_sync_reg3 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg4 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg4 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg4 : label is "FD";
  attribute box_type of data_sync_reg4 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg5 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg5 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg5 : label is "FD";
  attribute box_type of data_sync_reg5 : label is "PRIMITIVE";
  attribute ASYNC_REG of data_sync_reg6 : label is std.standard.true;
  attribute SHREG_EXTRACT of data_sync_reg6 : label is "no";
  attribute XILINX_LEGACY_PRIM of data_sync_reg6 : label is "FD";
  attribute box_type of data_sync_reg6 : label is "PRIMITIVE";
begin
  data_out <= \^data_out\;
data_sync_reg1: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      D => data_in,
      Q => data_sync1,
      R => '0'
    );
data_sync_reg2: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      D => data_sync1,
      Q => data_sync2,
      R => '0'
    );
data_sync_reg3: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      D => data_sync2,
      Q => data_sync3,
      R => '0'
    );
data_sync_reg4: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      D => data_sync3,
      Q => data_sync4,
      R => '0'
    );
data_sync_reg5: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      D => data_sync4,
      Q => data_sync5,
      R => '0'
    );
data_sync_reg6: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      D => data_sync5,
      Q => \^data_out\,
      R => '0'
    );
\state[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0C880C88FCF3FCC0"
    )
    port map (
      I0 => \n_0_state[0]_i_2__0\,
      I1 => Q(2),
      I2 => I1,
      I3 => Q(1),
      I4 => gtrxreset_ss,
      I5 => Q(0),
      O => D(0)
    );
\state[0]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => \^data_out\,
      I1 => rxpmaresetdone_sss,
      O => \n_0_state[0]_i_2__0\
    );
\state[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5500FFFF30FF0000"
    )
    port map (
      I0 => I1,
      I1 => \^data_out\,
      I2 => rxpmaresetdone_sss,
      I3 => Q(2),
      I4 => Q(0),
      I5 => Q(1),
      O => D(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0\ is
  port (
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT0_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    RXUSERRDY : out STD_LOGIC;
    gtrxreset_i : out STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC;
    SOFT_RESET_IN : in STD_LOGIC;
    I1 : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    gt0_rxresetdone_out : in STD_LOGIC;
    GT0_DATA_VALID_IN : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0\ : entity is "gtwizard_32_Rx_RX_STARTUP_FSM";
end \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0\ is
  signal \^ar\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^gt0_rx_fsm_reset_done_out\ : STD_LOGIC;
  signal \^rxuserrdy\ : STD_LOGIC;
  signal check_tlock_max : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \^gtrxreset_i\ : STD_LOGIC;
  signal \init_wait_count_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal init_wait_done : STD_LOGIC;
  signal \mmcm_lock_count_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_3\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_10__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_11__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_12\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_15\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_4\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_5\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_8__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_10\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_4\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_5\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_6\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_7\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_8\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_3\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_4\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[4]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_3\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[6]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[6]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[7]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[7]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[8]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[9]_i_1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[9]_i_2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[10]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[11]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[1]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[2]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[3]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[4]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[5]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[7]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[8]\ : STD_LOGIC;
  signal n_0_QPLL_RESET_i_1 : STD_LOGIC;
  signal n_0_RXUSERRDY_i_1 : STD_LOGIC;
  signal n_0_check_tlock_max_i_1 : STD_LOGIC;
  signal n_0_check_tlock_max_reg : STD_LOGIC;
  signal n_0_gtrxreset_i_i_1 : STD_LOGIC;
  signal \n_0_init_wait_count[4]_i_1\ : STD_LOGIC;
  signal n_0_init_wait_done_i_1 : STD_LOGIC;
  signal \n_0_mmcm_lock_count[0]_i_1\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[9]_i_2\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[9]_i_4\ : STD_LOGIC;
  signal n_0_mmcm_lock_reclocked_i_2 : STD_LOGIC;
  signal n_0_pll_reset_asserted_i_1 : STD_LOGIC;
  signal n_0_pll_reset_asserted_reg : STD_LOGIC;
  signal n_0_reset_time_out_i_11 : STD_LOGIC;
  signal n_0_reset_time_out_i_12 : STD_LOGIC;
  signal n_0_reset_time_out_i_13 : STD_LOGIC;
  signal n_0_reset_time_out_i_4 : STD_LOGIC;
  signal n_0_reset_time_out_i_5 : STD_LOGIC;
  signal n_0_reset_time_out_i_6 : STD_LOGIC;
  signal n_0_reset_time_out_i_8 : STD_LOGIC;
  signal n_0_reset_time_out_i_9 : STD_LOGIC;
  signal n_0_reset_time_out_reg : STD_LOGIC;
  signal n_0_run_phase_alignment_int_i_1 : STD_LOGIC;
  signal n_0_run_phase_alignment_int_i_2 : STD_LOGIC;
  signal n_0_run_phase_alignment_int_reg : STD_LOGIC;
  signal n_0_rx_fsm_reset_done_int_i_3 : STD_LOGIC;
  signal n_0_rx_fsm_reset_done_int_i_6 : STD_LOGIC;
  signal n_0_sync_QPLLLOCK : STD_LOGIC;
  signal n_0_sync_data_valid : STD_LOGIC;
  signal n_0_sync_mmcm_lock_reclocked : STD_LOGIC;
  signal n_0_time_out_100us_i_1 : STD_LOGIC;
  signal n_0_time_out_100us_i_2 : STD_LOGIC;
  signal n_0_time_out_100us_i_3 : STD_LOGIC;
  signal n_0_time_out_100us_reg : STD_LOGIC;
  signal n_0_time_out_1us_i_1 : STD_LOGIC;
  signal n_0_time_out_1us_i_2 : STD_LOGIC;
  signal n_0_time_out_1us_i_3 : STD_LOGIC;
  signal n_0_time_out_1us_reg : STD_LOGIC;
  signal n_0_time_out_2ms_i_1 : STD_LOGIC;
  signal n_0_time_out_2ms_i_2 : STD_LOGIC;
  signal n_0_time_out_2ms_i_3 : STD_LOGIC;
  signal n_0_time_out_2ms_reg : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_1\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_3\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_4\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_5\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_6\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_7\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_8\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_9\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_2\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_3\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_4\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_5\ : STD_LOGIC;
  signal \n_0_time_out_counter[16]_i_2\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_2\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_3\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_4\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_5\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_2\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_3\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_4\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_5\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[0]_i_2\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[12]_i_1\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[4]_i_1\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[8]_i_1\ : STD_LOGIC;
  signal n_0_time_out_wait_bypass_i_1 : STD_LOGIC;
  signal n_0_time_out_wait_bypass_reg : STD_LOGIC;
  signal n_0_time_tlock_max_i_1 : STD_LOGIC;
  signal n_0_time_tlock_max_i_10 : STD_LOGIC;
  signal n_0_time_tlock_max_i_11 : STD_LOGIC;
  signal n_0_time_tlock_max_i_12 : STD_LOGIC;
  signal n_0_time_tlock_max_i_13 : STD_LOGIC;
  signal n_0_time_tlock_max_i_14 : STD_LOGIC;
  signal n_0_time_tlock_max_i_15 : STD_LOGIC;
  signal n_0_time_tlock_max_i_16 : STD_LOGIC;
  signal n_0_time_tlock_max_i_17 : STD_LOGIC;
  signal n_0_time_tlock_max_i_18 : STD_LOGIC;
  signal n_0_time_tlock_max_i_4 : STD_LOGIC;
  signal n_0_time_tlock_max_i_6 : STD_LOGIC;
  signal n_0_time_tlock_max_i_7 : STD_LOGIC;
  signal n_0_time_tlock_max_i_8 : STD_LOGIC;
  signal n_0_time_tlock_max_i_9 : STD_LOGIC;
  signal n_0_time_tlock_max_reg_i_3 : STD_LOGIC;
  signal n_0_time_tlock_max_reg_i_5 : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_4\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_5\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_6\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_7\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_8\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_9\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[12]_i_2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_3\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_4\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_5\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_3\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_4\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_5\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[0]_i_3\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_4\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_5\ : STD_LOGIC;
  signal n_1_sync_QPLLLOCK : STD_LOGIC;
  signal n_1_sync_data_valid : STD_LOGIC;
  signal n_1_sync_mmcm_lock_reclocked : STD_LOGIC;
  signal \n_1_time_out_counter_reg[0]_i_2\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[12]_i_1\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[4]_i_1\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[8]_i_1\ : STD_LOGIC;
  signal n_1_time_tlock_max_reg_i_3 : STD_LOGIC;
  signal n_1_time_tlock_max_reg_i_5 : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[0]_i_3\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[8]_i_1\ : STD_LOGIC;
  signal n_2_sync_QPLLLOCK : STD_LOGIC;
  signal n_2_sync_data_valid : STD_LOGIC;
  signal \n_2_time_out_counter_reg[0]_i_2\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[12]_i_1\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[4]_i_1\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[8]_i_1\ : STD_LOGIC;
  signal n_2_time_tlock_max_reg_i_3 : STD_LOGIC;
  signal n_2_time_tlock_max_reg_i_5 : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[0]_i_3\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[8]_i_1\ : STD_LOGIC;
  signal n_3_sync_QPLLLOCK : STD_LOGIC;
  signal n_3_sync_data_valid : STD_LOGIC;
  signal \n_3_time_out_counter_reg[0]_i_2\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[12]_i_1\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[4]_i_1\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[8]_i_1\ : STD_LOGIC;
  signal n_3_time_tlock_max_reg_i_3 : STD_LOGIC;
  signal n_3_time_tlock_max_reg_i_5 : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[0]_i_3\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[8]_i_1\ : STD_LOGIC;
  signal n_4_sync_data_valid : STD_LOGIC;
  signal \n_4_time_out_counter_reg[0]_i_2\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[12]_i_1\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[4]_i_1\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[8]_i_1\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[0]_i_3\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[8]_i_1\ : STD_LOGIC;
  signal n_5_sync_data_valid : STD_LOGIC;
  signal \n_5_time_out_counter_reg[0]_i_2\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[12]_i_1\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[4]_i_1\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[8]_i_1\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[0]_i_3\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[0]_i_2\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[12]_i_1\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[4]_i_1\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[8]_i_1\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[0]_i_3\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[8]_i_1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[0]_i_2\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[12]_i_1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[16]_i_1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[4]_i_1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[8]_i_1\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[0]_i_3\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[12]_i_1\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[4]_i_1\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[8]_i_1\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \p_0_in__3\ : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal run_phase_alignment_int : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal run_phase_alignment_int_s3 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s2 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s3 : STD_LOGIC;
  signal rxresetdone_s2 : STD_LOGIC;
  signal rxresetdone_s3 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max : STD_LOGIC;
  signal time_tlock_max1 : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal wait_time_cnt0 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \wait_time_cnt_reg__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_time_tlock_max_reg_i_2_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal NLW_time_tlock_max_reg_i_2_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_time_tlock_max_reg_i_3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_time_tlock_max_reg_i_5_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[10]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[10]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_10__2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_11__2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_12\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_15\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_8__2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_10\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_6\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_7\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_8\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_4\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[4]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[5]_i_3\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[6]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[8]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of QPLL_RESET_i_1 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of check_tlock_max_i_1 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of gtrxreset_i_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_2\ : label is "soft_lutpair5";
  attribute counter : integer;
  attribute counter of \init_wait_count_reg[0]\ : label is 6;
  attribute counter of \init_wait_count_reg[1]\ : label is 6;
  attribute counter of \init_wait_count_reg[2]\ : label is 6;
  attribute counter of \init_wait_count_reg[3]\ : label is 6;
  attribute counter of \init_wait_count_reg[4]\ : label is 6;
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \mmcm_lock_count[8]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_3\ : label is "soft_lutpair10";
  attribute counter of \mmcm_lock_count_reg[0]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[1]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[2]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[3]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[4]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[5]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[6]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[7]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[8]\ : label is 22;
  attribute counter of \mmcm_lock_count_reg[9]\ : label is 22;
  attribute SOFT_HLUTNM of mmcm_lock_reclocked_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of pll_reset_asserted_i_1 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of reset_time_out_i_11 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of reset_time_out_i_12 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of reset_time_out_i_13 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of reset_time_out_i_5 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of reset_time_out_i_8 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of reset_time_out_i_9 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of run_phase_alignment_int_i_2 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of rx_fsm_reset_done_int_i_6 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of time_out_2ms_i_1 : label is "soft_lutpair19";
  attribute counter of \time_out_counter_reg[0]\ : label is 8;
  attribute counter of \time_out_counter_reg[10]\ : label is 8;
  attribute counter of \time_out_counter_reg[11]\ : label is 8;
  attribute counter of \time_out_counter_reg[12]\ : label is 8;
  attribute counter of \time_out_counter_reg[13]\ : label is 8;
  attribute counter of \time_out_counter_reg[14]\ : label is 8;
  attribute counter of \time_out_counter_reg[15]\ : label is 8;
  attribute counter of \time_out_counter_reg[16]\ : label is 8;
  attribute counter of \time_out_counter_reg[1]\ : label is 8;
  attribute counter of \time_out_counter_reg[2]\ : label is 8;
  attribute counter of \time_out_counter_reg[3]\ : label is 8;
  attribute counter of \time_out_counter_reg[4]\ : label is 8;
  attribute counter of \time_out_counter_reg[5]\ : label is 8;
  attribute counter of \time_out_counter_reg[6]\ : label is 8;
  attribute counter of \time_out_counter_reg[7]\ : label is 8;
  attribute counter of \time_out_counter_reg[8]\ : label is 8;
  attribute counter of \time_out_counter_reg[9]\ : label is 8;
  attribute counter of \wait_bypass_count_reg[0]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[10]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[11]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[12]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[1]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[2]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[3]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[4]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[5]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[6]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[7]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[8]\ : label is 9;
  attribute counter of \wait_bypass_count_reg[9]\ : label is 9;
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \wait_time_cnt[0]_i_1\ : label is std.standard.true;
  attribute SOFT_HLUTNM of \wait_time_cnt[0]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \wait_time_cnt[1]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \wait_time_cnt[2]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \wait_time_cnt[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wait_time_cnt[4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \wait_time_cnt[6]_i_4\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \wait_time_cnt[6]_i_5\ : label is "soft_lutpair24";
  attribute counter of \wait_time_cnt_reg[0]\ : label is 7;
  attribute counter of \wait_time_cnt_reg[1]\ : label is 7;
  attribute counter of \wait_time_cnt_reg[2]\ : label is 7;
  attribute counter of \wait_time_cnt_reg[3]\ : label is 7;
  attribute counter of \wait_time_cnt_reg[4]\ : label is 7;
  attribute counter of \wait_time_cnt_reg[5]\ : label is 7;
  attribute counter of \wait_time_cnt_reg[6]\ : label is 7;
begin
  AR(0) <= \^ar\(0);
  GT0_RX_FSM_RESET_DONE_OUT <= \^gt0_rx_fsm_reset_done_out\;
  RXUSERRDY <= \^rxuserrdy\;
  gtrxreset_i <= \^gtrxreset_i\;
\FSM_onehot_rx_state[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000010C"
    )
    port map (
      I0 => time_out_wait_bypass_s3,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[10]_i_2\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3\,
      O => \n_0_FSM_onehot_rx_state[10]_i_1\
    );
\FSM_onehot_rx_state[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[10]_i_2\
    );
\FSM_onehot_rx_state[10]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_FSM_onehot_rx_state[10]_i_3\
    );
\FSM_onehot_rx_state[11]_i_10__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F8F8F888"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_10__2\
    );
\FSM_onehot_rx_state[11]_i_11__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCFCFCA0"
    )
    port map (
      I0 => n_0_time_out_2ms_reg,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => check_tlock_max,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_11__2\
    );
\FSM_onehot_rx_state[11]_i_12\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_12\
    );
\FSM_onehot_rx_state[11]_i_15\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000203"
    )
    port map (
      I0 => init_wait_done,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[8]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_15\
    );
\FSM_onehot_rx_state[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEFEEEFEEE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[11]_i_10__2\,
      I1 => \n_0_FSM_onehot_rx_state[11]_i_11__2\,
      I2 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I3 => I1,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3\,
      O => \n_0_FSM_onehot_rx_state[11]_i_4\
    );
\FSM_onehot_rx_state[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_5\
    );
\FSM_onehot_rx_state[11]_i_8__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F080808"
    )
    port map (
      I0 => time_tlock_max,
      I1 => check_tlock_max,
      I2 => n_0_reset_time_out_reg,
      I3 => n_0_time_out_2ms_reg,
      I4 => \n_0_FSM_onehot_rx_state_reg[8]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_8__2\
    );
\FSM_onehot_rx_state[2]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => n_0_reset_time_out_reg,
      I1 => time_tlock_max,
      O => \n_0_FSM_onehot_rx_state[2]_i_10\
    );
\FSM_onehot_rx_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000C0400"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[2]_i_6\,
      I1 => \n_0_FSM_onehot_rx_state[2]_i_7\,
      I2 => \n_0_FSM_onehot_rx_state[2]_i_8\,
      I3 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_5\,
      O => \n_0_FSM_onehot_rx_state[2]_i_2\
    );
\FSM_onehot_rx_state[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4\,
      I1 => \n_0_FSM_onehot_rx_state[5]_i_3\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2\,
      I3 => check_tlock_max,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => \n_0_FSM_onehot_rx_state[2]_i_10\,
      O => \n_0_FSM_onehot_rx_state[2]_i_4\
    );
\FSM_onehot_rx_state[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[10]_i_3\,
      I1 => \n_0_FSM_onehot_rx_state[10]_i_2\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I5 => time_out_wait_bypass_s3,
      O => \n_0_FSM_onehot_rx_state[2]_i_5\
    );
\FSM_onehot_rx_state[2]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => n_0_reset_time_out_reg,
      I1 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[2]_i_6\
    );
\FSM_onehot_rx_state[2]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => run_phase_alignment_int,
      O => \n_0_FSM_onehot_rx_state[2]_i_7\
    );
\FSM_onehot_rx_state[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I3 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[2]_i_8\
    );
\FSM_onehot_rx_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4\,
      O => \n_0_FSM_onehot_rx_state[3]_i_1\
    );
\FSM_onehot_rx_state[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_2\
    );
\FSM_onehot_rx_state[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_3\
    );
\FSM_onehot_rx_state[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_4\
    );
\FSM_onehot_rx_state[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state[9]_i_2\,
      O => \n_0_FSM_onehot_rx_state[4]_i_1\
    );
\FSM_onehot_rx_state[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[5]_i_2\,
      I1 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[5]_i_1\
    );
\FSM_onehot_rx_state[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => check_tlock_max,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => \n_0_FSM_onehot_rx_state[5]_i_3\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4\,
      O => \n_0_FSM_onehot_rx_state[5]_i_2\
    );
\FSM_onehot_rx_state[5]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[10]\,
      O => \n_0_FSM_onehot_rx_state[5]_i_3\
    );
\FSM_onehot_rx_state[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state[6]_i_2\,
      O => \n_0_FSM_onehot_rx_state[6]_i_1\
    );
\FSM_onehot_rx_state[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4\,
      I1 => run_phase_alignment_int,
      I2 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[6]_i_2\
    );
\FSM_onehot_rx_state[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[7]_i_2\,
      I1 => time_tlock_max,
      I2 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[7]_i_1\
    );
\FSM_onehot_rx_state[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4\,
      O => \n_0_FSM_onehot_rx_state[7]_i_2\
    );
\FSM_onehot_rx_state[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I4 => \n_0_FSM_onehot_rx_state[9]_i_2\,
      O => \n_0_FSM_onehot_rx_state[8]_i_1\
    );
\FSM_onehot_rx_state[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000800000008"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[9]_i_2\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_5\,
      I4 => n_0_time_out_2ms_reg,
      I5 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[9]_i_1\
    );
\FSM_onehot_rx_state[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I3 => check_tlock_max,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_2\,
      O => \n_0_FSM_onehot_rx_state[9]_i_2\
    );
\FSM_onehot_rx_state_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[10]_i_1\,
      Q => \n_0_FSM_onehot_rx_state_reg[10]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => n_1_sync_data_valid,
      Q => \n_0_FSM_onehot_rx_state_reg[11]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => '0',
      Q => \n_0_FSM_onehot_rx_state_reg[1]\,
      S => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => n_2_sync_data_valid,
      Q => \n_0_FSM_onehot_rx_state_reg[2]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[3]_i_1\,
      Q => \n_0_FSM_onehot_rx_state_reg[3]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[4]_i_1\,
      Q => \n_0_FSM_onehot_rx_state_reg[4]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[5]_i_1\,
      Q => \n_0_FSM_onehot_rx_state_reg[5]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[6]_i_1\,
      Q => check_tlock_max,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[7]_i_1\,
      Q => \n_0_FSM_onehot_rx_state_reg[7]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[8]_i_1\,
      Q => \n_0_FSM_onehot_rx_state_reg[8]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[9]_i_1\,
      Q => run_phase_alignment_int,
      R => SOFT_RESET_IN
    );
QPLL_RESET_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"74"
    )
    port map (
      I0 => n_0_pll_reset_asserted_reg,
      I1 => \n_0_FSM_onehot_rx_state[3]_i_1\,
      I2 => \^ar\(0),
      O => n_0_QPLL_RESET_i_1
    );
QPLL_RESET_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_QPLL_RESET_i_1,
      Q => \^ar\(0),
      R => SOFT_RESET_IN
    );
RXUSERRDY_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCFFFFCCCC0008"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[9]_i_2\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_5\,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_1\,
      I5 => \^rxuserrdy\,
      O => n_0_RXUSERRDY_i_1
    );
RXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_RXUSERRDY_i_1,
      Q => \^rxuserrdy\,
      R => SOFT_RESET_IN
    );
check_tlock_max_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state[7]_i_2\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1\,
      I3 => n_0_check_tlock_max_reg,
      O => n_0_check_tlock_max_i_1
    );
check_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_check_tlock_max_i_1,
      Q => n_0_check_tlock_max_reg,
      R => SOFT_RESET_IN
    );
gtrxreset_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33F73300"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[6]_i_2\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_1\,
      I4 => \^gtrxreset_i\,
      O => n_0_gtrxreset_i_i_1
    );
gtrxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_gtrxreset_i_i_1,
      Q => \^gtrxreset_i\,
      R => SOFT_RESET_IN
    );
\init_wait_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \init_wait_count_reg__0\(0),
      O => p_0_in(0)
    );
\init_wait_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      O => p_0_in(1)
    );
\init_wait_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(2),
      O => p_0_in(2)
    );
\init_wait_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(3),
      O => p_0_in(3)
    );
\init_wait_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(4),
      I4 => \init_wait_count_reg__0\(3),
      O => \n_0_init_wait_count[4]_i_1\
    );
\init_wait_count[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \init_wait_count_reg__0\(3),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(2),
      I4 => \init_wait_count_reg__0\(4),
      O => p_0_in(4)
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1\,
      CLR => SOFT_RESET_IN,
      D => p_0_in(0),
      Q => \init_wait_count_reg__0\(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1\,
      CLR => SOFT_RESET_IN,
      D => p_0_in(1),
      Q => \init_wait_count_reg__0\(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1\,
      CLR => SOFT_RESET_IN,
      D => p_0_in(2),
      Q => \init_wait_count_reg__0\(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1\,
      CLR => SOFT_RESET_IN,
      D => p_0_in(3),
      Q => \init_wait_count_reg__0\(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1\,
      CLR => SOFT_RESET_IN,
      D => p_0_in(4),
      Q => \init_wait_count_reg__0\(4)
    );
init_wait_done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF40000000"
    )
    port map (
      I0 => \init_wait_count_reg__0\(0),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(4),
      I3 => \init_wait_count_reg__0\(3),
      I4 => \init_wait_count_reg__0\(2),
      I5 => init_wait_done,
      O => n_0_init_wait_done_i_1
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      CLR => SOFT_RESET_IN,
      D => n_0_init_wait_done_i_1,
      Q => init_wait_done
    );
\mmcm_lock_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      O => \n_0_mmcm_lock_count[0]_i_1\
    );
\mmcm_lock_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__3\(1)
    );
\mmcm_lock_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      O => \p_0_in__3\(2)
    );
\mmcm_lock_count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(2),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(1),
      I3 => \mmcm_lock_count_reg__0\(3),
      O => \p_0_in__3\(3)
    );
\mmcm_lock_count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(3),
      I4 => \mmcm_lock_count_reg__0\(4),
      O => \p_0_in__3\(4)
    );
\mmcm_lock_count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(3),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(0),
      I4 => \mmcm_lock_count_reg__0\(1),
      I5 => \mmcm_lock_count_reg__0\(5),
      O => \p_0_in__3\(5)
    );
\mmcm_lock_count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \n_0_mmcm_lock_count[9]_i_4\,
      I1 => \mmcm_lock_count_reg__0\(6),
      O => \p_0_in__3\(6)
    );
\mmcm_lock_count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(6),
      I1 => \n_0_mmcm_lock_count[9]_i_4\,
      I2 => \mmcm_lock_count_reg__0\(7),
      O => \p_0_in__3\(7)
    );
\mmcm_lock_count[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \n_0_mmcm_lock_count[9]_i_4\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      O => \p_0_in__3\(8)
    );
\mmcm_lock_count[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \n_0_mmcm_lock_count[9]_i_4\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \n_0_mmcm_lock_count[9]_i_2\
    );
\mmcm_lock_count[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FF0800"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count_reg__0\(6),
      I2 => \n_0_mmcm_lock_count[9]_i_4\,
      I3 => \mmcm_lock_count_reg__0\(7),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \p_0_in__3\(9)
    );
\mmcm_lock_count[9]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(4),
      I3 => \mmcm_lock_count_reg__0\(5),
      I4 => \mmcm_lock_count_reg__0\(2),
      I5 => \mmcm_lock_count_reg__0\(3),
      O => \n_0_mmcm_lock_count[9]_i_4\
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \n_0_mmcm_lock_count[0]_i_1\,
      Q => \mmcm_lock_count_reg__0\(0),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(1),
      Q => \mmcm_lock_count_reg__0\(1),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(2),
      Q => \mmcm_lock_count_reg__0\(2),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(3),
      Q => \mmcm_lock_count_reg__0\(3),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(4),
      Q => \mmcm_lock_count_reg__0\(4),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(5),
      Q => \mmcm_lock_count_reg__0\(5),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(6),
      Q => \mmcm_lock_count_reg__0\(6),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(7),
      Q => \mmcm_lock_count_reg__0\(7),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(8),
      Q => \mmcm_lock_count_reg__0\(8),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2\,
      D => \p_0_in__3\(9),
      Q => \mmcm_lock_count_reg__0\(9),
      R => n_0_sync_mmcm_lock_reclocked
    );
mmcm_lock_reclocked_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(8),
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \n_0_mmcm_lock_count[9]_i_4\,
      I4 => \mmcm_lock_count_reg__0\(7),
      O => n_0_mmcm_lock_reclocked_i_2
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_1_sync_mmcm_lock_reclocked,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
pll_reset_asserted_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55DC"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => n_0_pll_reset_asserted_reg,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1\,
      I3 => \n_0_FSM_onehot_rx_state[5]_i_2\,
      O => n_0_pll_reset_asserted_i_1
    );
pll_reset_asserted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_pll_reset_asserted_i_1,
      Q => n_0_pll_reset_asserted_reg,
      R => SOFT_RESET_IN
    );
reset_time_out_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => n_0_reset_time_out_i_11
    );
reset_time_out_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => n_0_reset_time_out_i_12
    );
reset_time_out_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => n_0_reset_time_out_i_13
    );
reset_time_out_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
    port map (
      I0 => I1,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_wait_time_cnt[6]_i_4\,
      I4 => \n_0_FSM_onehot_rx_state[5]_i_3\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4\,
      O => n_0_reset_time_out_i_4
    );
reset_time_out_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010006"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state[10]_i_3\,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2\,
      I4 => run_phase_alignment_int,
      O => n_0_reset_time_out_i_5
    );
reset_time_out_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000F00040004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4\,
      I1 => n_0_reset_time_out_i_12,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_3\,
      I4 => \n_0_FSM_onehot_rx_state[2]_i_8\,
      I5 => n_0_reset_time_out_i_13,
      O => n_0_reset_time_out_i_6
    );
reset_time_out_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => mmcm_lock_reclocked,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => check_tlock_max,
      O => n_0_reset_time_out_i_8
    );
reset_time_out_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => n_0_reset_time_out_i_9
    );
reset_time_out_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_4_sync_data_valid,
      Q => n_0_reset_time_out_reg,
      S => SOFT_RESET_IN
    );
run_phase_alignment_int_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => n_0_run_phase_alignment_int_i_2,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1\,
      I3 => n_0_run_phase_alignment_int_reg,
      O => n_0_run_phase_alignment_int_i_1
    );
run_phase_alignment_int_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2\,
      I4 => \n_0_FSM_onehot_rx_state[10]_i_3\,
      O => n_0_run_phase_alignment_int_i_2
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_run_phase_alignment_int_i_1,
      Q => n_0_run_phase_alignment_int_reg,
      R => SOFT_RESET_IN
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => run_phase_alignment_int_s3,
      R => '0'
    );
rx_fsm_reset_done_int_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3\,
      O => n_0_rx_fsm_reset_done_int_i_3
    );
rx_fsm_reset_done_int_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state[10]_i_3\,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2\,
      I4 => run_phase_alignment_int,
      O => n_0_rx_fsm_reset_done_int_i_6
    );
rx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_5_sync_data_valid,
      Q => \^gt0_rx_fsm_reset_done_out\,
      R => SOFT_RESET_IN
    );
rx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => rx_fsm_reset_done_int_s2,
      Q => rx_fsm_reset_done_int_s3,
      R => '0'
    );
rxresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => rxresetdone_s2,
      Q => rxresetdone_s3,
      R => '0'
    );
sync_QPLLLOCK: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_33\
    port map (
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      I1 => n_0_reset_time_out_i_9,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_4\,
      I3 => \n_0_FSM_onehot_rx_state[5]_i_3\,
      I4 => \n_0_wait_time_cnt[6]_i_4\,
      I5 => n_0_reset_time_out_i_11,
      I6 => \n_0_FSM_onehot_rx_state[11]_i_12\,
      I7 => n_3_sync_data_valid,
      I8 => n_0_pll_reset_asserted_reg,
      I9 => I1,
      O1 => n_0_sync_QPLLLOCK,
      O2 => n_1_sync_QPLLLOCK,
      O3 => n_2_sync_QPLLLOCK,
      O4 => n_3_sync_QPLLLOCK,
      Q(4) => \n_0_FSM_onehot_rx_state_reg[8]\,
      Q(3) => check_tlock_max,
      Q(2) => \n_0_FSM_onehot_rx_state_reg[5]\,
      Q(1) => \n_0_FSM_onehot_rx_state_reg[4]\,
      Q(0) => \n_0_FSM_onehot_rx_state_reg[2]\,
      SYSCLK_IN => SYSCLK_IN,
      mmcm_lock_reclocked => mmcm_lock_reclocked
    );
sync_RXRESETDONE: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_34\
    port map (
      SYSCLK_IN => SYSCLK_IN,
      data_out => rxresetdone_s2,
      gt0_rxresetdone_out => gt0_rxresetdone_out
    );
sync_data_valid: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_35\
    port map (
      D(1) => n_1_sync_data_valid,
      D(0) => n_2_sync_data_valid,
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      E(0) => n_0_sync_data_valid,
      GT0_DATA_VALID_IN => GT0_DATA_VALID_IN,
      GT0_RX_FSM_RESET_DONE_OUT => \^gt0_rx_fsm_reset_done_out\,
      I1 => \n_0_FSM_onehot_rx_state[11]_i_4\,
      I10 => n_0_time_out_1us_reg,
      I11 => n_0_reset_time_out_reg,
      I12 => \n_0_FSM_onehot_rx_state[2]_i_2\,
      I13 => \n_0_FSM_onehot_rx_state[5]_i_2\,
      I14 => n_0_time_out_2ms_reg,
      I15 => \n_0_FSM_onehot_rx_state[2]_i_4\,
      I16 => \n_0_FSM_onehot_rx_state[2]_i_5\,
      I17 => n_3_sync_QPLLLOCK,
      I18 => n_0_reset_time_out_i_8,
      I19 => n_0_time_out_100us_reg,
      I2(0) => sel,
      I20 => n_0_rx_fsm_reset_done_int_i_6,
      I21 => n_0_sync_QPLLLOCK,
      I22 => n_0_reset_time_out_i_4,
      I23 => n_0_reset_time_out_i_5,
      I24 => n_0_reset_time_out_i_6,
      I25 => n_0_rx_fsm_reset_done_int_i_3,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_5\,
      I4 => n_1_sync_QPLLLOCK,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_15\,
      I6 => \n_0_FSM_onehot_rx_state[10]_i_3\,
      I7 => \n_0_FSM_onehot_rx_state[10]_i_2\,
      I8 => \n_0_FSM_onehot_rx_state[11]_i_8__2\,
      I9 => n_2_sync_QPLLLOCK,
      O1 => n_3_sync_data_valid,
      O2 => n_4_sync_data_valid,
      O3 => n_5_sync_data_valid,
      Q(5) => \n_0_FSM_onehot_rx_state_reg[11]\,
      Q(4) => \n_0_FSM_onehot_rx_state_reg[10]\,
      Q(3) => run_phase_alignment_int,
      Q(2) => \n_0_FSM_onehot_rx_state_reg[8]\,
      Q(1) => \n_0_FSM_onehot_rx_state_reg[7]\,
      Q(0) => \n_0_FSM_onehot_rx_state_reg[3]\,
      SYSCLK_IN => SYSCLK_IN,
      rxresetdone_s3 => rxresetdone_s3
    );
sync_mmcm_lock_reclocked: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_36\
    port map (
      I1 => n_0_mmcm_lock_reclocked_i_2,
      O1 => n_1_sync_mmcm_lock_reclocked,
      SR(0) => n_0_sync_mmcm_lock_reclocked,
      SYSCLK_IN => SYSCLK_IN,
      mmcm_lock_reclocked => mmcm_lock_reclocked
    );
sync_run_phase_alignment_int: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_37\
    port map (
      data_in => n_0_run_phase_alignment_int_reg,
      data_out => run_phase_alignment_int_s2,
      gt0_rxusrclk_in => gt0_rxusrclk_in
    );
sync_rx_fsm_reset_done_int: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_38\
    port map (
      GT0_RX_FSM_RESET_DONE_OUT => \^gt0_rx_fsm_reset_done_out\,
      data_out => rx_fsm_reset_done_int_s2,
      gt0_rxusrclk_in => gt0_rxusrclk_in
    );
sync_time_out_wait_bypass: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_39\
    port map (
      SYSCLK_IN => SYSCLK_IN,
      data_in => n_0_time_out_wait_bypass_reg,
      data_out => time_out_wait_bypass_s2
    );
time_out_100us_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
    port map (
      I0 => \n_0_time_out_counter[0]_i_3\,
      I1 => n_0_time_out_100us_i_2,
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(11),
      I4 => n_0_time_out_100us_i_3,
      I5 => n_0_time_out_100us_reg,
      O => n_0_time_out_100us_i_1
    );
time_out_100us_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      O => n_0_time_out_100us_i_2
    );
time_out_100us_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
    port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(12),
      I3 => time_out_counter_reg(3),
      I4 => time_out_counter_reg(1),
      I5 => time_out_counter_reg(2),
      O => n_0_time_out_100us_i_3
    );
time_out_100us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_time_out_100us_i_1,
      Q => n_0_time_out_100us_reg,
      R => n_0_reset_time_out_reg
    );
time_out_1us_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000002"
    )
    port map (
      I0 => n_0_time_out_1us_i_2,
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(11),
      I4 => time_out_counter_reg(10),
      I5 => n_0_time_out_1us_reg,
      O => n_0_time_out_1us_i_1
    );
time_out_1us_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
    port map (
      I0 => n_0_time_out_2ms_i_3,
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(15),
      I3 => time_out_counter_reg(8),
      I4 => time_out_counter_reg(9),
      I5 => n_0_time_out_1us_i_3,
      O => n_0_time_out_1us_i_2
    );
time_out_1us_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
    port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(6),
      I2 => time_out_counter_reg(5),
      I3 => time_out_counter_reg(4),
      I4 => time_out_counter_reg(7),
      O => n_0_time_out_1us_i_3
    );
time_out_1us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_time_out_1us_i_1,
      Q => n_0_time_out_1us_reg,
      R => n_0_reset_time_out_reg
    );
time_out_2ms_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => n_0_time_out_2ms_i_2,
      I1 => \n_0_time_out_counter[0]_i_3\,
      I2 => n_0_time_out_2ms_i_3,
      I3 => n_0_time_out_2ms_reg,
      O => n_0_time_out_2ms_i_1
    );
time_out_2ms_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
    port map (
      I0 => time_out_counter_reg(13),
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(11),
      I3 => time_out_counter_reg(10),
      I4 => time_out_counter_reg(16),
      I5 => time_out_counter_reg(15),
      O => n_0_time_out_2ms_i_2
    );
time_out_2ms_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(3),
      I3 => time_out_counter_reg(12),
      O => n_0_time_out_2ms_i_3
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_time_out_2ms_i_1,
      Q => n_0_time_out_2ms_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_counter[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => time_out_counter_reg(10),
      I1 => \n_0_time_out_counter[0]_i_3\,
      I2 => \n_0_time_out_counter[0]_i_4\,
      O => \n_0_time_out_counter[0]_i_1\
    );
\time_out_counter[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
    port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      I2 => time_out_counter_reg(7),
      I3 => time_out_counter_reg(6),
      I4 => time_out_counter_reg(0),
      I5 => \n_0_time_out_counter[0]_i_9\,
      O => \n_0_time_out_counter[0]_i_3\
    );
\time_out_counter[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFFFFF"
    )
    port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(14),
      I4 => time_out_counter_reg(11),
      I5 => n_0_time_out_2ms_i_3,
      O => \n_0_time_out_counter[0]_i_4\
    );
\time_out_counter[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(3),
      O => \n_0_time_out_counter[0]_i_5\
    );
\time_out_counter[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(2),
      O => \n_0_time_out_counter[0]_i_6\
    );
\time_out_counter[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(1),
      O => \n_0_time_out_counter[0]_i_7\
    );
\time_out_counter[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(0),
      O => \n_0_time_out_counter[0]_i_8\
    );
\time_out_counter[0]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      O => \n_0_time_out_counter[0]_i_9\
    );
\time_out_counter[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(15),
      O => \n_0_time_out_counter[12]_i_2\
    );
\time_out_counter[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(14),
      O => \n_0_time_out_counter[12]_i_3\
    );
\time_out_counter[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(13),
      O => \n_0_time_out_counter[12]_i_4\
    );
\time_out_counter[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(12),
      O => \n_0_time_out_counter[12]_i_5\
    );
\time_out_counter[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(16),
      O => \n_0_time_out_counter[16]_i_2\
    );
\time_out_counter[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(7),
      O => \n_0_time_out_counter[4]_i_2\
    );
\time_out_counter[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(6),
      O => \n_0_time_out_counter[4]_i_3\
    );
\time_out_counter[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(5),
      O => \n_0_time_out_counter[4]_i_4\
    );
\time_out_counter[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(4),
      O => \n_0_time_out_counter[4]_i_5\
    );
\time_out_counter[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(11),
      O => \n_0_time_out_counter[8]_i_2\
    );
\time_out_counter[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(10),
      O => \n_0_time_out_counter[8]_i_3\
    );
\time_out_counter[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(9),
      O => \n_0_time_out_counter[8]_i_4\
    );
\time_out_counter[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(8),
      O => \n_0_time_out_counter[8]_i_5\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_7_time_out_counter_reg[0]_i_2\,
      Q => time_out_counter_reg(0),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[0]_i_2\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_time_out_counter_reg[0]_i_2\,
      CO(2) => \n_1_time_out_counter_reg[0]_i_2\,
      CO(1) => \n_2_time_out_counter_reg[0]_i_2\,
      CO(0) => \n_3_time_out_counter_reg[0]_i_2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_time_out_counter_reg[0]_i_2\,
      O(2) => \n_5_time_out_counter_reg[0]_i_2\,
      O(1) => \n_6_time_out_counter_reg[0]_i_2\,
      O(0) => \n_7_time_out_counter_reg[0]_i_2\,
      S(3) => \n_0_time_out_counter[0]_i_5\,
      S(2) => \n_0_time_out_counter[0]_i_6\,
      S(1) => \n_0_time_out_counter[0]_i_7\,
      S(0) => \n_0_time_out_counter[0]_i_8\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_5_time_out_counter_reg[8]_i_1\,
      Q => time_out_counter_reg(10),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_4_time_out_counter_reg[8]_i_1\,
      Q => time_out_counter_reg(11),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_7_time_out_counter_reg[12]_i_1\,
      Q => time_out_counter_reg(12),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[8]_i_1\,
      CO(3) => \n_0_time_out_counter_reg[12]_i_1\,
      CO(2) => \n_1_time_out_counter_reg[12]_i_1\,
      CO(1) => \n_2_time_out_counter_reg[12]_i_1\,
      CO(0) => \n_3_time_out_counter_reg[12]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[12]_i_1\,
      O(2) => \n_5_time_out_counter_reg[12]_i_1\,
      O(1) => \n_6_time_out_counter_reg[12]_i_1\,
      O(0) => \n_7_time_out_counter_reg[12]_i_1\,
      S(3) => \n_0_time_out_counter[12]_i_2\,
      S(2) => \n_0_time_out_counter[12]_i_3\,
      S(1) => \n_0_time_out_counter[12]_i_4\,
      S(0) => \n_0_time_out_counter[12]_i_5\
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_6_time_out_counter_reg[12]_i_1\,
      Q => time_out_counter_reg(13),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_5_time_out_counter_reg[12]_i_1\,
      Q => time_out_counter_reg(14),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_4_time_out_counter_reg[12]_i_1\,
      Q => time_out_counter_reg(15),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_7_time_out_counter_reg[16]_i_1\,
      Q => time_out_counter_reg(16),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[16]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[12]_i_1\,
      CO(3 downto 0) => \NLW_time_out_counter_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_time_out_counter_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_time_out_counter_reg[16]_i_1\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_time_out_counter[16]_i_2\
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_6_time_out_counter_reg[0]_i_2\,
      Q => time_out_counter_reg(1),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_5_time_out_counter_reg[0]_i_2\,
      Q => time_out_counter_reg(2),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_4_time_out_counter_reg[0]_i_2\,
      Q => time_out_counter_reg(3),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_7_time_out_counter_reg[4]_i_1\,
      Q => time_out_counter_reg(4),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[0]_i_2\,
      CO(3) => \n_0_time_out_counter_reg[4]_i_1\,
      CO(2) => \n_1_time_out_counter_reg[4]_i_1\,
      CO(1) => \n_2_time_out_counter_reg[4]_i_1\,
      CO(0) => \n_3_time_out_counter_reg[4]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[4]_i_1\,
      O(2) => \n_5_time_out_counter_reg[4]_i_1\,
      O(1) => \n_6_time_out_counter_reg[4]_i_1\,
      O(0) => \n_7_time_out_counter_reg[4]_i_1\,
      S(3) => \n_0_time_out_counter[4]_i_2\,
      S(2) => \n_0_time_out_counter[4]_i_3\,
      S(1) => \n_0_time_out_counter[4]_i_4\,
      S(0) => \n_0_time_out_counter[4]_i_5\
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_6_time_out_counter_reg[4]_i_1\,
      Q => time_out_counter_reg(5),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_5_time_out_counter_reg[4]_i_1\,
      Q => time_out_counter_reg(6),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_4_time_out_counter_reg[4]_i_1\,
      Q => time_out_counter_reg(7),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_7_time_out_counter_reg[8]_i_1\,
      Q => time_out_counter_reg(8),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[4]_i_1\,
      CO(3) => \n_0_time_out_counter_reg[8]_i_1\,
      CO(2) => \n_1_time_out_counter_reg[8]_i_1\,
      CO(1) => \n_2_time_out_counter_reg[8]_i_1\,
      CO(0) => \n_3_time_out_counter_reg[8]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[8]_i_1\,
      O(2) => \n_5_time_out_counter_reg[8]_i_1\,
      O(1) => \n_6_time_out_counter_reg[8]_i_1\,
      O(0) => \n_7_time_out_counter_reg[8]_i_1\,
      S(3) => \n_0_time_out_counter[8]_i_2\,
      S(2) => \n_0_time_out_counter[8]_i_3\,
      S(1) => \n_0_time_out_counter[8]_i_4\,
      S(0) => \n_0_time_out_counter[8]_i_5\
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1\,
      D => \n_6_time_out_counter_reg[8]_i_1\,
      Q => time_out_counter_reg(9),
      R => n_0_reset_time_out_reg
    );
time_out_wait_bypass_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF0100000000"
    )
    port map (
      I0 => \n_0_wait_bypass_count[0]_i_4\,
      I1 => wait_bypass_count_reg(3),
      I2 => \n_0_wait_bypass_count[0]_i_5\,
      I3 => n_0_time_out_wait_bypass_reg,
      I4 => rx_fsm_reset_done_int_s3,
      I5 => run_phase_alignment_int_s3,
      O => n_0_time_out_wait_bypass_i_1
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_rxusrclk_in,
      CE => '1',
      D => n_0_time_out_wait_bypass_i_1,
      Q => n_0_time_out_wait_bypass_reg,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
time_tlock_max_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => n_0_check_tlock_max_reg,
      I1 => time_tlock_max1,
      I2 => time_tlock_max,
      O => n_0_time_tlock_max_i_1
    );
time_tlock_max_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(13),
      O => n_0_time_tlock_max_i_10
    );
time_tlock_max_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(10),
      O => n_0_time_tlock_max_i_11
    );
time_tlock_max_i_12: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(9),
      I1 => time_out_counter_reg(8),
      O => n_0_time_tlock_max_i_12
    );
time_tlock_max_i_13: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      O => n_0_time_tlock_max_i_13
    );
time_tlock_max_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(1),
      O => n_0_time_tlock_max_i_14
    );
time_tlock_max_i_15: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(6),
      I1 => time_out_counter_reg(7),
      O => n_0_time_tlock_max_i_15
    );
time_tlock_max_i_16: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(5),
      I1 => time_out_counter_reg(4),
      O => n_0_time_tlock_max_i_16
    );
time_tlock_max_i_17: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(3),
      O => n_0_time_tlock_max_i_17
    );
time_tlock_max_i_18: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(1),
      I1 => time_out_counter_reg(0),
      O => n_0_time_tlock_max_i_18
    );
time_tlock_max_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(16),
      O => n_0_time_tlock_max_i_4
    );
time_tlock_max_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      O => n_0_time_tlock_max_i_6
    );
time_tlock_max_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(10),
      I1 => time_out_counter_reg(11),
      O => n_0_time_tlock_max_i_7
    );
time_tlock_max_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      O => n_0_time_tlock_max_i_8
    );
time_tlock_max_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(14),
      O => n_0_time_tlock_max_i_9
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_time_tlock_max_i_1,
      Q => time_tlock_max,
      R => n_0_reset_time_out_reg
    );
time_tlock_max_reg_i_2: unisim.vcomponents.CARRY4
    port map (
      CI => n_0_time_tlock_max_reg_i_3,
      CO(3 downto 1) => NLW_time_tlock_max_reg_i_2_CO_UNCONNECTED(3 downto 1),
      CO(0) => time_tlock_max1,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => time_out_counter_reg(16),
      O(3 downto 0) => NLW_time_tlock_max_reg_i_2_O_UNCONNECTED(3 downto 0),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => n_0_time_tlock_max_i_4
    );
time_tlock_max_reg_i_3: unisim.vcomponents.CARRY4
    port map (
      CI => n_0_time_tlock_max_reg_i_5,
      CO(3) => n_0_time_tlock_max_reg_i_3,
      CO(2) => n_1_time_tlock_max_reg_i_3,
      CO(1) => n_2_time_tlock_max_reg_i_3,
      CO(0) => n_3_time_tlock_max_reg_i_3,
      CYINIT => '0',
      DI(3) => n_0_time_tlock_max_i_6,
      DI(2) => time_out_counter_reg(13),
      DI(1) => n_0_time_tlock_max_i_7,
      DI(0) => n_0_time_tlock_max_i_8,
      O(3 downto 0) => NLW_time_tlock_max_reg_i_3_O_UNCONNECTED(3 downto 0),
      S(3) => n_0_time_tlock_max_i_9,
      S(2) => n_0_time_tlock_max_i_10,
      S(1) => n_0_time_tlock_max_i_11,
      S(0) => n_0_time_tlock_max_i_12
    );
time_tlock_max_reg_i_5: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => n_0_time_tlock_max_reg_i_5,
      CO(2) => n_1_time_tlock_max_reg_i_5,
      CO(1) => n_2_time_tlock_max_reg_i_5,
      CO(0) => n_3_time_tlock_max_reg_i_5,
      CYINIT => '0',
      DI(3) => time_out_counter_reg(7),
      DI(2) => n_0_time_tlock_max_i_13,
      DI(1) => time_out_counter_reg(3),
      DI(0) => n_0_time_tlock_max_i_14,
      O(3 downto 0) => NLW_time_tlock_max_reg_i_5_O_UNCONNECTED(3 downto 0),
      S(3) => n_0_time_tlock_max_i_15,
      S(2) => n_0_time_tlock_max_i_16,
      S(1) => n_0_time_tlock_max_i_17,
      S(0) => n_0_time_tlock_max_i_18
    );
\wait_bypass_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => run_phase_alignment_int_s3,
      O => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
    port map (
      I0 => \n_0_wait_bypass_count[0]_i_4\,
      I1 => wait_bypass_count_reg(3),
      I2 => \n_0_wait_bypass_count[0]_i_5\,
      I3 => rx_fsm_reset_done_int_s3,
      O => \n_0_wait_bypass_count[0]_i_2\
    );
\wait_bypass_count[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFFFFFFFFFF"
    )
    port map (
      I0 => wait_bypass_count_reg(11),
      I1 => wait_bypass_count_reg(4),
      I2 => wait_bypass_count_reg(0),
      I3 => wait_bypass_count_reg(9),
      I4 => wait_bypass_count_reg(10),
      I5 => wait_bypass_count_reg(2),
      O => \n_0_wait_bypass_count[0]_i_4\
    );
\wait_bypass_count[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFFFFFFFF"
    )
    port map (
      I0 => wait_bypass_count_reg(1),
      I1 => wait_bypass_count_reg(6),
      I2 => wait_bypass_count_reg(5),
      I3 => wait_bypass_count_reg(12),
      I4 => wait_bypass_count_reg(8),
      I5 => wait_bypass_count_reg(7),
      O => \n_0_wait_bypass_count[0]_i_5\
    );
\wait_bypass_count[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(3),
      O => \n_0_wait_bypass_count[0]_i_6\
    );
\wait_bypass_count[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(2),
      O => \n_0_wait_bypass_count[0]_i_7\
    );
\wait_bypass_count[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(1),
      O => \n_0_wait_bypass_count[0]_i_8\
    );
\wait_bypass_count[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wait_bypass_count_reg(0),
      O => \n_0_wait_bypass_count[0]_i_9\
    );
\wait_bypass_count[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(12),
      O => \n_0_wait_bypass_count[12]_i_2\
    );
\wait_bypass_count[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(7),
      O => \n_0_wait_bypass_count[4]_i_2\
    );
\wait_bypass_count[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(6),
      O => \n_0_wait_bypass_count[4]_i_3\
    );
\wait_bypass_count[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(5),
      O => \n_0_wait_bypass_count[4]_i_4\
    );
\wait_bypass_count[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(4),
      O => \n_0_wait_bypass_count[4]_i_5\
    );
\wait_bypass_count[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(11),
      O => \n_0_wait_bypass_count[8]_i_2\
    );
\wait_bypass_count[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(10),
      O => \n_0_wait_bypass_count[8]_i_3\
    );
\wait_bypass_count[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(9),
      O => \n_0_wait_bypass_count[8]_i_4\
    );
\wait_bypass_count[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(8),
      O => \n_0_wait_bypass_count[8]_i_5\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_7_wait_bypass_count_reg[0]_i_3\,
      Q => wait_bypass_count_reg(0),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[0]_i_3\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_wait_bypass_count_reg[0]_i_3\,
      CO(2) => \n_1_wait_bypass_count_reg[0]_i_3\,
      CO(1) => \n_2_wait_bypass_count_reg[0]_i_3\,
      CO(0) => \n_3_wait_bypass_count_reg[0]_i_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_wait_bypass_count_reg[0]_i_3\,
      O(2) => \n_5_wait_bypass_count_reg[0]_i_3\,
      O(1) => \n_6_wait_bypass_count_reg[0]_i_3\,
      O(0) => \n_7_wait_bypass_count_reg[0]_i_3\,
      S(3) => \n_0_wait_bypass_count[0]_i_6\,
      S(2) => \n_0_wait_bypass_count[0]_i_7\,
      S(1) => \n_0_wait_bypass_count[0]_i_8\,
      S(0) => \n_0_wait_bypass_count[0]_i_9\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_5_wait_bypass_count_reg[8]_i_1\,
      Q => wait_bypass_count_reg(10),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_4_wait_bypass_count_reg[8]_i_1\,
      Q => wait_bypass_count_reg(11),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_7_wait_bypass_count_reg[12]_i_1\,
      Q => wait_bypass_count_reg(12),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[8]_i_1\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[12]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_wait_bypass_count_reg[12]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_wait_bypass_count_reg[12]_i_1\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_wait_bypass_count[12]_i_2\
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_6_wait_bypass_count_reg[0]_i_3\,
      Q => wait_bypass_count_reg(1),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_5_wait_bypass_count_reg[0]_i_3\,
      Q => wait_bypass_count_reg(2),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_4_wait_bypass_count_reg[0]_i_3\,
      Q => wait_bypass_count_reg(3),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_7_wait_bypass_count_reg[4]_i_1\,
      Q => wait_bypass_count_reg(4),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[0]_i_3\,
      CO(3) => \n_0_wait_bypass_count_reg[4]_i_1\,
      CO(2) => \n_1_wait_bypass_count_reg[4]_i_1\,
      CO(1) => \n_2_wait_bypass_count_reg[4]_i_1\,
      CO(0) => \n_3_wait_bypass_count_reg[4]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_wait_bypass_count_reg[4]_i_1\,
      O(2) => \n_5_wait_bypass_count_reg[4]_i_1\,
      O(1) => \n_6_wait_bypass_count_reg[4]_i_1\,
      O(0) => \n_7_wait_bypass_count_reg[4]_i_1\,
      S(3) => \n_0_wait_bypass_count[4]_i_2\,
      S(2) => \n_0_wait_bypass_count[4]_i_3\,
      S(1) => \n_0_wait_bypass_count[4]_i_4\,
      S(0) => \n_0_wait_bypass_count[4]_i_5\
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_6_wait_bypass_count_reg[4]_i_1\,
      Q => wait_bypass_count_reg(5),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_5_wait_bypass_count_reg[4]_i_1\,
      Q => wait_bypass_count_reg(6),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_4_wait_bypass_count_reg[4]_i_1\,
      Q => wait_bypass_count_reg(7),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_7_wait_bypass_count_reg[8]_i_1\,
      Q => wait_bypass_count_reg(8),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_bypass_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[4]_i_1\,
      CO(3) => \n_0_wait_bypass_count_reg[8]_i_1\,
      CO(2) => \n_1_wait_bypass_count_reg[8]_i_1\,
      CO(1) => \n_2_wait_bypass_count_reg[8]_i_1\,
      CO(0) => \n_3_wait_bypass_count_reg[8]_i_1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_wait_bypass_count_reg[8]_i_1\,
      O(2) => \n_5_wait_bypass_count_reg[8]_i_1\,
      O(1) => \n_6_wait_bypass_count_reg[8]_i_1\,
      O(0) => \n_7_wait_bypass_count_reg[8]_i_1\,
      S(3) => \n_0_wait_bypass_count[8]_i_2\,
      S(2) => \n_0_wait_bypass_count[8]_i_3\,
      S(1) => \n_0_wait_bypass_count[8]_i_4\,
      S(0) => \n_0_wait_bypass_count[8]_i_5\
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => gt0_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2\,
      D => \n_6_wait_bypass_count_reg[8]_i_1\,
      Q => wait_bypass_count_reg(9),
      R => \n_0_wait_bypass_count[0]_i_1\
    );
\wait_time_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(0),
      O => wait_time_cnt0(0)
    );
\wait_time_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(1),
      I1 => \wait_time_cnt_reg__0\(0),
      O => wait_time_cnt0(1)
    );
\wait_time_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(2),
      I1 => \wait_time_cnt_reg__0\(0),
      I2 => \wait_time_cnt_reg__0\(1),
      O => wait_time_cnt0(2)
    );
\wait_time_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(1),
      I1 => \wait_time_cnt_reg__0\(0),
      I2 => \wait_time_cnt_reg__0\(2),
      I3 => \wait_time_cnt_reg__0\(3),
      O => wait_time_cnt0(3)
    );
\wait_time_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(4),
      I1 => \wait_time_cnt_reg__0\(3),
      I2 => \wait_time_cnt_reg__0\(2),
      I3 => \wait_time_cnt_reg__0\(0),
      I4 => \wait_time_cnt_reg__0\(1),
      O => wait_time_cnt0(4)
    );
\wait_time_cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0F0E1"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(3),
      I1 => \wait_time_cnt_reg__0\(2),
      I2 => \wait_time_cnt_reg__0\(5),
      I3 => \wait_time_cnt_reg__0\(4),
      I4 => \wait_time_cnt_reg__0\(1),
      I5 => \wait_time_cnt_reg__0\(0),
      O => wait_time_cnt0(5)
    );
\wait_time_cnt[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_3\,
      I1 => \n_0_wait_time_cnt[6]_i_4\,
      I2 => \n_0_FSM_onehot_rx_state[11]_i_5\,
      I3 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I4 => run_phase_alignment_int,
      I5 => \n_0_FSM_onehot_rx_state_reg[4]\,
      O => clear
    );
\wait_time_cnt[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(6),
      I1 => \wait_time_cnt_reg__0\(1),
      I2 => \wait_time_cnt_reg__0\(0),
      I3 => \n_0_wait_time_cnt[6]_i_5\,
      I4 => \wait_time_cnt_reg__0\(4),
      I5 => \wait_time_cnt_reg__0\(5),
      O => sel
    );
\wait_time_cnt[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(5),
      I1 => \wait_time_cnt_reg__0\(4),
      I2 => \n_0_wait_time_cnt[6]_i_5\,
      I3 => \wait_time_cnt_reg__0\(0),
      I4 => \wait_time_cnt_reg__0\(1),
      I5 => \wait_time_cnt_reg__0\(6),
      O => wait_time_cnt0(6)
    );
\wait_time_cnt[6]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_wait_time_cnt[6]_i_4\
    );
\wait_time_cnt[6]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(2),
      I1 => \wait_time_cnt_reg__0\(3),
      O => \n_0_wait_time_cnt[6]_i_5\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => sel,
      D => wait_time_cnt0(0),
      Q => \wait_time_cnt_reg__0\(0),
      R => clear
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => sel,
      D => wait_time_cnt0(1),
      Q => \wait_time_cnt_reg__0\(1),
      R => clear
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => sel,
      D => wait_time_cnt0(2),
      Q => \wait_time_cnt_reg__0\(2),
      S => clear
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => sel,
      D => wait_time_cnt0(3),
      Q => \wait_time_cnt_reg__0\(3),
      R => clear
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => sel,
      D => wait_time_cnt0(4),
      Q => \wait_time_cnt_reg__0\(4),
      R => clear
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => sel,
      D => wait_time_cnt0(5),
      Q => \wait_time_cnt_reg__0\(5),
      S => clear
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => sel,
      D => wait_time_cnt0(6),
      Q => \wait_time_cnt_reg__0\(6),
      S => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_0\ is
  port (
    GT1_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC;
    gt1_rxusrclk_in : in STD_LOGIC;
    SOFT_RESET_IN : in STD_LOGIC;
    I1 : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    gt1_rxresetdone_out : in STD_LOGIC;
    GT1_DATA_VALID_IN : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_0\ : entity is "gtwizard_32_Rx_RX_STARTUP_FSM";
end \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_0\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_0\ is
  signal \^gt1_rx_fsm_reset_done_out\ : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal check_tlock_max : STD_LOGIC;
  signal \init_wait_count_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal init_wait_done : STD_LOGIC;
  signal \mmcm_lock_count_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_3__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_10\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_11\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_12__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_14__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_15__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_16\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_5__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_6\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_8\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_10__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_4__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_5__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_6__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_7__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_8__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_3__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_4__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_3__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[6]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[6]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[7]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[7]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[8]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[9]_i_1__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[9]_i_2__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[10]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[11]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[1]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[2]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[3]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[4]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[5]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[7]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[8]\ : STD_LOGIC;
  signal \n_0_RXUSERRDY_i_1__0\ : STD_LOGIC;
  signal \n_0_check_tlock_max_i_1__0\ : STD_LOGIC;
  signal n_0_check_tlock_max_reg : STD_LOGIC;
  signal \n_0_gtrxreset_i_i_1__0\ : STD_LOGIC;
  signal \n_0_init_wait_count[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_init_wait_done_i_1__0\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[9]_i_2__0\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[9]_i_4__0\ : STD_LOGIC;
  signal \n_0_mmcm_lock_reclocked_i_2__0\ : STD_LOGIC;
  signal \n_0_pll_reset_asserted_i_1__0\ : STD_LOGIC;
  signal n_0_pll_reset_asserted_reg : STD_LOGIC;
  signal \n_0_reset_time_out_i_11__0\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_12__0\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_13__0\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_4__0\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_5__0\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_6__0\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_8__0\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_9__0\ : STD_LOGIC;
  signal n_0_reset_time_out_reg : STD_LOGIC;
  signal \n_0_run_phase_alignment_int_i_1__0\ : STD_LOGIC;
  signal \n_0_run_phase_alignment_int_i_2__0\ : STD_LOGIC;
  signal n_0_run_phase_alignment_int_reg : STD_LOGIC;
  signal n_0_run_phase_alignment_int_s3_reg : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_3__0\ : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_6__0\ : STD_LOGIC;
  signal n_0_rx_fsm_reset_done_int_s3_reg : STD_LOGIC;
  signal n_0_sync_QPLLLOCK : STD_LOGIC;
  signal n_0_sync_data_valid : STD_LOGIC;
  signal n_0_sync_mmcm_lock_reclocked : STD_LOGIC;
  signal \n_0_time_out_100us_i_1__0\ : STD_LOGIC;
  signal \n_0_time_out_100us_i_2__0\ : STD_LOGIC;
  signal \n_0_time_out_100us_i_3__0\ : STD_LOGIC;
  signal n_0_time_out_100us_reg : STD_LOGIC;
  signal \n_0_time_out_1us_i_1__0\ : STD_LOGIC;
  signal \n_0_time_out_1us_i_2__0\ : STD_LOGIC;
  signal \n_0_time_out_1us_i_3__0\ : STD_LOGIC;
  signal n_0_time_out_1us_reg : STD_LOGIC;
  signal \n_0_time_out_2ms_i_1__0\ : STD_LOGIC;
  signal \n_0_time_out_2ms_i_2__0\ : STD_LOGIC;
  signal \n_0_time_out_2ms_i_3__0\ : STD_LOGIC;
  signal n_0_time_out_2ms_reg : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_3__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_4__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_5__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_6__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_7__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_8__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_9__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_2__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_3__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_4__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_5__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[16]_i_2__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_2__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_3__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_4__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_5__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_2__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_3__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_4__0\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_5__0\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_0_time_out_wait_bypass_i_1__0\ : STD_LOGIC;
  signal n_0_time_out_wait_bypass_reg : STD_LOGIC;
  signal \n_0_time_tlock_max_i_10__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_11__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_12__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_13__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_14__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_15__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_16__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_17__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_18__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_1__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_4__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_6__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_7__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_8__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_9__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_reg_i_3__0\ : STD_LOGIC;
  signal \n_0_time_tlock_max_reg_i_5__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_1__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_2__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_4__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_5__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_6__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_7__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_8__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_9__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[12]_i_2__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_2__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_3__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_4__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_5__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_2__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_3__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_4__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_5__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[0]_i_3__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_1__0\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_2__0\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_4__0\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_5__0\ : STD_LOGIC;
  signal n_1_sync_QPLLLOCK : STD_LOGIC;
  signal n_1_sync_data_valid : STD_LOGIC;
  signal n_1_sync_mmcm_lock_reclocked : STD_LOGIC;
  signal \n_1_time_out_counter_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_1_time_tlock_max_reg_i_3__0\ : STD_LOGIC;
  signal \n_1_time_tlock_max_reg_i_5__0\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[0]_i_3__0\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[8]_i_1__0\ : STD_LOGIC;
  signal n_2_sync_QPLLLOCK : STD_LOGIC;
  signal n_2_sync_data_valid : STD_LOGIC;
  signal \n_2_time_out_counter_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_2_time_tlock_max_reg_i_3__0\ : STD_LOGIC;
  signal \n_2_time_tlock_max_reg_i_5__0\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[0]_i_3__0\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[8]_i_1__0\ : STD_LOGIC;
  signal n_3_sync_QPLLLOCK : STD_LOGIC;
  signal n_3_sync_data_valid : STD_LOGIC;
  signal \n_3_time_out_counter_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_3_time_tlock_max_reg_i_3__0\ : STD_LOGIC;
  signal \n_3_time_tlock_max_reg_i_5__0\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[0]_i_3__0\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[8]_i_1__0\ : STD_LOGIC;
  signal n_4_sync_data_valid : STD_LOGIC;
  signal \n_4_time_out_counter_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[0]_i_3__0\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[8]_i_1__0\ : STD_LOGIC;
  signal n_5_sync_data_valid : STD_LOGIC;
  signal \n_5_time_out_counter_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[0]_i_3__0\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[0]_i_3__0\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[0]_i_2__0\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[16]_i_1__0\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[8]_i_1__0\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[0]_i_3__0\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[12]_i_1__0\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[4]_i_1__0\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[8]_i_1__0\ : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \p_0_in__4\ : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal run_phase_alignment_int : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s2 : STD_LOGIC;
  signal rxresetdone_s2 : STD_LOGIC;
  signal rxresetdone_s3 : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max : STD_LOGIC;
  signal time_tlock_max1 : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \wait_time_cnt0__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \wait_time_cnt_reg__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_time_tlock_max_reg_i_2__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_time_tlock_max_reg_i_2__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_tlock_max_reg_i_3__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_tlock_max_reg_i_5__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[10]_i_2__0\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[10]_i_3__0\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_11\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_12__0\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_16\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_6\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_10__0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_6__0\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_7__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_8__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_2__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_3__0\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_4__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[4]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[5]_i_1__0\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[5]_i_3__0\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[6]_i_1__0\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[7]_i_1__0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[8]_i_1__0\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \check_tlock_max_i_1__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \gtrxreset_i_i_1__0\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1__0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1__0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1__0\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_2__0\ : label is "soft_lutpair32";
  attribute counter : integer;
  attribute counter of \init_wait_count_reg[0]\ : label is 10;
  attribute counter of \init_wait_count_reg[1]\ : label is 10;
  attribute counter of \init_wait_count_reg[2]\ : label is 10;
  attribute counter of \init_wait_count_reg[3]\ : label is 10;
  attribute counter of \init_wait_count_reg[4]\ : label is 10;
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1__0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1__0\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1__0\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \mmcm_lock_count[8]_i_1__0\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_3__0\ : label is "soft_lutpair39";
  attribute counter of \mmcm_lock_count_reg[0]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[1]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[2]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[3]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[4]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[5]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[6]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[7]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[8]\ : label is 24;
  attribute counter of \mmcm_lock_count_reg[9]\ : label is 24;
  attribute SOFT_HLUTNM of \mmcm_lock_reclocked_i_2__0\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \pll_reset_asserted_i_1__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \reset_time_out_i_11__0\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \reset_time_out_i_12__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \reset_time_out_i_13__0\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \reset_time_out_i_5__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \reset_time_out_i_8__0\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \reset_time_out_i_9__0\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \run_phase_alignment_int_i_2__0\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_6__0\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \time_out_2ms_i_1__0\ : label is "soft_lutpair48";
  attribute counter of \time_out_counter_reg[0]\ : label is 12;
  attribute counter of \time_out_counter_reg[10]\ : label is 12;
  attribute counter of \time_out_counter_reg[11]\ : label is 12;
  attribute counter of \time_out_counter_reg[12]\ : label is 12;
  attribute counter of \time_out_counter_reg[13]\ : label is 12;
  attribute counter of \time_out_counter_reg[14]\ : label is 12;
  attribute counter of \time_out_counter_reg[15]\ : label is 12;
  attribute counter of \time_out_counter_reg[16]\ : label is 12;
  attribute counter of \time_out_counter_reg[1]\ : label is 12;
  attribute counter of \time_out_counter_reg[2]\ : label is 12;
  attribute counter of \time_out_counter_reg[3]\ : label is 12;
  attribute counter of \time_out_counter_reg[4]\ : label is 12;
  attribute counter of \time_out_counter_reg[5]\ : label is 12;
  attribute counter of \time_out_counter_reg[6]\ : label is 12;
  attribute counter of \time_out_counter_reg[7]\ : label is 12;
  attribute counter of \time_out_counter_reg[8]\ : label is 12;
  attribute counter of \time_out_counter_reg[9]\ : label is 12;
  attribute counter of \wait_bypass_count_reg[0]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[10]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[11]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[12]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[1]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[2]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[3]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[4]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[5]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[6]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[7]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[8]\ : label is 13;
  attribute counter of \wait_bypass_count_reg[9]\ : label is 13;
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \wait_time_cnt[0]_i_1__0\ : label is std.standard.true;
  attribute SOFT_HLUTNM of \wait_time_cnt[0]_i_1__0\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \wait_time_cnt[1]_i_1__0\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \wait_time_cnt[2]_i_1__0\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \wait_time_cnt[3]_i_1__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \wait_time_cnt[4]_i_1__0\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \wait_time_cnt[6]_i_4__0\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \wait_time_cnt[6]_i_5__0\ : label is "soft_lutpair52";
  attribute counter of \wait_time_cnt_reg[0]\ : label is 11;
  attribute counter of \wait_time_cnt_reg[1]\ : label is 11;
  attribute counter of \wait_time_cnt_reg[2]\ : label is 11;
  attribute counter of \wait_time_cnt_reg[3]\ : label is 11;
  attribute counter of \wait_time_cnt_reg[4]\ : label is 11;
  attribute counter of \wait_time_cnt_reg[5]\ : label is 11;
  attribute counter of \wait_time_cnt_reg[6]\ : label is 11;
begin
  GT1_RX_FSM_RESET_DONE_OUT <= \^gt1_rx_fsm_reset_done_out\;
  O1 <= \^o1\;
  O2 <= \^o2\;
\FSM_onehot_rx_state[10]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000010C"
    )
    port map (
      I0 => time_out_wait_bypass_s3,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[10]_i_2__0\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3__0\,
      O => \n_0_FSM_onehot_rx_state[10]_i_1__0\
    );
\FSM_onehot_rx_state[10]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[10]_i_2__0\
    );
\FSM_onehot_rx_state[10]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I3 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[10]_i_3__0\
    );
\FSM_onehot_rx_state[11]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFEFFFE0000"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[10]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_10\
    );
\FSM_onehot_rx_state[11]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => n_0_time_out_2ms_reg,
      I2 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[11]_i_11\
    );
\FSM_onehot_rx_state[11]_i_12__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F888888"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I2 => n_0_reset_time_out_reg,
      I3 => time_tlock_max,
      I4 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[11]_i_12__0\
    );
\FSM_onehot_rx_state[11]_i_14__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8F8F8F8F8F8F888"
    )
    port map (
      I0 => check_tlock_max,
      I1 => mmcm_lock_reclocked,
      I2 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[1]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_14__0\
    );
\FSM_onehot_rx_state[11]_i_15__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFCFCECFCFCFCE0"
    )
    port map (
      I0 => I1,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => check_tlock_max,
      I5 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[11]_i_15__0\
    );
\FSM_onehot_rx_state[11]_i_16\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000203"
    )
    port map (
      I0 => init_wait_done,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[8]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_16\
    );
\FSM_onehot_rx_state[11]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEEEEEEEE0"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_3__0\,
      I1 => \n_0_FSM_onehot_rx_state[10]_i_3__0\,
      I2 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[8]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_5__0\
    );
\FSM_onehot_rx_state[11]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_6\
    );
\FSM_onehot_rx_state[11]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_8\
    );
\FSM_onehot_rx_state[2]_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => n_0_reset_time_out_reg,
      I1 => time_tlock_max,
      O => \n_0_FSM_onehot_rx_state[2]_i_10__0\
    );
\FSM_onehot_rx_state[2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000C0400"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[2]_i_6__0\,
      I1 => \n_0_FSM_onehot_rx_state[2]_i_7__0\,
      I2 => \n_0_FSM_onehot_rx_state[2]_i_8__0\,
      I3 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_6\,
      O => \n_0_FSM_onehot_rx_state[2]_i_2__0\
    );
\FSM_onehot_rx_state[2]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__0\,
      I1 => \n_0_FSM_onehot_rx_state[5]_i_3__0\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__0\,
      I3 => check_tlock_max,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => \n_0_FSM_onehot_rx_state[2]_i_10__0\,
      O => \n_0_FSM_onehot_rx_state[2]_i_4__0\
    );
\FSM_onehot_rx_state[2]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[10]_i_3__0\,
      I1 => \n_0_FSM_onehot_rx_state[10]_i_2__0\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I5 => time_out_wait_bypass_s3,
      O => \n_0_FSM_onehot_rx_state[2]_i_5__0\
    );
\FSM_onehot_rx_state[2]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => n_0_reset_time_out_reg,
      I1 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[2]_i_6__0\
    );
\FSM_onehot_rx_state[2]_i_7__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => run_phase_alignment_int,
      O => \n_0_FSM_onehot_rx_state[2]_i_7__0\
    );
\FSM_onehot_rx_state[2]_i_8__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_FSM_onehot_rx_state[2]_i_8__0\
    );
\FSM_onehot_rx_state[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__0\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3__0\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__0\,
      O => \n_0_FSM_onehot_rx_state[3]_i_1__0\
    );
\FSM_onehot_rx_state[3]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_2__0\
    );
\FSM_onehot_rx_state[3]_i_3__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_3__0\
    );
\FSM_onehot_rx_state[3]_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_4__0\
    );
\FSM_onehot_rx_state[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state[9]_i_2__0\,
      O => \n_0_FSM_onehot_rx_state[4]_i_1__0\
    );
\FSM_onehot_rx_state[5]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[5]_i_2__0\,
      I1 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[5]_i_1__0\
    );
\FSM_onehot_rx_state[5]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => check_tlock_max,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => \n_0_FSM_onehot_rx_state[5]_i_3__0\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__0\,
      O => \n_0_FSM_onehot_rx_state[5]_i_2__0\
    );
\FSM_onehot_rx_state[5]_i_3__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[10]\,
      O => \n_0_FSM_onehot_rx_state[5]_i_3__0\
    );
\FSM_onehot_rx_state[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state[6]_i_2__0\,
      O => \n_0_FSM_onehot_rx_state[6]_i_1__0\
    );
\FSM_onehot_rx_state[6]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__0\,
      I1 => run_phase_alignment_int,
      I2 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[6]_i_2__0\
    );
\FSM_onehot_rx_state[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[7]_i_2__0\,
      I1 => time_tlock_max,
      I2 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[7]_i_1__0\
    );
\FSM_onehot_rx_state[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__0\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3__0\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__0\,
      O => \n_0_FSM_onehot_rx_state[7]_i_2__0\
    );
\FSM_onehot_rx_state[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I4 => \n_0_FSM_onehot_rx_state[9]_i_2__0\,
      O => \n_0_FSM_onehot_rx_state[8]_i_1__0\
    );
\FSM_onehot_rx_state[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000800000008"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[9]_i_2__0\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_6\,
      I4 => n_0_time_out_2ms_reg,
      I5 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[9]_i_1__0\
    );
\FSM_onehot_rx_state[9]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_2__0\,
      I4 => check_tlock_max,
      I5 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_FSM_onehot_rx_state[9]_i_2__0\
    );
\FSM_onehot_rx_state_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[10]_i_1__0\,
      Q => \n_0_FSM_onehot_rx_state_reg[10]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => n_1_sync_data_valid,
      Q => \n_0_FSM_onehot_rx_state_reg[11]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => '0',
      Q => \n_0_FSM_onehot_rx_state_reg[1]\,
      S => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => n_2_sync_data_valid,
      Q => \n_0_FSM_onehot_rx_state_reg[2]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[3]_i_1__0\,
      Q => \n_0_FSM_onehot_rx_state_reg[3]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[4]_i_1__0\,
      Q => \n_0_FSM_onehot_rx_state_reg[4]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[5]_i_1__0\,
      Q => \n_0_FSM_onehot_rx_state_reg[5]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[6]_i_1__0\,
      Q => check_tlock_max,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[7]_i_1__0\,
      Q => \n_0_FSM_onehot_rx_state_reg[7]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[8]_i_1__0\,
      Q => \n_0_FSM_onehot_rx_state_reg[8]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[9]_i_1__0\,
      Q => run_phase_alignment_int,
      R => SOFT_RESET_IN
    );
\RXUSERRDY_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCFFFFCCCC0008"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[9]_i_2__0\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_6\,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_1__0\,
      I5 => \^o1\,
      O => \n_0_RXUSERRDY_i_1__0\
    );
RXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_RXUSERRDY_i_1__0\,
      Q => \^o1\,
      R => SOFT_RESET_IN
    );
\check_tlock_max_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state[7]_i_2__0\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__0\,
      I3 => n_0_check_tlock_max_reg,
      O => \n_0_check_tlock_max_i_1__0\
    );
check_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_check_tlock_max_i_1__0\,
      Q => n_0_check_tlock_max_reg,
      R => SOFT_RESET_IN
    );
\gtrxreset_i_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33F73300"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[6]_i_2__0\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_1__0\,
      I4 => \^o2\,
      O => \n_0_gtrxreset_i_i_1__0\
    );
gtrxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_gtrxreset_i_i_1__0\,
      Q => \^o2\,
      R => SOFT_RESET_IN
    );
\init_wait_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \init_wait_count_reg__0\(0),
      O => \p_0_in__0\(0)
    );
\init_wait_count[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      O => \p_0_in__0\(1)
    );
\init_wait_count[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(2),
      O => \p_0_in__0\(2)
    );
\init_wait_count[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(3),
      O => \p_0_in__0\(3)
    );
\init_wait_count[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(4),
      I4 => \init_wait_count_reg__0\(3),
      O => \n_0_init_wait_count[4]_i_1__0\
    );
\init_wait_count[4]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \init_wait_count_reg__0\(3),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(2),
      I4 => \init_wait_count_reg__0\(4),
      O => \p_0_in__0\(4)
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__0\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__0\(0),
      Q => \init_wait_count_reg__0\(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__0\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__0\(1),
      Q => \init_wait_count_reg__0\(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__0\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__0\(2),
      Q => \init_wait_count_reg__0\(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__0\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__0\(3),
      Q => \init_wait_count_reg__0\(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__0\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__0\(4),
      Q => \init_wait_count_reg__0\(4)
    );
\init_wait_done_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF40000000"
    )
    port map (
      I0 => \init_wait_count_reg__0\(0),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(4),
      I3 => \init_wait_count_reg__0\(3),
      I4 => \init_wait_count_reg__0\(2),
      I5 => init_wait_done,
      O => \n_0_init_wait_done_i_1__0\
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      CLR => SOFT_RESET_IN,
      D => \n_0_init_wait_done_i_1__0\,
      Q => init_wait_done
    );
\mmcm_lock_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      O => \n_0_mmcm_lock_count[0]_i_1__0\
    );
\mmcm_lock_count[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__4\(1)
    );
\mmcm_lock_count[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      O => \p_0_in__4\(2)
    );
\mmcm_lock_count[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(2),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(1),
      I3 => \mmcm_lock_count_reg__0\(3),
      O => \p_0_in__4\(3)
    );
\mmcm_lock_count[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(3),
      I4 => \mmcm_lock_count_reg__0\(4),
      O => \p_0_in__4\(4)
    );
\mmcm_lock_count[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(3),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(0),
      I4 => \mmcm_lock_count_reg__0\(1),
      I5 => \mmcm_lock_count_reg__0\(5),
      O => \p_0_in__4\(5)
    );
\mmcm_lock_count[6]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \n_0_mmcm_lock_count[9]_i_4__0\,
      I1 => \mmcm_lock_count_reg__0\(6),
      O => \p_0_in__4\(6)
    );
\mmcm_lock_count[7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(6),
      I1 => \n_0_mmcm_lock_count[9]_i_4__0\,
      I2 => \mmcm_lock_count_reg__0\(7),
      O => \p_0_in__4\(7)
    );
\mmcm_lock_count[8]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \n_0_mmcm_lock_count[9]_i_4__0\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      O => \p_0_in__4\(8)
    );
\mmcm_lock_count[9]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \n_0_mmcm_lock_count[9]_i_4__0\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \n_0_mmcm_lock_count[9]_i_2__0\
    );
\mmcm_lock_count[9]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FF0800"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count_reg__0\(6),
      I2 => \n_0_mmcm_lock_count[9]_i_4__0\,
      I3 => \mmcm_lock_count_reg__0\(7),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \p_0_in__4\(9)
    );
\mmcm_lock_count[9]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(4),
      I3 => \mmcm_lock_count_reg__0\(5),
      I4 => \mmcm_lock_count_reg__0\(2),
      I5 => \mmcm_lock_count_reg__0\(3),
      O => \n_0_mmcm_lock_count[9]_i_4__0\
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \n_0_mmcm_lock_count[0]_i_1__0\,
      Q => \mmcm_lock_count_reg__0\(0),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(1),
      Q => \mmcm_lock_count_reg__0\(1),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(2),
      Q => \mmcm_lock_count_reg__0\(2),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(3),
      Q => \mmcm_lock_count_reg__0\(3),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(4),
      Q => \mmcm_lock_count_reg__0\(4),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(5),
      Q => \mmcm_lock_count_reg__0\(5),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(6),
      Q => \mmcm_lock_count_reg__0\(6),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(7),
      Q => \mmcm_lock_count_reg__0\(7),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(8),
      Q => \mmcm_lock_count_reg__0\(8),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__0\,
      D => \p_0_in__4\(9),
      Q => \mmcm_lock_count_reg__0\(9),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_reclocked_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(8),
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \n_0_mmcm_lock_count[9]_i_4__0\,
      I4 => \mmcm_lock_count_reg__0\(7),
      O => \n_0_mmcm_lock_reclocked_i_2__0\
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_1_sync_mmcm_lock_reclocked,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
\pll_reset_asserted_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55DC"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => n_0_pll_reset_asserted_reg,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__0\,
      I3 => \n_0_FSM_onehot_rx_state[5]_i_2__0\,
      O => \n_0_pll_reset_asserted_i_1__0\
    );
pll_reset_asserted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_pll_reset_asserted_i_1__0\,
      Q => n_0_pll_reset_asserted_reg,
      R => SOFT_RESET_IN
    );
\reset_time_out_i_11__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_11__0\
    );
\reset_time_out_i_12__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_12__0\
    );
\reset_time_out_i_13__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_reset_time_out_i_13__0\
    );
\reset_time_out_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
    port map (
      I0 => I1,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_wait_time_cnt[6]_i_4__0\,
      I4 => \n_0_FSM_onehot_rx_state[5]_i_3__0\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__0\,
      O => \n_0_reset_time_out_i_4__0\
    );
\reset_time_out_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010006"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state[10]_i_3__0\,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__0\,
      I4 => run_phase_alignment_int,
      O => \n_0_reset_time_out_i_5__0\
    );
\reset_time_out_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000F00040004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__0\,
      I1 => \n_0_reset_time_out_i_12__0\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_3__0\,
      I4 => \n_0_FSM_onehot_rx_state[2]_i_8__0\,
      I5 => \n_0_reset_time_out_i_13__0\,
      O => \n_0_reset_time_out_i_6__0\
    );
\reset_time_out_i_8__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => mmcm_lock_reclocked,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => check_tlock_max,
      O => \n_0_reset_time_out_i_8__0\
    );
\reset_time_out_i_9__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_9__0\
    );
reset_time_out_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_4_sync_data_valid,
      Q => n_0_reset_time_out_reg,
      S => SOFT_RESET_IN
    );
\run_phase_alignment_int_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_run_phase_alignment_int_i_2__0\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__0\,
      I3 => n_0_run_phase_alignment_int_reg,
      O => \n_0_run_phase_alignment_int_i_1__0\
    );
\run_phase_alignment_int_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__0\,
      I4 => \n_0_FSM_onehot_rx_state[10]_i_3__0\,
      O => \n_0_run_phase_alignment_int_i_2__0\
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_run_phase_alignment_int_i_1__0\,
      Q => n_0_run_phase_alignment_int_reg,
      R => SOFT_RESET_IN
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => n_0_run_phase_alignment_int_s3_reg,
      R => '0'
    );
\rx_fsm_reset_done_int_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3__0\,
      O => \n_0_rx_fsm_reset_done_int_i_3__0\
    );
\rx_fsm_reset_done_int_i_6__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state[10]_i_3__0\,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__0\,
      I4 => run_phase_alignment_int,
      O => \n_0_rx_fsm_reset_done_int_i_6__0\
    );
rx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_5_sync_data_valid,
      Q => \^gt1_rx_fsm_reset_done_out\,
      R => SOFT_RESET_IN
    );
rx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => rx_fsm_reset_done_int_s2,
      Q => n_0_rx_fsm_reset_done_int_s3_reg,
      R => '0'
    );
rxresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => rxresetdone_s2,
      Q => rxresetdone_s3,
      R => '0'
    );
sync_QPLLLOCK: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_26\
    port map (
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      I1 => n_0_pll_reset_asserted_reg,
      I10 => I1,
      I2 => \n_0_FSM_onehot_rx_state[11]_i_14__0\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_15__0\,
      I4 => n_3_sync_data_valid,
      I5 => \n_0_reset_time_out_i_9__0\,
      I6 => \n_0_FSM_onehot_rx_state[3]_i_4__0\,
      I7 => \n_0_FSM_onehot_rx_state[5]_i_3__0\,
      I8 => \n_0_wait_time_cnt[6]_i_4__0\,
      I9 => \n_0_reset_time_out_i_11__0\,
      O1 => n_0_sync_QPLLLOCK,
      O2 => n_1_sync_QPLLLOCK,
      O3 => n_2_sync_QPLLLOCK,
      O4 => n_3_sync_QPLLLOCK,
      Q(6) => \n_0_FSM_onehot_rx_state_reg[10]\,
      Q(5) => \n_0_FSM_onehot_rx_state_reg[7]\,
      Q(4) => \n_0_FSM_onehot_rx_state_reg[5]\,
      Q(3) => \n_0_FSM_onehot_rx_state_reg[4]\,
      Q(2) => \n_0_FSM_onehot_rx_state_reg[3]\,
      Q(1) => \n_0_FSM_onehot_rx_state_reg[2]\,
      Q(0) => \n_0_FSM_onehot_rx_state_reg[1]\,
      SYSCLK_IN => SYSCLK_IN
    );
sync_RXRESETDONE: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_27\
    port map (
      SYSCLK_IN => SYSCLK_IN,
      data_out => rxresetdone_s2,
      gt1_rxresetdone_out => gt1_rxresetdone_out
    );
sync_data_valid: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_28\
    port map (
      D(1) => n_1_sync_data_valid,
      D(0) => n_2_sync_data_valid,
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      E(0) => n_0_sync_data_valid,
      GT1_DATA_VALID_IN => GT1_DATA_VALID_IN,
      GT1_RX_FSM_RESET_DONE_OUT => \^gt1_rx_fsm_reset_done_out\,
      I1 => n_1_sync_QPLLLOCK,
      I10 => \n_0_FSM_onehot_rx_state[11]_i_12__0\,
      I11 => n_0_sync_QPLLLOCK,
      I12 => n_0_time_out_1us_reg,
      I13 => n_0_reset_time_out_reg,
      I14 => \n_0_FSM_onehot_rx_state[2]_i_2__0\,
      I15 => \n_0_FSM_onehot_rx_state[5]_i_2__0\,
      I16 => n_0_time_out_2ms_reg,
      I17 => \n_0_FSM_onehot_rx_state[2]_i_4__0\,
      I18 => \n_0_FSM_onehot_rx_state[2]_i_5__0\,
      I19 => n_3_sync_QPLLLOCK,
      I2 => \n_0_FSM_onehot_rx_state[11]_i_5__0\,
      I20 => \n_0_reset_time_out_i_8__0\,
      I21 => \n_0_FSM_onehot_rx_state[10]_i_2__0\,
      I22 => n_0_time_out_100us_reg,
      I23 => \n_0_rx_fsm_reset_done_int_i_6__0\,
      I24 => n_2_sync_QPLLLOCK,
      I25 => \n_0_reset_time_out_i_4__0\,
      I26 => \n_0_reset_time_out_i_5__0\,
      I27 => \n_0_reset_time_out_i_6__0\,
      I28 => \n_0_rx_fsm_reset_done_int_i_3__0\,
      I3(0) => \n_0_wait_time_cnt[6]_i_2__0\,
      I4 => \n_0_FSM_onehot_rx_state[11]_i_6\,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_16\,
      I6 => \n_0_FSM_onehot_rx_state[10]_i_3__0\,
      I7 => \n_0_FSM_onehot_rx_state[11]_i_8\,
      I8 => \n_0_FSM_onehot_rx_state[11]_i_10\,
      I9 => \n_0_FSM_onehot_rx_state[11]_i_11\,
      O1 => n_3_sync_data_valid,
      O2 => n_4_sync_data_valid,
      O3 => n_5_sync_data_valid,
      Q(3) => \n_0_FSM_onehot_rx_state_reg[11]\,
      Q(2) => \n_0_FSM_onehot_rx_state_reg[10]\,
      Q(1) => run_phase_alignment_int,
      Q(0) => \n_0_FSM_onehot_rx_state_reg[8]\,
      SYSCLK_IN => SYSCLK_IN,
      rxresetdone_s3 => rxresetdone_s3
    );
sync_mmcm_lock_reclocked: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_29\
    port map (
      I1 => \n_0_mmcm_lock_reclocked_i_2__0\,
      O1 => n_1_sync_mmcm_lock_reclocked,
      SR(0) => n_0_sync_mmcm_lock_reclocked,
      SYSCLK_IN => SYSCLK_IN,
      mmcm_lock_reclocked => mmcm_lock_reclocked
    );
sync_run_phase_alignment_int: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_30\
    port map (
      data_in => n_0_run_phase_alignment_int_reg,
      data_out => run_phase_alignment_int_s2,
      gt1_rxusrclk_in => gt1_rxusrclk_in
    );
sync_rx_fsm_reset_done_int: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_31\
    port map (
      GT1_RX_FSM_RESET_DONE_OUT => \^gt1_rx_fsm_reset_done_out\,
      data_out => rx_fsm_reset_done_int_s2,
      gt1_rxusrclk_in => gt1_rxusrclk_in
    );
sync_time_out_wait_bypass: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_32\
    port map (
      SYSCLK_IN => SYSCLK_IN,
      data_in => n_0_time_out_wait_bypass_reg,
      data_out => time_out_wait_bypass_s2
    );
\time_out_100us_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
    port map (
      I0 => \n_0_time_out_counter[0]_i_3__0\,
      I1 => \n_0_time_out_100us_i_2__0\,
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(11),
      I4 => \n_0_time_out_100us_i_3__0\,
      I5 => n_0_time_out_100us_reg,
      O => \n_0_time_out_100us_i_1__0\
    );
\time_out_100us_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      O => \n_0_time_out_100us_i_2__0\
    );
\time_out_100us_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
    port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(12),
      I3 => time_out_counter_reg(3),
      I4 => time_out_counter_reg(1),
      I5 => time_out_counter_reg(2),
      O => \n_0_time_out_100us_i_3__0\
    );
time_out_100us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_100us_i_1__0\,
      Q => n_0_time_out_100us_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_1us_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000002"
    )
    port map (
      I0 => \n_0_time_out_1us_i_2__0\,
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(11),
      I4 => time_out_counter_reg(10),
      I5 => n_0_time_out_1us_reg,
      O => \n_0_time_out_1us_i_1__0\
    );
\time_out_1us_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
    port map (
      I0 => \n_0_time_out_2ms_i_3__0\,
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(15),
      I3 => time_out_counter_reg(8),
      I4 => time_out_counter_reg(9),
      I5 => \n_0_time_out_1us_i_3__0\,
      O => \n_0_time_out_1us_i_2__0\
    );
\time_out_1us_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
    port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(6),
      I2 => time_out_counter_reg(5),
      I3 => time_out_counter_reg(4),
      I4 => time_out_counter_reg(7),
      O => \n_0_time_out_1us_i_3__0\
    );
time_out_1us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_1us_i_1__0\,
      Q => n_0_time_out_1us_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_2ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => \n_0_time_out_2ms_i_2__0\,
      I1 => \n_0_time_out_counter[0]_i_3__0\,
      I2 => \n_0_time_out_2ms_i_3__0\,
      I3 => n_0_time_out_2ms_reg,
      O => \n_0_time_out_2ms_i_1__0\
    );
\time_out_2ms_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
    port map (
      I0 => time_out_counter_reg(13),
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(11),
      I3 => time_out_counter_reg(10),
      I4 => time_out_counter_reg(16),
      I5 => time_out_counter_reg(15),
      O => \n_0_time_out_2ms_i_2__0\
    );
\time_out_2ms_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(3),
      I3 => time_out_counter_reg(12),
      O => \n_0_time_out_2ms_i_3__0\
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_2ms_i_1__0\,
      Q => n_0_time_out_2ms_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_counter[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => time_out_counter_reg(10),
      I1 => \n_0_time_out_counter[0]_i_3__0\,
      I2 => \n_0_time_out_counter[0]_i_4__0\,
      O => \n_0_time_out_counter[0]_i_1__0\
    );
\time_out_counter[0]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
    port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      I2 => time_out_counter_reg(7),
      I3 => time_out_counter_reg(6),
      I4 => time_out_counter_reg(0),
      I5 => \n_0_time_out_counter[0]_i_9__0\,
      O => \n_0_time_out_counter[0]_i_3__0\
    );
\time_out_counter[0]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFFFFF"
    )
    port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(14),
      I4 => time_out_counter_reg(11),
      I5 => \n_0_time_out_2ms_i_3__0\,
      O => \n_0_time_out_counter[0]_i_4__0\
    );
\time_out_counter[0]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(3),
      O => \n_0_time_out_counter[0]_i_5__0\
    );
\time_out_counter[0]_i_6__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(2),
      O => \n_0_time_out_counter[0]_i_6__0\
    );
\time_out_counter[0]_i_7__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(1),
      O => \n_0_time_out_counter[0]_i_7__0\
    );
\time_out_counter[0]_i_8__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(0),
      O => \n_0_time_out_counter[0]_i_8__0\
    );
\time_out_counter[0]_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      O => \n_0_time_out_counter[0]_i_9__0\
    );
\time_out_counter[12]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(15),
      O => \n_0_time_out_counter[12]_i_2__0\
    );
\time_out_counter[12]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(14),
      O => \n_0_time_out_counter[12]_i_3__0\
    );
\time_out_counter[12]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(13),
      O => \n_0_time_out_counter[12]_i_4__0\
    );
\time_out_counter[12]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(12),
      O => \n_0_time_out_counter[12]_i_5__0\
    );
\time_out_counter[16]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(16),
      O => \n_0_time_out_counter[16]_i_2__0\
    );
\time_out_counter[4]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(7),
      O => \n_0_time_out_counter[4]_i_2__0\
    );
\time_out_counter[4]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(6),
      O => \n_0_time_out_counter[4]_i_3__0\
    );
\time_out_counter[4]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(5),
      O => \n_0_time_out_counter[4]_i_4__0\
    );
\time_out_counter[4]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(4),
      O => \n_0_time_out_counter[4]_i_5__0\
    );
\time_out_counter[8]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(11),
      O => \n_0_time_out_counter[8]_i_2__0\
    );
\time_out_counter[8]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(10),
      O => \n_0_time_out_counter[8]_i_3__0\
    );
\time_out_counter[8]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(9),
      O => \n_0_time_out_counter[8]_i_4__0\
    );
\time_out_counter[8]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(8),
      O => \n_0_time_out_counter[8]_i_5__0\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_7_time_out_counter_reg[0]_i_2__0\,
      Q => time_out_counter_reg(0),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[0]_i_2__0\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_time_out_counter_reg[0]_i_2__0\,
      CO(2) => \n_1_time_out_counter_reg[0]_i_2__0\,
      CO(1) => \n_2_time_out_counter_reg[0]_i_2__0\,
      CO(0) => \n_3_time_out_counter_reg[0]_i_2__0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_time_out_counter_reg[0]_i_2__0\,
      O(2) => \n_5_time_out_counter_reg[0]_i_2__0\,
      O(1) => \n_6_time_out_counter_reg[0]_i_2__0\,
      O(0) => \n_7_time_out_counter_reg[0]_i_2__0\,
      S(3) => \n_0_time_out_counter[0]_i_5__0\,
      S(2) => \n_0_time_out_counter[0]_i_6__0\,
      S(1) => \n_0_time_out_counter[0]_i_7__0\,
      S(0) => \n_0_time_out_counter[0]_i_8__0\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_5_time_out_counter_reg[8]_i_1__0\,
      Q => time_out_counter_reg(10),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_4_time_out_counter_reg[8]_i_1__0\,
      Q => time_out_counter_reg(11),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_7_time_out_counter_reg[12]_i_1__0\,
      Q => time_out_counter_reg(12),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[8]_i_1__0\,
      CO(3) => \n_0_time_out_counter_reg[12]_i_1__0\,
      CO(2) => \n_1_time_out_counter_reg[12]_i_1__0\,
      CO(1) => \n_2_time_out_counter_reg[12]_i_1__0\,
      CO(0) => \n_3_time_out_counter_reg[12]_i_1__0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[12]_i_1__0\,
      O(2) => \n_5_time_out_counter_reg[12]_i_1__0\,
      O(1) => \n_6_time_out_counter_reg[12]_i_1__0\,
      O(0) => \n_7_time_out_counter_reg[12]_i_1__0\,
      S(3) => \n_0_time_out_counter[12]_i_2__0\,
      S(2) => \n_0_time_out_counter[12]_i_3__0\,
      S(1) => \n_0_time_out_counter[12]_i_4__0\,
      S(0) => \n_0_time_out_counter[12]_i_5__0\
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_6_time_out_counter_reg[12]_i_1__0\,
      Q => time_out_counter_reg(13),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_5_time_out_counter_reg[12]_i_1__0\,
      Q => time_out_counter_reg(14),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_4_time_out_counter_reg[12]_i_1__0\,
      Q => time_out_counter_reg(15),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_7_time_out_counter_reg[16]_i_1__0\,
      Q => time_out_counter_reg(16),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[16]_i_1__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[12]_i_1__0\,
      CO(3 downto 0) => \NLW_time_out_counter_reg[16]_i_1__0_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_time_out_counter_reg[16]_i_1__0_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_time_out_counter_reg[16]_i_1__0\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_time_out_counter[16]_i_2__0\
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_6_time_out_counter_reg[0]_i_2__0\,
      Q => time_out_counter_reg(1),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_5_time_out_counter_reg[0]_i_2__0\,
      Q => time_out_counter_reg(2),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_4_time_out_counter_reg[0]_i_2__0\,
      Q => time_out_counter_reg(3),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_7_time_out_counter_reg[4]_i_1__0\,
      Q => time_out_counter_reg(4),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[0]_i_2__0\,
      CO(3) => \n_0_time_out_counter_reg[4]_i_1__0\,
      CO(2) => \n_1_time_out_counter_reg[4]_i_1__0\,
      CO(1) => \n_2_time_out_counter_reg[4]_i_1__0\,
      CO(0) => \n_3_time_out_counter_reg[4]_i_1__0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[4]_i_1__0\,
      O(2) => \n_5_time_out_counter_reg[4]_i_1__0\,
      O(1) => \n_6_time_out_counter_reg[4]_i_1__0\,
      O(0) => \n_7_time_out_counter_reg[4]_i_1__0\,
      S(3) => \n_0_time_out_counter[4]_i_2__0\,
      S(2) => \n_0_time_out_counter[4]_i_3__0\,
      S(1) => \n_0_time_out_counter[4]_i_4__0\,
      S(0) => \n_0_time_out_counter[4]_i_5__0\
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_6_time_out_counter_reg[4]_i_1__0\,
      Q => time_out_counter_reg(5),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_5_time_out_counter_reg[4]_i_1__0\,
      Q => time_out_counter_reg(6),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_4_time_out_counter_reg[4]_i_1__0\,
      Q => time_out_counter_reg(7),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_7_time_out_counter_reg[8]_i_1__0\,
      Q => time_out_counter_reg(8),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[4]_i_1__0\,
      CO(3) => \n_0_time_out_counter_reg[8]_i_1__0\,
      CO(2) => \n_1_time_out_counter_reg[8]_i_1__0\,
      CO(1) => \n_2_time_out_counter_reg[8]_i_1__0\,
      CO(0) => \n_3_time_out_counter_reg[8]_i_1__0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[8]_i_1__0\,
      O(2) => \n_5_time_out_counter_reg[8]_i_1__0\,
      O(1) => \n_6_time_out_counter_reg[8]_i_1__0\,
      O(0) => \n_7_time_out_counter_reg[8]_i_1__0\,
      S(3) => \n_0_time_out_counter[8]_i_2__0\,
      S(2) => \n_0_time_out_counter[8]_i_3__0\,
      S(1) => \n_0_time_out_counter[8]_i_4__0\,
      S(0) => \n_0_time_out_counter[8]_i_5__0\
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__0\,
      D => \n_6_time_out_counter_reg[8]_i_1__0\,
      Q => time_out_counter_reg(9),
      R => n_0_reset_time_out_reg
    );
\time_out_wait_bypass_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF0100000000"
    )
    port map (
      I0 => \n_0_wait_bypass_count[0]_i_4__0\,
      I1 => wait_bypass_count_reg(3),
      I2 => \n_0_wait_bypass_count[0]_i_5__0\,
      I3 => n_0_time_out_wait_bypass_reg,
      I4 => n_0_rx_fsm_reset_done_int_s3_reg,
      I5 => n_0_run_phase_alignment_int_s3_reg,
      O => \n_0_time_out_wait_bypass_i_1__0\
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_rxusrclk_in,
      CE => '1',
      D => \n_0_time_out_wait_bypass_i_1__0\,
      Q => n_0_time_out_wait_bypass_reg,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
\time_tlock_max_i_10__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(13),
      O => \n_0_time_tlock_max_i_10__0\
    );
\time_tlock_max_i_11__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(10),
      O => \n_0_time_tlock_max_i_11__0\
    );
\time_tlock_max_i_12__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(9),
      I1 => time_out_counter_reg(8),
      O => \n_0_time_tlock_max_i_12__0\
    );
\time_tlock_max_i_13__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      O => \n_0_time_tlock_max_i_13__0\
    );
\time_tlock_max_i_14__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(1),
      O => \n_0_time_tlock_max_i_14__0\
    );
\time_tlock_max_i_15__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(6),
      I1 => time_out_counter_reg(7),
      O => \n_0_time_tlock_max_i_15__0\
    );
\time_tlock_max_i_16__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(5),
      I1 => time_out_counter_reg(4),
      O => \n_0_time_tlock_max_i_16__0\
    );
\time_tlock_max_i_17__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(3),
      O => \n_0_time_tlock_max_i_17__0\
    );
\time_tlock_max_i_18__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(1),
      I1 => time_out_counter_reg(0),
      O => \n_0_time_tlock_max_i_18__0\
    );
\time_tlock_max_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => n_0_check_tlock_max_reg,
      I1 => time_tlock_max1,
      I2 => time_tlock_max,
      O => \n_0_time_tlock_max_i_1__0\
    );
\time_tlock_max_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(16),
      O => \n_0_time_tlock_max_i_4__0\
    );
\time_tlock_max_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      O => \n_0_time_tlock_max_i_6__0\
    );
\time_tlock_max_i_7__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(10),
      I1 => time_out_counter_reg(11),
      O => \n_0_time_tlock_max_i_7__0\
    );
\time_tlock_max_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      O => \n_0_time_tlock_max_i_8__0\
    );
\time_tlock_max_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(14),
      O => \n_0_time_tlock_max_i_9__0\
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_tlock_max_i_1__0\,
      Q => time_tlock_max,
      R => n_0_reset_time_out_reg
    );
\time_tlock_max_reg_i_2__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_tlock_max_reg_i_3__0\,
      CO(3 downto 1) => \NLW_time_tlock_max_reg_i_2__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => time_tlock_max1,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => time_out_counter_reg(16),
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_2__0_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_time_tlock_max_i_4__0\
    );
\time_tlock_max_reg_i_3__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_tlock_max_reg_i_5__0\,
      CO(3) => \n_0_time_tlock_max_reg_i_3__0\,
      CO(2) => \n_1_time_tlock_max_reg_i_3__0\,
      CO(1) => \n_2_time_tlock_max_reg_i_3__0\,
      CO(0) => \n_3_time_tlock_max_reg_i_3__0\,
      CYINIT => '0',
      DI(3) => \n_0_time_tlock_max_i_6__0\,
      DI(2) => time_out_counter_reg(13),
      DI(1) => \n_0_time_tlock_max_i_7__0\,
      DI(0) => \n_0_time_tlock_max_i_8__0\,
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_3__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_time_tlock_max_i_9__0\,
      S(2) => \n_0_time_tlock_max_i_10__0\,
      S(1) => \n_0_time_tlock_max_i_11__0\,
      S(0) => \n_0_time_tlock_max_i_12__0\
    );
\time_tlock_max_reg_i_5__0\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_time_tlock_max_reg_i_5__0\,
      CO(2) => \n_1_time_tlock_max_reg_i_5__0\,
      CO(1) => \n_2_time_tlock_max_reg_i_5__0\,
      CO(0) => \n_3_time_tlock_max_reg_i_5__0\,
      CYINIT => '0',
      DI(3) => time_out_counter_reg(7),
      DI(2) => \n_0_time_tlock_max_i_13__0\,
      DI(1) => time_out_counter_reg(3),
      DI(0) => \n_0_time_tlock_max_i_14__0\,
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_5__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_time_tlock_max_i_15__0\,
      S(2) => \n_0_time_tlock_max_i_16__0\,
      S(1) => \n_0_time_tlock_max_i_17__0\,
      S(0) => \n_0_time_tlock_max_i_18__0\
    );
\wait_bypass_count[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => n_0_run_phase_alignment_int_s3_reg,
      O => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count[0]_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
    port map (
      I0 => \n_0_wait_bypass_count[0]_i_4__0\,
      I1 => wait_bypass_count_reg(3),
      I2 => \n_0_wait_bypass_count[0]_i_5__0\,
      I3 => n_0_rx_fsm_reset_done_int_s3_reg,
      O => \n_0_wait_bypass_count[0]_i_2__0\
    );
\wait_bypass_count[0]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFFFFFFFFFF"
    )
    port map (
      I0 => wait_bypass_count_reg(11),
      I1 => wait_bypass_count_reg(4),
      I2 => wait_bypass_count_reg(0),
      I3 => wait_bypass_count_reg(9),
      I4 => wait_bypass_count_reg(10),
      I5 => wait_bypass_count_reg(2),
      O => \n_0_wait_bypass_count[0]_i_4__0\
    );
\wait_bypass_count[0]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFFFFFFFF"
    )
    port map (
      I0 => wait_bypass_count_reg(1),
      I1 => wait_bypass_count_reg(6),
      I2 => wait_bypass_count_reg(5),
      I3 => wait_bypass_count_reg(12),
      I4 => wait_bypass_count_reg(8),
      I5 => wait_bypass_count_reg(7),
      O => \n_0_wait_bypass_count[0]_i_5__0\
    );
\wait_bypass_count[0]_i_6__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(3),
      O => \n_0_wait_bypass_count[0]_i_6__0\
    );
\wait_bypass_count[0]_i_7__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(2),
      O => \n_0_wait_bypass_count[0]_i_7__0\
    );
\wait_bypass_count[0]_i_8__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(1),
      O => \n_0_wait_bypass_count[0]_i_8__0\
    );
\wait_bypass_count[0]_i_9__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wait_bypass_count_reg(0),
      O => \n_0_wait_bypass_count[0]_i_9__0\
    );
\wait_bypass_count[12]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(12),
      O => \n_0_wait_bypass_count[12]_i_2__0\
    );
\wait_bypass_count[4]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(7),
      O => \n_0_wait_bypass_count[4]_i_2__0\
    );
\wait_bypass_count[4]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(6),
      O => \n_0_wait_bypass_count[4]_i_3__0\
    );
\wait_bypass_count[4]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(5),
      O => \n_0_wait_bypass_count[4]_i_4__0\
    );
\wait_bypass_count[4]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(4),
      O => \n_0_wait_bypass_count[4]_i_5__0\
    );
\wait_bypass_count[8]_i_2__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(11),
      O => \n_0_wait_bypass_count[8]_i_2__0\
    );
\wait_bypass_count[8]_i_3__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(10),
      O => \n_0_wait_bypass_count[8]_i_3__0\
    );
\wait_bypass_count[8]_i_4__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(9),
      O => \n_0_wait_bypass_count[8]_i_4__0\
    );
\wait_bypass_count[8]_i_5__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(8),
      O => \n_0_wait_bypass_count[8]_i_5__0\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_7_wait_bypass_count_reg[0]_i_3__0\,
      Q => wait_bypass_count_reg(0),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[0]_i_3__0\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_wait_bypass_count_reg[0]_i_3__0\,
      CO(2) => \n_1_wait_bypass_count_reg[0]_i_3__0\,
      CO(1) => \n_2_wait_bypass_count_reg[0]_i_3__0\,
      CO(0) => \n_3_wait_bypass_count_reg[0]_i_3__0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_wait_bypass_count_reg[0]_i_3__0\,
      O(2) => \n_5_wait_bypass_count_reg[0]_i_3__0\,
      O(1) => \n_6_wait_bypass_count_reg[0]_i_3__0\,
      O(0) => \n_7_wait_bypass_count_reg[0]_i_3__0\,
      S(3) => \n_0_wait_bypass_count[0]_i_6__0\,
      S(2) => \n_0_wait_bypass_count[0]_i_7__0\,
      S(1) => \n_0_wait_bypass_count[0]_i_8__0\,
      S(0) => \n_0_wait_bypass_count[0]_i_9__0\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_5_wait_bypass_count_reg[8]_i_1__0\,
      Q => wait_bypass_count_reg(10),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_4_wait_bypass_count_reg[8]_i_1__0\,
      Q => wait_bypass_count_reg(11),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_7_wait_bypass_count_reg[12]_i_1__0\,
      Q => wait_bypass_count_reg(12),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[12]_i_1__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[8]_i_1__0\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[12]_i_1__0_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_wait_bypass_count_reg[12]_i_1__0_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_wait_bypass_count_reg[12]_i_1__0\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_wait_bypass_count[12]_i_2__0\
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_6_wait_bypass_count_reg[0]_i_3__0\,
      Q => wait_bypass_count_reg(1),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_5_wait_bypass_count_reg[0]_i_3__0\,
      Q => wait_bypass_count_reg(2),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_4_wait_bypass_count_reg[0]_i_3__0\,
      Q => wait_bypass_count_reg(3),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_7_wait_bypass_count_reg[4]_i_1__0\,
      Q => wait_bypass_count_reg(4),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[4]_i_1__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[0]_i_3__0\,
      CO(3) => \n_0_wait_bypass_count_reg[4]_i_1__0\,
      CO(2) => \n_1_wait_bypass_count_reg[4]_i_1__0\,
      CO(1) => \n_2_wait_bypass_count_reg[4]_i_1__0\,
      CO(0) => \n_3_wait_bypass_count_reg[4]_i_1__0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_wait_bypass_count_reg[4]_i_1__0\,
      O(2) => \n_5_wait_bypass_count_reg[4]_i_1__0\,
      O(1) => \n_6_wait_bypass_count_reg[4]_i_1__0\,
      O(0) => \n_7_wait_bypass_count_reg[4]_i_1__0\,
      S(3) => \n_0_wait_bypass_count[4]_i_2__0\,
      S(2) => \n_0_wait_bypass_count[4]_i_3__0\,
      S(1) => \n_0_wait_bypass_count[4]_i_4__0\,
      S(0) => \n_0_wait_bypass_count[4]_i_5__0\
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_6_wait_bypass_count_reg[4]_i_1__0\,
      Q => wait_bypass_count_reg(5),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_5_wait_bypass_count_reg[4]_i_1__0\,
      Q => wait_bypass_count_reg(6),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_4_wait_bypass_count_reg[4]_i_1__0\,
      Q => wait_bypass_count_reg(7),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_7_wait_bypass_count_reg[8]_i_1__0\,
      Q => wait_bypass_count_reg(8),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_bypass_count_reg[8]_i_1__0\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[4]_i_1__0\,
      CO(3) => \n_0_wait_bypass_count_reg[8]_i_1__0\,
      CO(2) => \n_1_wait_bypass_count_reg[8]_i_1__0\,
      CO(1) => \n_2_wait_bypass_count_reg[8]_i_1__0\,
      CO(0) => \n_3_wait_bypass_count_reg[8]_i_1__0\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_wait_bypass_count_reg[8]_i_1__0\,
      O(2) => \n_5_wait_bypass_count_reg[8]_i_1__0\,
      O(1) => \n_6_wait_bypass_count_reg[8]_i_1__0\,
      O(0) => \n_7_wait_bypass_count_reg[8]_i_1__0\,
      S(3) => \n_0_wait_bypass_count[8]_i_2__0\,
      S(2) => \n_0_wait_bypass_count[8]_i_3__0\,
      S(1) => \n_0_wait_bypass_count[8]_i_4__0\,
      S(0) => \n_0_wait_bypass_count[8]_i_5__0\
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => gt1_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__0\,
      D => \n_6_wait_bypass_count_reg[8]_i_1__0\,
      Q => wait_bypass_count_reg(9),
      R => \n_0_wait_bypass_count[0]_i_1__0\
    );
\wait_time_cnt[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__0\(0)
    );
\wait_time_cnt[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(1),
      I1 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__0\(1)
    );
\wait_time_cnt[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(2),
      I1 => \wait_time_cnt_reg__0\(0),
      I2 => \wait_time_cnt_reg__0\(1),
      O => \wait_time_cnt0__0\(2)
    );
\wait_time_cnt[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(1),
      I1 => \wait_time_cnt_reg__0\(0),
      I2 => \wait_time_cnt_reg__0\(2),
      I3 => \wait_time_cnt_reg__0\(3),
      O => \wait_time_cnt0__0\(3)
    );
\wait_time_cnt[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(4),
      I1 => \wait_time_cnt_reg__0\(3),
      I2 => \wait_time_cnt_reg__0\(2),
      I3 => \wait_time_cnt_reg__0\(0),
      I4 => \wait_time_cnt_reg__0\(1),
      O => \wait_time_cnt0__0\(4)
    );
\wait_time_cnt[5]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0F0E1"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(3),
      I1 => \wait_time_cnt_reg__0\(2),
      I2 => \wait_time_cnt_reg__0\(5),
      I3 => \wait_time_cnt_reg__0\(4),
      I4 => \wait_time_cnt_reg__0\(1),
      I5 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__0\(5)
    );
\wait_time_cnt[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[11]_i_6\,
      I1 => \n_0_wait_time_cnt[6]_i_4__0\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_3__0\,
      I3 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I4 => run_phase_alignment_int,
      I5 => \n_0_FSM_onehot_rx_state_reg[4]\,
      O => \n_0_wait_time_cnt[6]_i_1__0\
    );
\wait_time_cnt[6]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(6),
      I1 => \wait_time_cnt_reg__0\(1),
      I2 => \wait_time_cnt_reg__0\(0),
      I3 => \n_0_wait_time_cnt[6]_i_5__0\,
      I4 => \wait_time_cnt_reg__0\(4),
      I5 => \wait_time_cnt_reg__0\(5),
      O => \n_0_wait_time_cnt[6]_i_2__0\
    );
\wait_time_cnt[6]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(5),
      I1 => \wait_time_cnt_reg__0\(4),
      I2 => \n_0_wait_time_cnt[6]_i_5__0\,
      I3 => \wait_time_cnt_reg__0\(0),
      I4 => \wait_time_cnt_reg__0\(1),
      I5 => \wait_time_cnt_reg__0\(6),
      O => \wait_time_cnt0__0\(6)
    );
\wait_time_cnt[6]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_wait_time_cnt[6]_i_4__0\
    );
\wait_time_cnt[6]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(2),
      I1 => \wait_time_cnt_reg__0\(3),
      O => \n_0_wait_time_cnt[6]_i_5__0\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__0\,
      D => \wait_time_cnt0__0\(0),
      Q => \wait_time_cnt_reg__0\(0),
      R => \n_0_wait_time_cnt[6]_i_1__0\
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__0\,
      D => \wait_time_cnt0__0\(1),
      Q => \wait_time_cnt_reg__0\(1),
      R => \n_0_wait_time_cnt[6]_i_1__0\
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__0\,
      D => \wait_time_cnt0__0\(2),
      Q => \wait_time_cnt_reg__0\(2),
      S => \n_0_wait_time_cnt[6]_i_1__0\
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__0\,
      D => \wait_time_cnt0__0\(3),
      Q => \wait_time_cnt_reg__0\(3),
      R => \n_0_wait_time_cnt[6]_i_1__0\
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__0\,
      D => \wait_time_cnt0__0\(4),
      Q => \wait_time_cnt_reg__0\(4),
      R => \n_0_wait_time_cnt[6]_i_1__0\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__0\,
      D => \wait_time_cnt0__0\(5),
      Q => \wait_time_cnt_reg__0\(5),
      S => \n_0_wait_time_cnt[6]_i_1__0\
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__0\,
      D => \wait_time_cnt0__0\(6),
      Q => \wait_time_cnt_reg__0\(6),
      S => \n_0_wait_time_cnt[6]_i_1__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_1\ is
  port (
    GT2_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC;
    gt2_rxusrclk_in : in STD_LOGIC;
    SOFT_RESET_IN : in STD_LOGIC;
    I1 : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    gt2_rxresetdone_out : in STD_LOGIC;
    GT2_DATA_VALID_IN : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_1\ : entity is "gtwizard_32_Rx_RX_STARTUP_FSM";
end \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_1\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_1\ is
  signal \^gt2_rx_fsm_reset_done_out\ : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal check_tlock_max : STD_LOGIC;
  signal \init_wait_count_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal init_wait_done : STD_LOGIC;
  signal \mmcm_lock_count_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_1__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_2__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_3__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_10__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_11__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_12__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_14__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_15__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_16__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_5__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_6__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_8__0\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_10__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_2__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_4__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_5__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_6__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_7__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_8__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_1__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_2__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_3__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_4__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[4]_i_1__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_1__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_2__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_3__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[6]_i_1__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[6]_i_2__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[7]_i_1__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[7]_i_2__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[8]_i_1__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[9]_i_1__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[9]_i_2__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[10]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[11]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[1]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[2]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[3]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[4]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[5]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[7]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[8]\ : STD_LOGIC;
  signal \n_0_RXUSERRDY_i_1__1\ : STD_LOGIC;
  signal \n_0_check_tlock_max_i_1__1\ : STD_LOGIC;
  signal n_0_check_tlock_max_reg : STD_LOGIC;
  signal \n_0_gtrxreset_i_i_1__1\ : STD_LOGIC;
  signal \n_0_init_wait_count[4]_i_1__1\ : STD_LOGIC;
  signal \n_0_init_wait_done_i_1__1\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[0]_i_1__1\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[9]_i_2__1\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[9]_i_4__1\ : STD_LOGIC;
  signal \n_0_mmcm_lock_reclocked_i_2__1\ : STD_LOGIC;
  signal \n_0_pll_reset_asserted_i_1__1\ : STD_LOGIC;
  signal n_0_pll_reset_asserted_reg : STD_LOGIC;
  signal \n_0_reset_time_out_i_11__1\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_12__1\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_13__1\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_4__1\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_5__1\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_6__1\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_8__1\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_9__1\ : STD_LOGIC;
  signal n_0_reset_time_out_reg : STD_LOGIC;
  signal \n_0_run_phase_alignment_int_i_1__1\ : STD_LOGIC;
  signal \n_0_run_phase_alignment_int_i_2__1\ : STD_LOGIC;
  signal n_0_run_phase_alignment_int_reg : STD_LOGIC;
  signal n_0_run_phase_alignment_int_s3_reg : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_3__1\ : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_6__1\ : STD_LOGIC;
  signal n_0_rx_fsm_reset_done_int_s3_reg : STD_LOGIC;
  signal n_0_sync_QPLLLOCK : STD_LOGIC;
  signal n_0_sync_data_valid : STD_LOGIC;
  signal n_0_sync_mmcm_lock_reclocked : STD_LOGIC;
  signal \n_0_time_out_100us_i_1__1\ : STD_LOGIC;
  signal \n_0_time_out_100us_i_2__1\ : STD_LOGIC;
  signal \n_0_time_out_100us_i_3__1\ : STD_LOGIC;
  signal n_0_time_out_100us_reg : STD_LOGIC;
  signal \n_0_time_out_1us_i_1__1\ : STD_LOGIC;
  signal \n_0_time_out_1us_i_2__1\ : STD_LOGIC;
  signal \n_0_time_out_1us_i_3__1\ : STD_LOGIC;
  signal n_0_time_out_1us_reg : STD_LOGIC;
  signal \n_0_time_out_2ms_i_1__1\ : STD_LOGIC;
  signal \n_0_time_out_2ms_i_2__1\ : STD_LOGIC;
  signal \n_0_time_out_2ms_i_3__1\ : STD_LOGIC;
  signal n_0_time_out_2ms_reg : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_1__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_3__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_4__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_5__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_6__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_7__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_8__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_9__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_2__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_3__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_4__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_5__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[16]_i_2__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_2__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_3__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_4__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_5__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_2__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_3__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_4__1\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_5__1\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[0]_i_2__1\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_0_time_out_wait_bypass_i_1__1\ : STD_LOGIC;
  signal n_0_time_out_wait_bypass_reg : STD_LOGIC;
  signal \n_0_time_tlock_max_i_10__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_11__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_12__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_13__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_14__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_15__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_16__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_17__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_18__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_1__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_4__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_6__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_7__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_8__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_9__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_reg_i_3__1\ : STD_LOGIC;
  signal \n_0_time_tlock_max_reg_i_5__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_1__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_2__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_4__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_5__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_6__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_7__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_8__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_9__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[12]_i_2__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_2__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_3__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_4__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_5__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_2__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_3__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_4__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_5__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[0]_i_3__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_1__1\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_2__1\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_4__1\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_5__1\ : STD_LOGIC;
  signal n_1_sync_QPLLLOCK : STD_LOGIC;
  signal n_1_sync_data_valid : STD_LOGIC;
  signal n_1_sync_mmcm_lock_reclocked : STD_LOGIC;
  signal \n_1_time_out_counter_reg[0]_i_2__1\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_1_time_tlock_max_reg_i_3__1\ : STD_LOGIC;
  signal \n_1_time_tlock_max_reg_i_5__1\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[0]_i_3__1\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[8]_i_1__1\ : STD_LOGIC;
  signal n_2_sync_QPLLLOCK : STD_LOGIC;
  signal n_2_sync_data_valid : STD_LOGIC;
  signal \n_2_time_out_counter_reg[0]_i_2__1\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_2_time_tlock_max_reg_i_3__1\ : STD_LOGIC;
  signal \n_2_time_tlock_max_reg_i_5__1\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[0]_i_3__1\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[8]_i_1__1\ : STD_LOGIC;
  signal n_3_sync_QPLLLOCK : STD_LOGIC;
  signal n_3_sync_data_valid : STD_LOGIC;
  signal \n_3_time_out_counter_reg[0]_i_2__1\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_3_time_tlock_max_reg_i_3__1\ : STD_LOGIC;
  signal \n_3_time_tlock_max_reg_i_5__1\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[0]_i_3__1\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[8]_i_1__1\ : STD_LOGIC;
  signal n_4_sync_data_valid : STD_LOGIC;
  signal \n_4_time_out_counter_reg[0]_i_2__1\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[0]_i_3__1\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[8]_i_1__1\ : STD_LOGIC;
  signal n_5_sync_data_valid : STD_LOGIC;
  signal \n_5_time_out_counter_reg[0]_i_2__1\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[0]_i_3__1\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[0]_i_2__1\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[0]_i_3__1\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[0]_i_2__1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[16]_i_1__1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[8]_i_1__1\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[0]_i_3__1\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[12]_i_1__1\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[4]_i_1__1\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[8]_i_1__1\ : STD_LOGIC;
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \p_0_in__5\ : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal run_phase_alignment_int : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s2 : STD_LOGIC;
  signal rxresetdone_s2 : STD_LOGIC;
  signal rxresetdone_s3 : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max : STD_LOGIC;
  signal time_tlock_max1 : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \wait_time_cnt0__1\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \wait_time_cnt_reg__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \NLW_time_out_counter_reg[16]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_out_counter_reg[16]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_time_tlock_max_reg_i_2__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_time_tlock_max_reg_i_2__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_tlock_max_reg_i_3__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_tlock_max_reg_i_5__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[10]_i_2__1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[10]_i_3__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_11__0\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_12__1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_16__0\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_6__0\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_10__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_6__1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_7__1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_8__1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_2__1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_3__1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_4__1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[4]_i_1__1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[5]_i_1__1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[5]_i_3__1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[6]_i_1__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[7]_i_1__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[8]_i_1__1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \check_tlock_max_i_1__1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \gtrxreset_i_i_1__1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1__1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1__1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1__1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_2__1\ : label is "soft_lutpair60";
  attribute counter : integer;
  attribute counter of \init_wait_count_reg[0]\ : label is 14;
  attribute counter of \init_wait_count_reg[1]\ : label is 14;
  attribute counter of \init_wait_count_reg[2]\ : label is 14;
  attribute counter of \init_wait_count_reg[3]\ : label is 14;
  attribute counter of \init_wait_count_reg[4]\ : label is 14;
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1__1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1__1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1__1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1__1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_1__1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \mmcm_lock_count[8]_i_1__1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_3__1\ : label is "soft_lutpair67";
  attribute counter of \mmcm_lock_count_reg[0]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[1]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[2]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[3]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[4]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[5]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[6]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[7]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[8]\ : label is 26;
  attribute counter of \mmcm_lock_count_reg[9]\ : label is 26;
  attribute SOFT_HLUTNM of \mmcm_lock_reclocked_i_2__1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \pll_reset_asserted_i_1__1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \reset_time_out_i_11__1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \reset_time_out_i_12__1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \reset_time_out_i_13__1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \reset_time_out_i_5__1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \reset_time_out_i_8__1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \reset_time_out_i_9__1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \run_phase_alignment_int_i_2__1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_6__1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \time_out_2ms_i_1__1\ : label is "soft_lutpair76";
  attribute counter of \time_out_counter_reg[0]\ : label is 16;
  attribute counter of \time_out_counter_reg[10]\ : label is 16;
  attribute counter of \time_out_counter_reg[11]\ : label is 16;
  attribute counter of \time_out_counter_reg[12]\ : label is 16;
  attribute counter of \time_out_counter_reg[13]\ : label is 16;
  attribute counter of \time_out_counter_reg[14]\ : label is 16;
  attribute counter of \time_out_counter_reg[15]\ : label is 16;
  attribute counter of \time_out_counter_reg[16]\ : label is 16;
  attribute counter of \time_out_counter_reg[1]\ : label is 16;
  attribute counter of \time_out_counter_reg[2]\ : label is 16;
  attribute counter of \time_out_counter_reg[3]\ : label is 16;
  attribute counter of \time_out_counter_reg[4]\ : label is 16;
  attribute counter of \time_out_counter_reg[5]\ : label is 16;
  attribute counter of \time_out_counter_reg[6]\ : label is 16;
  attribute counter of \time_out_counter_reg[7]\ : label is 16;
  attribute counter of \time_out_counter_reg[8]\ : label is 16;
  attribute counter of \time_out_counter_reg[9]\ : label is 16;
  attribute counter of \wait_bypass_count_reg[0]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[10]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[11]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[12]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[1]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[2]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[3]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[4]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[5]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[6]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[7]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[8]\ : label is 17;
  attribute counter of \wait_bypass_count_reg[9]\ : label is 17;
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \wait_time_cnt[0]_i_1__1\ : label is std.standard.true;
  attribute SOFT_HLUTNM of \wait_time_cnt[0]_i_1__1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \wait_time_cnt[1]_i_1__1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \wait_time_cnt[2]_i_1__1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \wait_time_cnt[3]_i_1__1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \wait_time_cnt[4]_i_1__1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \wait_time_cnt[6]_i_4__1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \wait_time_cnt[6]_i_5__1\ : label is "soft_lutpair80";
  attribute counter of \wait_time_cnt_reg[0]\ : label is 15;
  attribute counter of \wait_time_cnt_reg[1]\ : label is 15;
  attribute counter of \wait_time_cnt_reg[2]\ : label is 15;
  attribute counter of \wait_time_cnt_reg[3]\ : label is 15;
  attribute counter of \wait_time_cnt_reg[4]\ : label is 15;
  attribute counter of \wait_time_cnt_reg[5]\ : label is 15;
  attribute counter of \wait_time_cnt_reg[6]\ : label is 15;
begin
  GT2_RX_FSM_RESET_DONE_OUT <= \^gt2_rx_fsm_reset_done_out\;
  O1 <= \^o1\;
  O2 <= \^o2\;
\FSM_onehot_rx_state[10]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000010C"
    )
    port map (
      I0 => time_out_wait_bypass_s3,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[10]_i_2__1\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3__1\,
      O => \n_0_FSM_onehot_rx_state[10]_i_1__1\
    );
\FSM_onehot_rx_state[10]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[10]_i_2__1\
    );
\FSM_onehot_rx_state[10]_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I3 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[10]_i_3__1\
    );
\FSM_onehot_rx_state[11]_i_10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFEFFFE0000"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[10]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_10__0\
    );
\FSM_onehot_rx_state[11]_i_11__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => n_0_time_out_2ms_reg,
      I2 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[11]_i_11__0\
    );
\FSM_onehot_rx_state[11]_i_12__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F888888"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I2 => n_0_reset_time_out_reg,
      I3 => time_tlock_max,
      I4 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[11]_i_12__1\
    );
\FSM_onehot_rx_state[11]_i_14__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8F8F8F8F8F8F888"
    )
    port map (
      I0 => check_tlock_max,
      I1 => mmcm_lock_reclocked,
      I2 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[1]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_14__1\
    );
\FSM_onehot_rx_state[11]_i_15__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFCFCECFCFCFCE0"
    )
    port map (
      I0 => I1,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => check_tlock_max,
      I5 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[11]_i_15__1\
    );
\FSM_onehot_rx_state[11]_i_16__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000203"
    )
    port map (
      I0 => init_wait_done,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[8]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_16__0\
    );
\FSM_onehot_rx_state[11]_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEEEEEEEE0"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_3__1\,
      I1 => \n_0_FSM_onehot_rx_state[10]_i_3__1\,
      I2 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[8]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_5__1\
    );
\FSM_onehot_rx_state[11]_i_6__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_6__0\
    );
\FSM_onehot_rx_state[11]_i_8__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_8__0\
    );
\FSM_onehot_rx_state[2]_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => n_0_reset_time_out_reg,
      I1 => time_tlock_max,
      O => \n_0_FSM_onehot_rx_state[2]_i_10__1\
    );
\FSM_onehot_rx_state[2]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000C0400"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[2]_i_6__1\,
      I1 => \n_0_FSM_onehot_rx_state[2]_i_7__1\,
      I2 => \n_0_FSM_onehot_rx_state[2]_i_8__1\,
      I3 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_6__0\,
      O => \n_0_FSM_onehot_rx_state[2]_i_2__1\
    );
\FSM_onehot_rx_state[2]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__1\,
      I1 => \n_0_FSM_onehot_rx_state[5]_i_3__1\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__1\,
      I3 => check_tlock_max,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => \n_0_FSM_onehot_rx_state[2]_i_10__1\,
      O => \n_0_FSM_onehot_rx_state[2]_i_4__1\
    );
\FSM_onehot_rx_state[2]_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[10]_i_3__1\,
      I1 => \n_0_FSM_onehot_rx_state[10]_i_2__1\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I5 => time_out_wait_bypass_s3,
      O => \n_0_FSM_onehot_rx_state[2]_i_5__1\
    );
\FSM_onehot_rx_state[2]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => n_0_reset_time_out_reg,
      I1 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[2]_i_6__1\
    );
\FSM_onehot_rx_state[2]_i_7__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => run_phase_alignment_int,
      O => \n_0_FSM_onehot_rx_state[2]_i_7__1\
    );
\FSM_onehot_rx_state[2]_i_8__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_FSM_onehot_rx_state[2]_i_8__1\
    );
\FSM_onehot_rx_state[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__1\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3__1\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__1\,
      O => \n_0_FSM_onehot_rx_state[3]_i_1__1\
    );
\FSM_onehot_rx_state[3]_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_2__1\
    );
\FSM_onehot_rx_state[3]_i_3__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_3__1\
    );
\FSM_onehot_rx_state[3]_i_4__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_4__1\
    );
\FSM_onehot_rx_state[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state[9]_i_2__1\,
      O => \n_0_FSM_onehot_rx_state[4]_i_1__1\
    );
\FSM_onehot_rx_state[5]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[5]_i_2__1\,
      I1 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[5]_i_1__1\
    );
\FSM_onehot_rx_state[5]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => check_tlock_max,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => \n_0_FSM_onehot_rx_state[5]_i_3__1\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__1\,
      O => \n_0_FSM_onehot_rx_state[5]_i_2__1\
    );
\FSM_onehot_rx_state[5]_i_3__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[10]\,
      O => \n_0_FSM_onehot_rx_state[5]_i_3__1\
    );
\FSM_onehot_rx_state[6]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state[6]_i_2__1\,
      O => \n_0_FSM_onehot_rx_state[6]_i_1__1\
    );
\FSM_onehot_rx_state[6]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__1\,
      I1 => run_phase_alignment_int,
      I2 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[6]_i_2__1\
    );
\FSM_onehot_rx_state[7]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[7]_i_2__1\,
      I1 => time_tlock_max,
      I2 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[7]_i_1__1\
    );
\FSM_onehot_rx_state[7]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__1\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3__1\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__1\,
      O => \n_0_FSM_onehot_rx_state[7]_i_2__1\
    );
\FSM_onehot_rx_state[8]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I4 => \n_0_FSM_onehot_rx_state[9]_i_2__1\,
      O => \n_0_FSM_onehot_rx_state[8]_i_1__1\
    );
\FSM_onehot_rx_state[9]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000800000008"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[9]_i_2__1\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_6__0\,
      I4 => n_0_time_out_2ms_reg,
      I5 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[9]_i_1__1\
    );
\FSM_onehot_rx_state[9]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_2__1\,
      I4 => check_tlock_max,
      I5 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_FSM_onehot_rx_state[9]_i_2__1\
    );
\FSM_onehot_rx_state_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[10]_i_1__1\,
      Q => \n_0_FSM_onehot_rx_state_reg[10]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => n_1_sync_data_valid,
      Q => \n_0_FSM_onehot_rx_state_reg[11]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => '0',
      Q => \n_0_FSM_onehot_rx_state_reg[1]\,
      S => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => n_2_sync_data_valid,
      Q => \n_0_FSM_onehot_rx_state_reg[2]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[3]_i_1__1\,
      Q => \n_0_FSM_onehot_rx_state_reg[3]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[4]_i_1__1\,
      Q => \n_0_FSM_onehot_rx_state_reg[4]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[5]_i_1__1\,
      Q => \n_0_FSM_onehot_rx_state_reg[5]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[6]_i_1__1\,
      Q => check_tlock_max,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[7]_i_1__1\,
      Q => \n_0_FSM_onehot_rx_state_reg[7]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[8]_i_1__1\,
      Q => \n_0_FSM_onehot_rx_state_reg[8]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[9]_i_1__1\,
      Q => run_phase_alignment_int,
      R => SOFT_RESET_IN
    );
\RXUSERRDY_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCFFFFCCCC0008"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[9]_i_2__1\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_6__0\,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_1__1\,
      I5 => \^o1\,
      O => \n_0_RXUSERRDY_i_1__1\
    );
RXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_RXUSERRDY_i_1__1\,
      Q => \^o1\,
      R => SOFT_RESET_IN
    );
\check_tlock_max_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state[7]_i_2__1\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__1\,
      I3 => n_0_check_tlock_max_reg,
      O => \n_0_check_tlock_max_i_1__1\
    );
check_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_check_tlock_max_i_1__1\,
      Q => n_0_check_tlock_max_reg,
      R => SOFT_RESET_IN
    );
\gtrxreset_i_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33F73300"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[6]_i_2__1\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_1__1\,
      I4 => \^o2\,
      O => \n_0_gtrxreset_i_i_1__1\
    );
gtrxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_gtrxreset_i_i_1__1\,
      Q => \^o2\,
      R => SOFT_RESET_IN
    );
\init_wait_count[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \init_wait_count_reg__0\(0),
      O => \p_0_in__1\(0)
    );
\init_wait_count[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      O => \p_0_in__1\(1)
    );
\init_wait_count[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(2),
      O => \p_0_in__1\(2)
    );
\init_wait_count[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(3),
      O => \p_0_in__1\(3)
    );
\init_wait_count[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(4),
      I4 => \init_wait_count_reg__0\(3),
      O => \n_0_init_wait_count[4]_i_1__1\
    );
\init_wait_count[4]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \init_wait_count_reg__0\(3),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(2),
      I4 => \init_wait_count_reg__0\(4),
      O => \p_0_in__1\(4)
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__1\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__1\(0),
      Q => \init_wait_count_reg__0\(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__1\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__1\(1),
      Q => \init_wait_count_reg__0\(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__1\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__1\(2),
      Q => \init_wait_count_reg__0\(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__1\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__1\(3),
      Q => \init_wait_count_reg__0\(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__1\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__1\(4),
      Q => \init_wait_count_reg__0\(4)
    );
\init_wait_done_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF40000000"
    )
    port map (
      I0 => \init_wait_count_reg__0\(0),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(4),
      I3 => \init_wait_count_reg__0\(3),
      I4 => \init_wait_count_reg__0\(2),
      I5 => init_wait_done,
      O => \n_0_init_wait_done_i_1__1\
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      CLR => SOFT_RESET_IN,
      D => \n_0_init_wait_done_i_1__1\,
      Q => init_wait_done
    );
\mmcm_lock_count[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      O => \n_0_mmcm_lock_count[0]_i_1__1\
    );
\mmcm_lock_count[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__5\(1)
    );
\mmcm_lock_count[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      O => \p_0_in__5\(2)
    );
\mmcm_lock_count[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(2),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(1),
      I3 => \mmcm_lock_count_reg__0\(3),
      O => \p_0_in__5\(3)
    );
\mmcm_lock_count[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(3),
      I4 => \mmcm_lock_count_reg__0\(4),
      O => \p_0_in__5\(4)
    );
\mmcm_lock_count[5]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(3),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(0),
      I4 => \mmcm_lock_count_reg__0\(1),
      I5 => \mmcm_lock_count_reg__0\(5),
      O => \p_0_in__5\(5)
    );
\mmcm_lock_count[6]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \n_0_mmcm_lock_count[9]_i_4__1\,
      I1 => \mmcm_lock_count_reg__0\(6),
      O => \p_0_in__5\(6)
    );
\mmcm_lock_count[7]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(6),
      I1 => \n_0_mmcm_lock_count[9]_i_4__1\,
      I2 => \mmcm_lock_count_reg__0\(7),
      O => \p_0_in__5\(7)
    );
\mmcm_lock_count[8]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \n_0_mmcm_lock_count[9]_i_4__1\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      O => \p_0_in__5\(8)
    );
\mmcm_lock_count[9]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \n_0_mmcm_lock_count[9]_i_4__1\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \n_0_mmcm_lock_count[9]_i_2__1\
    );
\mmcm_lock_count[9]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FF0800"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count_reg__0\(6),
      I2 => \n_0_mmcm_lock_count[9]_i_4__1\,
      I3 => \mmcm_lock_count_reg__0\(7),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \p_0_in__5\(9)
    );
\mmcm_lock_count[9]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(4),
      I3 => \mmcm_lock_count_reg__0\(5),
      I4 => \mmcm_lock_count_reg__0\(2),
      I5 => \mmcm_lock_count_reg__0\(3),
      O => \n_0_mmcm_lock_count[9]_i_4__1\
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \n_0_mmcm_lock_count[0]_i_1__1\,
      Q => \mmcm_lock_count_reg__0\(0),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(1),
      Q => \mmcm_lock_count_reg__0\(1),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(2),
      Q => \mmcm_lock_count_reg__0\(2),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(3),
      Q => \mmcm_lock_count_reg__0\(3),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(4),
      Q => \mmcm_lock_count_reg__0\(4),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(5),
      Q => \mmcm_lock_count_reg__0\(5),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(6),
      Q => \mmcm_lock_count_reg__0\(6),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(7),
      Q => \mmcm_lock_count_reg__0\(7),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(8),
      Q => \mmcm_lock_count_reg__0\(8),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__1\,
      D => \p_0_in__5\(9),
      Q => \mmcm_lock_count_reg__0\(9),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_reclocked_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(8),
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \n_0_mmcm_lock_count[9]_i_4__1\,
      I4 => \mmcm_lock_count_reg__0\(7),
      O => \n_0_mmcm_lock_reclocked_i_2__1\
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_1_sync_mmcm_lock_reclocked,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
\pll_reset_asserted_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55DC"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => n_0_pll_reset_asserted_reg,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__1\,
      I3 => \n_0_FSM_onehot_rx_state[5]_i_2__1\,
      O => \n_0_pll_reset_asserted_i_1__1\
    );
pll_reset_asserted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_pll_reset_asserted_i_1__1\,
      Q => n_0_pll_reset_asserted_reg,
      R => SOFT_RESET_IN
    );
\reset_time_out_i_11__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_11__1\
    );
\reset_time_out_i_12__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_12__1\
    );
\reset_time_out_i_13__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_reset_time_out_i_13__1\
    );
\reset_time_out_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
    port map (
      I0 => I1,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_wait_time_cnt[6]_i_4__1\,
      I4 => \n_0_FSM_onehot_rx_state[5]_i_3__1\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__1\,
      O => \n_0_reset_time_out_i_4__1\
    );
\reset_time_out_i_5__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010006"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state[10]_i_3__1\,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__1\,
      I4 => run_phase_alignment_int,
      O => \n_0_reset_time_out_i_5__1\
    );
\reset_time_out_i_6__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000F00040004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__1\,
      I1 => \n_0_reset_time_out_i_12__1\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_3__1\,
      I4 => \n_0_FSM_onehot_rx_state[2]_i_8__1\,
      I5 => \n_0_reset_time_out_i_13__1\,
      O => \n_0_reset_time_out_i_6__1\
    );
\reset_time_out_i_8__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => mmcm_lock_reclocked,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => check_tlock_max,
      O => \n_0_reset_time_out_i_8__1\
    );
\reset_time_out_i_9__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_9__1\
    );
reset_time_out_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_4_sync_data_valid,
      Q => n_0_reset_time_out_reg,
      S => SOFT_RESET_IN
    );
\run_phase_alignment_int_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_run_phase_alignment_int_i_2__1\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__1\,
      I3 => n_0_run_phase_alignment_int_reg,
      O => \n_0_run_phase_alignment_int_i_1__1\
    );
\run_phase_alignment_int_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__1\,
      I4 => \n_0_FSM_onehot_rx_state[10]_i_3__1\,
      O => \n_0_run_phase_alignment_int_i_2__1\
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_run_phase_alignment_int_i_1__1\,
      Q => n_0_run_phase_alignment_int_reg,
      R => SOFT_RESET_IN
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => n_0_run_phase_alignment_int_s3_reg,
      R => '0'
    );
\rx_fsm_reset_done_int_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3__1\,
      O => \n_0_rx_fsm_reset_done_int_i_3__1\
    );
\rx_fsm_reset_done_int_i_6__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state[10]_i_3__1\,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__1\,
      I4 => run_phase_alignment_int,
      O => \n_0_rx_fsm_reset_done_int_i_6__1\
    );
rx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_5_sync_data_valid,
      Q => \^gt2_rx_fsm_reset_done_out\,
      R => SOFT_RESET_IN
    );
rx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => rx_fsm_reset_done_int_s2,
      Q => n_0_rx_fsm_reset_done_int_s3_reg,
      R => '0'
    );
rxresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => rxresetdone_s2,
      Q => rxresetdone_s3,
      R => '0'
    );
sync_QPLLLOCK: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_19\
    port map (
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      I1 => n_0_pll_reset_asserted_reg,
      I10 => I1,
      I2 => \n_0_FSM_onehot_rx_state[11]_i_14__1\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_15__1\,
      I4 => n_3_sync_data_valid,
      I5 => \n_0_reset_time_out_i_9__1\,
      I6 => \n_0_FSM_onehot_rx_state[3]_i_4__1\,
      I7 => \n_0_FSM_onehot_rx_state[5]_i_3__1\,
      I8 => \n_0_wait_time_cnt[6]_i_4__1\,
      I9 => \n_0_reset_time_out_i_11__1\,
      O1 => n_0_sync_QPLLLOCK,
      O2 => n_1_sync_QPLLLOCK,
      O3 => n_2_sync_QPLLLOCK,
      O4 => n_3_sync_QPLLLOCK,
      Q(6) => \n_0_FSM_onehot_rx_state_reg[10]\,
      Q(5) => \n_0_FSM_onehot_rx_state_reg[7]\,
      Q(4) => \n_0_FSM_onehot_rx_state_reg[5]\,
      Q(3) => \n_0_FSM_onehot_rx_state_reg[4]\,
      Q(2) => \n_0_FSM_onehot_rx_state_reg[3]\,
      Q(1) => \n_0_FSM_onehot_rx_state_reg[2]\,
      Q(0) => \n_0_FSM_onehot_rx_state_reg[1]\,
      SYSCLK_IN => SYSCLK_IN
    );
sync_RXRESETDONE: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_20\
    port map (
      SYSCLK_IN => SYSCLK_IN,
      data_out => rxresetdone_s2,
      gt2_rxresetdone_out => gt2_rxresetdone_out
    );
sync_data_valid: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_21\
    port map (
      D(1) => n_1_sync_data_valid,
      D(0) => n_2_sync_data_valid,
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      E(0) => n_0_sync_data_valid,
      GT2_DATA_VALID_IN => GT2_DATA_VALID_IN,
      GT2_RX_FSM_RESET_DONE_OUT => \^gt2_rx_fsm_reset_done_out\,
      I1 => n_1_sync_QPLLLOCK,
      I10 => \n_0_FSM_onehot_rx_state[11]_i_12__1\,
      I11 => n_0_sync_QPLLLOCK,
      I12 => n_0_time_out_1us_reg,
      I13 => n_0_reset_time_out_reg,
      I14 => \n_0_FSM_onehot_rx_state[2]_i_2__1\,
      I15 => \n_0_FSM_onehot_rx_state[5]_i_2__1\,
      I16 => n_0_time_out_2ms_reg,
      I17 => \n_0_FSM_onehot_rx_state[2]_i_4__1\,
      I18 => \n_0_FSM_onehot_rx_state[2]_i_5__1\,
      I19 => n_3_sync_QPLLLOCK,
      I2 => \n_0_FSM_onehot_rx_state[11]_i_5__1\,
      I20 => \n_0_reset_time_out_i_8__1\,
      I21 => \n_0_FSM_onehot_rx_state[10]_i_2__1\,
      I22 => n_0_time_out_100us_reg,
      I23 => \n_0_rx_fsm_reset_done_int_i_6__1\,
      I24 => n_2_sync_QPLLLOCK,
      I25 => \n_0_reset_time_out_i_4__1\,
      I26 => \n_0_reset_time_out_i_5__1\,
      I27 => \n_0_reset_time_out_i_6__1\,
      I28 => \n_0_rx_fsm_reset_done_int_i_3__1\,
      I3(0) => \n_0_wait_time_cnt[6]_i_2__1\,
      I4 => \n_0_FSM_onehot_rx_state[11]_i_6__0\,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_16__0\,
      I6 => \n_0_FSM_onehot_rx_state[10]_i_3__1\,
      I7 => \n_0_FSM_onehot_rx_state[11]_i_8__0\,
      I8 => \n_0_FSM_onehot_rx_state[11]_i_10__0\,
      I9 => \n_0_FSM_onehot_rx_state[11]_i_11__0\,
      O1 => n_3_sync_data_valid,
      O2 => n_4_sync_data_valid,
      O3 => n_5_sync_data_valid,
      Q(3) => \n_0_FSM_onehot_rx_state_reg[11]\,
      Q(2) => \n_0_FSM_onehot_rx_state_reg[10]\,
      Q(1) => run_phase_alignment_int,
      Q(0) => \n_0_FSM_onehot_rx_state_reg[8]\,
      SYSCLK_IN => SYSCLK_IN,
      rxresetdone_s3 => rxresetdone_s3
    );
sync_mmcm_lock_reclocked: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_22\
    port map (
      I1 => \n_0_mmcm_lock_reclocked_i_2__1\,
      O1 => n_1_sync_mmcm_lock_reclocked,
      SR(0) => n_0_sync_mmcm_lock_reclocked,
      SYSCLK_IN => SYSCLK_IN,
      mmcm_lock_reclocked => mmcm_lock_reclocked
    );
sync_run_phase_alignment_int: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_23\
    port map (
      data_in => n_0_run_phase_alignment_int_reg,
      data_out => run_phase_alignment_int_s2,
      gt2_rxusrclk_in => gt2_rxusrclk_in
    );
sync_rx_fsm_reset_done_int: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_24\
    port map (
      GT2_RX_FSM_RESET_DONE_OUT => \^gt2_rx_fsm_reset_done_out\,
      data_out => rx_fsm_reset_done_int_s2,
      gt2_rxusrclk_in => gt2_rxusrclk_in
    );
sync_time_out_wait_bypass: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_25\
    port map (
      SYSCLK_IN => SYSCLK_IN,
      data_in => n_0_time_out_wait_bypass_reg,
      data_out => time_out_wait_bypass_s2
    );
\time_out_100us_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
    port map (
      I0 => \n_0_time_out_counter[0]_i_3__1\,
      I1 => \n_0_time_out_100us_i_2__1\,
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(11),
      I4 => \n_0_time_out_100us_i_3__1\,
      I5 => n_0_time_out_100us_reg,
      O => \n_0_time_out_100us_i_1__1\
    );
\time_out_100us_i_2__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      O => \n_0_time_out_100us_i_2__1\
    );
\time_out_100us_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
    port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(12),
      I3 => time_out_counter_reg(3),
      I4 => time_out_counter_reg(1),
      I5 => time_out_counter_reg(2),
      O => \n_0_time_out_100us_i_3__1\
    );
time_out_100us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_100us_i_1__1\,
      Q => n_0_time_out_100us_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_1us_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000002"
    )
    port map (
      I0 => \n_0_time_out_1us_i_2__1\,
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(11),
      I4 => time_out_counter_reg(10),
      I5 => n_0_time_out_1us_reg,
      O => \n_0_time_out_1us_i_1__1\
    );
\time_out_1us_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
    port map (
      I0 => \n_0_time_out_2ms_i_3__1\,
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(15),
      I3 => time_out_counter_reg(8),
      I4 => time_out_counter_reg(9),
      I5 => \n_0_time_out_1us_i_3__1\,
      O => \n_0_time_out_1us_i_2__1\
    );
\time_out_1us_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
    port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(6),
      I2 => time_out_counter_reg(5),
      I3 => time_out_counter_reg(4),
      I4 => time_out_counter_reg(7),
      O => \n_0_time_out_1us_i_3__1\
    );
time_out_1us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_1us_i_1__1\,
      Q => n_0_time_out_1us_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_2ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => \n_0_time_out_2ms_i_2__1\,
      I1 => \n_0_time_out_counter[0]_i_3__1\,
      I2 => \n_0_time_out_2ms_i_3__1\,
      I3 => n_0_time_out_2ms_reg,
      O => \n_0_time_out_2ms_i_1__1\
    );
\time_out_2ms_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
    port map (
      I0 => time_out_counter_reg(13),
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(11),
      I3 => time_out_counter_reg(10),
      I4 => time_out_counter_reg(16),
      I5 => time_out_counter_reg(15),
      O => \n_0_time_out_2ms_i_2__1\
    );
\time_out_2ms_i_3__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(3),
      I3 => time_out_counter_reg(12),
      O => \n_0_time_out_2ms_i_3__1\
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_2ms_i_1__1\,
      Q => n_0_time_out_2ms_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_counter[0]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => time_out_counter_reg(10),
      I1 => \n_0_time_out_counter[0]_i_3__1\,
      I2 => \n_0_time_out_counter[0]_i_4__1\,
      O => \n_0_time_out_counter[0]_i_1__1\
    );
\time_out_counter[0]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
    port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      I2 => time_out_counter_reg(7),
      I3 => time_out_counter_reg(6),
      I4 => time_out_counter_reg(0),
      I5 => \n_0_time_out_counter[0]_i_9__1\,
      O => \n_0_time_out_counter[0]_i_3__1\
    );
\time_out_counter[0]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFFFFF"
    )
    port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(14),
      I4 => time_out_counter_reg(11),
      I5 => \n_0_time_out_2ms_i_3__1\,
      O => \n_0_time_out_counter[0]_i_4__1\
    );
\time_out_counter[0]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(3),
      O => \n_0_time_out_counter[0]_i_5__1\
    );
\time_out_counter[0]_i_6__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(2),
      O => \n_0_time_out_counter[0]_i_6__1\
    );
\time_out_counter[0]_i_7__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(1),
      O => \n_0_time_out_counter[0]_i_7__1\
    );
\time_out_counter[0]_i_8__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(0),
      O => \n_0_time_out_counter[0]_i_8__1\
    );
\time_out_counter[0]_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      O => \n_0_time_out_counter[0]_i_9__1\
    );
\time_out_counter[12]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(15),
      O => \n_0_time_out_counter[12]_i_2__1\
    );
\time_out_counter[12]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(14),
      O => \n_0_time_out_counter[12]_i_3__1\
    );
\time_out_counter[12]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(13),
      O => \n_0_time_out_counter[12]_i_4__1\
    );
\time_out_counter[12]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(12),
      O => \n_0_time_out_counter[12]_i_5__1\
    );
\time_out_counter[16]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(16),
      O => \n_0_time_out_counter[16]_i_2__1\
    );
\time_out_counter[4]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(7),
      O => \n_0_time_out_counter[4]_i_2__1\
    );
\time_out_counter[4]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(6),
      O => \n_0_time_out_counter[4]_i_3__1\
    );
\time_out_counter[4]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(5),
      O => \n_0_time_out_counter[4]_i_4__1\
    );
\time_out_counter[4]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(4),
      O => \n_0_time_out_counter[4]_i_5__1\
    );
\time_out_counter[8]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(11),
      O => \n_0_time_out_counter[8]_i_2__1\
    );
\time_out_counter[8]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(10),
      O => \n_0_time_out_counter[8]_i_3__1\
    );
\time_out_counter[8]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(9),
      O => \n_0_time_out_counter[8]_i_4__1\
    );
\time_out_counter[8]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(8),
      O => \n_0_time_out_counter[8]_i_5__1\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_7_time_out_counter_reg[0]_i_2__1\,
      Q => time_out_counter_reg(0),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[0]_i_2__1\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_time_out_counter_reg[0]_i_2__1\,
      CO(2) => \n_1_time_out_counter_reg[0]_i_2__1\,
      CO(1) => \n_2_time_out_counter_reg[0]_i_2__1\,
      CO(0) => \n_3_time_out_counter_reg[0]_i_2__1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_time_out_counter_reg[0]_i_2__1\,
      O(2) => \n_5_time_out_counter_reg[0]_i_2__1\,
      O(1) => \n_6_time_out_counter_reg[0]_i_2__1\,
      O(0) => \n_7_time_out_counter_reg[0]_i_2__1\,
      S(3) => \n_0_time_out_counter[0]_i_5__1\,
      S(2) => \n_0_time_out_counter[0]_i_6__1\,
      S(1) => \n_0_time_out_counter[0]_i_7__1\,
      S(0) => \n_0_time_out_counter[0]_i_8__1\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_5_time_out_counter_reg[8]_i_1__1\,
      Q => time_out_counter_reg(10),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_4_time_out_counter_reg[8]_i_1__1\,
      Q => time_out_counter_reg(11),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_7_time_out_counter_reg[12]_i_1__1\,
      Q => time_out_counter_reg(12),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[8]_i_1__1\,
      CO(3) => \n_0_time_out_counter_reg[12]_i_1__1\,
      CO(2) => \n_1_time_out_counter_reg[12]_i_1__1\,
      CO(1) => \n_2_time_out_counter_reg[12]_i_1__1\,
      CO(0) => \n_3_time_out_counter_reg[12]_i_1__1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[12]_i_1__1\,
      O(2) => \n_5_time_out_counter_reg[12]_i_1__1\,
      O(1) => \n_6_time_out_counter_reg[12]_i_1__1\,
      O(0) => \n_7_time_out_counter_reg[12]_i_1__1\,
      S(3) => \n_0_time_out_counter[12]_i_2__1\,
      S(2) => \n_0_time_out_counter[12]_i_3__1\,
      S(1) => \n_0_time_out_counter[12]_i_4__1\,
      S(0) => \n_0_time_out_counter[12]_i_5__1\
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_6_time_out_counter_reg[12]_i_1__1\,
      Q => time_out_counter_reg(13),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_5_time_out_counter_reg[12]_i_1__1\,
      Q => time_out_counter_reg(14),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_4_time_out_counter_reg[12]_i_1__1\,
      Q => time_out_counter_reg(15),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_7_time_out_counter_reg[16]_i_1__1\,
      Q => time_out_counter_reg(16),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[16]_i_1__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[12]_i_1__1\,
      CO(3 downto 0) => \NLW_time_out_counter_reg[16]_i_1__1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_time_out_counter_reg[16]_i_1__1_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_time_out_counter_reg[16]_i_1__1\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_time_out_counter[16]_i_2__1\
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_6_time_out_counter_reg[0]_i_2__1\,
      Q => time_out_counter_reg(1),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_5_time_out_counter_reg[0]_i_2__1\,
      Q => time_out_counter_reg(2),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_4_time_out_counter_reg[0]_i_2__1\,
      Q => time_out_counter_reg(3),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_7_time_out_counter_reg[4]_i_1__1\,
      Q => time_out_counter_reg(4),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[0]_i_2__1\,
      CO(3) => \n_0_time_out_counter_reg[4]_i_1__1\,
      CO(2) => \n_1_time_out_counter_reg[4]_i_1__1\,
      CO(1) => \n_2_time_out_counter_reg[4]_i_1__1\,
      CO(0) => \n_3_time_out_counter_reg[4]_i_1__1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[4]_i_1__1\,
      O(2) => \n_5_time_out_counter_reg[4]_i_1__1\,
      O(1) => \n_6_time_out_counter_reg[4]_i_1__1\,
      O(0) => \n_7_time_out_counter_reg[4]_i_1__1\,
      S(3) => \n_0_time_out_counter[4]_i_2__1\,
      S(2) => \n_0_time_out_counter[4]_i_3__1\,
      S(1) => \n_0_time_out_counter[4]_i_4__1\,
      S(0) => \n_0_time_out_counter[4]_i_5__1\
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_6_time_out_counter_reg[4]_i_1__1\,
      Q => time_out_counter_reg(5),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_5_time_out_counter_reg[4]_i_1__1\,
      Q => time_out_counter_reg(6),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_4_time_out_counter_reg[4]_i_1__1\,
      Q => time_out_counter_reg(7),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_7_time_out_counter_reg[8]_i_1__1\,
      Q => time_out_counter_reg(8),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[4]_i_1__1\,
      CO(3) => \n_0_time_out_counter_reg[8]_i_1__1\,
      CO(2) => \n_1_time_out_counter_reg[8]_i_1__1\,
      CO(1) => \n_2_time_out_counter_reg[8]_i_1__1\,
      CO(0) => \n_3_time_out_counter_reg[8]_i_1__1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[8]_i_1__1\,
      O(2) => \n_5_time_out_counter_reg[8]_i_1__1\,
      O(1) => \n_6_time_out_counter_reg[8]_i_1__1\,
      O(0) => \n_7_time_out_counter_reg[8]_i_1__1\,
      S(3) => \n_0_time_out_counter[8]_i_2__1\,
      S(2) => \n_0_time_out_counter[8]_i_3__1\,
      S(1) => \n_0_time_out_counter[8]_i_4__1\,
      S(0) => \n_0_time_out_counter[8]_i_5__1\
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__1\,
      D => \n_6_time_out_counter_reg[8]_i_1__1\,
      Q => time_out_counter_reg(9),
      R => n_0_reset_time_out_reg
    );
\time_out_wait_bypass_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF0100000000"
    )
    port map (
      I0 => \n_0_wait_bypass_count[0]_i_4__1\,
      I1 => wait_bypass_count_reg(3),
      I2 => \n_0_wait_bypass_count[0]_i_5__1\,
      I3 => n_0_time_out_wait_bypass_reg,
      I4 => n_0_rx_fsm_reset_done_int_s3_reg,
      I5 => n_0_run_phase_alignment_int_s3_reg,
      O => \n_0_time_out_wait_bypass_i_1__1\
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_rxusrclk_in,
      CE => '1',
      D => \n_0_time_out_wait_bypass_i_1__1\,
      Q => n_0_time_out_wait_bypass_reg,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
\time_tlock_max_i_10__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(13),
      O => \n_0_time_tlock_max_i_10__1\
    );
\time_tlock_max_i_11__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(10),
      O => \n_0_time_tlock_max_i_11__1\
    );
\time_tlock_max_i_12__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(9),
      I1 => time_out_counter_reg(8),
      O => \n_0_time_tlock_max_i_12__1\
    );
\time_tlock_max_i_13__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      O => \n_0_time_tlock_max_i_13__1\
    );
\time_tlock_max_i_14__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(1),
      O => \n_0_time_tlock_max_i_14__1\
    );
\time_tlock_max_i_15__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(6),
      I1 => time_out_counter_reg(7),
      O => \n_0_time_tlock_max_i_15__1\
    );
\time_tlock_max_i_16__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(5),
      I1 => time_out_counter_reg(4),
      O => \n_0_time_tlock_max_i_16__1\
    );
\time_tlock_max_i_17__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(3),
      O => \n_0_time_tlock_max_i_17__1\
    );
\time_tlock_max_i_18__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(1),
      I1 => time_out_counter_reg(0),
      O => \n_0_time_tlock_max_i_18__1\
    );
\time_tlock_max_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => n_0_check_tlock_max_reg,
      I1 => time_tlock_max1,
      I2 => time_tlock_max,
      O => \n_0_time_tlock_max_i_1__1\
    );
\time_tlock_max_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(16),
      O => \n_0_time_tlock_max_i_4__1\
    );
\time_tlock_max_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      O => \n_0_time_tlock_max_i_6__1\
    );
\time_tlock_max_i_7__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(10),
      I1 => time_out_counter_reg(11),
      O => \n_0_time_tlock_max_i_7__1\
    );
\time_tlock_max_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      O => \n_0_time_tlock_max_i_8__1\
    );
\time_tlock_max_i_9__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(14),
      O => \n_0_time_tlock_max_i_9__1\
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_tlock_max_i_1__1\,
      Q => time_tlock_max,
      R => n_0_reset_time_out_reg
    );
\time_tlock_max_reg_i_2__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_tlock_max_reg_i_3__1\,
      CO(3 downto 1) => \NLW_time_tlock_max_reg_i_2__1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => time_tlock_max1,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => time_out_counter_reg(16),
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_2__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_time_tlock_max_i_4__1\
    );
\time_tlock_max_reg_i_3__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_tlock_max_reg_i_5__1\,
      CO(3) => \n_0_time_tlock_max_reg_i_3__1\,
      CO(2) => \n_1_time_tlock_max_reg_i_3__1\,
      CO(1) => \n_2_time_tlock_max_reg_i_3__1\,
      CO(0) => \n_3_time_tlock_max_reg_i_3__1\,
      CYINIT => '0',
      DI(3) => \n_0_time_tlock_max_i_6__1\,
      DI(2) => time_out_counter_reg(13),
      DI(1) => \n_0_time_tlock_max_i_7__1\,
      DI(0) => \n_0_time_tlock_max_i_8__1\,
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_3__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_time_tlock_max_i_9__1\,
      S(2) => \n_0_time_tlock_max_i_10__1\,
      S(1) => \n_0_time_tlock_max_i_11__1\,
      S(0) => \n_0_time_tlock_max_i_12__1\
    );
\time_tlock_max_reg_i_5__1\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_time_tlock_max_reg_i_5__1\,
      CO(2) => \n_1_time_tlock_max_reg_i_5__1\,
      CO(1) => \n_2_time_tlock_max_reg_i_5__1\,
      CO(0) => \n_3_time_tlock_max_reg_i_5__1\,
      CYINIT => '0',
      DI(3) => time_out_counter_reg(7),
      DI(2) => \n_0_time_tlock_max_i_13__1\,
      DI(1) => time_out_counter_reg(3),
      DI(0) => \n_0_time_tlock_max_i_14__1\,
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_5__1_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_time_tlock_max_i_15__1\,
      S(2) => \n_0_time_tlock_max_i_16__1\,
      S(1) => \n_0_time_tlock_max_i_17__1\,
      S(0) => \n_0_time_tlock_max_i_18__1\
    );
\wait_bypass_count[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => n_0_run_phase_alignment_int_s3_reg,
      O => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count[0]_i_2__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
    port map (
      I0 => \n_0_wait_bypass_count[0]_i_4__1\,
      I1 => wait_bypass_count_reg(3),
      I2 => \n_0_wait_bypass_count[0]_i_5__1\,
      I3 => n_0_rx_fsm_reset_done_int_s3_reg,
      O => \n_0_wait_bypass_count[0]_i_2__1\
    );
\wait_bypass_count[0]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFFFFFFFFFF"
    )
    port map (
      I0 => wait_bypass_count_reg(11),
      I1 => wait_bypass_count_reg(4),
      I2 => wait_bypass_count_reg(0),
      I3 => wait_bypass_count_reg(9),
      I4 => wait_bypass_count_reg(10),
      I5 => wait_bypass_count_reg(2),
      O => \n_0_wait_bypass_count[0]_i_4__1\
    );
\wait_bypass_count[0]_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFFFFFFFF"
    )
    port map (
      I0 => wait_bypass_count_reg(1),
      I1 => wait_bypass_count_reg(6),
      I2 => wait_bypass_count_reg(5),
      I3 => wait_bypass_count_reg(12),
      I4 => wait_bypass_count_reg(8),
      I5 => wait_bypass_count_reg(7),
      O => \n_0_wait_bypass_count[0]_i_5__1\
    );
\wait_bypass_count[0]_i_6__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(3),
      O => \n_0_wait_bypass_count[0]_i_6__1\
    );
\wait_bypass_count[0]_i_7__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(2),
      O => \n_0_wait_bypass_count[0]_i_7__1\
    );
\wait_bypass_count[0]_i_8__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(1),
      O => \n_0_wait_bypass_count[0]_i_8__1\
    );
\wait_bypass_count[0]_i_9__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wait_bypass_count_reg(0),
      O => \n_0_wait_bypass_count[0]_i_9__1\
    );
\wait_bypass_count[12]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(12),
      O => \n_0_wait_bypass_count[12]_i_2__1\
    );
\wait_bypass_count[4]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(7),
      O => \n_0_wait_bypass_count[4]_i_2__1\
    );
\wait_bypass_count[4]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(6),
      O => \n_0_wait_bypass_count[4]_i_3__1\
    );
\wait_bypass_count[4]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(5),
      O => \n_0_wait_bypass_count[4]_i_4__1\
    );
\wait_bypass_count[4]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(4),
      O => \n_0_wait_bypass_count[4]_i_5__1\
    );
\wait_bypass_count[8]_i_2__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(11),
      O => \n_0_wait_bypass_count[8]_i_2__1\
    );
\wait_bypass_count[8]_i_3__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(10),
      O => \n_0_wait_bypass_count[8]_i_3__1\
    );
\wait_bypass_count[8]_i_4__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(9),
      O => \n_0_wait_bypass_count[8]_i_4__1\
    );
\wait_bypass_count[8]_i_5__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(8),
      O => \n_0_wait_bypass_count[8]_i_5__1\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_7_wait_bypass_count_reg[0]_i_3__1\,
      Q => wait_bypass_count_reg(0),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[0]_i_3__1\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_wait_bypass_count_reg[0]_i_3__1\,
      CO(2) => \n_1_wait_bypass_count_reg[0]_i_3__1\,
      CO(1) => \n_2_wait_bypass_count_reg[0]_i_3__1\,
      CO(0) => \n_3_wait_bypass_count_reg[0]_i_3__1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_wait_bypass_count_reg[0]_i_3__1\,
      O(2) => \n_5_wait_bypass_count_reg[0]_i_3__1\,
      O(1) => \n_6_wait_bypass_count_reg[0]_i_3__1\,
      O(0) => \n_7_wait_bypass_count_reg[0]_i_3__1\,
      S(3) => \n_0_wait_bypass_count[0]_i_6__1\,
      S(2) => \n_0_wait_bypass_count[0]_i_7__1\,
      S(1) => \n_0_wait_bypass_count[0]_i_8__1\,
      S(0) => \n_0_wait_bypass_count[0]_i_9__1\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_5_wait_bypass_count_reg[8]_i_1__1\,
      Q => wait_bypass_count_reg(10),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_4_wait_bypass_count_reg[8]_i_1__1\,
      Q => wait_bypass_count_reg(11),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_7_wait_bypass_count_reg[12]_i_1__1\,
      Q => wait_bypass_count_reg(12),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[12]_i_1__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[8]_i_1__1\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[12]_i_1__1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_wait_bypass_count_reg[12]_i_1__1_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_wait_bypass_count_reg[12]_i_1__1\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_wait_bypass_count[12]_i_2__1\
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_6_wait_bypass_count_reg[0]_i_3__1\,
      Q => wait_bypass_count_reg(1),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_5_wait_bypass_count_reg[0]_i_3__1\,
      Q => wait_bypass_count_reg(2),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_4_wait_bypass_count_reg[0]_i_3__1\,
      Q => wait_bypass_count_reg(3),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_7_wait_bypass_count_reg[4]_i_1__1\,
      Q => wait_bypass_count_reg(4),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[4]_i_1__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[0]_i_3__1\,
      CO(3) => \n_0_wait_bypass_count_reg[4]_i_1__1\,
      CO(2) => \n_1_wait_bypass_count_reg[4]_i_1__1\,
      CO(1) => \n_2_wait_bypass_count_reg[4]_i_1__1\,
      CO(0) => \n_3_wait_bypass_count_reg[4]_i_1__1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_wait_bypass_count_reg[4]_i_1__1\,
      O(2) => \n_5_wait_bypass_count_reg[4]_i_1__1\,
      O(1) => \n_6_wait_bypass_count_reg[4]_i_1__1\,
      O(0) => \n_7_wait_bypass_count_reg[4]_i_1__1\,
      S(3) => \n_0_wait_bypass_count[4]_i_2__1\,
      S(2) => \n_0_wait_bypass_count[4]_i_3__1\,
      S(1) => \n_0_wait_bypass_count[4]_i_4__1\,
      S(0) => \n_0_wait_bypass_count[4]_i_5__1\
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_6_wait_bypass_count_reg[4]_i_1__1\,
      Q => wait_bypass_count_reg(5),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_5_wait_bypass_count_reg[4]_i_1__1\,
      Q => wait_bypass_count_reg(6),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_4_wait_bypass_count_reg[4]_i_1__1\,
      Q => wait_bypass_count_reg(7),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_7_wait_bypass_count_reg[8]_i_1__1\,
      Q => wait_bypass_count_reg(8),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_bypass_count_reg[8]_i_1__1\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[4]_i_1__1\,
      CO(3) => \n_0_wait_bypass_count_reg[8]_i_1__1\,
      CO(2) => \n_1_wait_bypass_count_reg[8]_i_1__1\,
      CO(1) => \n_2_wait_bypass_count_reg[8]_i_1__1\,
      CO(0) => \n_3_wait_bypass_count_reg[8]_i_1__1\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_wait_bypass_count_reg[8]_i_1__1\,
      O(2) => \n_5_wait_bypass_count_reg[8]_i_1__1\,
      O(1) => \n_6_wait_bypass_count_reg[8]_i_1__1\,
      O(0) => \n_7_wait_bypass_count_reg[8]_i_1__1\,
      S(3) => \n_0_wait_bypass_count[8]_i_2__1\,
      S(2) => \n_0_wait_bypass_count[8]_i_3__1\,
      S(1) => \n_0_wait_bypass_count[8]_i_4__1\,
      S(0) => \n_0_wait_bypass_count[8]_i_5__1\
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => gt2_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__1\,
      D => \n_6_wait_bypass_count_reg[8]_i_1__1\,
      Q => wait_bypass_count_reg(9),
      R => \n_0_wait_bypass_count[0]_i_1__1\
    );
\wait_time_cnt[0]_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__1\(0)
    );
\wait_time_cnt[1]_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(1),
      I1 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__1\(1)
    );
\wait_time_cnt[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(2),
      I1 => \wait_time_cnt_reg__0\(0),
      I2 => \wait_time_cnt_reg__0\(1),
      O => \wait_time_cnt0__1\(2)
    );
\wait_time_cnt[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(1),
      I1 => \wait_time_cnt_reg__0\(0),
      I2 => \wait_time_cnt_reg__0\(2),
      I3 => \wait_time_cnt_reg__0\(3),
      O => \wait_time_cnt0__1\(3)
    );
\wait_time_cnt[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(4),
      I1 => \wait_time_cnt_reg__0\(3),
      I2 => \wait_time_cnt_reg__0\(2),
      I3 => \wait_time_cnt_reg__0\(0),
      I4 => \wait_time_cnt_reg__0\(1),
      O => \wait_time_cnt0__1\(4)
    );
\wait_time_cnt[5]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0F0E1"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(3),
      I1 => \wait_time_cnt_reg__0\(2),
      I2 => \wait_time_cnt_reg__0\(5),
      I3 => \wait_time_cnt_reg__0\(4),
      I4 => \wait_time_cnt_reg__0\(1),
      I5 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__1\(5)
    );
\wait_time_cnt[6]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[11]_i_6__0\,
      I1 => \n_0_wait_time_cnt[6]_i_4__1\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_3__1\,
      I3 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I4 => run_phase_alignment_int,
      I5 => \n_0_FSM_onehot_rx_state_reg[4]\,
      O => \n_0_wait_time_cnt[6]_i_1__1\
    );
\wait_time_cnt[6]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(6),
      I1 => \wait_time_cnt_reg__0\(1),
      I2 => \wait_time_cnt_reg__0\(0),
      I3 => \n_0_wait_time_cnt[6]_i_5__1\,
      I4 => \wait_time_cnt_reg__0\(4),
      I5 => \wait_time_cnt_reg__0\(5),
      O => \n_0_wait_time_cnt[6]_i_2__1\
    );
\wait_time_cnt[6]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(5),
      I1 => \wait_time_cnt_reg__0\(4),
      I2 => \n_0_wait_time_cnt[6]_i_5__1\,
      I3 => \wait_time_cnt_reg__0\(0),
      I4 => \wait_time_cnt_reg__0\(1),
      I5 => \wait_time_cnt_reg__0\(6),
      O => \wait_time_cnt0__1\(6)
    );
\wait_time_cnt[6]_i_4__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_wait_time_cnt[6]_i_4__1\
    );
\wait_time_cnt[6]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(2),
      I1 => \wait_time_cnt_reg__0\(3),
      O => \n_0_wait_time_cnt[6]_i_5__1\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__1\,
      D => \wait_time_cnt0__1\(0),
      Q => \wait_time_cnt_reg__0\(0),
      R => \n_0_wait_time_cnt[6]_i_1__1\
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__1\,
      D => \wait_time_cnt0__1\(1),
      Q => \wait_time_cnt_reg__0\(1),
      R => \n_0_wait_time_cnt[6]_i_1__1\
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__1\,
      D => \wait_time_cnt0__1\(2),
      Q => \wait_time_cnt_reg__0\(2),
      S => \n_0_wait_time_cnt[6]_i_1__1\
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__1\,
      D => \wait_time_cnt0__1\(3),
      Q => \wait_time_cnt_reg__0\(3),
      R => \n_0_wait_time_cnt[6]_i_1__1\
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__1\,
      D => \wait_time_cnt0__1\(4),
      Q => \wait_time_cnt_reg__0\(4),
      R => \n_0_wait_time_cnt[6]_i_1__1\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__1\,
      D => \wait_time_cnt0__1\(5),
      Q => \wait_time_cnt_reg__0\(5),
      S => \n_0_wait_time_cnt[6]_i_1__1\
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__1\,
      D => \wait_time_cnt0__1\(6),
      Q => \wait_time_cnt_reg__0\(6),
      S => \n_0_wait_time_cnt[6]_i_1__1\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_2\ is
  port (
    GT3_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    SYSCLK_IN : in STD_LOGIC;
    gt3_rxusrclk_in : in STD_LOGIC;
    SOFT_RESET_IN : in STD_LOGIC;
    I1 : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    gt3_rxresetdone_out : in STD_LOGIC;
    GT3_DATA_VALID_IN : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_2\ : entity is "gtwizard_32_Rx_RX_STARTUP_FSM";
end \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_2\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_2\ is
  signal \^gt3_rx_fsm_reset_done_out\ : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \^o2\ : STD_LOGIC;
  signal check_tlock_max : STD_LOGIC;
  signal \init_wait_count_reg__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal init_wait_done : STD_LOGIC;
  signal \mmcm_lock_count_reg__0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal mmcm_lock_reclocked : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_1__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_2__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[10]_i_3__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_10__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_11__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_12__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_14__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_15__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_16__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_5__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_6__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[11]_i_8__1\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_10__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_2__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_4__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_5__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_6__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_7__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[2]_i_8__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_1__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_2__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_3__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[3]_i_4__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[4]_i_1__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_1__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_2__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[5]_i_3__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[6]_i_1__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[6]_i_2__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[7]_i_1__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[7]_i_2__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[8]_i_1__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[9]_i_1__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state[9]_i_2__2\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[10]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[11]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[1]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[2]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[3]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[4]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[5]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[7]\ : STD_LOGIC;
  signal \n_0_FSM_onehot_rx_state_reg[8]\ : STD_LOGIC;
  signal \n_0_RXUSERRDY_i_1__2\ : STD_LOGIC;
  signal \n_0_check_tlock_max_i_1__2\ : STD_LOGIC;
  signal n_0_check_tlock_max_reg : STD_LOGIC;
  signal \n_0_gtrxreset_i_i_1__2\ : STD_LOGIC;
  signal \n_0_init_wait_count[4]_i_1__2\ : STD_LOGIC;
  signal \n_0_init_wait_done_i_1__2\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[0]_i_1__2\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[9]_i_2__2\ : STD_LOGIC;
  signal \n_0_mmcm_lock_count[9]_i_4__2\ : STD_LOGIC;
  signal \n_0_mmcm_lock_reclocked_i_2__2\ : STD_LOGIC;
  signal \n_0_pll_reset_asserted_i_1__2\ : STD_LOGIC;
  signal n_0_pll_reset_asserted_reg : STD_LOGIC;
  signal \n_0_reset_time_out_i_11__2\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_12__2\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_13__2\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_4__2\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_5__2\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_6__2\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_8__2\ : STD_LOGIC;
  signal \n_0_reset_time_out_i_9__2\ : STD_LOGIC;
  signal n_0_reset_time_out_reg : STD_LOGIC;
  signal \n_0_run_phase_alignment_int_i_1__2\ : STD_LOGIC;
  signal \n_0_run_phase_alignment_int_i_2__2\ : STD_LOGIC;
  signal n_0_run_phase_alignment_int_reg : STD_LOGIC;
  signal n_0_run_phase_alignment_int_s3_reg : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_3__2\ : STD_LOGIC;
  signal \n_0_rx_fsm_reset_done_int_i_6__2\ : STD_LOGIC;
  signal n_0_rx_fsm_reset_done_int_s3_reg : STD_LOGIC;
  signal n_0_sync_QPLLLOCK : STD_LOGIC;
  signal n_0_sync_data_valid : STD_LOGIC;
  signal n_0_sync_mmcm_lock_reclocked : STD_LOGIC;
  signal \n_0_time_out_100us_i_1__2\ : STD_LOGIC;
  signal \n_0_time_out_100us_i_2__2\ : STD_LOGIC;
  signal \n_0_time_out_100us_i_3__2\ : STD_LOGIC;
  signal n_0_time_out_100us_reg : STD_LOGIC;
  signal \n_0_time_out_1us_i_1__2\ : STD_LOGIC;
  signal \n_0_time_out_1us_i_2__2\ : STD_LOGIC;
  signal \n_0_time_out_1us_i_3__2\ : STD_LOGIC;
  signal n_0_time_out_1us_reg : STD_LOGIC;
  signal \n_0_time_out_2ms_i_1__2\ : STD_LOGIC;
  signal \n_0_time_out_2ms_i_2__2\ : STD_LOGIC;
  signal \n_0_time_out_2ms_i_3__2\ : STD_LOGIC;
  signal n_0_time_out_2ms_reg : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_1__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_3__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_4__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_5__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_6__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_7__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_8__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[0]_i_9__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_2__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_3__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_4__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[12]_i_5__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[16]_i_2__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_2__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_3__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_4__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[4]_i_5__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_2__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_3__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_4__2\ : STD_LOGIC;
  signal \n_0_time_out_counter[8]_i_5__2\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[0]_i_2__2\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_0_time_out_counter_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_0_time_out_wait_bypass_i_1__2\ : STD_LOGIC;
  signal n_0_time_out_wait_bypass_reg : STD_LOGIC;
  signal \n_0_time_tlock_max_i_10__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_11__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_12__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_13__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_14__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_15__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_16__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_17__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_18__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_1__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_4__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_6__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_7__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_8__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_i_9__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_reg_i_3__2\ : STD_LOGIC;
  signal \n_0_time_tlock_max_reg_i_5__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_1__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_2__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_4__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_5__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_6__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_7__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_8__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[0]_i_9__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[12]_i_2__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_2__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_3__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_4__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[4]_i_5__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_2__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_3__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_4__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count[8]_i_5__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[0]_i_3__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_0_wait_bypass_count_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_1__2\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_2__2\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_4__2\ : STD_LOGIC;
  signal \n_0_wait_time_cnt[6]_i_5__2\ : STD_LOGIC;
  signal n_1_sync_QPLLLOCK : STD_LOGIC;
  signal n_1_sync_data_valid : STD_LOGIC;
  signal n_1_sync_mmcm_lock_reclocked : STD_LOGIC;
  signal \n_1_time_out_counter_reg[0]_i_2__2\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_1_time_out_counter_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_1_time_tlock_max_reg_i_3__2\ : STD_LOGIC;
  signal \n_1_time_tlock_max_reg_i_5__2\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[0]_i_3__2\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_1_wait_bypass_count_reg[8]_i_1__2\ : STD_LOGIC;
  signal n_2_sync_QPLLLOCK : STD_LOGIC;
  signal n_2_sync_data_valid : STD_LOGIC;
  signal \n_2_time_out_counter_reg[0]_i_2__2\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_2_time_out_counter_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_2_time_tlock_max_reg_i_3__2\ : STD_LOGIC;
  signal \n_2_time_tlock_max_reg_i_5__2\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[0]_i_3__2\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_2_wait_bypass_count_reg[8]_i_1__2\ : STD_LOGIC;
  signal n_3_sync_QPLLLOCK : STD_LOGIC;
  signal n_3_sync_data_valid : STD_LOGIC;
  signal \n_3_time_out_counter_reg[0]_i_2__2\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_3_time_out_counter_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_3_time_tlock_max_reg_i_3__2\ : STD_LOGIC;
  signal \n_3_time_tlock_max_reg_i_5__2\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[0]_i_3__2\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_3_wait_bypass_count_reg[8]_i_1__2\ : STD_LOGIC;
  signal n_4_sync_data_valid : STD_LOGIC;
  signal \n_4_time_out_counter_reg[0]_i_2__2\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_4_time_out_counter_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[0]_i_3__2\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_4_wait_bypass_count_reg[8]_i_1__2\ : STD_LOGIC;
  signal n_5_sync_data_valid : STD_LOGIC;
  signal \n_5_time_out_counter_reg[0]_i_2__2\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_5_time_out_counter_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[0]_i_3__2\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_5_wait_bypass_count_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[0]_i_2__2\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_6_time_out_counter_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[0]_i_3__2\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_6_wait_bypass_count_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[0]_i_2__2\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[16]_i_1__2\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_7_time_out_counter_reg[8]_i_1__2\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[0]_i_3__2\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[12]_i_1__2\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[4]_i_1__2\ : STD_LOGIC;
  signal \n_7_wait_bypass_count_reg[8]_i_1__2\ : STD_LOGIC;
  signal \p_0_in__2\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \p_0_in__6\ : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal run_phase_alignment_int : STD_LOGIC;
  signal run_phase_alignment_int_s2 : STD_LOGIC;
  signal rx_fsm_reset_done_int_s2 : STD_LOGIC;
  signal rxresetdone_s2 : STD_LOGIC;
  signal rxresetdone_s3 : STD_LOGIC;
  signal time_out_counter_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal time_out_wait_bypass_s2 : STD_LOGIC;
  signal time_out_wait_bypass_s3 : STD_LOGIC;
  signal time_tlock_max : STD_LOGIC;
  signal time_tlock_max1 : STD_LOGIC;
  signal wait_bypass_count_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \wait_time_cnt0__2\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \wait_time_cnt_reg__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \NLW_time_out_counter_reg[16]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_out_counter_reg[16]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_time_tlock_max_reg_i_2__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_time_tlock_max_reg_i_2__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_tlock_max_reg_i_3__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_time_tlock_max_reg_i_5__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_wait_bypass_count_reg[12]_i_1__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[10]_i_2__2\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[10]_i_3__2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_11__1\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_12__2\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_16__1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[11]_i_6__1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_10__2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_6__2\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_7__2\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[2]_i_8__2\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_2__2\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_3__2\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[3]_i_4__2\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[4]_i_1__2\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[5]_i_1__2\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[5]_i_3__2\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[6]_i_1__2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[7]_i_1__2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \FSM_onehot_rx_state[8]_i_1__2\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \check_tlock_max_i_1__2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \gtrxreset_i_i_1__2\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \init_wait_count[1]_i_1__2\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \init_wait_count[2]_i_1__2\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \init_wait_count[3]_i_1__2\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \init_wait_count[4]_i_2__2\ : label is "soft_lutpair88";
  attribute counter : integer;
  attribute counter of \init_wait_count_reg[0]\ : label is 18;
  attribute counter of \init_wait_count_reg[1]\ : label is 18;
  attribute counter of \init_wait_count_reg[2]\ : label is 18;
  attribute counter of \init_wait_count_reg[3]\ : label is 18;
  attribute counter of \init_wait_count_reg[4]\ : label is 18;
  attribute SOFT_HLUTNM of \mmcm_lock_count[1]_i_1__2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \mmcm_lock_count[2]_i_1__2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \mmcm_lock_count[3]_i_1__2\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \mmcm_lock_count[4]_i_1__2\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \mmcm_lock_count[7]_i_1__2\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \mmcm_lock_count[8]_i_1__2\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \mmcm_lock_count[9]_i_3__2\ : label is "soft_lutpair95";
  attribute counter of \mmcm_lock_count_reg[0]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[1]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[2]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[3]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[4]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[5]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[6]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[7]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[8]\ : label is 28;
  attribute counter of \mmcm_lock_count_reg[9]\ : label is 28;
  attribute SOFT_HLUTNM of \mmcm_lock_reclocked_i_2__2\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \pll_reset_asserted_i_1__2\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \reset_time_out_i_11__2\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \reset_time_out_i_12__2\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \reset_time_out_i_13__2\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \reset_time_out_i_5__2\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \reset_time_out_i_8__2\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \reset_time_out_i_9__2\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \run_phase_alignment_int_i_2__2\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \rx_fsm_reset_done_int_i_6__2\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \time_out_2ms_i_1__2\ : label is "soft_lutpair104";
  attribute counter of \time_out_counter_reg[0]\ : label is 20;
  attribute counter of \time_out_counter_reg[10]\ : label is 20;
  attribute counter of \time_out_counter_reg[11]\ : label is 20;
  attribute counter of \time_out_counter_reg[12]\ : label is 20;
  attribute counter of \time_out_counter_reg[13]\ : label is 20;
  attribute counter of \time_out_counter_reg[14]\ : label is 20;
  attribute counter of \time_out_counter_reg[15]\ : label is 20;
  attribute counter of \time_out_counter_reg[16]\ : label is 20;
  attribute counter of \time_out_counter_reg[1]\ : label is 20;
  attribute counter of \time_out_counter_reg[2]\ : label is 20;
  attribute counter of \time_out_counter_reg[3]\ : label is 20;
  attribute counter of \time_out_counter_reg[4]\ : label is 20;
  attribute counter of \time_out_counter_reg[5]\ : label is 20;
  attribute counter of \time_out_counter_reg[6]\ : label is 20;
  attribute counter of \time_out_counter_reg[7]\ : label is 20;
  attribute counter of \time_out_counter_reg[8]\ : label is 20;
  attribute counter of \time_out_counter_reg[9]\ : label is 20;
  attribute counter of \wait_bypass_count_reg[0]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[10]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[11]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[12]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[1]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[2]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[3]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[4]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[5]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[6]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[7]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[8]\ : label is 21;
  attribute counter of \wait_bypass_count_reg[9]\ : label is 21;
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \wait_time_cnt[0]_i_1__2\ : label is std.standard.true;
  attribute SOFT_HLUTNM of \wait_time_cnt[0]_i_1__2\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \wait_time_cnt[1]_i_1__2\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \wait_time_cnt[2]_i_1__2\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \wait_time_cnt[3]_i_1__2\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \wait_time_cnt[4]_i_1__2\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \wait_time_cnt[6]_i_4__2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \wait_time_cnt[6]_i_5__2\ : label is "soft_lutpair108";
  attribute counter of \wait_time_cnt_reg[0]\ : label is 19;
  attribute counter of \wait_time_cnt_reg[1]\ : label is 19;
  attribute counter of \wait_time_cnt_reg[2]\ : label is 19;
  attribute counter of \wait_time_cnt_reg[3]\ : label is 19;
  attribute counter of \wait_time_cnt_reg[4]\ : label is 19;
  attribute counter of \wait_time_cnt_reg[5]\ : label is 19;
  attribute counter of \wait_time_cnt_reg[6]\ : label is 19;
begin
  GT3_RX_FSM_RESET_DONE_OUT <= \^gt3_rx_fsm_reset_done_out\;
  O1 <= \^o1\;
  O2 <= \^o2\;
\FSM_onehot_rx_state[10]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000010C"
    )
    port map (
      I0 => time_out_wait_bypass_s3,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[10]_i_2__2\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3__2\,
      O => \n_0_FSM_onehot_rx_state[10]_i_1__2\
    );
\FSM_onehot_rx_state[10]_i_2__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[10]_i_2__2\
    );
\FSM_onehot_rx_state[10]_i_3__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I3 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[10]_i_3__2\
    );
\FSM_onehot_rx_state[11]_i_10__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFEFFFE0000"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[10]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_10__1\
    );
\FSM_onehot_rx_state[11]_i_11__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => n_0_time_out_2ms_reg,
      I2 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[11]_i_11__1\
    );
\FSM_onehot_rx_state[11]_i_12__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8F888888"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I2 => n_0_reset_time_out_reg,
      I3 => time_tlock_max,
      I4 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[11]_i_12__2\
    );
\FSM_onehot_rx_state[11]_i_14__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F8F8F8F8F8F8F888"
    )
    port map (
      I0 => check_tlock_max,
      I1 => mmcm_lock_reclocked,
      I2 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[1]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_14__2\
    );
\FSM_onehot_rx_state[11]_i_15__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFCFCECFCFCFCE0"
    )
    port map (
      I0 => I1,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => check_tlock_max,
      I5 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[11]_i_15__2\
    );
\FSM_onehot_rx_state[11]_i_16__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000203"
    )
    port map (
      I0 => init_wait_done,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[8]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_16__1\
    );
\FSM_onehot_rx_state[11]_i_5__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEEEEEEEE0"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_3__2\,
      I1 => \n_0_FSM_onehot_rx_state[10]_i_3__2\,
      I2 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I5 => \n_0_FSM_onehot_rx_state_reg[8]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_5__2\
    );
\FSM_onehot_rx_state[11]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_6__1\
    );
\FSM_onehot_rx_state[11]_i_8__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_FSM_onehot_rx_state[11]_i_8__1\
    );
\FSM_onehot_rx_state[2]_i_10__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => n_0_reset_time_out_reg,
      I1 => time_tlock_max,
      O => \n_0_FSM_onehot_rx_state[2]_i_10__2\
    );
\FSM_onehot_rx_state[2]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000C0400"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[2]_i_6__2\,
      I1 => \n_0_FSM_onehot_rx_state[2]_i_7__2\,
      I2 => \n_0_FSM_onehot_rx_state[2]_i_8__2\,
      I3 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_6__1\,
      O => \n_0_FSM_onehot_rx_state[2]_i_2__2\
    );
\FSM_onehot_rx_state[2]_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__2\,
      I1 => \n_0_FSM_onehot_rx_state[5]_i_3__2\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__2\,
      I3 => check_tlock_max,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => \n_0_FSM_onehot_rx_state[2]_i_10__2\,
      O => \n_0_FSM_onehot_rx_state[2]_i_4__2\
    );
\FSM_onehot_rx_state[2]_i_5__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[10]_i_3__2\,
      I1 => \n_0_FSM_onehot_rx_state[10]_i_2__2\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I5 => time_out_wait_bypass_s3,
      O => \n_0_FSM_onehot_rx_state[2]_i_5__2\
    );
\FSM_onehot_rx_state[2]_i_6__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => n_0_reset_time_out_reg,
      I1 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[2]_i_6__2\
    );
\FSM_onehot_rx_state[2]_i_7__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => run_phase_alignment_int,
      O => \n_0_FSM_onehot_rx_state[2]_i_7__2\
    );
\FSM_onehot_rx_state[2]_i_8__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_FSM_onehot_rx_state[2]_i_8__2\
    );
\FSM_onehot_rx_state[3]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__2\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3__2\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__2\,
      O => \n_0_FSM_onehot_rx_state[3]_i_1__2\
    );
\FSM_onehot_rx_state[3]_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_2__2\
    );
\FSM_onehot_rx_state[3]_i_3__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_3__2\
    );
\FSM_onehot_rx_state[3]_i_4__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      O => \n_0_FSM_onehot_rx_state[3]_i_4__2\
    );
\FSM_onehot_rx_state[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state[9]_i_2__2\,
      O => \n_0_FSM_onehot_rx_state[4]_i_1__2\
    );
\FSM_onehot_rx_state[5]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[5]_i_2__2\,
      I1 => n_0_time_out_2ms_reg,
      O => \n_0_FSM_onehot_rx_state[5]_i_1__2\
    );
\FSM_onehot_rx_state[5]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => check_tlock_max,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => \n_0_FSM_onehot_rx_state[5]_i_3__2\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__2\,
      O => \n_0_FSM_onehot_rx_state[5]_i_2__2\
    );
\FSM_onehot_rx_state[5]_i_3__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[10]\,
      O => \n_0_FSM_onehot_rx_state[5]_i_3__2\
    );
\FSM_onehot_rx_state[6]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state[6]_i_2__2\,
      O => \n_0_FSM_onehot_rx_state[6]_i_1__2\
    );
\FSM_onehot_rx_state[6]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__2\,
      I1 => run_phase_alignment_int,
      I2 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I5 => check_tlock_max,
      O => \n_0_FSM_onehot_rx_state[6]_i_2__2\
    );
\FSM_onehot_rx_state[7]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[7]_i_2__2\,
      I1 => time_tlock_max,
      I2 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[7]_i_1__2\
    );
\FSM_onehot_rx_state[7]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_2__2\,
      I3 => run_phase_alignment_int,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_3__2\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__2\,
      O => \n_0_FSM_onehot_rx_state[7]_i_2__2\
    );
\FSM_onehot_rx_state[8]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I4 => \n_0_FSM_onehot_rx_state[9]_i_2__2\,
      O => \n_0_FSM_onehot_rx_state[8]_i_1__2\
    );
\FSM_onehot_rx_state[9]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000800000008"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[9]_i_2__2\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_6__1\,
      I4 => n_0_time_out_2ms_reg,
      I5 => n_0_reset_time_out_reg,
      O => \n_0_FSM_onehot_rx_state[9]_i_1__2\
    );
\FSM_onehot_rx_state[9]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_2__2\,
      I4 => check_tlock_max,
      I5 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_FSM_onehot_rx_state[9]_i_2__2\
    );
\FSM_onehot_rx_state_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[10]_i_1__2\,
      Q => \n_0_FSM_onehot_rx_state_reg[10]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => n_1_sync_data_valid,
      Q => \n_0_FSM_onehot_rx_state_reg[11]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => '0',
      Q => \n_0_FSM_onehot_rx_state_reg[1]\,
      S => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => n_2_sync_data_valid,
      Q => \n_0_FSM_onehot_rx_state_reg[2]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[3]_i_1__2\,
      Q => \n_0_FSM_onehot_rx_state_reg[3]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[4]_i_1__2\,
      Q => \n_0_FSM_onehot_rx_state_reg[4]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[5]_i_1__2\,
      Q => \n_0_FSM_onehot_rx_state_reg[5]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[6]_i_1__2\,
      Q => check_tlock_max,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[7]_i_1__2\,
      Q => \n_0_FSM_onehot_rx_state_reg[7]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[8]_i_1__2\,
      Q => \n_0_FSM_onehot_rx_state_reg[8]\,
      R => SOFT_RESET_IN
    );
\FSM_onehot_rx_state_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => n_0_sync_data_valid,
      D => \n_0_FSM_onehot_rx_state[9]_i_1__2\,
      Q => run_phase_alignment_int,
      R => SOFT_RESET_IN
    );
\RXUSERRDY_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCFFFFCCCC0008"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[9]_i_2__2\,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_6__1\,
      I4 => \n_0_FSM_onehot_rx_state[3]_i_1__2\,
      I5 => \^o1\,
      O => \n_0_RXUSERRDY_i_1__2\
    );
RXUSERRDY_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_RXUSERRDY_i_1__2\,
      Q => \^o1\,
      R => SOFT_RESET_IN
    );
\check_tlock_max_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state[7]_i_2__2\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__2\,
      I3 => n_0_check_tlock_max_reg,
      O => \n_0_check_tlock_max_i_1__2\
    );
check_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_check_tlock_max_i_1__2\,
      Q => n_0_check_tlock_max_reg,
      R => SOFT_RESET_IN
    );
\gtrxreset_i_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33F73300"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[6]_i_2__2\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_1__2\,
      I4 => \^o2\,
      O => \n_0_gtrxreset_i_i_1__2\
    );
gtrxreset_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_gtrxreset_i_i_1__2\,
      Q => \^o2\,
      R => SOFT_RESET_IN
    );
\init_wait_count[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \init_wait_count_reg__0\(0),
      O => \p_0_in__2\(0)
    );
\init_wait_count[1]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      O => \p_0_in__2\(1)
    );
\init_wait_count[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \init_wait_count_reg__0\(1),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(2),
      O => \p_0_in__2\(2)
    );
\init_wait_count[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(3),
      O => \p_0_in__2\(3)
    );
\init_wait_count[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => \init_wait_count_reg__0\(2),
      I1 => \init_wait_count_reg__0\(0),
      I2 => \init_wait_count_reg__0\(1),
      I3 => \init_wait_count_reg__0\(4),
      I4 => \init_wait_count_reg__0\(3),
      O => \n_0_init_wait_count[4]_i_1__2\
    );
\init_wait_count[4]_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \init_wait_count_reg__0\(3),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(0),
      I3 => \init_wait_count_reg__0\(2),
      I4 => \init_wait_count_reg__0\(4),
      O => \p_0_in__2\(4)
    );
\init_wait_count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__2\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__2\(0),
      Q => \init_wait_count_reg__0\(0)
    );
\init_wait_count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__2\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__2\(1),
      Q => \init_wait_count_reg__0\(1)
    );
\init_wait_count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__2\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__2\(2),
      Q => \init_wait_count_reg__0\(2)
    );
\init_wait_count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__2\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__2\(3),
      Q => \init_wait_count_reg__0\(3)
    );
\init_wait_count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_init_wait_count[4]_i_1__2\,
      CLR => SOFT_RESET_IN,
      D => \p_0_in__2\(4),
      Q => \init_wait_count_reg__0\(4)
    );
\init_wait_done_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF40000000"
    )
    port map (
      I0 => \init_wait_count_reg__0\(0),
      I1 => \init_wait_count_reg__0\(1),
      I2 => \init_wait_count_reg__0\(4),
      I3 => \init_wait_count_reg__0\(3),
      I4 => \init_wait_count_reg__0\(2),
      I5 => init_wait_done,
      O => \n_0_init_wait_done_i_1__2\
    );
init_wait_done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      CLR => SOFT_RESET_IN,
      D => \n_0_init_wait_done_i_1__2\,
      Q => init_wait_done
    );
\mmcm_lock_count[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      O => \n_0_mmcm_lock_count[0]_i_1__2\
    );
\mmcm_lock_count[1]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      O => \p_0_in__6\(1)
    );
\mmcm_lock_count[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      O => \p_0_in__6\(2)
    );
\mmcm_lock_count[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(2),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(1),
      I3 => \mmcm_lock_count_reg__0\(3),
      O => \p_0_in__6\(3)
    );
\mmcm_lock_count[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(1),
      I1 => \mmcm_lock_count_reg__0\(0),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(3),
      I4 => \mmcm_lock_count_reg__0\(4),
      O => \p_0_in__6\(4)
    );
\mmcm_lock_count[5]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(4),
      I1 => \mmcm_lock_count_reg__0\(3),
      I2 => \mmcm_lock_count_reg__0\(2),
      I3 => \mmcm_lock_count_reg__0\(0),
      I4 => \mmcm_lock_count_reg__0\(1),
      I5 => \mmcm_lock_count_reg__0\(5),
      O => \p_0_in__6\(5)
    );
\mmcm_lock_count[6]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \n_0_mmcm_lock_count[9]_i_4__2\,
      I1 => \mmcm_lock_count_reg__0\(6),
      O => \p_0_in__6\(6)
    );
\mmcm_lock_count[7]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D2"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(6),
      I1 => \n_0_mmcm_lock_count[9]_i_4__2\,
      I2 => \mmcm_lock_count_reg__0\(7),
      O => \p_0_in__6\(7)
    );
\mmcm_lock_count[8]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \n_0_mmcm_lock_count[9]_i_4__2\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      O => \p_0_in__6\(8)
    );
\mmcm_lock_count[9]_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(7),
      I1 => \n_0_mmcm_lock_count[9]_i_4__2\,
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \mmcm_lock_count_reg__0\(8),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \n_0_mmcm_lock_count[9]_i_2__2\
    );
\mmcm_lock_count[9]_i_3__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FF0800"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(8),
      I1 => \mmcm_lock_count_reg__0\(6),
      I2 => \n_0_mmcm_lock_count[9]_i_4__2\,
      I3 => \mmcm_lock_count_reg__0\(7),
      I4 => \mmcm_lock_count_reg__0\(9),
      O => \p_0_in__6\(9)
    );
\mmcm_lock_count[9]_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(0),
      I1 => \mmcm_lock_count_reg__0\(1),
      I2 => \mmcm_lock_count_reg__0\(4),
      I3 => \mmcm_lock_count_reg__0\(5),
      I4 => \mmcm_lock_count_reg__0\(2),
      I5 => \mmcm_lock_count_reg__0\(3),
      O => \n_0_mmcm_lock_count[9]_i_4__2\
    );
\mmcm_lock_count_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \n_0_mmcm_lock_count[0]_i_1__2\,
      Q => \mmcm_lock_count_reg__0\(0),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(1),
      Q => \mmcm_lock_count_reg__0\(1),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(2),
      Q => \mmcm_lock_count_reg__0\(2),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(3),
      Q => \mmcm_lock_count_reg__0\(3),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(4),
      Q => \mmcm_lock_count_reg__0\(4),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(5),
      Q => \mmcm_lock_count_reg__0\(5),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(6),
      Q => \mmcm_lock_count_reg__0\(6),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(7),
      Q => \mmcm_lock_count_reg__0\(7),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(8),
      Q => \mmcm_lock_count_reg__0\(8),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_count_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_mmcm_lock_count[9]_i_2__2\,
      D => \p_0_in__6\(9),
      Q => \mmcm_lock_count_reg__0\(9),
      R => n_0_sync_mmcm_lock_reclocked
    );
\mmcm_lock_reclocked_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => \mmcm_lock_count_reg__0\(9),
      I1 => \mmcm_lock_count_reg__0\(8),
      I2 => \mmcm_lock_count_reg__0\(6),
      I3 => \n_0_mmcm_lock_count[9]_i_4__2\,
      I4 => \mmcm_lock_count_reg__0\(7),
      O => \n_0_mmcm_lock_reclocked_i_2__2\
    );
mmcm_lock_reclocked_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_1_sync_mmcm_lock_reclocked,
      Q => mmcm_lock_reclocked,
      R => '0'
    );
\pll_reset_asserted_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55DC"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => n_0_pll_reset_asserted_reg,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__2\,
      I3 => \n_0_FSM_onehot_rx_state[5]_i_2__2\,
      O => \n_0_pll_reset_asserted_i_1__2\
    );
pll_reset_asserted_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_pll_reset_asserted_i_1__2\,
      Q => n_0_pll_reset_asserted_reg,
      R => SOFT_RESET_IN
    );
\reset_time_out_i_11__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_11__2\
    );
\reset_time_out_i_12__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I1 => check_tlock_max,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_12__2\
    );
\reset_time_out_i_13__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[3]\,
      O => \n_0_reset_time_out_i_13__2\
    );
\reset_time_out_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
    port map (
      I0 => I1,
      I1 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_wait_time_cnt[6]_i_4__2\,
      I4 => \n_0_FSM_onehot_rx_state[5]_i_3__2\,
      I5 => \n_0_FSM_onehot_rx_state[3]_i_4__2\,
      O => \n_0_reset_time_out_i_4__2\
    );
\reset_time_out_i_5__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010006"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state[10]_i_3__2\,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__2\,
      I4 => run_phase_alignment_int,
      O => \n_0_reset_time_out_i_5__2\
    );
\reset_time_out_i_6__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000F00040004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[3]_i_4__2\,
      I1 => \n_0_reset_time_out_i_12__2\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state[3]_i_3__2\,
      I4 => \n_0_FSM_onehot_rx_state[2]_i_8__2\,
      I5 => \n_0_reset_time_out_i_13__2\,
      O => \n_0_reset_time_out_i_6__2\
    );
\reset_time_out_i_8__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[5]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I2 => mmcm_lock_reclocked,
      I3 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I4 => check_tlock_max,
      O => \n_0_reset_time_out_i_8__2\
    );
\reset_time_out_i_9__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[4]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[5]\,
      O => \n_0_reset_time_out_i_9__2\
    );
reset_time_out_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_4_sync_data_valid,
      Q => n_0_reset_time_out_reg,
      S => SOFT_RESET_IN
    );
\run_phase_alignment_int_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_run_phase_alignment_int_i_2__2\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_1__2\,
      I3 => n_0_run_phase_alignment_int_reg,
      O => \n_0_run_phase_alignment_int_i_1__2\
    );
\run_phase_alignment_int_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000010"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => run_phase_alignment_int,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__2\,
      I4 => \n_0_FSM_onehot_rx_state[10]_i_3__2\,
      O => \n_0_run_phase_alignment_int_i_2__2\
    );
run_phase_alignment_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_run_phase_alignment_int_i_1__2\,
      Q => n_0_run_phase_alignment_int_reg,
      R => SOFT_RESET_IN
    );
run_phase_alignment_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => run_phase_alignment_int_s2,
      Q => n_0_run_phase_alignment_int_s3_reg,
      R => '0'
    );
\rx_fsm_reset_done_int_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => run_phase_alignment_int,
      I1 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I2 => \n_0_FSM_onehot_rx_state_reg[1]\,
      I3 => \n_0_FSM_onehot_rx_state_reg[7]\,
      I4 => \n_0_FSM_onehot_rx_state_reg[3]\,
      I5 => \n_0_FSM_onehot_rx_state[10]_i_3__2\,
      O => \n_0_rx_fsm_reset_done_int_i_3__2\
    );
\rx_fsm_reset_done_int_i_6__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state_reg[11]\,
      I1 => \n_0_FSM_onehot_rx_state_reg[10]\,
      I2 => \n_0_FSM_onehot_rx_state[10]_i_3__2\,
      I3 => \n_0_FSM_onehot_rx_state[10]_i_2__2\,
      I4 => run_phase_alignment_int,
      O => \n_0_rx_fsm_reset_done_int_i_6__2\
    );
rx_fsm_reset_done_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_5_sync_data_valid,
      Q => \^gt3_rx_fsm_reset_done_out\,
      R => SOFT_RESET_IN
    );
rx_fsm_reset_done_int_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => rx_fsm_reset_done_int_s2,
      Q => n_0_rx_fsm_reset_done_int_s3_reg,
      R => '0'
    );
rxresetdone_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => rxresetdone_s2,
      Q => rxresetdone_s3,
      R => '0'
    );
sync_QPLLLOCK: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_12\
    port map (
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      I1 => n_0_pll_reset_asserted_reg,
      I10 => I1,
      I2 => \n_0_FSM_onehot_rx_state[11]_i_14__2\,
      I3 => \n_0_FSM_onehot_rx_state[11]_i_15__2\,
      I4 => n_3_sync_data_valid,
      I5 => \n_0_reset_time_out_i_9__2\,
      I6 => \n_0_FSM_onehot_rx_state[3]_i_4__2\,
      I7 => \n_0_FSM_onehot_rx_state[5]_i_3__2\,
      I8 => \n_0_wait_time_cnt[6]_i_4__2\,
      I9 => \n_0_reset_time_out_i_11__2\,
      O1 => n_0_sync_QPLLLOCK,
      O2 => n_1_sync_QPLLLOCK,
      O3 => n_2_sync_QPLLLOCK,
      O4 => n_3_sync_QPLLLOCK,
      Q(6) => \n_0_FSM_onehot_rx_state_reg[10]\,
      Q(5) => \n_0_FSM_onehot_rx_state_reg[7]\,
      Q(4) => \n_0_FSM_onehot_rx_state_reg[5]\,
      Q(3) => \n_0_FSM_onehot_rx_state_reg[4]\,
      Q(2) => \n_0_FSM_onehot_rx_state_reg[3]\,
      Q(1) => \n_0_FSM_onehot_rx_state_reg[2]\,
      Q(0) => \n_0_FSM_onehot_rx_state_reg[1]\,
      SYSCLK_IN => SYSCLK_IN
    );
sync_RXRESETDONE: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_13\
    port map (
      SYSCLK_IN => SYSCLK_IN,
      data_out => rxresetdone_s2,
      gt3_rxresetdone_out => gt3_rxresetdone_out
    );
sync_data_valid: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_14\
    port map (
      D(1) => n_1_sync_data_valid,
      D(0) => n_2_sync_data_valid,
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      E(0) => n_0_sync_data_valid,
      GT3_DATA_VALID_IN => GT3_DATA_VALID_IN,
      GT3_RX_FSM_RESET_DONE_OUT => \^gt3_rx_fsm_reset_done_out\,
      I1 => n_1_sync_QPLLLOCK,
      I10 => \n_0_FSM_onehot_rx_state[11]_i_12__2\,
      I11 => n_0_sync_QPLLLOCK,
      I12 => n_0_time_out_1us_reg,
      I13 => n_0_reset_time_out_reg,
      I14 => \n_0_FSM_onehot_rx_state[2]_i_2__2\,
      I15 => \n_0_FSM_onehot_rx_state[5]_i_2__2\,
      I16 => n_0_time_out_2ms_reg,
      I17 => \n_0_FSM_onehot_rx_state[2]_i_4__2\,
      I18 => \n_0_FSM_onehot_rx_state[2]_i_5__2\,
      I19 => n_3_sync_QPLLLOCK,
      I2 => \n_0_FSM_onehot_rx_state[11]_i_5__2\,
      I20 => \n_0_reset_time_out_i_8__2\,
      I21 => \n_0_FSM_onehot_rx_state[10]_i_2__2\,
      I22 => n_0_time_out_100us_reg,
      I23 => \n_0_rx_fsm_reset_done_int_i_6__2\,
      I24 => n_2_sync_QPLLLOCK,
      I25 => \n_0_reset_time_out_i_4__2\,
      I26 => \n_0_reset_time_out_i_5__2\,
      I27 => \n_0_reset_time_out_i_6__2\,
      I28 => \n_0_rx_fsm_reset_done_int_i_3__2\,
      I3(0) => \n_0_wait_time_cnt[6]_i_2__2\,
      I4 => \n_0_FSM_onehot_rx_state[11]_i_6__1\,
      I5 => \n_0_FSM_onehot_rx_state[11]_i_16__1\,
      I6 => \n_0_FSM_onehot_rx_state[10]_i_3__2\,
      I7 => \n_0_FSM_onehot_rx_state[11]_i_8__1\,
      I8 => \n_0_FSM_onehot_rx_state[11]_i_10__1\,
      I9 => \n_0_FSM_onehot_rx_state[11]_i_11__1\,
      O1 => n_3_sync_data_valid,
      O2 => n_4_sync_data_valid,
      O3 => n_5_sync_data_valid,
      Q(3) => \n_0_FSM_onehot_rx_state_reg[11]\,
      Q(2) => \n_0_FSM_onehot_rx_state_reg[10]\,
      Q(1) => run_phase_alignment_int,
      Q(0) => \n_0_FSM_onehot_rx_state_reg[8]\,
      SYSCLK_IN => SYSCLK_IN,
      rxresetdone_s3 => rxresetdone_s3
    );
sync_mmcm_lock_reclocked: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_15\
    port map (
      I1 => \n_0_mmcm_lock_reclocked_i_2__2\,
      O1 => n_1_sync_mmcm_lock_reclocked,
      SR(0) => n_0_sync_mmcm_lock_reclocked,
      SYSCLK_IN => SYSCLK_IN,
      mmcm_lock_reclocked => mmcm_lock_reclocked
    );
sync_run_phase_alignment_int: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_16\
    port map (
      data_in => n_0_run_phase_alignment_int_reg,
      data_out => run_phase_alignment_int_s2,
      gt3_rxusrclk_in => gt3_rxusrclk_in
    );
sync_rx_fsm_reset_done_int: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_17\
    port map (
      GT3_RX_FSM_RESET_DONE_OUT => \^gt3_rx_fsm_reset_done_out\,
      data_out => rx_fsm_reset_done_int_s2,
      gt3_rxusrclk_in => gt3_rxusrclk_in
    );
sync_time_out_wait_bypass: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_18\
    port map (
      SYSCLK_IN => SYSCLK_IN,
      data_in => n_0_time_out_wait_bypass_reg,
      data_out => time_out_wait_bypass_s2
    );
\time_out_100us_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00010000"
    )
    port map (
      I0 => \n_0_time_out_counter[0]_i_3__2\,
      I1 => \n_0_time_out_100us_i_2__2\,
      I2 => time_out_counter_reg(10),
      I3 => time_out_counter_reg(11),
      I4 => \n_0_time_out_100us_i_3__2\,
      I5 => n_0_time_out_100us_reg,
      O => \n_0_time_out_100us_i_1__2\
    );
\time_out_100us_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      O => \n_0_time_out_100us_i_2__2\
    );
\time_out_100us_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010000000000000"
    )
    port map (
      I0 => time_out_counter_reg(16),
      I1 => time_out_counter_reg(13),
      I2 => time_out_counter_reg(12),
      I3 => time_out_counter_reg(3),
      I4 => time_out_counter_reg(1),
      I5 => time_out_counter_reg(2),
      O => \n_0_time_out_100us_i_3__2\
    );
time_out_100us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_100us_i_1__2\,
      Q => n_0_time_out_100us_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_1us_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000002"
    )
    port map (
      I0 => \n_0_time_out_1us_i_2__2\,
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(11),
      I4 => time_out_counter_reg(10),
      I5 => n_0_time_out_1us_reg,
      O => \n_0_time_out_1us_i_1__2\
    );
\time_out_1us_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000100000000"
    )
    port map (
      I0 => \n_0_time_out_2ms_i_3__2\,
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(15),
      I3 => time_out_counter_reg(8),
      I4 => time_out_counter_reg(9),
      I5 => \n_0_time_out_1us_i_3__2\,
      O => \n_0_time_out_1us_i_2__2\
    );
\time_out_1us_i_3__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
    port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(6),
      I2 => time_out_counter_reg(5),
      I3 => time_out_counter_reg(4),
      I4 => time_out_counter_reg(7),
      O => \n_0_time_out_1us_i_3__2\
    );
time_out_1us_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_1us_i_1__2\,
      Q => n_0_time_out_1us_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_2ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => \n_0_time_out_2ms_i_2__2\,
      I1 => \n_0_time_out_counter[0]_i_3__2\,
      I2 => \n_0_time_out_2ms_i_3__2\,
      I3 => n_0_time_out_2ms_reg,
      O => \n_0_time_out_2ms_i_1__2\
    );
\time_out_2ms_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
    port map (
      I0 => time_out_counter_reg(13),
      I1 => time_out_counter_reg(14),
      I2 => time_out_counter_reg(11),
      I3 => time_out_counter_reg(10),
      I4 => time_out_counter_reg(16),
      I5 => time_out_counter_reg(15),
      O => \n_0_time_out_2ms_i_2__2\
    );
\time_out_2ms_i_3__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(1),
      I2 => time_out_counter_reg(3),
      I3 => time_out_counter_reg(12),
      O => \n_0_time_out_2ms_i_3__2\
    );
time_out_2ms_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_out_2ms_i_1__2\,
      Q => n_0_time_out_2ms_reg,
      R => n_0_reset_time_out_reg
    );
\time_out_counter[0]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => time_out_counter_reg(10),
      I1 => \n_0_time_out_counter[0]_i_3__2\,
      I2 => \n_0_time_out_counter[0]_i_4__2\,
      O => \n_0_time_out_counter[0]_i_1__2\
    );
\time_out_counter[0]_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
    port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      I2 => time_out_counter_reg(7),
      I3 => time_out_counter_reg(6),
      I4 => time_out_counter_reg(0),
      I5 => \n_0_time_out_counter[0]_i_9__2\,
      O => \n_0_time_out_counter[0]_i_3__2\
    );
\time_out_counter[0]_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFFFFF"
    )
    port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(16),
      I2 => time_out_counter_reg(13),
      I3 => time_out_counter_reg(14),
      I4 => time_out_counter_reg(11),
      I5 => \n_0_time_out_2ms_i_3__2\,
      O => \n_0_time_out_counter[0]_i_4__2\
    );
\time_out_counter[0]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(3),
      O => \n_0_time_out_counter[0]_i_5__2\
    );
\time_out_counter[0]_i_6__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(2),
      O => \n_0_time_out_counter[0]_i_6__2\
    );
\time_out_counter[0]_i_7__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(1),
      O => \n_0_time_out_counter[0]_i_7__2\
    );
\time_out_counter[0]_i_8__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(0),
      O => \n_0_time_out_counter[0]_i_8__2\
    );
\time_out_counter[0]_i_9__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      O => \n_0_time_out_counter[0]_i_9__2\
    );
\time_out_counter[12]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(15),
      O => \n_0_time_out_counter[12]_i_2__2\
    );
\time_out_counter[12]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(14),
      O => \n_0_time_out_counter[12]_i_3__2\
    );
\time_out_counter[12]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(13),
      O => \n_0_time_out_counter[12]_i_4__2\
    );
\time_out_counter[12]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(12),
      O => \n_0_time_out_counter[12]_i_5__2\
    );
\time_out_counter[16]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(16),
      O => \n_0_time_out_counter[16]_i_2__2\
    );
\time_out_counter[4]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(7),
      O => \n_0_time_out_counter[4]_i_2__2\
    );
\time_out_counter[4]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(6),
      O => \n_0_time_out_counter[4]_i_3__2\
    );
\time_out_counter[4]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(5),
      O => \n_0_time_out_counter[4]_i_4__2\
    );
\time_out_counter[4]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(4),
      O => \n_0_time_out_counter[4]_i_5__2\
    );
\time_out_counter[8]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(11),
      O => \n_0_time_out_counter[8]_i_2__2\
    );
\time_out_counter[8]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(10),
      O => \n_0_time_out_counter[8]_i_3__2\
    );
\time_out_counter[8]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(9),
      O => \n_0_time_out_counter[8]_i_4__2\
    );
\time_out_counter[8]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(8),
      O => \n_0_time_out_counter[8]_i_5__2\
    );
\time_out_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_7_time_out_counter_reg[0]_i_2__2\,
      Q => time_out_counter_reg(0),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[0]_i_2__2\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_time_out_counter_reg[0]_i_2__2\,
      CO(2) => \n_1_time_out_counter_reg[0]_i_2__2\,
      CO(1) => \n_2_time_out_counter_reg[0]_i_2__2\,
      CO(0) => \n_3_time_out_counter_reg[0]_i_2__2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_time_out_counter_reg[0]_i_2__2\,
      O(2) => \n_5_time_out_counter_reg[0]_i_2__2\,
      O(1) => \n_6_time_out_counter_reg[0]_i_2__2\,
      O(0) => \n_7_time_out_counter_reg[0]_i_2__2\,
      S(3) => \n_0_time_out_counter[0]_i_5__2\,
      S(2) => \n_0_time_out_counter[0]_i_6__2\,
      S(1) => \n_0_time_out_counter[0]_i_7__2\,
      S(0) => \n_0_time_out_counter[0]_i_8__2\
    );
\time_out_counter_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_5_time_out_counter_reg[8]_i_1__2\,
      Q => time_out_counter_reg(10),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_4_time_out_counter_reg[8]_i_1__2\,
      Q => time_out_counter_reg(11),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_7_time_out_counter_reg[12]_i_1__2\,
      Q => time_out_counter_reg(12),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[12]_i_1__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[8]_i_1__2\,
      CO(3) => \n_0_time_out_counter_reg[12]_i_1__2\,
      CO(2) => \n_1_time_out_counter_reg[12]_i_1__2\,
      CO(1) => \n_2_time_out_counter_reg[12]_i_1__2\,
      CO(0) => \n_3_time_out_counter_reg[12]_i_1__2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[12]_i_1__2\,
      O(2) => \n_5_time_out_counter_reg[12]_i_1__2\,
      O(1) => \n_6_time_out_counter_reg[12]_i_1__2\,
      O(0) => \n_7_time_out_counter_reg[12]_i_1__2\,
      S(3) => \n_0_time_out_counter[12]_i_2__2\,
      S(2) => \n_0_time_out_counter[12]_i_3__2\,
      S(1) => \n_0_time_out_counter[12]_i_4__2\,
      S(0) => \n_0_time_out_counter[12]_i_5__2\
    );
\time_out_counter_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_6_time_out_counter_reg[12]_i_1__2\,
      Q => time_out_counter_reg(13),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_5_time_out_counter_reg[12]_i_1__2\,
      Q => time_out_counter_reg(14),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_4_time_out_counter_reg[12]_i_1__2\,
      Q => time_out_counter_reg(15),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_7_time_out_counter_reg[16]_i_1__2\,
      Q => time_out_counter_reg(16),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[16]_i_1__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[12]_i_1__2\,
      CO(3 downto 0) => \NLW_time_out_counter_reg[16]_i_1__2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_time_out_counter_reg[16]_i_1__2_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_time_out_counter_reg[16]_i_1__2\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_time_out_counter[16]_i_2__2\
    );
\time_out_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_6_time_out_counter_reg[0]_i_2__2\,
      Q => time_out_counter_reg(1),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_5_time_out_counter_reg[0]_i_2__2\,
      Q => time_out_counter_reg(2),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_4_time_out_counter_reg[0]_i_2__2\,
      Q => time_out_counter_reg(3),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_7_time_out_counter_reg[4]_i_1__2\,
      Q => time_out_counter_reg(4),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[4]_i_1__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[0]_i_2__2\,
      CO(3) => \n_0_time_out_counter_reg[4]_i_1__2\,
      CO(2) => \n_1_time_out_counter_reg[4]_i_1__2\,
      CO(1) => \n_2_time_out_counter_reg[4]_i_1__2\,
      CO(0) => \n_3_time_out_counter_reg[4]_i_1__2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[4]_i_1__2\,
      O(2) => \n_5_time_out_counter_reg[4]_i_1__2\,
      O(1) => \n_6_time_out_counter_reg[4]_i_1__2\,
      O(0) => \n_7_time_out_counter_reg[4]_i_1__2\,
      S(3) => \n_0_time_out_counter[4]_i_2__2\,
      S(2) => \n_0_time_out_counter[4]_i_3__2\,
      S(1) => \n_0_time_out_counter[4]_i_4__2\,
      S(0) => \n_0_time_out_counter[4]_i_5__2\
    );
\time_out_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_6_time_out_counter_reg[4]_i_1__2\,
      Q => time_out_counter_reg(5),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_5_time_out_counter_reg[4]_i_1__2\,
      Q => time_out_counter_reg(6),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_4_time_out_counter_reg[4]_i_1__2\,
      Q => time_out_counter_reg(7),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_7_time_out_counter_reg[8]_i_1__2\,
      Q => time_out_counter_reg(8),
      R => n_0_reset_time_out_reg
    );
\time_out_counter_reg[8]_i_1__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_out_counter_reg[4]_i_1__2\,
      CO(3) => \n_0_time_out_counter_reg[8]_i_1__2\,
      CO(2) => \n_1_time_out_counter_reg[8]_i_1__2\,
      CO(1) => \n_2_time_out_counter_reg[8]_i_1__2\,
      CO(0) => \n_3_time_out_counter_reg[8]_i_1__2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_time_out_counter_reg[8]_i_1__2\,
      O(2) => \n_5_time_out_counter_reg[8]_i_1__2\,
      O(1) => \n_6_time_out_counter_reg[8]_i_1__2\,
      O(0) => \n_7_time_out_counter_reg[8]_i_1__2\,
      S(3) => \n_0_time_out_counter[8]_i_2__2\,
      S(2) => \n_0_time_out_counter[8]_i_3__2\,
      S(1) => \n_0_time_out_counter[8]_i_4__2\,
      S(0) => \n_0_time_out_counter[8]_i_5__2\
    );
\time_out_counter_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => \n_0_time_out_counter[0]_i_1__2\,
      D => \n_6_time_out_counter_reg[8]_i_1__2\,
      Q => time_out_counter_reg(9),
      R => n_0_reset_time_out_reg
    );
\time_out_wait_bypass_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF0100000000"
    )
    port map (
      I0 => \n_0_wait_bypass_count[0]_i_4__2\,
      I1 => wait_bypass_count_reg(3),
      I2 => \n_0_wait_bypass_count[0]_i_5__2\,
      I3 => n_0_time_out_wait_bypass_reg,
      I4 => n_0_rx_fsm_reset_done_int_s3_reg,
      I5 => n_0_run_phase_alignment_int_s3_reg,
      O => \n_0_time_out_wait_bypass_i_1__2\
    );
time_out_wait_bypass_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_rxusrclk_in,
      CE => '1',
      D => \n_0_time_out_wait_bypass_i_1__2\,
      Q => n_0_time_out_wait_bypass_reg,
      R => '0'
    );
time_out_wait_bypass_s3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => time_out_wait_bypass_s2,
      Q => time_out_wait_bypass_s3,
      R => '0'
    );
\time_tlock_max_i_10__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(12),
      I1 => time_out_counter_reg(13),
      O => \n_0_time_tlock_max_i_10__2\
    );
\time_tlock_max_i_11__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(11),
      I1 => time_out_counter_reg(10),
      O => \n_0_time_tlock_max_i_11__2\
    );
\time_tlock_max_i_12__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(9),
      I1 => time_out_counter_reg(8),
      O => \n_0_time_tlock_max_i_12__2\
    );
\time_tlock_max_i_13__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(4),
      I1 => time_out_counter_reg(5),
      O => \n_0_time_tlock_max_i_13__2\
    );
\time_tlock_max_i_14__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => time_out_counter_reg(0),
      I1 => time_out_counter_reg(1),
      O => \n_0_time_tlock_max_i_14__2\
    );
\time_tlock_max_i_15__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(6),
      I1 => time_out_counter_reg(7),
      O => \n_0_time_tlock_max_i_15__2\
    );
\time_tlock_max_i_16__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(5),
      I1 => time_out_counter_reg(4),
      O => \n_0_time_tlock_max_i_16__2\
    );
\time_tlock_max_i_17__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(2),
      I1 => time_out_counter_reg(3),
      O => \n_0_time_tlock_max_i_17__2\
    );
\time_tlock_max_i_18__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => time_out_counter_reg(1),
      I1 => time_out_counter_reg(0),
      O => \n_0_time_tlock_max_i_18__2\
    );
\time_tlock_max_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => n_0_check_tlock_max_reg,
      I1 => time_tlock_max1,
      I2 => time_tlock_max,
      O => \n_0_time_tlock_max_i_1__2\
    );
\time_tlock_max_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(16),
      O => \n_0_time_tlock_max_i_4__2\
    );
\time_tlock_max_i_6__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(14),
      I1 => time_out_counter_reg(15),
      O => \n_0_time_tlock_max_i_6__2\
    );
\time_tlock_max_i_7__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(10),
      I1 => time_out_counter_reg(11),
      O => \n_0_time_tlock_max_i_7__2\
    );
\time_tlock_max_i_8__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => time_out_counter_reg(8),
      I1 => time_out_counter_reg(9),
      O => \n_0_time_tlock_max_i_8__2\
    );
\time_tlock_max_i_9__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => time_out_counter_reg(15),
      I1 => time_out_counter_reg(14),
      O => \n_0_time_tlock_max_i_9__2\
    );
time_tlock_max_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => \n_0_time_tlock_max_i_1__2\,
      Q => time_tlock_max,
      R => n_0_reset_time_out_reg
    );
\time_tlock_max_reg_i_2__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_tlock_max_reg_i_3__2\,
      CO(3 downto 1) => \NLW_time_tlock_max_reg_i_2__2_CO_UNCONNECTED\(3 downto 1),
      CO(0) => time_tlock_max1,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => time_out_counter_reg(16),
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_2__2_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_time_tlock_max_i_4__2\
    );
\time_tlock_max_reg_i_3__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_time_tlock_max_reg_i_5__2\,
      CO(3) => \n_0_time_tlock_max_reg_i_3__2\,
      CO(2) => \n_1_time_tlock_max_reg_i_3__2\,
      CO(1) => \n_2_time_tlock_max_reg_i_3__2\,
      CO(0) => \n_3_time_tlock_max_reg_i_3__2\,
      CYINIT => '0',
      DI(3) => \n_0_time_tlock_max_i_6__2\,
      DI(2) => time_out_counter_reg(13),
      DI(1) => \n_0_time_tlock_max_i_7__2\,
      DI(0) => \n_0_time_tlock_max_i_8__2\,
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_3__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_time_tlock_max_i_9__2\,
      S(2) => \n_0_time_tlock_max_i_10__2\,
      S(1) => \n_0_time_tlock_max_i_11__2\,
      S(0) => \n_0_time_tlock_max_i_12__2\
    );
\time_tlock_max_reg_i_5__2\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_time_tlock_max_reg_i_5__2\,
      CO(2) => \n_1_time_tlock_max_reg_i_5__2\,
      CO(1) => \n_2_time_tlock_max_reg_i_5__2\,
      CO(0) => \n_3_time_tlock_max_reg_i_5__2\,
      CYINIT => '0',
      DI(3) => time_out_counter_reg(7),
      DI(2) => \n_0_time_tlock_max_i_13__2\,
      DI(1) => time_out_counter_reg(3),
      DI(0) => \n_0_time_tlock_max_i_14__2\,
      O(3 downto 0) => \NLW_time_tlock_max_reg_i_5__2_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_time_tlock_max_i_15__2\,
      S(2) => \n_0_time_tlock_max_i_16__2\,
      S(1) => \n_0_time_tlock_max_i_17__2\,
      S(0) => \n_0_time_tlock_max_i_18__2\
    );
\wait_bypass_count[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => n_0_run_phase_alignment_int_s3_reg,
      O => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count[0]_i_2__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FE"
    )
    port map (
      I0 => \n_0_wait_bypass_count[0]_i_4__2\,
      I1 => wait_bypass_count_reg(3),
      I2 => \n_0_wait_bypass_count[0]_i_5__2\,
      I3 => n_0_rx_fsm_reset_done_int_s3_reg,
      O => \n_0_wait_bypass_count[0]_i_2__2\
    );
\wait_bypass_count[0]_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEFFFFFFFFFFF"
    )
    port map (
      I0 => wait_bypass_count_reg(11),
      I1 => wait_bypass_count_reg(4),
      I2 => wait_bypass_count_reg(0),
      I3 => wait_bypass_count_reg(9),
      I4 => wait_bypass_count_reg(10),
      I5 => wait_bypass_count_reg(2),
      O => \n_0_wait_bypass_count[0]_i_4__2\
    );
\wait_bypass_count[0]_i_5__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFFFFFFFF"
    )
    port map (
      I0 => wait_bypass_count_reg(1),
      I1 => wait_bypass_count_reg(6),
      I2 => wait_bypass_count_reg(5),
      I3 => wait_bypass_count_reg(12),
      I4 => wait_bypass_count_reg(8),
      I5 => wait_bypass_count_reg(7),
      O => \n_0_wait_bypass_count[0]_i_5__2\
    );
\wait_bypass_count[0]_i_6__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(3),
      O => \n_0_wait_bypass_count[0]_i_6__2\
    );
\wait_bypass_count[0]_i_7__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(2),
      O => \n_0_wait_bypass_count[0]_i_7__2\
    );
\wait_bypass_count[0]_i_8__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(1),
      O => \n_0_wait_bypass_count[0]_i_8__2\
    );
\wait_bypass_count[0]_i_9__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wait_bypass_count_reg(0),
      O => \n_0_wait_bypass_count[0]_i_9__2\
    );
\wait_bypass_count[12]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(12),
      O => \n_0_wait_bypass_count[12]_i_2__2\
    );
\wait_bypass_count[4]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(7),
      O => \n_0_wait_bypass_count[4]_i_2__2\
    );
\wait_bypass_count[4]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(6),
      O => \n_0_wait_bypass_count[4]_i_3__2\
    );
\wait_bypass_count[4]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(5),
      O => \n_0_wait_bypass_count[4]_i_4__2\
    );
\wait_bypass_count[4]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(4),
      O => \n_0_wait_bypass_count[4]_i_5__2\
    );
\wait_bypass_count[8]_i_2__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(11),
      O => \n_0_wait_bypass_count[8]_i_2__2\
    );
\wait_bypass_count[8]_i_3__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(10),
      O => \n_0_wait_bypass_count[8]_i_3__2\
    );
\wait_bypass_count[8]_i_4__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(9),
      O => \n_0_wait_bypass_count[8]_i_4__2\
    );
\wait_bypass_count[8]_i_5__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wait_bypass_count_reg(8),
      O => \n_0_wait_bypass_count[8]_i_5__2\
    );
\wait_bypass_count_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_7_wait_bypass_count_reg[0]_i_3__2\,
      Q => wait_bypass_count_reg(0),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[0]_i_3__2\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_wait_bypass_count_reg[0]_i_3__2\,
      CO(2) => \n_1_wait_bypass_count_reg[0]_i_3__2\,
      CO(1) => \n_2_wait_bypass_count_reg[0]_i_3__2\,
      CO(0) => \n_3_wait_bypass_count_reg[0]_i_3__2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \n_4_wait_bypass_count_reg[0]_i_3__2\,
      O(2) => \n_5_wait_bypass_count_reg[0]_i_3__2\,
      O(1) => \n_6_wait_bypass_count_reg[0]_i_3__2\,
      O(0) => \n_7_wait_bypass_count_reg[0]_i_3__2\,
      S(3) => \n_0_wait_bypass_count[0]_i_6__2\,
      S(2) => \n_0_wait_bypass_count[0]_i_7__2\,
      S(1) => \n_0_wait_bypass_count[0]_i_8__2\,
      S(0) => \n_0_wait_bypass_count[0]_i_9__2\
    );
\wait_bypass_count_reg[10]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_5_wait_bypass_count_reg[8]_i_1__2\,
      Q => wait_bypass_count_reg(10),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[11]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_4_wait_bypass_count_reg[8]_i_1__2\,
      Q => wait_bypass_count_reg(11),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[12]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_7_wait_bypass_count_reg[12]_i_1__2\,
      Q => wait_bypass_count_reg(12),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[12]_i_1__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[8]_i_1__2\,
      CO(3 downto 0) => \NLW_wait_bypass_count_reg[12]_i_1__2_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_wait_bypass_count_reg[12]_i_1__2_O_UNCONNECTED\(3 downto 1),
      O(0) => \n_7_wait_bypass_count_reg[12]_i_1__2\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \n_0_wait_bypass_count[12]_i_2__2\
    );
\wait_bypass_count_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_6_wait_bypass_count_reg[0]_i_3__2\,
      Q => wait_bypass_count_reg(1),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[2]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_5_wait_bypass_count_reg[0]_i_3__2\,
      Q => wait_bypass_count_reg(2),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_4_wait_bypass_count_reg[0]_i_3__2\,
      Q => wait_bypass_count_reg(3),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_7_wait_bypass_count_reg[4]_i_1__2\,
      Q => wait_bypass_count_reg(4),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[4]_i_1__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[0]_i_3__2\,
      CO(3) => \n_0_wait_bypass_count_reg[4]_i_1__2\,
      CO(2) => \n_1_wait_bypass_count_reg[4]_i_1__2\,
      CO(1) => \n_2_wait_bypass_count_reg[4]_i_1__2\,
      CO(0) => \n_3_wait_bypass_count_reg[4]_i_1__2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_wait_bypass_count_reg[4]_i_1__2\,
      O(2) => \n_5_wait_bypass_count_reg[4]_i_1__2\,
      O(1) => \n_6_wait_bypass_count_reg[4]_i_1__2\,
      O(0) => \n_7_wait_bypass_count_reg[4]_i_1__2\,
      S(3) => \n_0_wait_bypass_count[4]_i_2__2\,
      S(2) => \n_0_wait_bypass_count[4]_i_3__2\,
      S(1) => \n_0_wait_bypass_count[4]_i_4__2\,
      S(0) => \n_0_wait_bypass_count[4]_i_5__2\
    );
\wait_bypass_count_reg[5]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_6_wait_bypass_count_reg[4]_i_1__2\,
      Q => wait_bypass_count_reg(5),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[6]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_5_wait_bypass_count_reg[4]_i_1__2\,
      Q => wait_bypass_count_reg(6),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[7]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_4_wait_bypass_count_reg[4]_i_1__2\,
      Q => wait_bypass_count_reg(7),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[8]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_7_wait_bypass_count_reg[8]_i_1__2\,
      Q => wait_bypass_count_reg(8),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_bypass_count_reg[8]_i_1__2\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_wait_bypass_count_reg[4]_i_1__2\,
      CO(3) => \n_0_wait_bypass_count_reg[8]_i_1__2\,
      CO(2) => \n_1_wait_bypass_count_reg[8]_i_1__2\,
      CO(1) => \n_2_wait_bypass_count_reg[8]_i_1__2\,
      CO(0) => \n_3_wait_bypass_count_reg[8]_i_1__2\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \n_4_wait_bypass_count_reg[8]_i_1__2\,
      O(2) => \n_5_wait_bypass_count_reg[8]_i_1__2\,
      O(1) => \n_6_wait_bypass_count_reg[8]_i_1__2\,
      O(0) => \n_7_wait_bypass_count_reg[8]_i_1__2\,
      S(3) => \n_0_wait_bypass_count[8]_i_2__2\,
      S(2) => \n_0_wait_bypass_count[8]_i_3__2\,
      S(1) => \n_0_wait_bypass_count[8]_i_4__2\,
      S(0) => \n_0_wait_bypass_count[8]_i_5__2\
    );
\wait_bypass_count_reg[9]\: unisim.vcomponents.FDRE
    port map (
      C => gt3_rxusrclk_in,
      CE => \n_0_wait_bypass_count[0]_i_2__2\,
      D => \n_6_wait_bypass_count_reg[8]_i_1__2\,
      Q => wait_bypass_count_reg(9),
      R => \n_0_wait_bypass_count[0]_i_1__2\
    );
\wait_time_cnt[0]_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__2\(0)
    );
\wait_time_cnt[1]_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(1),
      I1 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__2\(1)
    );
\wait_time_cnt[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(2),
      I1 => \wait_time_cnt_reg__0\(0),
      I2 => \wait_time_cnt_reg__0\(1),
      O => \wait_time_cnt0__2\(2)
    );
\wait_time_cnt[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(1),
      I1 => \wait_time_cnt_reg__0\(0),
      I2 => \wait_time_cnt_reg__0\(2),
      I3 => \wait_time_cnt_reg__0\(3),
      O => \wait_time_cnt0__2\(3)
    );
\wait_time_cnt[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(4),
      I1 => \wait_time_cnt_reg__0\(3),
      I2 => \wait_time_cnt_reg__0\(2),
      I3 => \wait_time_cnt_reg__0\(0),
      I4 => \wait_time_cnt_reg__0\(1),
      O => \wait_time_cnt0__2\(4)
    );
\wait_time_cnt[5]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0F0E1"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(3),
      I1 => \wait_time_cnt_reg__0\(2),
      I2 => \wait_time_cnt_reg__0\(5),
      I3 => \wait_time_cnt_reg__0\(4),
      I4 => \wait_time_cnt_reg__0\(1),
      I5 => \wait_time_cnt_reg__0\(0),
      O => \wait_time_cnt0__2\(5)
    );
\wait_time_cnt[6]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
    port map (
      I0 => \n_0_FSM_onehot_rx_state[11]_i_6__1\,
      I1 => \n_0_wait_time_cnt[6]_i_4__2\,
      I2 => \n_0_FSM_onehot_rx_state[3]_i_3__2\,
      I3 => \n_0_FSM_onehot_rx_state_reg[8]\,
      I4 => run_phase_alignment_int,
      I5 => \n_0_FSM_onehot_rx_state_reg[4]\,
      O => \n_0_wait_time_cnt[6]_i_1__2\
    );
\wait_time_cnt[6]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(6),
      I1 => \wait_time_cnt_reg__0\(1),
      I2 => \wait_time_cnt_reg__0\(0),
      I3 => \n_0_wait_time_cnt[6]_i_5__2\,
      I4 => \wait_time_cnt_reg__0\(4),
      I5 => \wait_time_cnt_reg__0\(5),
      O => \n_0_wait_time_cnt[6]_i_2__2\
    );
\wait_time_cnt[6]_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00000001"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(5),
      I1 => \wait_time_cnt_reg__0\(4),
      I2 => \n_0_wait_time_cnt[6]_i_5__2\,
      I3 => \wait_time_cnt_reg__0\(0),
      I4 => \wait_time_cnt_reg__0\(1),
      I5 => \wait_time_cnt_reg__0\(6),
      O => \wait_time_cnt0__2\(6)
    );
\wait_time_cnt[6]_i_4__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => check_tlock_max,
      I1 => \n_0_FSM_onehot_rx_state_reg[2]\,
      O => \n_0_wait_time_cnt[6]_i_4__2\
    );
\wait_time_cnt[6]_i_5__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \wait_time_cnt_reg__0\(2),
      I1 => \wait_time_cnt_reg__0\(3),
      O => \n_0_wait_time_cnt[6]_i_5__2\
    );
\wait_time_cnt_reg[0]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__2\,
      D => \wait_time_cnt0__2\(0),
      Q => \wait_time_cnt_reg__0\(0),
      R => \n_0_wait_time_cnt[6]_i_1__2\
    );
\wait_time_cnt_reg[1]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__2\,
      D => \wait_time_cnt0__2\(1),
      Q => \wait_time_cnt_reg__0\(1),
      R => \n_0_wait_time_cnt[6]_i_1__2\
    );
\wait_time_cnt_reg[2]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__2\,
      D => \wait_time_cnt0__2\(2),
      Q => \wait_time_cnt_reg__0\(2),
      S => \n_0_wait_time_cnt[6]_i_1__2\
    );
\wait_time_cnt_reg[3]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__2\,
      D => \wait_time_cnt0__2\(3),
      Q => \wait_time_cnt_reg__0\(3),
      R => \n_0_wait_time_cnt[6]_i_1__2\
    );
\wait_time_cnt_reg[4]\: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__2\,
      D => \wait_time_cnt0__2\(4),
      Q => \wait_time_cnt_reg__0\(4),
      R => \n_0_wait_time_cnt[6]_i_1__2\
    );
\wait_time_cnt_reg[5]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__2\,
      D => \wait_time_cnt0__2\(5),
      Q => \wait_time_cnt_reg__0\(5),
      S => \n_0_wait_time_cnt[6]_i_1__2\
    );
\wait_time_cnt_reg[6]\: unisim.vcomponents.FDSE
    port map (
      C => SYSCLK_IN,
      CE => \n_0_wait_time_cnt[6]_i_2__2\,
      D => \wait_time_cnt0__2\(6),
      Q => \wait_time_cnt_reg__0\(6),
      S => \n_0_wait_time_cnt[6]_i_1__2\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq is
  port (
    GTRXRESET_OUT : out STD_LOGIC;
    O1 : out STD_LOGIC;
    DRPDI : out STD_LOGIC_VECTOR ( 15 downto 0 );
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    DRPADDR : out STD_LOGIC_VECTOR ( 8 downto 0 );
    gt3_drpclk_in : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC;
    I1 : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt3_drpdo_out : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpen_in : in STD_LOGIC;
    gt3_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpwe_in : in STD_LOGIC;
    gt3_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq : entity is "gtwizard_32_rx_gtrxreset_seq";
end gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq;

architecture STRUCTURE of gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq is
  signal DRP_OP_DONE : STD_LOGIC;
  signal data_out : STD_LOGIC;
  signal gtrxreset_i : STD_LOGIC;
  signal gtrxreset_ss : STD_LOGIC;
  signal \n_0_drp_op_done_o_i_1__2\ : STD_LOGIC;
  signal n_0_gtrxreset_s_reg : STD_LOGIC;
  signal \n_0_rd_data[15]_i_1__2\ : STD_LOGIC;
  signal \n_0_rd_data_reg[0]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[10]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[11]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[12]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[13]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[14]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[15]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[1]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[2]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[3]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[4]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[5]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[6]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[7]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[8]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[9]\ : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rxpmaresetdone_sss : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \drp_busy_i1_i_1__2\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \drp_busy_i1_i_1__2\ : label is "soft_lutpair131";
  attribute SOFT_HLUTNM of \gthe2_i_i_19__2\ : label is "soft_lutpair133";
  attribute SOFT_HLUTNM of \gthe2_i_i_1__2\ : label is "soft_lutpair131";
  attribute SOFT_HLUTNM of \gthe2_i_i_20__2\ : label is "soft_lutpair134";
  attribute SOFT_HLUTNM of \gthe2_i_i_21__2\ : label is "soft_lutpair133";
  attribute SOFT_HLUTNM of \gthe2_i_i_22__2\ : label is "soft_lutpair134";
  attribute SOFT_HLUTNM of \gthe2_i_i_23__2\ : label is "soft_lutpair135";
  attribute SOFT_HLUTNM of \gthe2_i_i_24__2\ : label is "soft_lutpair135";
  attribute SOFT_HLUTNM of \gthe2_i_i_25__2\ : label is "soft_lutpair136";
  attribute SOFT_HLUTNM of \gthe2_i_i_26__2\ : label is "soft_lutpair136";
  attribute SOFT_HLUTNM of \gtrxreset_o_i_1__2\ : label is "soft_lutpair132";
  attribute SOFT_HLUTNM of \state[2]_i_1__2\ : label is "soft_lutpair132";
begin
\drp_busy_i1_i_1__2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => DRP_OP_DONE,
      O => O3
    );
\drp_op_done_o_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
    port map (
      I0 => I1,
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      I4 => DRP_OP_DONE,
      O => \n_0_drp_op_done_o_i_1__2\
    );
drp_op_done_o_reg: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      CLR => I6,
      D => \n_0_drp_op_done_o_i_1__2\,
      Q => DRP_OP_DONE
    );
\gthe2_i_i_10__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(8),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[8]\,
      O => DRPDI(8)
    );
\gthe2_i_i_11__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(7),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[7]\,
      O => DRPDI(7)
    );
\gthe2_i_i_12__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(6),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[6]\,
      O => DRPDI(6)
    );
\gthe2_i_i_13__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(5),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[5]\,
      O => DRPDI(5)
    );
\gthe2_i_i_14__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(4),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[4]\,
      O => DRPDI(4)
    );
\gthe2_i_i_15__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(3),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[3]\,
      O => DRPDI(3)
    );
\gthe2_i_i_16__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(2),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[2]\,
      O => DRPDI(2)
    );
\gthe2_i_i_17__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(1),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[1]\,
      O => DRPDI(1)
    );
\gthe2_i_i_18__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(0),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[0]\,
      O => DRPDI(0)
    );
\gthe2_i_i_19__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt3_drpaddr_in(8),
      O => DRPADDR(8)
    );
\gthe2_i_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B88B8B8"
    )
    port map (
      I0 => gt3_drpen_in,
      I1 => DRP_OP_DONE,
      I2 => state(0),
      I3 => state(1),
      I4 => state(2),
      O => O1
    );
\gthe2_i_i_20__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt3_drpaddr_in(7),
      O => DRPADDR(7)
    );
\gthe2_i_i_21__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt3_drpaddr_in(6),
      O => DRPADDR(6)
    );
\gthe2_i_i_22__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt3_drpaddr_in(5),
      O => DRPADDR(5)
    );
\gthe2_i_i_23__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => gt3_drpaddr_in(4),
      I1 => DRP_OP_DONE,
      O => DRPADDR(4)
    );
\gthe2_i_i_24__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt3_drpaddr_in(3),
      O => DRPADDR(3)
    );
\gthe2_i_i_25__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt3_drpaddr_in(2),
      O => DRPADDR(2)
    );
\gthe2_i_i_26__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt3_drpaddr_in(1),
      O => DRPADDR(1)
    );
\gthe2_i_i_27__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => gt3_drpaddr_in(0),
      I1 => DRP_OP_DONE,
      O => DRPADDR(0)
    );
\gthe2_i_i_2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA3CAA00"
    )
    port map (
      I0 => gt3_drpwe_in,
      I1 => state(2),
      I2 => state(0),
      I3 => DRP_OP_DONE,
      I4 => state(1),
      O => O2
    );
\gthe2_i_i_3__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(15),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[15]\,
      O => DRPDI(15)
    );
\gthe2_i_i_4__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(14),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[14]\,
      O => DRPDI(14)
    );
\gthe2_i_i_5__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(13),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[13]\,
      O => DRPDI(13)
    );
\gthe2_i_i_6__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(12),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[12]\,
      O => DRPDI(12)
    );
\gthe2_i_i_7__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B88888888888888"
    )
    port map (
      I0 => gt3_drpdi_in(11),
      I1 => DRP_OP_DONE,
      I2 => state(0),
      I3 => state(2),
      I4 => \n_0_rd_data_reg[11]\,
      I5 => state(1),
      O => DRPDI(11)
    );
\gthe2_i_i_8__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(10),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[10]\,
      O => DRPDI(10)
    );
\gthe2_i_i_9__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt3_drpdi_in(9),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[9]\,
      O => DRPDI(9)
    );
\gtrxreset_o_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FDA"
    )
    port map (
      I0 => state(0),
      I1 => gtrxreset_ss,
      I2 => state(2),
      I3 => state(1),
      O => gtrxreset_i
    );
gtrxreset_o_reg: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => gtrxreset_i,
      Q => GTRXRESET_OUT
    );
gtrxreset_s_reg: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => I6,
      Q => n_0_gtrxreset_s_reg
    );
gtrxreset_ss_reg: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => n_0_gtrxreset_s_reg,
      Q => gtrxreset_ss
    );
\rd_data[15]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => state(2),
      I1 => I1,
      I2 => state(1),
      I3 => state(0),
      O => \n_0_rd_data[15]_i_1__2\
    );
\rd_data_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(0),
      Q => \n_0_rd_data_reg[0]\
    );
\rd_data_reg[10]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(10),
      Q => \n_0_rd_data_reg[10]\
    );
\rd_data_reg[11]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(11),
      Q => \n_0_rd_data_reg[11]\
    );
\rd_data_reg[12]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(12),
      Q => \n_0_rd_data_reg[12]\
    );
\rd_data_reg[13]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(13),
      Q => \n_0_rd_data_reg[13]\
    );
\rd_data_reg[14]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(14),
      Q => \n_0_rd_data_reg[14]\
    );
\rd_data_reg[15]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(15),
      Q => \n_0_rd_data_reg[15]\
    );
\rd_data_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(1),
      Q => \n_0_rd_data_reg[1]\
    );
\rd_data_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(2),
      Q => \n_0_rd_data_reg[2]\
    );
\rd_data_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(3),
      Q => \n_0_rd_data_reg[3]\
    );
\rd_data_reg[4]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(4),
      Q => \n_0_rd_data_reg[4]\
    );
\rd_data_reg[5]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(5),
      Q => \n_0_rd_data_reg[5]\
    );
\rd_data_reg[6]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(6),
      Q => \n_0_rd_data_reg[6]\
    );
\rd_data_reg[7]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(7),
      Q => \n_0_rd_data_reg[7]\
    );
\rd_data_reg[8]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(8),
      Q => \n_0_rd_data_reg[8]\
    );
\rd_data_reg[9]\: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__2\,
      CLR => AR(0),
      D => gt3_drpdo_out(9),
      Q => \n_0_rd_data_reg[9]\
    );
rxpmaresetdone_sss_reg: unisim.vcomponents.FDCE
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => data_out,
      Q => rxpmaresetdone_sss
    );
\state[2]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F88"
    )
    port map (
      I0 => state(0),
      I1 => state(1),
      I2 => I1,
      I3 => state(2),
      O => next_state(2)
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(0),
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(1),
      Q => state(1)
    );
\state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(2),
      Q => state(2)
    );
sync0_RXPMARESETDONE: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0\
    port map (
      D(1 downto 0) => next_state(1 downto 0),
      I1 => I1,
      Q(2 downto 0) => state(2 downto 0),
      data_in => data_in,
      data_out => data_out,
      gt3_drpclk_in => gt3_drpclk_in,
      gtrxreset_ss => gtrxreset_ss,
      rxpmaresetdone_sss => rxpmaresetdone_sss
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_10 is
  port (
    GTRXRESET_OUT : out STD_LOGIC;
    O1 : out STD_LOGIC;
    DRPDI : out STD_LOGIC_VECTOR ( 15 downto 0 );
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    DRPADDR : out STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpclk_in : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxreset_i : in STD_LOGIC;
    I1 : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt0_drpdo_out : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpwe_in : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_10 : entity is "gtwizard_32_rx_gtrxreset_seq";
end gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_10;

architecture STRUCTURE of gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_10 is
  signal DRP_OP_DONE : STD_LOGIC;
  signal data_out : STD_LOGIC;
  signal gtrxreset_i_0 : STD_LOGIC;
  signal gtrxreset_s : STD_LOGIC;
  signal gtrxreset_ss : STD_LOGIC;
  signal n_0_drp_op_done_o_i_1 : STD_LOGIC;
  signal \n_0_rd_data[15]_i_1\ : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rd_data : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rxpmaresetdone_sss : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of drp_busy_i1_i_1 : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of drp_busy_i1_i_1 : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of gthe2_i_i_1 : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of gthe2_i_i_19 : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of gthe2_i_i_20 : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of gthe2_i_i_21 : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of gthe2_i_i_22 : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of gthe2_i_i_23 : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of gthe2_i_i_24 : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of gthe2_i_i_25 : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of gthe2_i_i_26 : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of gtrxreset_o_i_1 : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \state[2]_i_1\ : label is "soft_lutpair114";
begin
drp_busy_i1_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => DRP_OP_DONE,
      O => O3
    );
drp_op_done_o_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
    port map (
      I0 => I1,
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      I4 => DRP_OP_DONE,
      O => n_0_drp_op_done_o_i_1
    );
drp_op_done_o_reg: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => gtrxreset_i,
      D => n_0_drp_op_done_o_i_1,
      Q => DRP_OP_DONE
    );
gthe2_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B88B8B8"
    )
    port map (
      I0 => gt0_drpen_in,
      I1 => DRP_OP_DONE,
      I2 => state(0),
      I3 => state(1),
      I4 => state(2),
      O => O1
    );
gthe2_i_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(8),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(8),
      O => DRPDI(8)
    );
gthe2_i_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(7),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(7),
      O => DRPDI(7)
    );
gthe2_i_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(6),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(6),
      O => DRPDI(6)
    );
gthe2_i_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(5),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(5),
      O => DRPDI(5)
    );
gthe2_i_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(4),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(4),
      O => DRPDI(4)
    );
gthe2_i_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(3),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(3),
      O => DRPDI(3)
    );
gthe2_i_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(2),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(2),
      O => DRPDI(2)
    );
gthe2_i_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(1),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(1),
      O => DRPDI(1)
    );
gthe2_i_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(0),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(0),
      O => DRPDI(0)
    );
gthe2_i_i_19: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt0_drpaddr_in(8),
      O => DRPADDR(8)
    );
gthe2_i_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA3CAA00"
    )
    port map (
      I0 => gt0_drpwe_in,
      I1 => state(2),
      I2 => state(0),
      I3 => DRP_OP_DONE,
      I4 => state(1),
      O => O2
    );
gthe2_i_i_20: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt0_drpaddr_in(7),
      O => DRPADDR(7)
    );
gthe2_i_i_21: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt0_drpaddr_in(6),
      O => DRPADDR(6)
    );
gthe2_i_i_22: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt0_drpaddr_in(5),
      O => DRPADDR(5)
    );
gthe2_i_i_23: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => gt0_drpaddr_in(4),
      I1 => DRP_OP_DONE,
      O => DRPADDR(4)
    );
gthe2_i_i_24: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt0_drpaddr_in(3),
      O => DRPADDR(3)
    );
gthe2_i_i_25: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt0_drpaddr_in(2),
      O => DRPADDR(2)
    );
gthe2_i_i_26: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt0_drpaddr_in(1),
      O => DRPADDR(1)
    );
gthe2_i_i_27: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => gt0_drpaddr_in(0),
      I1 => DRP_OP_DONE,
      O => DRPADDR(0)
    );
gthe2_i_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(15),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(15),
      O => DRPDI(15)
    );
gthe2_i_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(14),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(14),
      O => DRPDI(14)
    );
gthe2_i_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(13),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(13),
      O => DRPDI(13)
    );
gthe2_i_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(12),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(12),
      O => DRPDI(12)
    );
gthe2_i_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B88888888888888"
    )
    port map (
      I0 => gt0_drpdi_in(11),
      I1 => DRP_OP_DONE,
      I2 => state(0),
      I3 => state(2),
      I4 => rd_data(11),
      I5 => state(1),
      O => DRPDI(11)
    );
gthe2_i_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(10),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(10),
      O => DRPDI(10)
    );
gthe2_i_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt0_drpdi_in(9),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => rd_data(9),
      O => DRPDI(9)
    );
gtrxreset_o_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FDA"
    )
    port map (
      I0 => state(0),
      I1 => gtrxreset_ss,
      I2 => state(2),
      I3 => state(1),
      O => gtrxreset_i_0
    );
gtrxreset_o_reg: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => gtrxreset_i_0,
      Q => GTRXRESET_OUT
    );
gtrxreset_s_reg: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => gtrxreset_i,
      Q => gtrxreset_s
    );
gtrxreset_ss_reg: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => gtrxreset_s,
      Q => gtrxreset_ss
    );
\rd_data[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => state(2),
      I1 => I1,
      I2 => state(1),
      I3 => state(0),
      O => \n_0_rd_data[15]_i_1\
    );
\rd_data_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(0),
      Q => rd_data(0)
    );
\rd_data_reg[10]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(10),
      Q => rd_data(10)
    );
\rd_data_reg[11]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(11),
      Q => rd_data(11)
    );
\rd_data_reg[12]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(12),
      Q => rd_data(12)
    );
\rd_data_reg[13]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(13),
      Q => rd_data(13)
    );
\rd_data_reg[14]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(14),
      Q => rd_data(14)
    );
\rd_data_reg[15]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(15),
      Q => rd_data(15)
    );
\rd_data_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(1),
      Q => rd_data(1)
    );
\rd_data_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(2),
      Q => rd_data(2)
    );
\rd_data_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(3),
      Q => rd_data(3)
    );
\rd_data_reg[4]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(4),
      Q => rd_data(4)
    );
\rd_data_reg[5]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(5),
      Q => rd_data(5)
    );
\rd_data_reg[6]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(6),
      Q => rd_data(6)
    );
\rd_data_reg[7]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(7),
      Q => rd_data(7)
    );
\rd_data_reg[8]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(8),
      Q => rd_data(8)
    );
\rd_data_reg[9]\: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => \n_0_rd_data[15]_i_1\,
      CLR => AR(0),
      D => gt0_drpdo_out(9),
      Q => rd_data(9)
    );
rxpmaresetdone_sss_reg: unisim.vcomponents.FDCE
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => data_out,
      Q => rxpmaresetdone_sss
    );
\state[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F88"
    )
    port map (
      I0 => state(0),
      I1 => state(1),
      I2 => I1,
      I3 => state(2),
      O => next_state(2)
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(0),
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(1),
      Q => state(1)
    );
\state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(2),
      Q => state(2)
    );
sync0_RXPMARESETDONE: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_11\
    port map (
      D(1 downto 0) => next_state(1 downto 0),
      I1 => I1,
      Q(2 downto 0) => state(2 downto 0),
      data_in => data_in,
      data_out => data_out,
      gt0_drpclk_in => gt0_drpclk_in,
      gtrxreset_ss => gtrxreset_ss,
      rxpmaresetdone_sss => rxpmaresetdone_sss
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_6 is
  port (
    GTRXRESET_OUT : out STD_LOGIC;
    O1 : out STD_LOGIC;
    DRPDI : out STD_LOGIC_VECTOR ( 15 downto 0 );
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    DRPADDR : out STD_LOGIC_VECTOR ( 8 downto 0 );
    gt2_drpclk_in : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    I5 : in STD_LOGIC;
    I1 : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt2_drpdo_out : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpen_in : in STD_LOGIC;
    gt2_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpwe_in : in STD_LOGIC;
    gt2_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_6 : entity is "gtwizard_32_rx_gtrxreset_seq";
end gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_6;

architecture STRUCTURE of gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_6 is
  signal DRP_OP_DONE : STD_LOGIC;
  signal data_out : STD_LOGIC;
  signal gtrxreset_i : STD_LOGIC;
  signal gtrxreset_ss : STD_LOGIC;
  signal \n_0_drp_op_done_o_i_1__1\ : STD_LOGIC;
  signal n_0_gtrxreset_s_reg : STD_LOGIC;
  signal \n_0_rd_data[15]_i_1__1\ : STD_LOGIC;
  signal \n_0_rd_data_reg[0]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[10]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[11]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[12]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[13]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[14]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[15]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[1]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[2]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[3]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[4]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[5]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[6]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[7]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[8]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[9]\ : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rxpmaresetdone_sss : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \drp_busy_i1_i_1__1\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \drp_busy_i1_i_1__1\ : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \gthe2_i_i_19__1\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \gthe2_i_i_1__1\ : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \gthe2_i_i_20__1\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \gthe2_i_i_21__1\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \gthe2_i_i_22__1\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \gthe2_i_i_23__1\ : label is "soft_lutpair129";
  attribute SOFT_HLUTNM of \gthe2_i_i_24__1\ : label is "soft_lutpair129";
  attribute SOFT_HLUTNM of \gthe2_i_i_25__1\ : label is "soft_lutpair130";
  attribute SOFT_HLUTNM of \gthe2_i_i_26__1\ : label is "soft_lutpair130";
  attribute SOFT_HLUTNM of \gtrxreset_o_i_1__1\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \state[2]_i_1__1\ : label is "soft_lutpair126";
begin
\drp_busy_i1_i_1__1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => DRP_OP_DONE,
      O => O3
    );
\drp_op_done_o_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
    port map (
      I0 => I1,
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      I4 => DRP_OP_DONE,
      O => \n_0_drp_op_done_o_i_1__1\
    );
drp_op_done_o_reg: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      CLR => I5,
      D => \n_0_drp_op_done_o_i_1__1\,
      Q => DRP_OP_DONE
    );
\gthe2_i_i_10__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(8),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[8]\,
      O => DRPDI(8)
    );
\gthe2_i_i_11__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(7),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[7]\,
      O => DRPDI(7)
    );
\gthe2_i_i_12__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(6),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[6]\,
      O => DRPDI(6)
    );
\gthe2_i_i_13__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(5),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[5]\,
      O => DRPDI(5)
    );
\gthe2_i_i_14__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(4),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[4]\,
      O => DRPDI(4)
    );
\gthe2_i_i_15__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(3),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[3]\,
      O => DRPDI(3)
    );
\gthe2_i_i_16__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(2),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[2]\,
      O => DRPDI(2)
    );
\gthe2_i_i_17__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(1),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[1]\,
      O => DRPDI(1)
    );
\gthe2_i_i_18__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(0),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[0]\,
      O => DRPDI(0)
    );
\gthe2_i_i_19__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt2_drpaddr_in(8),
      O => DRPADDR(8)
    );
\gthe2_i_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B88B8B8"
    )
    port map (
      I0 => gt2_drpen_in,
      I1 => DRP_OP_DONE,
      I2 => state(0),
      I3 => state(1),
      I4 => state(2),
      O => O1
    );
\gthe2_i_i_20__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt2_drpaddr_in(7),
      O => DRPADDR(7)
    );
\gthe2_i_i_21__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt2_drpaddr_in(6),
      O => DRPADDR(6)
    );
\gthe2_i_i_22__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt2_drpaddr_in(5),
      O => DRPADDR(5)
    );
\gthe2_i_i_23__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => gt2_drpaddr_in(4),
      I1 => DRP_OP_DONE,
      O => DRPADDR(4)
    );
\gthe2_i_i_24__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt2_drpaddr_in(3),
      O => DRPADDR(3)
    );
\gthe2_i_i_25__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt2_drpaddr_in(2),
      O => DRPADDR(2)
    );
\gthe2_i_i_26__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt2_drpaddr_in(1),
      O => DRPADDR(1)
    );
\gthe2_i_i_27__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => gt2_drpaddr_in(0),
      I1 => DRP_OP_DONE,
      O => DRPADDR(0)
    );
\gthe2_i_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA3CAA00"
    )
    port map (
      I0 => gt2_drpwe_in,
      I1 => state(2),
      I2 => state(0),
      I3 => DRP_OP_DONE,
      I4 => state(1),
      O => O2
    );
\gthe2_i_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(15),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[15]\,
      O => DRPDI(15)
    );
\gthe2_i_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(14),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[14]\,
      O => DRPDI(14)
    );
\gthe2_i_i_5__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(13),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[13]\,
      O => DRPDI(13)
    );
\gthe2_i_i_6__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(12),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[12]\,
      O => DRPDI(12)
    );
\gthe2_i_i_7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B88888888888888"
    )
    port map (
      I0 => gt2_drpdi_in(11),
      I1 => DRP_OP_DONE,
      I2 => state(0),
      I3 => state(2),
      I4 => \n_0_rd_data_reg[11]\,
      I5 => state(1),
      O => DRPDI(11)
    );
\gthe2_i_i_8__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(10),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[10]\,
      O => DRPDI(10)
    );
\gthe2_i_i_9__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt2_drpdi_in(9),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[9]\,
      O => DRPDI(9)
    );
\gtrxreset_o_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FDA"
    )
    port map (
      I0 => state(0),
      I1 => gtrxreset_ss,
      I2 => state(2),
      I3 => state(1),
      O => gtrxreset_i
    );
gtrxreset_o_reg: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => gtrxreset_i,
      Q => GTRXRESET_OUT
    );
gtrxreset_s_reg: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => I5,
      Q => n_0_gtrxreset_s_reg
    );
gtrxreset_ss_reg: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => n_0_gtrxreset_s_reg,
      Q => gtrxreset_ss
    );
\rd_data[15]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => state(2),
      I1 => I1,
      I2 => state(1),
      I3 => state(0),
      O => \n_0_rd_data[15]_i_1__1\
    );
\rd_data_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(0),
      Q => \n_0_rd_data_reg[0]\
    );
\rd_data_reg[10]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(10),
      Q => \n_0_rd_data_reg[10]\
    );
\rd_data_reg[11]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(11),
      Q => \n_0_rd_data_reg[11]\
    );
\rd_data_reg[12]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(12),
      Q => \n_0_rd_data_reg[12]\
    );
\rd_data_reg[13]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(13),
      Q => \n_0_rd_data_reg[13]\
    );
\rd_data_reg[14]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(14),
      Q => \n_0_rd_data_reg[14]\
    );
\rd_data_reg[15]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(15),
      Q => \n_0_rd_data_reg[15]\
    );
\rd_data_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(1),
      Q => \n_0_rd_data_reg[1]\
    );
\rd_data_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(2),
      Q => \n_0_rd_data_reg[2]\
    );
\rd_data_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(3),
      Q => \n_0_rd_data_reg[3]\
    );
\rd_data_reg[4]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(4),
      Q => \n_0_rd_data_reg[4]\
    );
\rd_data_reg[5]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(5),
      Q => \n_0_rd_data_reg[5]\
    );
\rd_data_reg[6]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(6),
      Q => \n_0_rd_data_reg[6]\
    );
\rd_data_reg[7]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(7),
      Q => \n_0_rd_data_reg[7]\
    );
\rd_data_reg[8]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(8),
      Q => \n_0_rd_data_reg[8]\
    );
\rd_data_reg[9]\: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__1\,
      CLR => AR(0),
      D => gt2_drpdo_out(9),
      Q => \n_0_rd_data_reg[9]\
    );
rxpmaresetdone_sss_reg: unisim.vcomponents.FDCE
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => data_out,
      Q => rxpmaresetdone_sss
    );
\state[2]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F88"
    )
    port map (
      I0 => state(0),
      I1 => state(1),
      I2 => I1,
      I3 => state(2),
      O => next_state(2)
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(0),
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(1),
      Q => state(1)
    );
\state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(2),
      Q => state(2)
    );
sync0_RXPMARESETDONE: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_7\
    port map (
      D(1 downto 0) => next_state(1 downto 0),
      I1 => I1,
      Q(2 downto 0) => state(2 downto 0),
      data_in => data_in,
      data_out => data_out,
      gt2_drpclk_in => gt2_drpclk_in,
      gtrxreset_ss => gtrxreset_ss,
      rxpmaresetdone_sss => rxpmaresetdone_sss
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_8 is
  port (
    GTRXRESET_OUT : out STD_LOGIC;
    O1 : out STD_LOGIC;
    DRPDI : out STD_LOGIC_VECTOR ( 15 downto 0 );
    O2 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    DRPADDR : out STD_LOGIC_VECTOR ( 8 downto 0 );
    gt1_drpclk_in : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    I4 : in STD_LOGIC;
    I1 : in STD_LOGIC;
    data_in : in STD_LOGIC;
    gt1_drpdo_out : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpen_in : in STD_LOGIC;
    gt1_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpwe_in : in STD_LOGIC;
    gt1_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_8 : entity is "gtwizard_32_rx_gtrxreset_seq";
end gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_8;

architecture STRUCTURE of gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_8 is
  signal DRP_OP_DONE : STD_LOGIC;
  signal data_out : STD_LOGIC;
  signal gtrxreset_i : STD_LOGIC;
  signal gtrxreset_ss : STD_LOGIC;
  signal \n_0_drp_op_done_o_i_1__0\ : STD_LOGIC;
  signal n_0_gtrxreset_s_reg : STD_LOGIC;
  signal \n_0_rd_data[15]_i_1__0\ : STD_LOGIC;
  signal \n_0_rd_data_reg[0]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[10]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[11]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[12]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[13]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[14]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[15]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[1]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[2]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[3]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[4]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[5]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[6]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[7]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[8]\ : STD_LOGIC;
  signal \n_0_rd_data_reg[9]\ : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal rxpmaresetdone_sss : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \drp_busy_i1_i_1__0\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \drp_busy_i1_i_1__0\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \gthe2_i_i_19__0\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \gthe2_i_i_1__0\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \gthe2_i_i_20__0\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \gthe2_i_i_21__0\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \gthe2_i_i_22__0\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \gthe2_i_i_23__0\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \gthe2_i_i_24__0\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \gthe2_i_i_25__0\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \gthe2_i_i_26__0\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \gtrxreset_o_i_1__0\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \state[2]_i_1__0\ : label is "soft_lutpair120";
begin
\drp_busy_i1_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => DRP_OP_DONE,
      O => O3
    );
\drp_op_done_o_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8000"
    )
    port map (
      I0 => I1,
      I1 => state(2),
      I2 => state(0),
      I3 => state(1),
      I4 => DRP_OP_DONE,
      O => \n_0_drp_op_done_o_i_1__0\
    );
drp_op_done_o_reg: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      CLR => I4,
      D => \n_0_drp_op_done_o_i_1__0\,
      Q => DRP_OP_DONE
    );
\gthe2_i_i_10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(8),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[8]\,
      O => DRPDI(8)
    );
\gthe2_i_i_11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(7),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[7]\,
      O => DRPDI(7)
    );
\gthe2_i_i_12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(6),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[6]\,
      O => DRPDI(6)
    );
\gthe2_i_i_13__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(5),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[5]\,
      O => DRPDI(5)
    );
\gthe2_i_i_14__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(4),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[4]\,
      O => DRPDI(4)
    );
\gthe2_i_i_15__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(3),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[3]\,
      O => DRPDI(3)
    );
\gthe2_i_i_16__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(2),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[2]\,
      O => DRPDI(2)
    );
\gthe2_i_i_17__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(1),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[1]\,
      O => DRPDI(1)
    );
\gthe2_i_i_18__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(0),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[0]\,
      O => DRPDI(0)
    );
\gthe2_i_i_19__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt1_drpaddr_in(8),
      O => DRPADDR(8)
    );
\gthe2_i_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B88B8B8"
    )
    port map (
      I0 => gt1_drpen_in,
      I1 => DRP_OP_DONE,
      I2 => state(0),
      I3 => state(1),
      I4 => state(2),
      O => O1
    );
\gthe2_i_i_20__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt1_drpaddr_in(7),
      O => DRPADDR(7)
    );
\gthe2_i_i_21__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt1_drpaddr_in(6),
      O => DRPADDR(6)
    );
\gthe2_i_i_22__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt1_drpaddr_in(5),
      O => DRPADDR(5)
    );
\gthe2_i_i_23__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => gt1_drpaddr_in(4),
      I1 => DRP_OP_DONE,
      O => DRPADDR(4)
    );
\gthe2_i_i_24__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt1_drpaddr_in(3),
      O => DRPADDR(3)
    );
\gthe2_i_i_25__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt1_drpaddr_in(2),
      O => DRPADDR(2)
    );
\gthe2_i_i_26__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => DRP_OP_DONE,
      I1 => gt1_drpaddr_in(1),
      O => DRPADDR(1)
    );
\gthe2_i_i_27__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => gt1_drpaddr_in(0),
      I1 => DRP_OP_DONE,
      O => DRPADDR(0)
    );
\gthe2_i_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA3CAA00"
    )
    port map (
      I0 => gt1_drpwe_in,
      I1 => state(2),
      I2 => state(0),
      I3 => DRP_OP_DONE,
      I4 => state(1),
      O => O2
    );
\gthe2_i_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(15),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[15]\,
      O => DRPDI(15)
    );
\gthe2_i_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(14),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[14]\,
      O => DRPDI(14)
    );
\gthe2_i_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(13),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[13]\,
      O => DRPDI(13)
    );
\gthe2_i_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(12),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[12]\,
      O => DRPDI(12)
    );
\gthe2_i_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B88888888888888"
    )
    port map (
      I0 => gt1_drpdi_in(11),
      I1 => DRP_OP_DONE,
      I2 => state(0),
      I3 => state(2),
      I4 => \n_0_rd_data_reg[11]\,
      I5 => state(1),
      O => DRPDI(11)
    );
\gthe2_i_i_8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(10),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[10]\,
      O => DRPDI(10)
    );
\gthe2_i_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0ACACA0A0A0A0A0"
    )
    port map (
      I0 => gt1_drpdi_in(9),
      I1 => state(1),
      I2 => DRP_OP_DONE,
      I3 => state(0),
      I4 => state(2),
      I5 => \n_0_rd_data_reg[9]\,
      O => DRPDI(9)
    );
\gtrxreset_o_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0FDA"
    )
    port map (
      I0 => state(0),
      I1 => gtrxreset_ss,
      I2 => state(2),
      I3 => state(1),
      O => gtrxreset_i
    );
gtrxreset_o_reg: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => gtrxreset_i,
      Q => GTRXRESET_OUT
    );
gtrxreset_s_reg: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => I4,
      Q => n_0_gtrxreset_s_reg
    );
gtrxreset_ss_reg: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => n_0_gtrxreset_s_reg,
      Q => gtrxreset_ss
    );
\rd_data[15]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => state(2),
      I1 => I1,
      I2 => state(1),
      I3 => state(0),
      O => \n_0_rd_data[15]_i_1__0\
    );
\rd_data_reg[0]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(0),
      Q => \n_0_rd_data_reg[0]\
    );
\rd_data_reg[10]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(10),
      Q => \n_0_rd_data_reg[10]\
    );
\rd_data_reg[11]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(11),
      Q => \n_0_rd_data_reg[11]\
    );
\rd_data_reg[12]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(12),
      Q => \n_0_rd_data_reg[12]\
    );
\rd_data_reg[13]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(13),
      Q => \n_0_rd_data_reg[13]\
    );
\rd_data_reg[14]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(14),
      Q => \n_0_rd_data_reg[14]\
    );
\rd_data_reg[15]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(15),
      Q => \n_0_rd_data_reg[15]\
    );
\rd_data_reg[1]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(1),
      Q => \n_0_rd_data_reg[1]\
    );
\rd_data_reg[2]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(2),
      Q => \n_0_rd_data_reg[2]\
    );
\rd_data_reg[3]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(3),
      Q => \n_0_rd_data_reg[3]\
    );
\rd_data_reg[4]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(4),
      Q => \n_0_rd_data_reg[4]\
    );
\rd_data_reg[5]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(5),
      Q => \n_0_rd_data_reg[5]\
    );
\rd_data_reg[6]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(6),
      Q => \n_0_rd_data_reg[6]\
    );
\rd_data_reg[7]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(7),
      Q => \n_0_rd_data_reg[7]\
    );
\rd_data_reg[8]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(8),
      Q => \n_0_rd_data_reg[8]\
    );
\rd_data_reg[9]\: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => \n_0_rd_data[15]_i_1__0\,
      CLR => AR(0),
      D => gt1_drpdo_out(9),
      Q => \n_0_rd_data_reg[9]\
    );
rxpmaresetdone_sss_reg: unisim.vcomponents.FDCE
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => data_out,
      Q => rxpmaresetdone_sss
    );
\state[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F88"
    )
    port map (
      I0 => state(0),
      I1 => state(1),
      I2 => I1,
      I3 => state(2),
      O => next_state(2)
    );
\state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(0),
      Q => state(0)
    );
\state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(1),
      Q => state(1)
    );
\state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      CLR => AR(0),
      D => next_state(2),
      Q => state(2)
    );
sync0_RXPMARESETDONE: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_sync_block__parameterized0_9\
    port map (
      D(1 downto 0) => next_state(1 downto 0),
      I1 => I1,
      Q(2 downto 0) => state(2 downto 0),
      data_in => data_in,
      data_out => data_out,
      gt1_drpclk_in => gt1_drpclk_in,
      gtrxreset_ss => gtrxreset_ss,
      rxpmaresetdone_sss => rxpmaresetdone_sss
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0\ is
  port (
    O1 : out STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GT0_DRP_BUSY_OUT : out STD_LOGIC;
    gt0_drpclk_in : in STD_LOGIC;
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_gthrxn_in : in STD_LOGIC;
    gt0_gthrxp_in : in STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxmcommaalignen_in : in STD_LOGIC;
    gt0_rxpcommaalignen_in : in STD_LOGIC;
    RXUSERRDY : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxreset_i : in STD_LOGIC;
    gt0_drpen_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpwe_in : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0\ : entity is "gtwizard_32_Rx_GT";
end \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0\ is
  signal GTRXRESET_OUT : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal RXPMARESETDONE : STD_LOGIC;
  signal \^gt0_drpdo_out\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal n_10_gtrxreset_seq_i : STD_LOGIC;
  signal n_11_gtrxreset_seq_i : STD_LOGIC;
  signal n_12_gtrxreset_seq_i : STD_LOGIC;
  signal n_13_gtrxreset_seq_i : STD_LOGIC;
  signal n_14_gtrxreset_seq_i : STD_LOGIC;
  signal n_15_gtrxreset_seq_i : STD_LOGIC;
  signal n_16_gtrxreset_seq_i : STD_LOGIC;
  signal n_17_gtrxreset_seq_i : STD_LOGIC;
  signal n_18_gtrxreset_seq_i : STD_LOGIC;
  signal n_19_gtrxreset_seq_i : STD_LOGIC;
  signal n_1_gtrxreset_seq_i : STD_LOGIC;
  signal n_20_gtrxreset_seq_i : STD_LOGIC;
  signal n_21_gtrxreset_seq_i : STD_LOGIC;
  signal n_22_gtrxreset_seq_i : STD_LOGIC;
  signal n_23_gtrxreset_seq_i : STD_LOGIC;
  signal n_24_gtrxreset_seq_i : STD_LOGIC;
  signal n_25_gtrxreset_seq_i : STD_LOGIC;
  signal n_26_gtrxreset_seq_i : STD_LOGIC;
  signal n_270_gthe2_i : STD_LOGIC;
  signal n_27_gtrxreset_seq_i : STD_LOGIC;
  signal n_28_gtrxreset_seq_i : STD_LOGIC;
  signal n_2_gtrxreset_seq_i : STD_LOGIC;
  signal n_3_gtrxreset_seq_i : STD_LOGIC;
  signal n_4_gtrxreset_seq_i : STD_LOGIC;
  signal n_5_gtrxreset_seq_i : STD_LOGIC;
  signal n_6_gtrxreset_seq_i : STD_LOGIC;
  signal n_7_gtrxreset_seq_i : STD_LOGIC;
  signal n_8_gtrxreset_seq_i : STD_LOGIC;
  signal n_9_gtrxreset_seq_i : STD_LOGIC;
  signal NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_CPLLLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTHTXN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTHTXP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_PHYSTATUS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RSOSINTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCDRLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMINITDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMMADET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMSASDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXELECIDLE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXPRBSERR_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXCOMFINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPHINITDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXCHARISK_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXCHBONDO_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 16 );
  signal NLW_gthe2_i_RXDATAVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXDISPERR_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXHEADER_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_gthe2_i_RXHEADERVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXPHMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute box_type : string;
  attribute box_type of gthe2_i : label is "PRIMITIVE";
begin
  O1 <= \^o1\;
  gt0_drpdo_out(15 downto 0) <= \^gt0_drpdo_out\(15 downto 0);
  n_270_gthe2_i <= 'Z';
drp_busy_i1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt0_drpclk_in,
      CE => '1',
      D => n_19_gtrxreset_seq_i,
      Q => GT0_DRP_BUSY_OUT,
      R => '0'
    );
gthe2_i: unisim.vcomponents.GTHE2_CHANNEL
    generic map(
      ACJTAG_DEBUG_MODE => '0',
      ACJTAG_MODE => '0',
      ACJTAG_RESET => '0',
      ADAPT_CFG0 => X"00C10",
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"1111111111",
      ALIGN_COMMA_WORD => 2,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      A_RXOSCALRESET => '0',
      CBCC_DATA_SOURCE_SEL => "DECODED",
      CFOK_CFG => X"24800040E80",
      CFOK_CFG2 => B"100000",
      CFOK_CFG3 => B"100000",
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 1,
      CHAN_BOND_SEQ_1_1 => B"0000000000",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_CORRECT_USE => "FALSE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 10,
      CLK_COR_MIN_LAT => 8,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0100000000",
      CLK_COR_SEQ_1_2 => B"0000000000",
      CLK_COR_SEQ_1_3 => B"0000000000",
      CLK_COR_SEQ_1_4 => B"0000000000",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0100000000",
      CLK_COR_SEQ_2_2 => B"0000000000",
      CLK_COR_SEQ_2_3 => B"0000000000",
      CLK_COR_SEQ_2_4 => B"0000000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "FALSE",
      CLK_COR_SEQ_LEN => 1,
      CPLL_CFG => X"00BC07DC",
      CPLL_FBDIV => 5,
      CPLL_FBDIV_45 => 5,
      CPLL_INIT_CFG => X"00001E",
      CPLL_LOCK_CFG => X"01E8",
      CPLL_REFCLK_DIV => 1,
      DEC_MCOMMA_DETECT => "TRUE",
      DEC_PCOMMA_DETECT => "TRUE",
      DEC_VALID_COMMA_ONLY => "TRUE",
      DMONITOR_CFG => X"000A00",
      ES_CLK_PHASE_SEL => '0',
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "TRUE",
      ES_HORZ_OFFSET => X"000",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER => X"00000000000000000000",
      ES_QUAL_MASK => X"00000000000000000000",
      ES_SDATA_MASK => X"00000000000000000000",
      ES_VERT_OFFSET => B"000000000",
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"000",
      IS_CLKRSVD0_INVERTED => '0',
      IS_CLKRSVD1_INVERTED => '0',
      IS_CPLLLOCKDETCLK_INVERTED => '0',
      IS_DMONITORCLK_INVERTED => '0',
      IS_DRPCLK_INVERTED => '0',
      IS_GTGREFCLK_INVERTED => '0',
      IS_RXUSRCLK2_INVERTED => '0',
      IS_RXUSRCLK_INVERTED => '0',
      IS_SIGVALIDCLK_INVERTED => '0',
      IS_TXPHDLYTSTCLK_INVERTED => '0',
      IS_TXUSRCLK2_INVERTED => '0',
      IS_TXUSRCLK_INVERTED => '0',
      LOOPBACK_CFG => '0',
      OUTREFCLK_SEL_INV => B"11",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD_ATTR => X"000000000000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"3C",
      PD_TRANS_TIME_TO_P2 => X"64",
      PMA_RSV => B"00000000000111100111000010000000",
      PMA_RSV2 => B"00011100000000000000000000001010",
      PMA_RSV3 => B"00",
      PMA_RSV4 => B"000000000001000",
      PMA_RSV5 => B"0000",
      RESET_POWERSAVE_DISABLE => '0',
      RXBUFRESET_TIME => B"00001",
      RXBUF_ADDR_MODE => "FAST",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 61,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 4,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG => X"0002007FE1000C2080018",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG => B"010101",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXDFELPMRESET_TIME => B"0001111",
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"030",
      RXDLY_TAP_CFG => X"0000",
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPM_HF_CFG => B"00001000000000",
      RXLPM_LF_CFG => B"001001000000000000",
      RXOOB_CFG => B"0000110",
      RXOOB_CLK_CFG => "PMA",
      RXOSCALRESET_TIME => B"00011",
      RXOSCALRESET_TIMEOUT => B"00000",
      RXOUT_DIV => 2,
      RXPCSRESET_TIME => B"00001",
      RXPHDLY_CFG => X"084020",
      RXPH_CFG => X"C00002",
      RXPH_MONITOR_SEL => B"00000",
      RXPI_CFG0 => B"00",
      RXPI_CFG1 => B"11",
      RXPI_CFG2 => B"11",
      RXPI_CFG3 => B"11",
      RXPI_CFG4 => '0',
      RXPI_CFG5 => '0',
      RXPI_CFG6 => B"100",
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RXSYNC_MULTILANE => '1',
      RXSYNC_OVRD => '0',
      RXSYNC_SKIP_DA => '0',
      RX_BIAS_CFG => B"000011000000000000010000",
      RX_BUFFER_CFG => B"000000",
      RX_CLK25_DIV => 6,
      RX_CLKMUX_PD => '1',
      RX_CM_SEL => B"00",
      RX_CM_TRIM => B"0000",
      RX_DATA_WIDTH => 20,
      RX_DDI_SEL => B"000000",
      RX_DEBUG_CFG => B"00000000000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DFELPM_CFG0 => B"0110",
      RX_DFELPM_CFG1 => '0',
      RX_DFELPM_KLKH_AGC_STUP_EN => '1',
      RX_DFE_AGC_CFG0 => B"00",
      RX_DFE_AGC_CFG1 => B"010",
      RX_DFE_AGC_CFG2 => B"0000",
      RX_DFE_AGC_OVRDEN => '1',
      RX_DFE_GAIN_CFG => X"0020C0",
      RX_DFE_H2_CFG => B"000000000000",
      RX_DFE_H3_CFG => B"000001000000",
      RX_DFE_H4_CFG => B"00011100000",
      RX_DFE_H5_CFG => B"00011100000",
      RX_DFE_H6_CFG => B"00000100000",
      RX_DFE_H7_CFG => B"00000100000",
      RX_DFE_KL_CFG => B"001000001000000000000001100010000",
      RX_DFE_KL_LPM_KH_CFG0 => B"01",
      RX_DFE_KL_LPM_KH_CFG1 => B"010",
      RX_DFE_KL_LPM_KH_CFG2 => B"0010",
      RX_DFE_KL_LPM_KH_OVRDEN => '1',
      RX_DFE_KL_LPM_KL_CFG0 => B"01",
      RX_DFE_KL_LPM_KL_CFG1 => B"010",
      RX_DFE_KL_LPM_KL_CFG2 => B"0010",
      RX_DFE_KL_LPM_KL_OVRDEN => '1',
      RX_DFE_LPM_CFG => X"0080",
      RX_DFE_LPM_HOLD_DURING_EIDLE => '0',
      RX_DFE_ST_CFG => X"00E100000C003F",
      RX_DFE_UT_CFG => B"00011100000000000",
      RX_DFE_VP_CFG => B"00011101010100011",
      RX_DISPERR_SEQ_MATCH => "TRUE",
      RX_INT_DATAWIDTH => 0,
      RX_OS_CFG => B"0000010000000",
      RX_SIG_VALID_DLY => 10,
      RX_XCLK_SEL => "RXREC",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"1111",
      SATA_BURST_VAL => B"100",
      SATA_CPLL_CFG => "VCO_3000MHZ",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_CPLLREFCLK_SEL => B"001",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "FALSE",
      SIM_TX_EIDLE_DRIVE_LEVEL => "X",
      SIM_VERSION => "2.0",
      TERM_RCAL_CFG => B"100001000010000",
      TERM_RCAL_OVRD => B"000",
      TRANS_TIME_RATE => X"0E",
      TST_RSV => X"00000000",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"001F",
      TXDLY_LCFG => X"030",
      TXDLY_TAP_CFG => X"0000",
      TXGEARBOX_EN => "FALSE",
      TXOOB_CFG => '0',
      TXOUT_DIV => 1,
      TXPCSRESET_TIME => B"00001",
      TXPHDLY_CFG => X"084020",
      TXPH_CFG => X"0780",
      TXPH_MONITOR_SEL => B"00000",
      TXPI_CFG0 => B"00",
      TXPI_CFG1 => B"00",
      TXPI_CFG2 => B"00",
      TXPI_CFG3 => '0',
      TXPI_CFG4 => '0',
      TXPI_CFG5 => B"100",
      TXPI_GREY_SEL => '0',
      TXPI_INVSTROBE_SEL => '0',
      TXPI_PPMCLK_SEL => "TXUSRCLK2",
      TXPI_PPM_CFG => B"00000000",
      TXPI_SYNFREQ_PPM => B"000",
      TXPMARESET_TIME => B"00001",
      TXSYNC_MULTILANE => '0',
      TXSYNC_OVRD => '0',
      TXSYNC_SKIP_DA => '0',
      TX_CLK25_DIV => 6,
      TX_CLKMUX_PD => '1',
      TX_DATA_WIDTH => 20,
      TX_DEEMPH0 => B"000000",
      TX_DEEMPH1 => B"000000",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"110",
      TX_EIDLE_DEASSERT_DELAY => B"100",
      TX_INT_DATAWIDTH => 0,
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001110",
      TX_MARGIN_FULL_1 => B"1001001",
      TX_MARGIN_FULL_2 => B"1000101",
      TX_MARGIN_FULL_3 => B"1000010",
      TX_MARGIN_FULL_4 => B"1000000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000100",
      TX_MARGIN_LOW_2 => B"1000010",
      TX_MARGIN_LOW_3 => B"1000000",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_QPI_STATUS_EN => '0',
      TX_RXDETECT_CFG => X"1832",
      TX_RXDETECT_PRECHARGE_TIME => X"155CC",
      TX_RXDETECT_REF => B"100",
      TX_XCLK_SEL => "TXOUT",
      UCODEER_CLR => '0',
      USE_PCS_CLK_PHASE_SEL => '0'
    )
    port map (
      CFGRESET => '0',
      CLKRSVD0 => '0',
      CLKRSVD1 => '0',
      CPLLFBCLKLOST => NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED,
      CPLLLOCK => NLW_gthe2_i_CPLLLOCK_UNCONNECTED,
      CPLLLOCKDETCLK => '0',
      CPLLLOCKEN => '1',
      CPLLPD => '1',
      CPLLREFCLKLOST => NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED,
      CPLLREFCLKSEL(2) => '0',
      CPLLREFCLKSEL(1) => '0',
      CPLLREFCLKSEL(0) => '1',
      CPLLRESET => '0',
      DMONFIFORESET => '0',
      DMONITORCLK => '0',
      DMONITOROUT(14 downto 0) => gt0_dmonitorout_out(14 downto 0),
      DRPADDR(8) => n_20_gtrxreset_seq_i,
      DRPADDR(7) => n_21_gtrxreset_seq_i,
      DRPADDR(6) => n_22_gtrxreset_seq_i,
      DRPADDR(5) => n_23_gtrxreset_seq_i,
      DRPADDR(4) => n_24_gtrxreset_seq_i,
      DRPADDR(3) => n_25_gtrxreset_seq_i,
      DRPADDR(2) => n_26_gtrxreset_seq_i,
      DRPADDR(1) => n_27_gtrxreset_seq_i,
      DRPADDR(0) => n_28_gtrxreset_seq_i,
      DRPCLK => gt0_drpclk_in,
      DRPDI(15) => n_2_gtrxreset_seq_i,
      DRPDI(14) => n_3_gtrxreset_seq_i,
      DRPDI(13) => n_4_gtrxreset_seq_i,
      DRPDI(12) => n_5_gtrxreset_seq_i,
      DRPDI(11) => n_6_gtrxreset_seq_i,
      DRPDI(10) => n_7_gtrxreset_seq_i,
      DRPDI(9) => n_8_gtrxreset_seq_i,
      DRPDI(8) => n_9_gtrxreset_seq_i,
      DRPDI(7) => n_10_gtrxreset_seq_i,
      DRPDI(6) => n_11_gtrxreset_seq_i,
      DRPDI(5) => n_12_gtrxreset_seq_i,
      DRPDI(4) => n_13_gtrxreset_seq_i,
      DRPDI(3) => n_14_gtrxreset_seq_i,
      DRPDI(2) => n_15_gtrxreset_seq_i,
      DRPDI(1) => n_16_gtrxreset_seq_i,
      DRPDI(0) => n_17_gtrxreset_seq_i,
      DRPDO(15 downto 0) => \^gt0_drpdo_out\(15 downto 0),
      DRPEN => n_1_gtrxreset_seq_i,
      DRPRDY => \^o1\,
      DRPWE => n_18_gtrxreset_seq_i,
      EYESCANDATAERROR => gt0_eyescandataerror_out,
      EYESCANMODE => '0',
      EYESCANRESET => gt0_eyescanreset_in,
      EYESCANTRIGGER => gt0_eyescantrigger_in,
      GTGREFCLK => '0',
      GTHRXN => gt0_gthrxn_in,
      GTHRXP => gt0_gthrxp_in,
      GTHTXN => NLW_gthe2_i_GTHTXN_UNCONNECTED,
      GTHTXP => NLW_gthe2_i_GTHTXP_UNCONNECTED,
      GTNORTHREFCLK0 => '0',
      GTNORTHREFCLK1 => '0',
      GTREFCLK0 => '0',
      GTREFCLK1 => '0',
      GTREFCLKMONITOR => NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED,
      GTRESETSEL => '0',
      GTRSVD(15) => '0',
      GTRSVD(14) => '0',
      GTRSVD(13) => '0',
      GTRSVD(12) => '0',
      GTRSVD(11) => '0',
      GTRSVD(10) => '0',
      GTRSVD(9) => '0',
      GTRSVD(8) => '0',
      GTRSVD(7) => '0',
      GTRSVD(6) => '0',
      GTRSVD(5) => '0',
      GTRSVD(4) => '0',
      GTRSVD(3) => '0',
      GTRSVD(2) => '0',
      GTRSVD(1) => '0',
      GTRSVD(0) => '0',
      GTRXRESET => GTRXRESET_OUT,
      GTSOUTHREFCLK0 => '0',
      GTSOUTHREFCLK1 => '0',
      GTTXRESET => n_270_gthe2_i,
      LOOPBACK(2) => '0',
      LOOPBACK(1) => '0',
      LOOPBACK(0) => '0',
      PCSRSVDIN(15) => '0',
      PCSRSVDIN(14) => '0',
      PCSRSVDIN(13) => '0',
      PCSRSVDIN(12) => '0',
      PCSRSVDIN(11) => '0',
      PCSRSVDIN(10) => '0',
      PCSRSVDIN(9) => '0',
      PCSRSVDIN(8) => '0',
      PCSRSVDIN(7) => '0',
      PCSRSVDIN(6) => '0',
      PCSRSVDIN(5) => '0',
      PCSRSVDIN(4) => '0',
      PCSRSVDIN(3) => '0',
      PCSRSVDIN(2) => '0',
      PCSRSVDIN(1) => '0',
      PCSRSVDIN(0) => '0',
      PCSRSVDIN2(4) => '0',
      PCSRSVDIN2(3) => '0',
      PCSRSVDIN2(2) => '0',
      PCSRSVDIN2(1) => '0',
      PCSRSVDIN2(0) => '0',
      PCSRSVDOUT(15 downto 0) => NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED(15 downto 0),
      PHYSTATUS => NLW_gthe2_i_PHYSTATUS_UNCONNECTED,
      PMARSVDIN(4) => '0',
      PMARSVDIN(3) => '0',
      PMARSVDIN(2) => '0',
      PMARSVDIN(1) => '0',
      PMARSVDIN(0) => '0',
      QPLLCLK => GT0_QPLLOUTCLK_IN,
      QPLLREFCLK => GT0_QPLLOUTREFCLK_IN,
      RESETOVRD => '0',
      RSOSINTDONE => NLW_gthe2_i_RSOSINTDONE_UNCONNECTED,
      RX8B10BEN => '1',
      RXADAPTSELTEST(13) => '0',
      RXADAPTSELTEST(12) => '0',
      RXADAPTSELTEST(11) => '0',
      RXADAPTSELTEST(10) => '0',
      RXADAPTSELTEST(9) => '0',
      RXADAPTSELTEST(8) => '0',
      RXADAPTSELTEST(7) => '0',
      RXADAPTSELTEST(6) => '0',
      RXADAPTSELTEST(5) => '0',
      RXADAPTSELTEST(4) => '0',
      RXADAPTSELTEST(3) => '0',
      RXADAPTSELTEST(2) => '0',
      RXADAPTSELTEST(1) => '0',
      RXADAPTSELTEST(0) => '0',
      RXBUFRESET => gt0_rxbufreset_in,
      RXBUFSTATUS(2 downto 0) => gt0_rxbufstatus_out(2 downto 0),
      RXBYTEISALIGNED => NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED,
      RXBYTEREALIGN => NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED,
      RXCDRFREQRESET => '0',
      RXCDRHOLD => '0',
      RXCDRLOCK => NLW_gthe2_i_RXCDRLOCK_UNCONNECTED,
      RXCDROVRDEN => '0',
      RXCDRRESET => '0',
      RXCDRRESETRSV => '0',
      RXCHANBONDSEQ => NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED,
      RXCHANISALIGNED => NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED,
      RXCHANREALIGN => NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED,
      RXCHARISCOMMA(7 downto 2) => NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED(7 downto 2),
      RXCHARISCOMMA(1 downto 0) => gt0_rxchariscomma_out(1 downto 0),
      RXCHARISK(7 downto 2) => NLW_gthe2_i_RXCHARISK_UNCONNECTED(7 downto 2),
      RXCHARISK(1 downto 0) => gt0_rxcharisk_out(1 downto 0),
      RXCHBONDEN => '0',
      RXCHBONDI(4) => '0',
      RXCHBONDI(3) => '0',
      RXCHBONDI(2) => '0',
      RXCHBONDI(1) => '0',
      RXCHBONDI(0) => '0',
      RXCHBONDLEVEL(2) => '0',
      RXCHBONDLEVEL(1) => '0',
      RXCHBONDLEVEL(0) => '0',
      RXCHBONDMASTER => '0',
      RXCHBONDO(4 downto 0) => NLW_gthe2_i_RXCHBONDO_UNCONNECTED(4 downto 0),
      RXCHBONDSLAVE => '0',
      RXCLKCORCNT(1 downto 0) => NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED(1 downto 0),
      RXCOMINITDET => NLW_gthe2_i_RXCOMINITDET_UNCONNECTED,
      RXCOMMADET => NLW_gthe2_i_RXCOMMADET_UNCONNECTED,
      RXCOMMADETEN => '1',
      RXCOMSASDET => NLW_gthe2_i_RXCOMSASDET_UNCONNECTED,
      RXCOMWAKEDET => NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED,
      RXDATA(63 downto 16) => NLW_gthe2_i_RXDATA_UNCONNECTED(63 downto 16),
      RXDATA(15 downto 0) => gt0_rxdata_out(15 downto 0),
      RXDATAVALID(1 downto 0) => NLW_gthe2_i_RXDATAVALID_UNCONNECTED(1 downto 0),
      RXDDIEN => '0',
      RXDFEAGCHOLD => '0',
      RXDFEAGCOVRDEN => '1',
      RXDFEAGCTRL(4) => '1',
      RXDFEAGCTRL(3) => '0',
      RXDFEAGCTRL(2) => '0',
      RXDFEAGCTRL(1) => '0',
      RXDFEAGCTRL(0) => '0',
      RXDFECM1EN => '0',
      RXDFELFHOLD => '0',
      RXDFELFOVRDEN => '0',
      RXDFELPMRESET => '0',
      RXDFESLIDETAP(4) => '0',
      RXDFESLIDETAP(3) => '0',
      RXDFESLIDETAP(2) => '0',
      RXDFESLIDETAP(1) => '0',
      RXDFESLIDETAP(0) => '0',
      RXDFESLIDETAPADAPTEN => '0',
      RXDFESLIDETAPHOLD => '0',
      RXDFESLIDETAPID(5) => '0',
      RXDFESLIDETAPID(4) => '0',
      RXDFESLIDETAPID(3) => '0',
      RXDFESLIDETAPID(2) => '0',
      RXDFESLIDETAPID(1) => '0',
      RXDFESLIDETAPID(0) => '0',
      RXDFESLIDETAPINITOVRDEN => '0',
      RXDFESLIDETAPONLYADAPTEN => '0',
      RXDFESLIDETAPOVRDEN => '0',
      RXDFESLIDETAPSTARTED => NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED,
      RXDFESLIDETAPSTROBE => '0',
      RXDFESLIDETAPSTROBEDONE => NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED,
      RXDFESLIDETAPSTROBESTARTED => NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED,
      RXDFESTADAPTDONE => NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED,
      RXDFETAP2HOLD => '0',
      RXDFETAP2OVRDEN => '0',
      RXDFETAP3HOLD => '0',
      RXDFETAP3OVRDEN => '0',
      RXDFETAP4HOLD => '0',
      RXDFETAP4OVRDEN => '0',
      RXDFETAP5HOLD => '0',
      RXDFETAP5OVRDEN => '0',
      RXDFETAP6HOLD => '0',
      RXDFETAP6OVRDEN => '0',
      RXDFETAP7HOLD => '0',
      RXDFETAP7OVRDEN => '0',
      RXDFEUTHOLD => '0',
      RXDFEUTOVRDEN => '0',
      RXDFEVPHOLD => '0',
      RXDFEVPOVRDEN => '0',
      RXDFEVSEN => '0',
      RXDFEXYDEN => '1',
      RXDISPERR(7 downto 2) => NLW_gthe2_i_RXDISPERR_UNCONNECTED(7 downto 2),
      RXDISPERR(1 downto 0) => gt0_rxdisperr_out(1 downto 0),
      RXDLYBYPASS => '1',
      RXDLYEN => '0',
      RXDLYOVRDEN => '0',
      RXDLYSRESET => '0',
      RXDLYSRESETDONE => NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED,
      RXELECIDLE => NLW_gthe2_i_RXELECIDLE_UNCONNECTED,
      RXELECIDLEMODE(1) => '1',
      RXELECIDLEMODE(0) => '1',
      RXGEARBOXSLIP => '0',
      RXHEADER(5 downto 0) => NLW_gthe2_i_RXHEADER_UNCONNECTED(5 downto 0),
      RXHEADERVALID(1 downto 0) => NLW_gthe2_i_RXHEADERVALID_UNCONNECTED(1 downto 0),
      RXLPMEN => '1',
      RXLPMHFHOLD => '0',
      RXLPMHFOVRDEN => '0',
      RXLPMLFHOLD => '0',
      RXLPMLFKLOVRDEN => '0',
      RXMCOMMAALIGNEN => gt0_rxmcommaalignen_in,
      RXMONITOROUT(6 downto 0) => gt0_rxmonitorout_out(6 downto 0),
      RXMONITORSEL(1 downto 0) => gt0_rxmonitorsel_in(1 downto 0),
      RXNOTINTABLE(7 downto 2) => NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED(7 downto 2),
      RXNOTINTABLE(1 downto 0) => gt0_rxnotintable_out(1 downto 0),
      RXOOBRESET => '0',
      RXOSCALRESET => '0',
      RXOSHOLD => '0',
      RXOSINTCFG(3) => '0',
      RXOSINTCFG(2) => '1',
      RXOSINTCFG(1) => '1',
      RXOSINTCFG(0) => '0',
      RXOSINTEN => '1',
      RXOSINTHOLD => '0',
      RXOSINTID0(3) => '0',
      RXOSINTID0(2) => '0',
      RXOSINTID0(1) => '0',
      RXOSINTID0(0) => '0',
      RXOSINTNTRLEN => '0',
      RXOSINTOVRDEN => '0',
      RXOSINTSTARTED => NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED,
      RXOSINTSTROBE => '0',
      RXOSINTSTROBEDONE => NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED,
      RXOSINTSTROBESTARTED => NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED,
      RXOSINTTESTOVRDEN => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => gt0_rxoutclk_out,
      RXOUTCLKFABRIC => NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED,
      RXOUTCLKPCS => NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2) => '0',
      RXOUTCLKSEL(1) => '1',
      RXOUTCLKSEL(0) => '0',
      RXPCOMMAALIGNEN => gt0_rxpcommaalignen_in,
      RXPCSRESET => '0',
      RXPD(1 downto 0) => gt0_rxpd_in(1 downto 0),
      RXPHALIGN => '0',
      RXPHALIGNDONE => NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED,
      RXPHALIGNEN => '0',
      RXPHDLYPD => '0',
      RXPHDLYRESET => '0',
      RXPHMONITOR(4 downto 0) => NLW_gthe2_i_RXPHMONITOR_UNCONNECTED(4 downto 0),
      RXPHOVRDEN => '0',
      RXPHSLIPMONITOR(4 downto 0) => NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED(4 downto 0),
      RXPMARESET => '0',
      RXPMARESETDONE => RXPMARESETDONE,
      RXPOLARITY => '0',
      RXPRBSCNTRESET => '0',
      RXPRBSERR => NLW_gthe2_i_RXPRBSERR_UNCONNECTED,
      RXPRBSSEL(2) => '0',
      RXPRBSSEL(1) => '0',
      RXPRBSSEL(0) => '0',
      RXQPIEN => '0',
      RXQPISENN => NLW_gthe2_i_RXQPISENN_UNCONNECTED,
      RXQPISENP => NLW_gthe2_i_RXQPISENP_UNCONNECTED,
      RXRATE(2) => '0',
      RXRATE(1) => '0',
      RXRATE(0) => '0',
      RXRATEDONE => NLW_gthe2_i_RXRATEDONE_UNCONNECTED,
      RXRATEMODE => '0',
      RXRESETDONE => gt0_rxresetdone_out,
      RXSLIDE => '0',
      RXSTARTOFSEQ(1 downto 0) => NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED(1 downto 0),
      RXSTATUS(2 downto 0) => NLW_gthe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYNCALLIN => '0',
      RXSYNCDONE => NLW_gthe2_i_RXSYNCDONE_UNCONNECTED,
      RXSYNCIN => '0',
      RXSYNCMODE => '0',
      RXSYNCOUT => NLW_gthe2_i_RXSYNCOUT_UNCONNECTED,
      RXSYSCLKSEL(1) => '1',
      RXSYSCLKSEL(0) => '1',
      RXUSERRDY => RXUSERRDY,
      RXUSRCLK => gt0_rxusrclk_in,
      RXUSRCLK2 => gt0_rxusrclk2_in,
      RXVALID => NLW_gthe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      SIGVALIDCLK => '0',
      TSTIN(19) => '1',
      TSTIN(18) => '1',
      TSTIN(17) => '1',
      TSTIN(16) => '1',
      TSTIN(15) => '1',
      TSTIN(14) => '1',
      TSTIN(13) => '1',
      TSTIN(12) => '1',
      TSTIN(11) => '1',
      TSTIN(10) => '1',
      TSTIN(9) => '1',
      TSTIN(8) => '1',
      TSTIN(7) => '1',
      TSTIN(6) => '1',
      TSTIN(5) => '1',
      TSTIN(4) => '1',
      TSTIN(3) => '1',
      TSTIN(2) => '1',
      TSTIN(1) => '1',
      TSTIN(0) => '1',
      TX8B10BBYPASS(7) => '0',
      TX8B10BBYPASS(6) => '0',
      TX8B10BBYPASS(5) => '0',
      TX8B10BBYPASS(4) => '0',
      TX8B10BBYPASS(3) => '0',
      TX8B10BBYPASS(2) => '0',
      TX8B10BBYPASS(1) => '0',
      TX8B10BBYPASS(0) => '0',
      TX8B10BEN => '0',
      TXBUFDIFFCTRL(2) => '1',
      TXBUFDIFFCTRL(1) => '0',
      TXBUFDIFFCTRL(0) => '0',
      TXBUFSTATUS(1 downto 0) => NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED(1 downto 0),
      TXCHARDISPMODE(7) => '0',
      TXCHARDISPMODE(6) => '0',
      TXCHARDISPMODE(5) => '0',
      TXCHARDISPMODE(4) => '0',
      TXCHARDISPMODE(3) => '0',
      TXCHARDISPMODE(2) => '0',
      TXCHARDISPMODE(1) => '0',
      TXCHARDISPMODE(0) => '0',
      TXCHARDISPVAL(7) => '0',
      TXCHARDISPVAL(6) => '0',
      TXCHARDISPVAL(5) => '0',
      TXCHARDISPVAL(4) => '0',
      TXCHARDISPVAL(3) => '0',
      TXCHARDISPVAL(2) => '0',
      TXCHARDISPVAL(1) => '0',
      TXCHARDISPVAL(0) => '0',
      TXCHARISK(7) => '0',
      TXCHARISK(6) => '0',
      TXCHARISK(5) => '0',
      TXCHARISK(4) => '0',
      TXCHARISK(3) => '0',
      TXCHARISK(2) => '0',
      TXCHARISK(1) => '0',
      TXCHARISK(0) => '0',
      TXCOMFINISH => NLW_gthe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(63) => '0',
      TXDATA(62) => '0',
      TXDATA(61) => '0',
      TXDATA(60) => '0',
      TXDATA(59) => '0',
      TXDATA(58) => '0',
      TXDATA(57) => '0',
      TXDATA(56) => '0',
      TXDATA(55) => '0',
      TXDATA(54) => '0',
      TXDATA(53) => '0',
      TXDATA(52) => '0',
      TXDATA(51) => '0',
      TXDATA(50) => '0',
      TXDATA(49) => '0',
      TXDATA(48) => '0',
      TXDATA(47) => '0',
      TXDATA(46) => '0',
      TXDATA(45) => '0',
      TXDATA(44) => '0',
      TXDATA(43) => '0',
      TXDATA(42) => '0',
      TXDATA(41) => '0',
      TXDATA(40) => '0',
      TXDATA(39) => '0',
      TXDATA(38) => '0',
      TXDATA(37) => '0',
      TXDATA(36) => '0',
      TXDATA(35) => '0',
      TXDATA(34) => '0',
      TXDATA(33) => '0',
      TXDATA(32) => '0',
      TXDATA(31) => '0',
      TXDATA(30) => '0',
      TXDATA(29) => '0',
      TXDATA(28) => '0',
      TXDATA(27) => '0',
      TXDATA(26) => '0',
      TXDATA(25) => '0',
      TXDATA(24) => '0',
      TXDATA(23) => '0',
      TXDATA(22) => '0',
      TXDATA(21) => '0',
      TXDATA(20) => '0',
      TXDATA(19) => '0',
      TXDATA(18) => '0',
      TXDATA(17) => '0',
      TXDATA(16) => '0',
      TXDATA(15) => '0',
      TXDATA(14) => '0',
      TXDATA(13) => '0',
      TXDATA(12) => '0',
      TXDATA(11) => '0',
      TXDATA(10) => '0',
      TXDATA(9) => '0',
      TXDATA(8) => '0',
      TXDATA(7) => '0',
      TXDATA(6) => '0',
      TXDATA(5) => '0',
      TXDATA(4) => '0',
      TXDATA(3) => '0',
      TXDATA(2) => '0',
      TXDATA(1) => '0',
      TXDATA(0) => '0',
      TXDEEMPH => '0',
      TXDETECTRX => '0',
      TXDIFFCTRL(3) => '1',
      TXDIFFCTRL(2) => '0',
      TXDIFFCTRL(1) => '0',
      TXDIFFCTRL(0) => '0',
      TXDIFFPD => '1',
      TXDLYBYPASS => '1',
      TXDLYEN => '0',
      TXDLYHOLD => '0',
      TXDLYOVRDEN => '0',
      TXDLYSRESET => '0',
      TXDLYSRESETDONE => NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED,
      TXDLYUPDOWN => '0',
      TXELECIDLE => '1',
      TXGEARBOXREADY => NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED,
      TXHEADER(2) => '0',
      TXHEADER(1) => '0',
      TXHEADER(0) => '0',
      TXINHIBIT => '0',
      TXMAINCURSOR(6) => '0',
      TXMAINCURSOR(5) => '0',
      TXMAINCURSOR(4) => '0',
      TXMAINCURSOR(3) => '0',
      TXMAINCURSOR(2) => '0',
      TXMAINCURSOR(1) => '0',
      TXMAINCURSOR(0) => '0',
      TXMARGIN(2) => '0',
      TXMARGIN(1) => '0',
      TXMARGIN(0) => '0',
      TXOUTCLK => NLW_gthe2_i_TXOUTCLK_UNCONNECTED,
      TXOUTCLKFABRIC => NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED,
      TXOUTCLKPCS => NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED,
      TXOUTCLKSEL(2) => '0',
      TXOUTCLKSEL(1) => '1',
      TXOUTCLKSEL(0) => '0',
      TXPCSRESET => '0',
      TXPD(1) => '1',
      TXPD(0) => '1',
      TXPDELECIDLEMODE => '1',
      TXPHALIGN => '0',
      TXPHALIGNDONE => NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED,
      TXPHALIGNEN => '0',
      TXPHDLYPD => '1',
      TXPHDLYRESET => '0',
      TXPHDLYTSTCLK => '0',
      TXPHINIT => '0',
      TXPHINITDONE => NLW_gthe2_i_TXPHINITDONE_UNCONNECTED,
      TXPHOVRDEN => '0',
      TXPIPPMEN => '0',
      TXPIPPMOVRDEN => '0',
      TXPIPPMPD => '1',
      TXPIPPMSEL => '0',
      TXPIPPMSTEPSIZE(4) => '0',
      TXPIPPMSTEPSIZE(3) => '0',
      TXPIPPMSTEPSIZE(2) => '0',
      TXPIPPMSTEPSIZE(1) => '0',
      TXPIPPMSTEPSIZE(0) => '0',
      TXPISOPD => '1',
      TXPMARESET => '0',
      TXPMARESETDONE => NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED,
      TXPOLARITY => '0',
      TXPOSTCURSOR(4) => '0',
      TXPOSTCURSOR(3) => '0',
      TXPOSTCURSOR(2) => '0',
      TXPOSTCURSOR(1) => '0',
      TXPOSTCURSOR(0) => '0',
      TXPOSTCURSORINV => '0',
      TXPRBSFORCEERR => '0',
      TXPRBSSEL(2) => '0',
      TXPRBSSEL(1) => '0',
      TXPRBSSEL(0) => '0',
      TXPRECURSOR(4) => '0',
      TXPRECURSOR(3) => '0',
      TXPRECURSOR(2) => '0',
      TXPRECURSOR(1) => '0',
      TXPRECURSOR(0) => '0',
      TXPRECURSORINV => '0',
      TXQPIBIASEN => '0',
      TXQPISENN => NLW_gthe2_i_TXQPISENN_UNCONNECTED,
      TXQPISENP => NLW_gthe2_i_TXQPISENP_UNCONNECTED,
      TXQPISTRONGPDOWN => '0',
      TXQPIWEAKPUP => '0',
      TXRATE(2) => '0',
      TXRATE(1) => '0',
      TXRATE(0) => '0',
      TXRATEDONE => NLW_gthe2_i_TXRATEDONE_UNCONNECTED,
      TXRATEMODE => '0',
      TXRESETDONE => NLW_gthe2_i_TXRESETDONE_UNCONNECTED,
      TXSEQUENCE(6) => '0',
      TXSEQUENCE(5) => '0',
      TXSEQUENCE(4) => '0',
      TXSEQUENCE(3) => '0',
      TXSEQUENCE(2) => '0',
      TXSEQUENCE(1) => '0',
      TXSEQUENCE(0) => '0',
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYNCALLIN => '0',
      TXSYNCDONE => NLW_gthe2_i_TXSYNCDONE_UNCONNECTED,
      TXSYNCIN => '0',
      TXSYNCMODE => '0',
      TXSYNCOUT => NLW_gthe2_i_TXSYNCOUT_UNCONNECTED,
      TXSYSCLKSEL(1) => '0',
      TXSYSCLKSEL(0) => '0',
      TXUSERRDY => '0',
      TXUSRCLK => '0',
      TXUSRCLK2 => '0'
    );
gtrxreset_seq_i: entity work.gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_10
    port map (
      AR(0) => AR(0),
      DRPADDR(8) => n_20_gtrxreset_seq_i,
      DRPADDR(7) => n_21_gtrxreset_seq_i,
      DRPADDR(6) => n_22_gtrxreset_seq_i,
      DRPADDR(5) => n_23_gtrxreset_seq_i,
      DRPADDR(4) => n_24_gtrxreset_seq_i,
      DRPADDR(3) => n_25_gtrxreset_seq_i,
      DRPADDR(2) => n_26_gtrxreset_seq_i,
      DRPADDR(1) => n_27_gtrxreset_seq_i,
      DRPADDR(0) => n_28_gtrxreset_seq_i,
      DRPDI(15) => n_2_gtrxreset_seq_i,
      DRPDI(14) => n_3_gtrxreset_seq_i,
      DRPDI(13) => n_4_gtrxreset_seq_i,
      DRPDI(12) => n_5_gtrxreset_seq_i,
      DRPDI(11) => n_6_gtrxreset_seq_i,
      DRPDI(10) => n_7_gtrxreset_seq_i,
      DRPDI(9) => n_8_gtrxreset_seq_i,
      DRPDI(8) => n_9_gtrxreset_seq_i,
      DRPDI(7) => n_10_gtrxreset_seq_i,
      DRPDI(6) => n_11_gtrxreset_seq_i,
      DRPDI(5) => n_12_gtrxreset_seq_i,
      DRPDI(4) => n_13_gtrxreset_seq_i,
      DRPDI(3) => n_14_gtrxreset_seq_i,
      DRPDI(2) => n_15_gtrxreset_seq_i,
      DRPDI(1) => n_16_gtrxreset_seq_i,
      DRPDI(0) => n_17_gtrxreset_seq_i,
      GTRXRESET_OUT => GTRXRESET_OUT,
      I1 => \^o1\,
      O1 => n_1_gtrxreset_seq_i,
      O2 => n_18_gtrxreset_seq_i,
      O3 => n_19_gtrxreset_seq_i,
      data_in => RXPMARESETDONE,
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      gt0_drpdo_out(15 downto 0) => \^gt0_drpdo_out\(15 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_drpwe_in => gt0_drpwe_in,
      gtrxreset_i => gtrxreset_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_3\ is
  port (
    O1 : out STD_LOGIC;
    gt1_eyescandataerror_out : out STD_LOGIC;
    gt1_rxoutclk_out : out STD_LOGIC;
    gt1_rxresetdone_out : out STD_LOGIC;
    gt1_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt1_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt1_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GT1_DRP_BUSY_OUT : out STD_LOGIC;
    gt1_drpclk_in : in STD_LOGIC;
    gt1_eyescanreset_in : in STD_LOGIC;
    gt1_eyescantrigger_in : in STD_LOGIC;
    gt1_gthrxn_in : in STD_LOGIC;
    gt1_gthrxp_in : in STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC;
    gt1_rxbufreset_in : in STD_LOGIC;
    gt1_rxmcommaalignen_in : in STD_LOGIC;
    gt1_rxpcommaalignen_in : in STD_LOGIC;
    I1 : in STD_LOGIC;
    gt1_rxusrclk_in : in STD_LOGIC;
    gt1_rxusrclk2_in : in STD_LOGIC;
    gt1_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    I4 : in STD_LOGIC;
    gt1_drpen_in : in STD_LOGIC;
    gt1_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpwe_in : in STD_LOGIC;
    gt1_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_3\ : entity is "gtwizard_32_Rx_GT";
end \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_3\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_3\ is
  signal GTRXRESET_OUT : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \^gt1_drpdo_out\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal n_10_gtrxreset_seq_i : STD_LOGIC;
  signal n_11_gtrxreset_seq_i : STD_LOGIC;
  signal n_12_gtrxreset_seq_i : STD_LOGIC;
  signal n_13_gtrxreset_seq_i : STD_LOGIC;
  signal n_14_gtrxreset_seq_i : STD_LOGIC;
  signal n_15_gtrxreset_seq_i : STD_LOGIC;
  signal n_16_gtrxreset_seq_i : STD_LOGIC;
  signal n_17_gtrxreset_seq_i : STD_LOGIC;
  signal n_18_gtrxreset_seq_i : STD_LOGIC;
  signal n_19_gtrxreset_seq_i : STD_LOGIC;
  signal n_1_gtrxreset_seq_i : STD_LOGIC;
  signal n_20_gtrxreset_seq_i : STD_LOGIC;
  signal n_21_gtrxreset_seq_i : STD_LOGIC;
  signal n_22_gtrxreset_seq_i : STD_LOGIC;
  signal n_23_gtrxreset_seq_i : STD_LOGIC;
  signal n_24_gtrxreset_seq_i : STD_LOGIC;
  signal n_25_gtrxreset_seq_i : STD_LOGIC;
  signal n_26_gtrxreset_seq_i : STD_LOGIC;
  signal n_270_gthe2_i : STD_LOGIC;
  signal n_27_gtrxreset_seq_i : STD_LOGIC;
  signal n_28_gtrxreset_seq_i : STD_LOGIC;
  signal n_2_gtrxreset_seq_i : STD_LOGIC;
  signal n_33_gthe2_i : STD_LOGIC;
  signal n_3_gtrxreset_seq_i : STD_LOGIC;
  signal n_4_gtrxreset_seq_i : STD_LOGIC;
  signal n_5_gtrxreset_seq_i : STD_LOGIC;
  signal n_6_gtrxreset_seq_i : STD_LOGIC;
  signal n_7_gtrxreset_seq_i : STD_LOGIC;
  signal n_8_gtrxreset_seq_i : STD_LOGIC;
  signal n_9_gtrxreset_seq_i : STD_LOGIC;
  signal NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_CPLLLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTHTXN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTHTXP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_PHYSTATUS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RSOSINTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCDRLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMINITDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMMADET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMSASDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXELECIDLE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXPRBSERR_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXCOMFINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPHINITDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXCHARISK_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXCHBONDO_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 16 );
  signal NLW_gthe2_i_RXDATAVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXDISPERR_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXHEADER_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_gthe2_i_RXHEADERVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXPHMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute box_type : string;
  attribute box_type of gthe2_i : label is "PRIMITIVE";
begin
  O1 <= \^o1\;
  gt1_drpdo_out(15 downto 0) <= \^gt1_drpdo_out\(15 downto 0);
  n_270_gthe2_i <= 'Z';
drp_busy_i1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt1_drpclk_in,
      CE => '1',
      D => n_19_gtrxreset_seq_i,
      Q => GT1_DRP_BUSY_OUT,
      R => '0'
    );
gthe2_i: unisim.vcomponents.GTHE2_CHANNEL
    generic map(
      ACJTAG_DEBUG_MODE => '0',
      ACJTAG_MODE => '0',
      ACJTAG_RESET => '0',
      ADAPT_CFG0 => X"00C10",
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"1111111111",
      ALIGN_COMMA_WORD => 2,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      A_RXOSCALRESET => '0',
      CBCC_DATA_SOURCE_SEL => "DECODED",
      CFOK_CFG => X"24800040E80",
      CFOK_CFG2 => B"100000",
      CFOK_CFG3 => B"100000",
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 1,
      CHAN_BOND_SEQ_1_1 => B"0000000000",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_CORRECT_USE => "FALSE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 10,
      CLK_COR_MIN_LAT => 8,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0100000000",
      CLK_COR_SEQ_1_2 => B"0000000000",
      CLK_COR_SEQ_1_3 => B"0000000000",
      CLK_COR_SEQ_1_4 => B"0000000000",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0100000000",
      CLK_COR_SEQ_2_2 => B"0000000000",
      CLK_COR_SEQ_2_3 => B"0000000000",
      CLK_COR_SEQ_2_4 => B"0000000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "FALSE",
      CLK_COR_SEQ_LEN => 1,
      CPLL_CFG => X"00BC07DC",
      CPLL_FBDIV => 5,
      CPLL_FBDIV_45 => 5,
      CPLL_INIT_CFG => X"00001E",
      CPLL_LOCK_CFG => X"01E8",
      CPLL_REFCLK_DIV => 1,
      DEC_MCOMMA_DETECT => "TRUE",
      DEC_PCOMMA_DETECT => "TRUE",
      DEC_VALID_COMMA_ONLY => "TRUE",
      DMONITOR_CFG => X"000A00",
      ES_CLK_PHASE_SEL => '0',
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "TRUE",
      ES_HORZ_OFFSET => X"000",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER => X"00000000000000000000",
      ES_QUAL_MASK => X"00000000000000000000",
      ES_SDATA_MASK => X"00000000000000000000",
      ES_VERT_OFFSET => B"000000000",
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"000",
      IS_CLKRSVD0_INVERTED => '0',
      IS_CLKRSVD1_INVERTED => '0',
      IS_CPLLLOCKDETCLK_INVERTED => '0',
      IS_DMONITORCLK_INVERTED => '0',
      IS_DRPCLK_INVERTED => '0',
      IS_GTGREFCLK_INVERTED => '0',
      IS_RXUSRCLK2_INVERTED => '0',
      IS_RXUSRCLK_INVERTED => '0',
      IS_SIGVALIDCLK_INVERTED => '0',
      IS_TXPHDLYTSTCLK_INVERTED => '0',
      IS_TXUSRCLK2_INVERTED => '0',
      IS_TXUSRCLK_INVERTED => '0',
      LOOPBACK_CFG => '0',
      OUTREFCLK_SEL_INV => B"11",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD_ATTR => X"000000000000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"3C",
      PD_TRANS_TIME_TO_P2 => X"64",
      PMA_RSV => B"00000000000111100111000010000000",
      PMA_RSV2 => B"00011100000000000000000000001010",
      PMA_RSV3 => B"00",
      PMA_RSV4 => B"000000000001000",
      PMA_RSV5 => B"0000",
      RESET_POWERSAVE_DISABLE => '0',
      RXBUFRESET_TIME => B"00001",
      RXBUF_ADDR_MODE => "FAST",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 61,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 4,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG => X"0002007FE1000C2080018",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG => B"010101",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXDFELPMRESET_TIME => B"0001111",
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"030",
      RXDLY_TAP_CFG => X"0000",
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPM_HF_CFG => B"00001000000000",
      RXLPM_LF_CFG => B"001001000000000000",
      RXOOB_CFG => B"0000110",
      RXOOB_CLK_CFG => "PMA",
      RXOSCALRESET_TIME => B"00011",
      RXOSCALRESET_TIMEOUT => B"00000",
      RXOUT_DIV => 2,
      RXPCSRESET_TIME => B"00001",
      RXPHDLY_CFG => X"084020",
      RXPH_CFG => X"C00002",
      RXPH_MONITOR_SEL => B"00000",
      RXPI_CFG0 => B"00",
      RXPI_CFG1 => B"11",
      RXPI_CFG2 => B"11",
      RXPI_CFG3 => B"11",
      RXPI_CFG4 => '0',
      RXPI_CFG5 => '0',
      RXPI_CFG6 => B"100",
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RXSYNC_MULTILANE => '1',
      RXSYNC_OVRD => '0',
      RXSYNC_SKIP_DA => '0',
      RX_BIAS_CFG => B"000011000000000000010000",
      RX_BUFFER_CFG => B"000000",
      RX_CLK25_DIV => 6,
      RX_CLKMUX_PD => '1',
      RX_CM_SEL => B"00",
      RX_CM_TRIM => B"0000",
      RX_DATA_WIDTH => 20,
      RX_DDI_SEL => B"000000",
      RX_DEBUG_CFG => B"00000000000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DFELPM_CFG0 => B"0110",
      RX_DFELPM_CFG1 => '0',
      RX_DFELPM_KLKH_AGC_STUP_EN => '1',
      RX_DFE_AGC_CFG0 => B"00",
      RX_DFE_AGC_CFG1 => B"010",
      RX_DFE_AGC_CFG2 => B"0000",
      RX_DFE_AGC_OVRDEN => '1',
      RX_DFE_GAIN_CFG => X"0020C0",
      RX_DFE_H2_CFG => B"000000000000",
      RX_DFE_H3_CFG => B"000001000000",
      RX_DFE_H4_CFG => B"00011100000",
      RX_DFE_H5_CFG => B"00011100000",
      RX_DFE_H6_CFG => B"00000100000",
      RX_DFE_H7_CFG => B"00000100000",
      RX_DFE_KL_CFG => B"001000001000000000000001100010000",
      RX_DFE_KL_LPM_KH_CFG0 => B"01",
      RX_DFE_KL_LPM_KH_CFG1 => B"010",
      RX_DFE_KL_LPM_KH_CFG2 => B"0010",
      RX_DFE_KL_LPM_KH_OVRDEN => '1',
      RX_DFE_KL_LPM_KL_CFG0 => B"01",
      RX_DFE_KL_LPM_KL_CFG1 => B"010",
      RX_DFE_KL_LPM_KL_CFG2 => B"0010",
      RX_DFE_KL_LPM_KL_OVRDEN => '1',
      RX_DFE_LPM_CFG => X"0080",
      RX_DFE_LPM_HOLD_DURING_EIDLE => '0',
      RX_DFE_ST_CFG => X"00E100000C003F",
      RX_DFE_UT_CFG => B"00011100000000000",
      RX_DFE_VP_CFG => B"00011101010100011",
      RX_DISPERR_SEQ_MATCH => "TRUE",
      RX_INT_DATAWIDTH => 0,
      RX_OS_CFG => B"0000010000000",
      RX_SIG_VALID_DLY => 10,
      RX_XCLK_SEL => "RXREC",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"1111",
      SATA_BURST_VAL => B"100",
      SATA_CPLL_CFG => "VCO_3000MHZ",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_CPLLREFCLK_SEL => B"001",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "FALSE",
      SIM_TX_EIDLE_DRIVE_LEVEL => "X",
      SIM_VERSION => "2.0",
      TERM_RCAL_CFG => B"100001000010000",
      TERM_RCAL_OVRD => B"000",
      TRANS_TIME_RATE => X"0E",
      TST_RSV => X"00000000",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"001F",
      TXDLY_LCFG => X"030",
      TXDLY_TAP_CFG => X"0000",
      TXGEARBOX_EN => "FALSE",
      TXOOB_CFG => '0',
      TXOUT_DIV => 1,
      TXPCSRESET_TIME => B"00001",
      TXPHDLY_CFG => X"084020",
      TXPH_CFG => X"0780",
      TXPH_MONITOR_SEL => B"00000",
      TXPI_CFG0 => B"00",
      TXPI_CFG1 => B"00",
      TXPI_CFG2 => B"00",
      TXPI_CFG3 => '0',
      TXPI_CFG4 => '0',
      TXPI_CFG5 => B"100",
      TXPI_GREY_SEL => '0',
      TXPI_INVSTROBE_SEL => '0',
      TXPI_PPMCLK_SEL => "TXUSRCLK2",
      TXPI_PPM_CFG => B"00000000",
      TXPI_SYNFREQ_PPM => B"000",
      TXPMARESET_TIME => B"00001",
      TXSYNC_MULTILANE => '0',
      TXSYNC_OVRD => '0',
      TXSYNC_SKIP_DA => '0',
      TX_CLK25_DIV => 6,
      TX_CLKMUX_PD => '1',
      TX_DATA_WIDTH => 20,
      TX_DEEMPH0 => B"000000",
      TX_DEEMPH1 => B"000000",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"110",
      TX_EIDLE_DEASSERT_DELAY => B"100",
      TX_INT_DATAWIDTH => 0,
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001110",
      TX_MARGIN_FULL_1 => B"1001001",
      TX_MARGIN_FULL_2 => B"1000101",
      TX_MARGIN_FULL_3 => B"1000010",
      TX_MARGIN_FULL_4 => B"1000000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000100",
      TX_MARGIN_LOW_2 => B"1000010",
      TX_MARGIN_LOW_3 => B"1000000",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_QPI_STATUS_EN => '0',
      TX_RXDETECT_CFG => X"1832",
      TX_RXDETECT_PRECHARGE_TIME => X"155CC",
      TX_RXDETECT_REF => B"100",
      TX_XCLK_SEL => "TXOUT",
      UCODEER_CLR => '0',
      USE_PCS_CLK_PHASE_SEL => '0'
    )
    port map (
      CFGRESET => '0',
      CLKRSVD0 => '0',
      CLKRSVD1 => '0',
      CPLLFBCLKLOST => NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED,
      CPLLLOCK => NLW_gthe2_i_CPLLLOCK_UNCONNECTED,
      CPLLLOCKDETCLK => '0',
      CPLLLOCKEN => '1',
      CPLLPD => '1',
      CPLLREFCLKLOST => NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED,
      CPLLREFCLKSEL(2) => '0',
      CPLLREFCLKSEL(1) => '0',
      CPLLREFCLKSEL(0) => '1',
      CPLLRESET => '0',
      DMONFIFORESET => '0',
      DMONITORCLK => '0',
      DMONITOROUT(14 downto 0) => gt1_dmonitorout_out(14 downto 0),
      DRPADDR(8) => n_20_gtrxreset_seq_i,
      DRPADDR(7) => n_21_gtrxreset_seq_i,
      DRPADDR(6) => n_22_gtrxreset_seq_i,
      DRPADDR(5) => n_23_gtrxreset_seq_i,
      DRPADDR(4) => n_24_gtrxreset_seq_i,
      DRPADDR(3) => n_25_gtrxreset_seq_i,
      DRPADDR(2) => n_26_gtrxreset_seq_i,
      DRPADDR(1) => n_27_gtrxreset_seq_i,
      DRPADDR(0) => n_28_gtrxreset_seq_i,
      DRPCLK => gt1_drpclk_in,
      DRPDI(15) => n_2_gtrxreset_seq_i,
      DRPDI(14) => n_3_gtrxreset_seq_i,
      DRPDI(13) => n_4_gtrxreset_seq_i,
      DRPDI(12) => n_5_gtrxreset_seq_i,
      DRPDI(11) => n_6_gtrxreset_seq_i,
      DRPDI(10) => n_7_gtrxreset_seq_i,
      DRPDI(9) => n_8_gtrxreset_seq_i,
      DRPDI(8) => n_9_gtrxreset_seq_i,
      DRPDI(7) => n_10_gtrxreset_seq_i,
      DRPDI(6) => n_11_gtrxreset_seq_i,
      DRPDI(5) => n_12_gtrxreset_seq_i,
      DRPDI(4) => n_13_gtrxreset_seq_i,
      DRPDI(3) => n_14_gtrxreset_seq_i,
      DRPDI(2) => n_15_gtrxreset_seq_i,
      DRPDI(1) => n_16_gtrxreset_seq_i,
      DRPDI(0) => n_17_gtrxreset_seq_i,
      DRPDO(15 downto 0) => \^gt1_drpdo_out\(15 downto 0),
      DRPEN => n_1_gtrxreset_seq_i,
      DRPRDY => \^o1\,
      DRPWE => n_18_gtrxreset_seq_i,
      EYESCANDATAERROR => gt1_eyescandataerror_out,
      EYESCANMODE => '0',
      EYESCANRESET => gt1_eyescanreset_in,
      EYESCANTRIGGER => gt1_eyescantrigger_in,
      GTGREFCLK => '0',
      GTHRXN => gt1_gthrxn_in,
      GTHRXP => gt1_gthrxp_in,
      GTHTXN => NLW_gthe2_i_GTHTXN_UNCONNECTED,
      GTHTXP => NLW_gthe2_i_GTHTXP_UNCONNECTED,
      GTNORTHREFCLK0 => '0',
      GTNORTHREFCLK1 => '0',
      GTREFCLK0 => '0',
      GTREFCLK1 => '0',
      GTREFCLKMONITOR => NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED,
      GTRESETSEL => '0',
      GTRSVD(15) => '0',
      GTRSVD(14) => '0',
      GTRSVD(13) => '0',
      GTRSVD(12) => '0',
      GTRSVD(11) => '0',
      GTRSVD(10) => '0',
      GTRSVD(9) => '0',
      GTRSVD(8) => '0',
      GTRSVD(7) => '0',
      GTRSVD(6) => '0',
      GTRSVD(5) => '0',
      GTRSVD(4) => '0',
      GTRSVD(3) => '0',
      GTRSVD(2) => '0',
      GTRSVD(1) => '0',
      GTRSVD(0) => '0',
      GTRXRESET => GTRXRESET_OUT,
      GTSOUTHREFCLK0 => '0',
      GTSOUTHREFCLK1 => '0',
      GTTXRESET => n_270_gthe2_i,
      LOOPBACK(2) => '0',
      LOOPBACK(1) => '0',
      LOOPBACK(0) => '0',
      PCSRSVDIN(15) => '0',
      PCSRSVDIN(14) => '0',
      PCSRSVDIN(13) => '0',
      PCSRSVDIN(12) => '0',
      PCSRSVDIN(11) => '0',
      PCSRSVDIN(10) => '0',
      PCSRSVDIN(9) => '0',
      PCSRSVDIN(8) => '0',
      PCSRSVDIN(7) => '0',
      PCSRSVDIN(6) => '0',
      PCSRSVDIN(5) => '0',
      PCSRSVDIN(4) => '0',
      PCSRSVDIN(3) => '0',
      PCSRSVDIN(2) => '0',
      PCSRSVDIN(1) => '0',
      PCSRSVDIN(0) => '0',
      PCSRSVDIN2(4) => '0',
      PCSRSVDIN2(3) => '0',
      PCSRSVDIN2(2) => '0',
      PCSRSVDIN2(1) => '0',
      PCSRSVDIN2(0) => '0',
      PCSRSVDOUT(15 downto 0) => NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED(15 downto 0),
      PHYSTATUS => NLW_gthe2_i_PHYSTATUS_UNCONNECTED,
      PMARSVDIN(4) => '0',
      PMARSVDIN(3) => '0',
      PMARSVDIN(2) => '0',
      PMARSVDIN(1) => '0',
      PMARSVDIN(0) => '0',
      QPLLCLK => GT0_QPLLOUTCLK_IN,
      QPLLREFCLK => GT0_QPLLOUTREFCLK_IN,
      RESETOVRD => '0',
      RSOSINTDONE => NLW_gthe2_i_RSOSINTDONE_UNCONNECTED,
      RX8B10BEN => '1',
      RXADAPTSELTEST(13) => '0',
      RXADAPTSELTEST(12) => '0',
      RXADAPTSELTEST(11) => '0',
      RXADAPTSELTEST(10) => '0',
      RXADAPTSELTEST(9) => '0',
      RXADAPTSELTEST(8) => '0',
      RXADAPTSELTEST(7) => '0',
      RXADAPTSELTEST(6) => '0',
      RXADAPTSELTEST(5) => '0',
      RXADAPTSELTEST(4) => '0',
      RXADAPTSELTEST(3) => '0',
      RXADAPTSELTEST(2) => '0',
      RXADAPTSELTEST(1) => '0',
      RXADAPTSELTEST(0) => '0',
      RXBUFRESET => gt1_rxbufreset_in,
      RXBUFSTATUS(2 downto 0) => gt1_rxbufstatus_out(2 downto 0),
      RXBYTEISALIGNED => NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED,
      RXBYTEREALIGN => NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED,
      RXCDRFREQRESET => '0',
      RXCDRHOLD => '0',
      RXCDRLOCK => NLW_gthe2_i_RXCDRLOCK_UNCONNECTED,
      RXCDROVRDEN => '0',
      RXCDRRESET => '0',
      RXCDRRESETRSV => '0',
      RXCHANBONDSEQ => NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED,
      RXCHANISALIGNED => NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED,
      RXCHANREALIGN => NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED,
      RXCHARISCOMMA(7 downto 2) => NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED(7 downto 2),
      RXCHARISCOMMA(1 downto 0) => gt1_rxchariscomma_out(1 downto 0),
      RXCHARISK(7 downto 2) => NLW_gthe2_i_RXCHARISK_UNCONNECTED(7 downto 2),
      RXCHARISK(1 downto 0) => gt1_rxcharisk_out(1 downto 0),
      RXCHBONDEN => '0',
      RXCHBONDI(4) => '0',
      RXCHBONDI(3) => '0',
      RXCHBONDI(2) => '0',
      RXCHBONDI(1) => '0',
      RXCHBONDI(0) => '0',
      RXCHBONDLEVEL(2) => '0',
      RXCHBONDLEVEL(1) => '0',
      RXCHBONDLEVEL(0) => '0',
      RXCHBONDMASTER => '0',
      RXCHBONDO(4 downto 0) => NLW_gthe2_i_RXCHBONDO_UNCONNECTED(4 downto 0),
      RXCHBONDSLAVE => '0',
      RXCLKCORCNT(1 downto 0) => NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED(1 downto 0),
      RXCOMINITDET => NLW_gthe2_i_RXCOMINITDET_UNCONNECTED,
      RXCOMMADET => NLW_gthe2_i_RXCOMMADET_UNCONNECTED,
      RXCOMMADETEN => '1',
      RXCOMSASDET => NLW_gthe2_i_RXCOMSASDET_UNCONNECTED,
      RXCOMWAKEDET => NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED,
      RXDATA(63 downto 16) => NLW_gthe2_i_RXDATA_UNCONNECTED(63 downto 16),
      RXDATA(15 downto 0) => gt1_rxdata_out(15 downto 0),
      RXDATAVALID(1 downto 0) => NLW_gthe2_i_RXDATAVALID_UNCONNECTED(1 downto 0),
      RXDDIEN => '0',
      RXDFEAGCHOLD => '0',
      RXDFEAGCOVRDEN => '1',
      RXDFEAGCTRL(4) => '1',
      RXDFEAGCTRL(3) => '0',
      RXDFEAGCTRL(2) => '0',
      RXDFEAGCTRL(1) => '0',
      RXDFEAGCTRL(0) => '0',
      RXDFECM1EN => '0',
      RXDFELFHOLD => '0',
      RXDFELFOVRDEN => '0',
      RXDFELPMRESET => '0',
      RXDFESLIDETAP(4) => '0',
      RXDFESLIDETAP(3) => '0',
      RXDFESLIDETAP(2) => '0',
      RXDFESLIDETAP(1) => '0',
      RXDFESLIDETAP(0) => '0',
      RXDFESLIDETAPADAPTEN => '0',
      RXDFESLIDETAPHOLD => '0',
      RXDFESLIDETAPID(5) => '0',
      RXDFESLIDETAPID(4) => '0',
      RXDFESLIDETAPID(3) => '0',
      RXDFESLIDETAPID(2) => '0',
      RXDFESLIDETAPID(1) => '0',
      RXDFESLIDETAPID(0) => '0',
      RXDFESLIDETAPINITOVRDEN => '0',
      RXDFESLIDETAPONLYADAPTEN => '0',
      RXDFESLIDETAPOVRDEN => '0',
      RXDFESLIDETAPSTARTED => NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED,
      RXDFESLIDETAPSTROBE => '0',
      RXDFESLIDETAPSTROBEDONE => NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED,
      RXDFESLIDETAPSTROBESTARTED => NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED,
      RXDFESTADAPTDONE => NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED,
      RXDFETAP2HOLD => '0',
      RXDFETAP2OVRDEN => '0',
      RXDFETAP3HOLD => '0',
      RXDFETAP3OVRDEN => '0',
      RXDFETAP4HOLD => '0',
      RXDFETAP4OVRDEN => '0',
      RXDFETAP5HOLD => '0',
      RXDFETAP5OVRDEN => '0',
      RXDFETAP6HOLD => '0',
      RXDFETAP6OVRDEN => '0',
      RXDFETAP7HOLD => '0',
      RXDFETAP7OVRDEN => '0',
      RXDFEUTHOLD => '0',
      RXDFEUTOVRDEN => '0',
      RXDFEVPHOLD => '0',
      RXDFEVPOVRDEN => '0',
      RXDFEVSEN => '0',
      RXDFEXYDEN => '1',
      RXDISPERR(7 downto 2) => NLW_gthe2_i_RXDISPERR_UNCONNECTED(7 downto 2),
      RXDISPERR(1 downto 0) => gt1_rxdisperr_out(1 downto 0),
      RXDLYBYPASS => '1',
      RXDLYEN => '0',
      RXDLYOVRDEN => '0',
      RXDLYSRESET => '0',
      RXDLYSRESETDONE => NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED,
      RXELECIDLE => NLW_gthe2_i_RXELECIDLE_UNCONNECTED,
      RXELECIDLEMODE(1) => '1',
      RXELECIDLEMODE(0) => '1',
      RXGEARBOXSLIP => '0',
      RXHEADER(5 downto 0) => NLW_gthe2_i_RXHEADER_UNCONNECTED(5 downto 0),
      RXHEADERVALID(1 downto 0) => NLW_gthe2_i_RXHEADERVALID_UNCONNECTED(1 downto 0),
      RXLPMEN => '1',
      RXLPMHFHOLD => '0',
      RXLPMHFOVRDEN => '0',
      RXLPMLFHOLD => '0',
      RXLPMLFKLOVRDEN => '0',
      RXMCOMMAALIGNEN => gt1_rxmcommaalignen_in,
      RXMONITOROUT(6 downto 0) => gt1_rxmonitorout_out(6 downto 0),
      RXMONITORSEL(1 downto 0) => gt1_rxmonitorsel_in(1 downto 0),
      RXNOTINTABLE(7 downto 2) => NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED(7 downto 2),
      RXNOTINTABLE(1 downto 0) => gt1_rxnotintable_out(1 downto 0),
      RXOOBRESET => '0',
      RXOSCALRESET => '0',
      RXOSHOLD => '0',
      RXOSINTCFG(3) => '0',
      RXOSINTCFG(2) => '1',
      RXOSINTCFG(1) => '1',
      RXOSINTCFG(0) => '0',
      RXOSINTEN => '1',
      RXOSINTHOLD => '0',
      RXOSINTID0(3) => '0',
      RXOSINTID0(2) => '0',
      RXOSINTID0(1) => '0',
      RXOSINTID0(0) => '0',
      RXOSINTNTRLEN => '0',
      RXOSINTOVRDEN => '0',
      RXOSINTSTARTED => NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED,
      RXOSINTSTROBE => '0',
      RXOSINTSTROBEDONE => NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED,
      RXOSINTSTROBESTARTED => NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED,
      RXOSINTTESTOVRDEN => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => gt1_rxoutclk_out,
      RXOUTCLKFABRIC => NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED,
      RXOUTCLKPCS => NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2) => '0',
      RXOUTCLKSEL(1) => '1',
      RXOUTCLKSEL(0) => '0',
      RXPCOMMAALIGNEN => gt1_rxpcommaalignen_in,
      RXPCSRESET => '0',
      RXPD(1 downto 0) => gt1_rxpd_in(1 downto 0),
      RXPHALIGN => '0',
      RXPHALIGNDONE => NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED,
      RXPHALIGNEN => '0',
      RXPHDLYPD => '0',
      RXPHDLYRESET => '0',
      RXPHMONITOR(4 downto 0) => NLW_gthe2_i_RXPHMONITOR_UNCONNECTED(4 downto 0),
      RXPHOVRDEN => '0',
      RXPHSLIPMONITOR(4 downto 0) => NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED(4 downto 0),
      RXPMARESET => '0',
      RXPMARESETDONE => n_33_gthe2_i,
      RXPOLARITY => '0',
      RXPRBSCNTRESET => '0',
      RXPRBSERR => NLW_gthe2_i_RXPRBSERR_UNCONNECTED,
      RXPRBSSEL(2) => '0',
      RXPRBSSEL(1) => '0',
      RXPRBSSEL(0) => '0',
      RXQPIEN => '0',
      RXQPISENN => NLW_gthe2_i_RXQPISENN_UNCONNECTED,
      RXQPISENP => NLW_gthe2_i_RXQPISENP_UNCONNECTED,
      RXRATE(2) => '0',
      RXRATE(1) => '0',
      RXRATE(0) => '0',
      RXRATEDONE => NLW_gthe2_i_RXRATEDONE_UNCONNECTED,
      RXRATEMODE => '0',
      RXRESETDONE => gt1_rxresetdone_out,
      RXSLIDE => '0',
      RXSTARTOFSEQ(1 downto 0) => NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED(1 downto 0),
      RXSTATUS(2 downto 0) => NLW_gthe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYNCALLIN => '0',
      RXSYNCDONE => NLW_gthe2_i_RXSYNCDONE_UNCONNECTED,
      RXSYNCIN => '0',
      RXSYNCMODE => '0',
      RXSYNCOUT => NLW_gthe2_i_RXSYNCOUT_UNCONNECTED,
      RXSYSCLKSEL(1) => '1',
      RXSYSCLKSEL(0) => '1',
      RXUSERRDY => I1,
      RXUSRCLK => gt1_rxusrclk_in,
      RXUSRCLK2 => gt1_rxusrclk2_in,
      RXVALID => NLW_gthe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      SIGVALIDCLK => '0',
      TSTIN(19) => '1',
      TSTIN(18) => '1',
      TSTIN(17) => '1',
      TSTIN(16) => '1',
      TSTIN(15) => '1',
      TSTIN(14) => '1',
      TSTIN(13) => '1',
      TSTIN(12) => '1',
      TSTIN(11) => '1',
      TSTIN(10) => '1',
      TSTIN(9) => '1',
      TSTIN(8) => '1',
      TSTIN(7) => '1',
      TSTIN(6) => '1',
      TSTIN(5) => '1',
      TSTIN(4) => '1',
      TSTIN(3) => '1',
      TSTIN(2) => '1',
      TSTIN(1) => '1',
      TSTIN(0) => '1',
      TX8B10BBYPASS(7) => '0',
      TX8B10BBYPASS(6) => '0',
      TX8B10BBYPASS(5) => '0',
      TX8B10BBYPASS(4) => '0',
      TX8B10BBYPASS(3) => '0',
      TX8B10BBYPASS(2) => '0',
      TX8B10BBYPASS(1) => '0',
      TX8B10BBYPASS(0) => '0',
      TX8B10BEN => '0',
      TXBUFDIFFCTRL(2) => '1',
      TXBUFDIFFCTRL(1) => '0',
      TXBUFDIFFCTRL(0) => '0',
      TXBUFSTATUS(1 downto 0) => NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED(1 downto 0),
      TXCHARDISPMODE(7) => '0',
      TXCHARDISPMODE(6) => '0',
      TXCHARDISPMODE(5) => '0',
      TXCHARDISPMODE(4) => '0',
      TXCHARDISPMODE(3) => '0',
      TXCHARDISPMODE(2) => '0',
      TXCHARDISPMODE(1) => '0',
      TXCHARDISPMODE(0) => '0',
      TXCHARDISPVAL(7) => '0',
      TXCHARDISPVAL(6) => '0',
      TXCHARDISPVAL(5) => '0',
      TXCHARDISPVAL(4) => '0',
      TXCHARDISPVAL(3) => '0',
      TXCHARDISPVAL(2) => '0',
      TXCHARDISPVAL(1) => '0',
      TXCHARDISPVAL(0) => '0',
      TXCHARISK(7) => '0',
      TXCHARISK(6) => '0',
      TXCHARISK(5) => '0',
      TXCHARISK(4) => '0',
      TXCHARISK(3) => '0',
      TXCHARISK(2) => '0',
      TXCHARISK(1) => '0',
      TXCHARISK(0) => '0',
      TXCOMFINISH => NLW_gthe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(63) => '0',
      TXDATA(62) => '0',
      TXDATA(61) => '0',
      TXDATA(60) => '0',
      TXDATA(59) => '0',
      TXDATA(58) => '0',
      TXDATA(57) => '0',
      TXDATA(56) => '0',
      TXDATA(55) => '0',
      TXDATA(54) => '0',
      TXDATA(53) => '0',
      TXDATA(52) => '0',
      TXDATA(51) => '0',
      TXDATA(50) => '0',
      TXDATA(49) => '0',
      TXDATA(48) => '0',
      TXDATA(47) => '0',
      TXDATA(46) => '0',
      TXDATA(45) => '0',
      TXDATA(44) => '0',
      TXDATA(43) => '0',
      TXDATA(42) => '0',
      TXDATA(41) => '0',
      TXDATA(40) => '0',
      TXDATA(39) => '0',
      TXDATA(38) => '0',
      TXDATA(37) => '0',
      TXDATA(36) => '0',
      TXDATA(35) => '0',
      TXDATA(34) => '0',
      TXDATA(33) => '0',
      TXDATA(32) => '0',
      TXDATA(31) => '0',
      TXDATA(30) => '0',
      TXDATA(29) => '0',
      TXDATA(28) => '0',
      TXDATA(27) => '0',
      TXDATA(26) => '0',
      TXDATA(25) => '0',
      TXDATA(24) => '0',
      TXDATA(23) => '0',
      TXDATA(22) => '0',
      TXDATA(21) => '0',
      TXDATA(20) => '0',
      TXDATA(19) => '0',
      TXDATA(18) => '0',
      TXDATA(17) => '0',
      TXDATA(16) => '0',
      TXDATA(15) => '0',
      TXDATA(14) => '0',
      TXDATA(13) => '0',
      TXDATA(12) => '0',
      TXDATA(11) => '0',
      TXDATA(10) => '0',
      TXDATA(9) => '0',
      TXDATA(8) => '0',
      TXDATA(7) => '0',
      TXDATA(6) => '0',
      TXDATA(5) => '0',
      TXDATA(4) => '0',
      TXDATA(3) => '0',
      TXDATA(2) => '0',
      TXDATA(1) => '0',
      TXDATA(0) => '0',
      TXDEEMPH => '0',
      TXDETECTRX => '0',
      TXDIFFCTRL(3) => '1',
      TXDIFFCTRL(2) => '0',
      TXDIFFCTRL(1) => '0',
      TXDIFFCTRL(0) => '0',
      TXDIFFPD => '1',
      TXDLYBYPASS => '1',
      TXDLYEN => '0',
      TXDLYHOLD => '0',
      TXDLYOVRDEN => '0',
      TXDLYSRESET => '0',
      TXDLYSRESETDONE => NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED,
      TXDLYUPDOWN => '0',
      TXELECIDLE => '1',
      TXGEARBOXREADY => NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED,
      TXHEADER(2) => '0',
      TXHEADER(1) => '0',
      TXHEADER(0) => '0',
      TXINHIBIT => '0',
      TXMAINCURSOR(6) => '0',
      TXMAINCURSOR(5) => '0',
      TXMAINCURSOR(4) => '0',
      TXMAINCURSOR(3) => '0',
      TXMAINCURSOR(2) => '0',
      TXMAINCURSOR(1) => '0',
      TXMAINCURSOR(0) => '0',
      TXMARGIN(2) => '0',
      TXMARGIN(1) => '0',
      TXMARGIN(0) => '0',
      TXOUTCLK => NLW_gthe2_i_TXOUTCLK_UNCONNECTED,
      TXOUTCLKFABRIC => NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED,
      TXOUTCLKPCS => NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED,
      TXOUTCLKSEL(2) => '0',
      TXOUTCLKSEL(1) => '1',
      TXOUTCLKSEL(0) => '0',
      TXPCSRESET => '0',
      TXPD(1) => '1',
      TXPD(0) => '1',
      TXPDELECIDLEMODE => '1',
      TXPHALIGN => '0',
      TXPHALIGNDONE => NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED,
      TXPHALIGNEN => '0',
      TXPHDLYPD => '1',
      TXPHDLYRESET => '0',
      TXPHDLYTSTCLK => '0',
      TXPHINIT => '0',
      TXPHINITDONE => NLW_gthe2_i_TXPHINITDONE_UNCONNECTED,
      TXPHOVRDEN => '0',
      TXPIPPMEN => '0',
      TXPIPPMOVRDEN => '0',
      TXPIPPMPD => '1',
      TXPIPPMSEL => '0',
      TXPIPPMSTEPSIZE(4) => '0',
      TXPIPPMSTEPSIZE(3) => '0',
      TXPIPPMSTEPSIZE(2) => '0',
      TXPIPPMSTEPSIZE(1) => '0',
      TXPIPPMSTEPSIZE(0) => '0',
      TXPISOPD => '1',
      TXPMARESET => '0',
      TXPMARESETDONE => NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED,
      TXPOLARITY => '0',
      TXPOSTCURSOR(4) => '0',
      TXPOSTCURSOR(3) => '0',
      TXPOSTCURSOR(2) => '0',
      TXPOSTCURSOR(1) => '0',
      TXPOSTCURSOR(0) => '0',
      TXPOSTCURSORINV => '0',
      TXPRBSFORCEERR => '0',
      TXPRBSSEL(2) => '0',
      TXPRBSSEL(1) => '0',
      TXPRBSSEL(0) => '0',
      TXPRECURSOR(4) => '0',
      TXPRECURSOR(3) => '0',
      TXPRECURSOR(2) => '0',
      TXPRECURSOR(1) => '0',
      TXPRECURSOR(0) => '0',
      TXPRECURSORINV => '0',
      TXQPIBIASEN => '0',
      TXQPISENN => NLW_gthe2_i_TXQPISENN_UNCONNECTED,
      TXQPISENP => NLW_gthe2_i_TXQPISENP_UNCONNECTED,
      TXQPISTRONGPDOWN => '0',
      TXQPIWEAKPUP => '0',
      TXRATE(2) => '0',
      TXRATE(1) => '0',
      TXRATE(0) => '0',
      TXRATEDONE => NLW_gthe2_i_TXRATEDONE_UNCONNECTED,
      TXRATEMODE => '0',
      TXRESETDONE => NLW_gthe2_i_TXRESETDONE_UNCONNECTED,
      TXSEQUENCE(6) => '0',
      TXSEQUENCE(5) => '0',
      TXSEQUENCE(4) => '0',
      TXSEQUENCE(3) => '0',
      TXSEQUENCE(2) => '0',
      TXSEQUENCE(1) => '0',
      TXSEQUENCE(0) => '0',
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYNCALLIN => '0',
      TXSYNCDONE => NLW_gthe2_i_TXSYNCDONE_UNCONNECTED,
      TXSYNCIN => '0',
      TXSYNCMODE => '0',
      TXSYNCOUT => NLW_gthe2_i_TXSYNCOUT_UNCONNECTED,
      TXSYSCLKSEL(1) => '0',
      TXSYSCLKSEL(0) => '0',
      TXUSERRDY => '0',
      TXUSRCLK => '0',
      TXUSRCLK2 => '0'
    );
gtrxreset_seq_i: entity work.gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_8
    port map (
      AR(0) => AR(0),
      DRPADDR(8) => n_20_gtrxreset_seq_i,
      DRPADDR(7) => n_21_gtrxreset_seq_i,
      DRPADDR(6) => n_22_gtrxreset_seq_i,
      DRPADDR(5) => n_23_gtrxreset_seq_i,
      DRPADDR(4) => n_24_gtrxreset_seq_i,
      DRPADDR(3) => n_25_gtrxreset_seq_i,
      DRPADDR(2) => n_26_gtrxreset_seq_i,
      DRPADDR(1) => n_27_gtrxreset_seq_i,
      DRPADDR(0) => n_28_gtrxreset_seq_i,
      DRPDI(15) => n_2_gtrxreset_seq_i,
      DRPDI(14) => n_3_gtrxreset_seq_i,
      DRPDI(13) => n_4_gtrxreset_seq_i,
      DRPDI(12) => n_5_gtrxreset_seq_i,
      DRPDI(11) => n_6_gtrxreset_seq_i,
      DRPDI(10) => n_7_gtrxreset_seq_i,
      DRPDI(9) => n_8_gtrxreset_seq_i,
      DRPDI(8) => n_9_gtrxreset_seq_i,
      DRPDI(7) => n_10_gtrxreset_seq_i,
      DRPDI(6) => n_11_gtrxreset_seq_i,
      DRPDI(5) => n_12_gtrxreset_seq_i,
      DRPDI(4) => n_13_gtrxreset_seq_i,
      DRPDI(3) => n_14_gtrxreset_seq_i,
      DRPDI(2) => n_15_gtrxreset_seq_i,
      DRPDI(1) => n_16_gtrxreset_seq_i,
      DRPDI(0) => n_17_gtrxreset_seq_i,
      GTRXRESET_OUT => GTRXRESET_OUT,
      I1 => \^o1\,
      I4 => I4,
      O1 => n_1_gtrxreset_seq_i,
      O2 => n_18_gtrxreset_seq_i,
      O3 => n_19_gtrxreset_seq_i,
      data_in => n_33_gthe2_i,
      gt1_drpaddr_in(8 downto 0) => gt1_drpaddr_in(8 downto 0),
      gt1_drpclk_in => gt1_drpclk_in,
      gt1_drpdi_in(15 downto 0) => gt1_drpdi_in(15 downto 0),
      gt1_drpdo_out(15 downto 0) => \^gt1_drpdo_out\(15 downto 0),
      gt1_drpen_in => gt1_drpen_in,
      gt1_drpwe_in => gt1_drpwe_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_4\ is
  port (
    O1 : out STD_LOGIC;
    gt2_eyescandataerror_out : out STD_LOGIC;
    gt2_rxoutclk_out : out STD_LOGIC;
    gt2_rxresetdone_out : out STD_LOGIC;
    gt2_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt2_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt2_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GT2_DRP_BUSY_OUT : out STD_LOGIC;
    gt2_drpclk_in : in STD_LOGIC;
    gt2_eyescanreset_in : in STD_LOGIC;
    gt2_eyescantrigger_in : in STD_LOGIC;
    gt2_gthrxn_in : in STD_LOGIC;
    gt2_gthrxp_in : in STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC;
    gt2_rxbufreset_in : in STD_LOGIC;
    gt2_rxmcommaalignen_in : in STD_LOGIC;
    gt2_rxpcommaalignen_in : in STD_LOGIC;
    I2 : in STD_LOGIC;
    gt2_rxusrclk_in : in STD_LOGIC;
    gt2_rxusrclk2_in : in STD_LOGIC;
    gt2_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    I5 : in STD_LOGIC;
    gt2_drpen_in : in STD_LOGIC;
    gt2_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpwe_in : in STD_LOGIC;
    gt2_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_4\ : entity is "gtwizard_32_Rx_GT";
end \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_4\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_4\ is
  signal GTRXRESET_OUT : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \^gt2_drpdo_out\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal n_10_gtrxreset_seq_i : STD_LOGIC;
  signal n_11_gtrxreset_seq_i : STD_LOGIC;
  signal n_12_gtrxreset_seq_i : STD_LOGIC;
  signal n_13_gtrxreset_seq_i : STD_LOGIC;
  signal n_14_gtrxreset_seq_i : STD_LOGIC;
  signal n_15_gtrxreset_seq_i : STD_LOGIC;
  signal n_16_gtrxreset_seq_i : STD_LOGIC;
  signal n_17_gtrxreset_seq_i : STD_LOGIC;
  signal n_18_gtrxreset_seq_i : STD_LOGIC;
  signal n_19_gtrxreset_seq_i : STD_LOGIC;
  signal n_1_gtrxreset_seq_i : STD_LOGIC;
  signal n_20_gtrxreset_seq_i : STD_LOGIC;
  signal n_21_gtrxreset_seq_i : STD_LOGIC;
  signal n_22_gtrxreset_seq_i : STD_LOGIC;
  signal n_23_gtrxreset_seq_i : STD_LOGIC;
  signal n_24_gtrxreset_seq_i : STD_LOGIC;
  signal n_25_gtrxreset_seq_i : STD_LOGIC;
  signal n_26_gtrxreset_seq_i : STD_LOGIC;
  signal n_270_gthe2_i : STD_LOGIC;
  signal n_27_gtrxreset_seq_i : STD_LOGIC;
  signal n_28_gtrxreset_seq_i : STD_LOGIC;
  signal n_2_gtrxreset_seq_i : STD_LOGIC;
  signal n_33_gthe2_i : STD_LOGIC;
  signal n_3_gtrxreset_seq_i : STD_LOGIC;
  signal n_4_gtrxreset_seq_i : STD_LOGIC;
  signal n_5_gtrxreset_seq_i : STD_LOGIC;
  signal n_6_gtrxreset_seq_i : STD_LOGIC;
  signal n_7_gtrxreset_seq_i : STD_LOGIC;
  signal n_8_gtrxreset_seq_i : STD_LOGIC;
  signal n_9_gtrxreset_seq_i : STD_LOGIC;
  signal NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_CPLLLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTHTXN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTHTXP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_PHYSTATUS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RSOSINTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCDRLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMINITDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMMADET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMSASDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXELECIDLE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXPRBSERR_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXCOMFINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPHINITDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXCHARISK_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXCHBONDO_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 16 );
  signal NLW_gthe2_i_RXDATAVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXDISPERR_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXHEADER_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_gthe2_i_RXHEADERVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXPHMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute box_type : string;
  attribute box_type of gthe2_i : label is "PRIMITIVE";
begin
  O1 <= \^o1\;
  gt2_drpdo_out(15 downto 0) <= \^gt2_drpdo_out\(15 downto 0);
  n_270_gthe2_i <= 'Z';
drp_busy_i1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt2_drpclk_in,
      CE => '1',
      D => n_19_gtrxreset_seq_i,
      Q => GT2_DRP_BUSY_OUT,
      R => '0'
    );
gthe2_i: unisim.vcomponents.GTHE2_CHANNEL
    generic map(
      ACJTAG_DEBUG_MODE => '0',
      ACJTAG_MODE => '0',
      ACJTAG_RESET => '0',
      ADAPT_CFG0 => X"00C10",
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"1111111111",
      ALIGN_COMMA_WORD => 2,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      A_RXOSCALRESET => '0',
      CBCC_DATA_SOURCE_SEL => "DECODED",
      CFOK_CFG => X"24800040E80",
      CFOK_CFG2 => B"100000",
      CFOK_CFG3 => B"100000",
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 1,
      CHAN_BOND_SEQ_1_1 => B"0000000000",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_CORRECT_USE => "FALSE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 10,
      CLK_COR_MIN_LAT => 8,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0100000000",
      CLK_COR_SEQ_1_2 => B"0000000000",
      CLK_COR_SEQ_1_3 => B"0000000000",
      CLK_COR_SEQ_1_4 => B"0000000000",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0100000000",
      CLK_COR_SEQ_2_2 => B"0000000000",
      CLK_COR_SEQ_2_3 => B"0000000000",
      CLK_COR_SEQ_2_4 => B"0000000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "FALSE",
      CLK_COR_SEQ_LEN => 1,
      CPLL_CFG => X"00BC07DC",
      CPLL_FBDIV => 5,
      CPLL_FBDIV_45 => 5,
      CPLL_INIT_CFG => X"00001E",
      CPLL_LOCK_CFG => X"01E8",
      CPLL_REFCLK_DIV => 1,
      DEC_MCOMMA_DETECT => "TRUE",
      DEC_PCOMMA_DETECT => "TRUE",
      DEC_VALID_COMMA_ONLY => "TRUE",
      DMONITOR_CFG => X"000A00",
      ES_CLK_PHASE_SEL => '0',
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "TRUE",
      ES_HORZ_OFFSET => X"000",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER => X"00000000000000000000",
      ES_QUAL_MASK => X"00000000000000000000",
      ES_SDATA_MASK => X"00000000000000000000",
      ES_VERT_OFFSET => B"000000000",
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"000",
      IS_CLKRSVD0_INVERTED => '0',
      IS_CLKRSVD1_INVERTED => '0',
      IS_CPLLLOCKDETCLK_INVERTED => '0',
      IS_DMONITORCLK_INVERTED => '0',
      IS_DRPCLK_INVERTED => '0',
      IS_GTGREFCLK_INVERTED => '0',
      IS_RXUSRCLK2_INVERTED => '0',
      IS_RXUSRCLK_INVERTED => '0',
      IS_SIGVALIDCLK_INVERTED => '0',
      IS_TXPHDLYTSTCLK_INVERTED => '0',
      IS_TXUSRCLK2_INVERTED => '0',
      IS_TXUSRCLK_INVERTED => '0',
      LOOPBACK_CFG => '0',
      OUTREFCLK_SEL_INV => B"11",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD_ATTR => X"000000000000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"3C",
      PD_TRANS_TIME_TO_P2 => X"64",
      PMA_RSV => B"00000000000111100111000010000000",
      PMA_RSV2 => B"00011100000000000000000000001010",
      PMA_RSV3 => B"00",
      PMA_RSV4 => B"000000000001000",
      PMA_RSV5 => B"0000",
      RESET_POWERSAVE_DISABLE => '0',
      RXBUFRESET_TIME => B"00001",
      RXBUF_ADDR_MODE => "FAST",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 61,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 4,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG => X"0002007FE1000C2080018",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG => B"010101",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXDFELPMRESET_TIME => B"0001111",
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"030",
      RXDLY_TAP_CFG => X"0000",
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPM_HF_CFG => B"00001000000000",
      RXLPM_LF_CFG => B"001001000000000000",
      RXOOB_CFG => B"0000110",
      RXOOB_CLK_CFG => "PMA",
      RXOSCALRESET_TIME => B"00011",
      RXOSCALRESET_TIMEOUT => B"00000",
      RXOUT_DIV => 2,
      RXPCSRESET_TIME => B"00001",
      RXPHDLY_CFG => X"084020",
      RXPH_CFG => X"C00002",
      RXPH_MONITOR_SEL => B"00000",
      RXPI_CFG0 => B"00",
      RXPI_CFG1 => B"11",
      RXPI_CFG2 => B"11",
      RXPI_CFG3 => B"11",
      RXPI_CFG4 => '0',
      RXPI_CFG5 => '0',
      RXPI_CFG6 => B"100",
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RXSYNC_MULTILANE => '1',
      RXSYNC_OVRD => '0',
      RXSYNC_SKIP_DA => '0',
      RX_BIAS_CFG => B"000011000000000000010000",
      RX_BUFFER_CFG => B"000000",
      RX_CLK25_DIV => 6,
      RX_CLKMUX_PD => '1',
      RX_CM_SEL => B"00",
      RX_CM_TRIM => B"0000",
      RX_DATA_WIDTH => 20,
      RX_DDI_SEL => B"000000",
      RX_DEBUG_CFG => B"00000000000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DFELPM_CFG0 => B"0110",
      RX_DFELPM_CFG1 => '0',
      RX_DFELPM_KLKH_AGC_STUP_EN => '1',
      RX_DFE_AGC_CFG0 => B"00",
      RX_DFE_AGC_CFG1 => B"010",
      RX_DFE_AGC_CFG2 => B"0000",
      RX_DFE_AGC_OVRDEN => '1',
      RX_DFE_GAIN_CFG => X"0020C0",
      RX_DFE_H2_CFG => B"000000000000",
      RX_DFE_H3_CFG => B"000001000000",
      RX_DFE_H4_CFG => B"00011100000",
      RX_DFE_H5_CFG => B"00011100000",
      RX_DFE_H6_CFG => B"00000100000",
      RX_DFE_H7_CFG => B"00000100000",
      RX_DFE_KL_CFG => B"001000001000000000000001100010000",
      RX_DFE_KL_LPM_KH_CFG0 => B"01",
      RX_DFE_KL_LPM_KH_CFG1 => B"010",
      RX_DFE_KL_LPM_KH_CFG2 => B"0010",
      RX_DFE_KL_LPM_KH_OVRDEN => '1',
      RX_DFE_KL_LPM_KL_CFG0 => B"01",
      RX_DFE_KL_LPM_KL_CFG1 => B"010",
      RX_DFE_KL_LPM_KL_CFG2 => B"0010",
      RX_DFE_KL_LPM_KL_OVRDEN => '1',
      RX_DFE_LPM_CFG => X"0080",
      RX_DFE_LPM_HOLD_DURING_EIDLE => '0',
      RX_DFE_ST_CFG => X"00E100000C003F",
      RX_DFE_UT_CFG => B"00011100000000000",
      RX_DFE_VP_CFG => B"00011101010100011",
      RX_DISPERR_SEQ_MATCH => "TRUE",
      RX_INT_DATAWIDTH => 0,
      RX_OS_CFG => B"0000010000000",
      RX_SIG_VALID_DLY => 10,
      RX_XCLK_SEL => "RXREC",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"1111",
      SATA_BURST_VAL => B"100",
      SATA_CPLL_CFG => "VCO_3000MHZ",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_CPLLREFCLK_SEL => B"001",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "FALSE",
      SIM_TX_EIDLE_DRIVE_LEVEL => "X",
      SIM_VERSION => "2.0",
      TERM_RCAL_CFG => B"100001000010000",
      TERM_RCAL_OVRD => B"000",
      TRANS_TIME_RATE => X"0E",
      TST_RSV => X"00000000",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"001F",
      TXDLY_LCFG => X"030",
      TXDLY_TAP_CFG => X"0000",
      TXGEARBOX_EN => "FALSE",
      TXOOB_CFG => '0',
      TXOUT_DIV => 1,
      TXPCSRESET_TIME => B"00001",
      TXPHDLY_CFG => X"084020",
      TXPH_CFG => X"0780",
      TXPH_MONITOR_SEL => B"00000",
      TXPI_CFG0 => B"00",
      TXPI_CFG1 => B"00",
      TXPI_CFG2 => B"00",
      TXPI_CFG3 => '0',
      TXPI_CFG4 => '0',
      TXPI_CFG5 => B"100",
      TXPI_GREY_SEL => '0',
      TXPI_INVSTROBE_SEL => '0',
      TXPI_PPMCLK_SEL => "TXUSRCLK2",
      TXPI_PPM_CFG => B"00000000",
      TXPI_SYNFREQ_PPM => B"000",
      TXPMARESET_TIME => B"00001",
      TXSYNC_MULTILANE => '0',
      TXSYNC_OVRD => '0',
      TXSYNC_SKIP_DA => '0',
      TX_CLK25_DIV => 6,
      TX_CLKMUX_PD => '1',
      TX_DATA_WIDTH => 20,
      TX_DEEMPH0 => B"000000",
      TX_DEEMPH1 => B"000000",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"110",
      TX_EIDLE_DEASSERT_DELAY => B"100",
      TX_INT_DATAWIDTH => 0,
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001110",
      TX_MARGIN_FULL_1 => B"1001001",
      TX_MARGIN_FULL_2 => B"1000101",
      TX_MARGIN_FULL_3 => B"1000010",
      TX_MARGIN_FULL_4 => B"1000000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000100",
      TX_MARGIN_LOW_2 => B"1000010",
      TX_MARGIN_LOW_3 => B"1000000",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_QPI_STATUS_EN => '0',
      TX_RXDETECT_CFG => X"1832",
      TX_RXDETECT_PRECHARGE_TIME => X"155CC",
      TX_RXDETECT_REF => B"100",
      TX_XCLK_SEL => "TXOUT",
      UCODEER_CLR => '0',
      USE_PCS_CLK_PHASE_SEL => '0'
    )
    port map (
      CFGRESET => '0',
      CLKRSVD0 => '0',
      CLKRSVD1 => '0',
      CPLLFBCLKLOST => NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED,
      CPLLLOCK => NLW_gthe2_i_CPLLLOCK_UNCONNECTED,
      CPLLLOCKDETCLK => '0',
      CPLLLOCKEN => '1',
      CPLLPD => '1',
      CPLLREFCLKLOST => NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED,
      CPLLREFCLKSEL(2) => '0',
      CPLLREFCLKSEL(1) => '0',
      CPLLREFCLKSEL(0) => '1',
      CPLLRESET => '0',
      DMONFIFORESET => '0',
      DMONITORCLK => '0',
      DMONITOROUT(14 downto 0) => gt2_dmonitorout_out(14 downto 0),
      DRPADDR(8) => n_20_gtrxreset_seq_i,
      DRPADDR(7) => n_21_gtrxreset_seq_i,
      DRPADDR(6) => n_22_gtrxreset_seq_i,
      DRPADDR(5) => n_23_gtrxreset_seq_i,
      DRPADDR(4) => n_24_gtrxreset_seq_i,
      DRPADDR(3) => n_25_gtrxreset_seq_i,
      DRPADDR(2) => n_26_gtrxreset_seq_i,
      DRPADDR(1) => n_27_gtrxreset_seq_i,
      DRPADDR(0) => n_28_gtrxreset_seq_i,
      DRPCLK => gt2_drpclk_in,
      DRPDI(15) => n_2_gtrxreset_seq_i,
      DRPDI(14) => n_3_gtrxreset_seq_i,
      DRPDI(13) => n_4_gtrxreset_seq_i,
      DRPDI(12) => n_5_gtrxreset_seq_i,
      DRPDI(11) => n_6_gtrxreset_seq_i,
      DRPDI(10) => n_7_gtrxreset_seq_i,
      DRPDI(9) => n_8_gtrxreset_seq_i,
      DRPDI(8) => n_9_gtrxreset_seq_i,
      DRPDI(7) => n_10_gtrxreset_seq_i,
      DRPDI(6) => n_11_gtrxreset_seq_i,
      DRPDI(5) => n_12_gtrxreset_seq_i,
      DRPDI(4) => n_13_gtrxreset_seq_i,
      DRPDI(3) => n_14_gtrxreset_seq_i,
      DRPDI(2) => n_15_gtrxreset_seq_i,
      DRPDI(1) => n_16_gtrxreset_seq_i,
      DRPDI(0) => n_17_gtrxreset_seq_i,
      DRPDO(15 downto 0) => \^gt2_drpdo_out\(15 downto 0),
      DRPEN => n_1_gtrxreset_seq_i,
      DRPRDY => \^o1\,
      DRPWE => n_18_gtrxreset_seq_i,
      EYESCANDATAERROR => gt2_eyescandataerror_out,
      EYESCANMODE => '0',
      EYESCANRESET => gt2_eyescanreset_in,
      EYESCANTRIGGER => gt2_eyescantrigger_in,
      GTGREFCLK => '0',
      GTHRXN => gt2_gthrxn_in,
      GTHRXP => gt2_gthrxp_in,
      GTHTXN => NLW_gthe2_i_GTHTXN_UNCONNECTED,
      GTHTXP => NLW_gthe2_i_GTHTXP_UNCONNECTED,
      GTNORTHREFCLK0 => '0',
      GTNORTHREFCLK1 => '0',
      GTREFCLK0 => '0',
      GTREFCLK1 => '0',
      GTREFCLKMONITOR => NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED,
      GTRESETSEL => '0',
      GTRSVD(15) => '0',
      GTRSVD(14) => '0',
      GTRSVD(13) => '0',
      GTRSVD(12) => '0',
      GTRSVD(11) => '0',
      GTRSVD(10) => '0',
      GTRSVD(9) => '0',
      GTRSVD(8) => '0',
      GTRSVD(7) => '0',
      GTRSVD(6) => '0',
      GTRSVD(5) => '0',
      GTRSVD(4) => '0',
      GTRSVD(3) => '0',
      GTRSVD(2) => '0',
      GTRSVD(1) => '0',
      GTRSVD(0) => '0',
      GTRXRESET => GTRXRESET_OUT,
      GTSOUTHREFCLK0 => '0',
      GTSOUTHREFCLK1 => '0',
      GTTXRESET => n_270_gthe2_i,
      LOOPBACK(2) => '0',
      LOOPBACK(1) => '0',
      LOOPBACK(0) => '0',
      PCSRSVDIN(15) => '0',
      PCSRSVDIN(14) => '0',
      PCSRSVDIN(13) => '0',
      PCSRSVDIN(12) => '0',
      PCSRSVDIN(11) => '0',
      PCSRSVDIN(10) => '0',
      PCSRSVDIN(9) => '0',
      PCSRSVDIN(8) => '0',
      PCSRSVDIN(7) => '0',
      PCSRSVDIN(6) => '0',
      PCSRSVDIN(5) => '0',
      PCSRSVDIN(4) => '0',
      PCSRSVDIN(3) => '0',
      PCSRSVDIN(2) => '0',
      PCSRSVDIN(1) => '0',
      PCSRSVDIN(0) => '0',
      PCSRSVDIN2(4) => '0',
      PCSRSVDIN2(3) => '0',
      PCSRSVDIN2(2) => '0',
      PCSRSVDIN2(1) => '0',
      PCSRSVDIN2(0) => '0',
      PCSRSVDOUT(15 downto 0) => NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED(15 downto 0),
      PHYSTATUS => NLW_gthe2_i_PHYSTATUS_UNCONNECTED,
      PMARSVDIN(4) => '0',
      PMARSVDIN(3) => '0',
      PMARSVDIN(2) => '0',
      PMARSVDIN(1) => '0',
      PMARSVDIN(0) => '0',
      QPLLCLK => GT0_QPLLOUTCLK_IN,
      QPLLREFCLK => GT0_QPLLOUTREFCLK_IN,
      RESETOVRD => '0',
      RSOSINTDONE => NLW_gthe2_i_RSOSINTDONE_UNCONNECTED,
      RX8B10BEN => '1',
      RXADAPTSELTEST(13) => '0',
      RXADAPTSELTEST(12) => '0',
      RXADAPTSELTEST(11) => '0',
      RXADAPTSELTEST(10) => '0',
      RXADAPTSELTEST(9) => '0',
      RXADAPTSELTEST(8) => '0',
      RXADAPTSELTEST(7) => '0',
      RXADAPTSELTEST(6) => '0',
      RXADAPTSELTEST(5) => '0',
      RXADAPTSELTEST(4) => '0',
      RXADAPTSELTEST(3) => '0',
      RXADAPTSELTEST(2) => '0',
      RXADAPTSELTEST(1) => '0',
      RXADAPTSELTEST(0) => '0',
      RXBUFRESET => gt2_rxbufreset_in,
      RXBUFSTATUS(2 downto 0) => gt2_rxbufstatus_out(2 downto 0),
      RXBYTEISALIGNED => NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED,
      RXBYTEREALIGN => NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED,
      RXCDRFREQRESET => '0',
      RXCDRHOLD => '0',
      RXCDRLOCK => NLW_gthe2_i_RXCDRLOCK_UNCONNECTED,
      RXCDROVRDEN => '0',
      RXCDRRESET => '0',
      RXCDRRESETRSV => '0',
      RXCHANBONDSEQ => NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED,
      RXCHANISALIGNED => NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED,
      RXCHANREALIGN => NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED,
      RXCHARISCOMMA(7 downto 2) => NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED(7 downto 2),
      RXCHARISCOMMA(1 downto 0) => gt2_rxchariscomma_out(1 downto 0),
      RXCHARISK(7 downto 2) => NLW_gthe2_i_RXCHARISK_UNCONNECTED(7 downto 2),
      RXCHARISK(1 downto 0) => gt2_rxcharisk_out(1 downto 0),
      RXCHBONDEN => '0',
      RXCHBONDI(4) => '0',
      RXCHBONDI(3) => '0',
      RXCHBONDI(2) => '0',
      RXCHBONDI(1) => '0',
      RXCHBONDI(0) => '0',
      RXCHBONDLEVEL(2) => '0',
      RXCHBONDLEVEL(1) => '0',
      RXCHBONDLEVEL(0) => '0',
      RXCHBONDMASTER => '0',
      RXCHBONDO(4 downto 0) => NLW_gthe2_i_RXCHBONDO_UNCONNECTED(4 downto 0),
      RXCHBONDSLAVE => '0',
      RXCLKCORCNT(1 downto 0) => NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED(1 downto 0),
      RXCOMINITDET => NLW_gthe2_i_RXCOMINITDET_UNCONNECTED,
      RXCOMMADET => NLW_gthe2_i_RXCOMMADET_UNCONNECTED,
      RXCOMMADETEN => '1',
      RXCOMSASDET => NLW_gthe2_i_RXCOMSASDET_UNCONNECTED,
      RXCOMWAKEDET => NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED,
      RXDATA(63 downto 16) => NLW_gthe2_i_RXDATA_UNCONNECTED(63 downto 16),
      RXDATA(15 downto 0) => gt2_rxdata_out(15 downto 0),
      RXDATAVALID(1 downto 0) => NLW_gthe2_i_RXDATAVALID_UNCONNECTED(1 downto 0),
      RXDDIEN => '0',
      RXDFEAGCHOLD => '0',
      RXDFEAGCOVRDEN => '1',
      RXDFEAGCTRL(4) => '1',
      RXDFEAGCTRL(3) => '0',
      RXDFEAGCTRL(2) => '0',
      RXDFEAGCTRL(1) => '0',
      RXDFEAGCTRL(0) => '0',
      RXDFECM1EN => '0',
      RXDFELFHOLD => '0',
      RXDFELFOVRDEN => '0',
      RXDFELPMRESET => '0',
      RXDFESLIDETAP(4) => '0',
      RXDFESLIDETAP(3) => '0',
      RXDFESLIDETAP(2) => '0',
      RXDFESLIDETAP(1) => '0',
      RXDFESLIDETAP(0) => '0',
      RXDFESLIDETAPADAPTEN => '0',
      RXDFESLIDETAPHOLD => '0',
      RXDFESLIDETAPID(5) => '0',
      RXDFESLIDETAPID(4) => '0',
      RXDFESLIDETAPID(3) => '0',
      RXDFESLIDETAPID(2) => '0',
      RXDFESLIDETAPID(1) => '0',
      RXDFESLIDETAPID(0) => '0',
      RXDFESLIDETAPINITOVRDEN => '0',
      RXDFESLIDETAPONLYADAPTEN => '0',
      RXDFESLIDETAPOVRDEN => '0',
      RXDFESLIDETAPSTARTED => NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED,
      RXDFESLIDETAPSTROBE => '0',
      RXDFESLIDETAPSTROBEDONE => NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED,
      RXDFESLIDETAPSTROBESTARTED => NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED,
      RXDFESTADAPTDONE => NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED,
      RXDFETAP2HOLD => '0',
      RXDFETAP2OVRDEN => '0',
      RXDFETAP3HOLD => '0',
      RXDFETAP3OVRDEN => '0',
      RXDFETAP4HOLD => '0',
      RXDFETAP4OVRDEN => '0',
      RXDFETAP5HOLD => '0',
      RXDFETAP5OVRDEN => '0',
      RXDFETAP6HOLD => '0',
      RXDFETAP6OVRDEN => '0',
      RXDFETAP7HOLD => '0',
      RXDFETAP7OVRDEN => '0',
      RXDFEUTHOLD => '0',
      RXDFEUTOVRDEN => '0',
      RXDFEVPHOLD => '0',
      RXDFEVPOVRDEN => '0',
      RXDFEVSEN => '0',
      RXDFEXYDEN => '1',
      RXDISPERR(7 downto 2) => NLW_gthe2_i_RXDISPERR_UNCONNECTED(7 downto 2),
      RXDISPERR(1 downto 0) => gt2_rxdisperr_out(1 downto 0),
      RXDLYBYPASS => '1',
      RXDLYEN => '0',
      RXDLYOVRDEN => '0',
      RXDLYSRESET => '0',
      RXDLYSRESETDONE => NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED,
      RXELECIDLE => NLW_gthe2_i_RXELECIDLE_UNCONNECTED,
      RXELECIDLEMODE(1) => '1',
      RXELECIDLEMODE(0) => '1',
      RXGEARBOXSLIP => '0',
      RXHEADER(5 downto 0) => NLW_gthe2_i_RXHEADER_UNCONNECTED(5 downto 0),
      RXHEADERVALID(1 downto 0) => NLW_gthe2_i_RXHEADERVALID_UNCONNECTED(1 downto 0),
      RXLPMEN => '1',
      RXLPMHFHOLD => '0',
      RXLPMHFOVRDEN => '0',
      RXLPMLFHOLD => '0',
      RXLPMLFKLOVRDEN => '0',
      RXMCOMMAALIGNEN => gt2_rxmcommaalignen_in,
      RXMONITOROUT(6 downto 0) => gt2_rxmonitorout_out(6 downto 0),
      RXMONITORSEL(1 downto 0) => gt2_rxmonitorsel_in(1 downto 0),
      RXNOTINTABLE(7 downto 2) => NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED(7 downto 2),
      RXNOTINTABLE(1 downto 0) => gt2_rxnotintable_out(1 downto 0),
      RXOOBRESET => '0',
      RXOSCALRESET => '0',
      RXOSHOLD => '0',
      RXOSINTCFG(3) => '0',
      RXOSINTCFG(2) => '1',
      RXOSINTCFG(1) => '1',
      RXOSINTCFG(0) => '0',
      RXOSINTEN => '1',
      RXOSINTHOLD => '0',
      RXOSINTID0(3) => '0',
      RXOSINTID0(2) => '0',
      RXOSINTID0(1) => '0',
      RXOSINTID0(0) => '0',
      RXOSINTNTRLEN => '0',
      RXOSINTOVRDEN => '0',
      RXOSINTSTARTED => NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED,
      RXOSINTSTROBE => '0',
      RXOSINTSTROBEDONE => NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED,
      RXOSINTSTROBESTARTED => NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED,
      RXOSINTTESTOVRDEN => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => gt2_rxoutclk_out,
      RXOUTCLKFABRIC => NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED,
      RXOUTCLKPCS => NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2) => '0',
      RXOUTCLKSEL(1) => '1',
      RXOUTCLKSEL(0) => '0',
      RXPCOMMAALIGNEN => gt2_rxpcommaalignen_in,
      RXPCSRESET => '0',
      RXPD(1 downto 0) => gt2_rxpd_in(1 downto 0),
      RXPHALIGN => '0',
      RXPHALIGNDONE => NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED,
      RXPHALIGNEN => '0',
      RXPHDLYPD => '0',
      RXPHDLYRESET => '0',
      RXPHMONITOR(4 downto 0) => NLW_gthe2_i_RXPHMONITOR_UNCONNECTED(4 downto 0),
      RXPHOVRDEN => '0',
      RXPHSLIPMONITOR(4 downto 0) => NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED(4 downto 0),
      RXPMARESET => '0',
      RXPMARESETDONE => n_33_gthe2_i,
      RXPOLARITY => '0',
      RXPRBSCNTRESET => '0',
      RXPRBSERR => NLW_gthe2_i_RXPRBSERR_UNCONNECTED,
      RXPRBSSEL(2) => '0',
      RXPRBSSEL(1) => '0',
      RXPRBSSEL(0) => '0',
      RXQPIEN => '0',
      RXQPISENN => NLW_gthe2_i_RXQPISENN_UNCONNECTED,
      RXQPISENP => NLW_gthe2_i_RXQPISENP_UNCONNECTED,
      RXRATE(2) => '0',
      RXRATE(1) => '0',
      RXRATE(0) => '0',
      RXRATEDONE => NLW_gthe2_i_RXRATEDONE_UNCONNECTED,
      RXRATEMODE => '0',
      RXRESETDONE => gt2_rxresetdone_out,
      RXSLIDE => '0',
      RXSTARTOFSEQ(1 downto 0) => NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED(1 downto 0),
      RXSTATUS(2 downto 0) => NLW_gthe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYNCALLIN => '0',
      RXSYNCDONE => NLW_gthe2_i_RXSYNCDONE_UNCONNECTED,
      RXSYNCIN => '0',
      RXSYNCMODE => '0',
      RXSYNCOUT => NLW_gthe2_i_RXSYNCOUT_UNCONNECTED,
      RXSYSCLKSEL(1) => '1',
      RXSYSCLKSEL(0) => '1',
      RXUSERRDY => I2,
      RXUSRCLK => gt2_rxusrclk_in,
      RXUSRCLK2 => gt2_rxusrclk2_in,
      RXVALID => NLW_gthe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      SIGVALIDCLK => '0',
      TSTIN(19) => '1',
      TSTIN(18) => '1',
      TSTIN(17) => '1',
      TSTIN(16) => '1',
      TSTIN(15) => '1',
      TSTIN(14) => '1',
      TSTIN(13) => '1',
      TSTIN(12) => '1',
      TSTIN(11) => '1',
      TSTIN(10) => '1',
      TSTIN(9) => '1',
      TSTIN(8) => '1',
      TSTIN(7) => '1',
      TSTIN(6) => '1',
      TSTIN(5) => '1',
      TSTIN(4) => '1',
      TSTIN(3) => '1',
      TSTIN(2) => '1',
      TSTIN(1) => '1',
      TSTIN(0) => '1',
      TX8B10BBYPASS(7) => '0',
      TX8B10BBYPASS(6) => '0',
      TX8B10BBYPASS(5) => '0',
      TX8B10BBYPASS(4) => '0',
      TX8B10BBYPASS(3) => '0',
      TX8B10BBYPASS(2) => '0',
      TX8B10BBYPASS(1) => '0',
      TX8B10BBYPASS(0) => '0',
      TX8B10BEN => '0',
      TXBUFDIFFCTRL(2) => '1',
      TXBUFDIFFCTRL(1) => '0',
      TXBUFDIFFCTRL(0) => '0',
      TXBUFSTATUS(1 downto 0) => NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED(1 downto 0),
      TXCHARDISPMODE(7) => '0',
      TXCHARDISPMODE(6) => '0',
      TXCHARDISPMODE(5) => '0',
      TXCHARDISPMODE(4) => '0',
      TXCHARDISPMODE(3) => '0',
      TXCHARDISPMODE(2) => '0',
      TXCHARDISPMODE(1) => '0',
      TXCHARDISPMODE(0) => '0',
      TXCHARDISPVAL(7) => '0',
      TXCHARDISPVAL(6) => '0',
      TXCHARDISPVAL(5) => '0',
      TXCHARDISPVAL(4) => '0',
      TXCHARDISPVAL(3) => '0',
      TXCHARDISPVAL(2) => '0',
      TXCHARDISPVAL(1) => '0',
      TXCHARDISPVAL(0) => '0',
      TXCHARISK(7) => '0',
      TXCHARISK(6) => '0',
      TXCHARISK(5) => '0',
      TXCHARISK(4) => '0',
      TXCHARISK(3) => '0',
      TXCHARISK(2) => '0',
      TXCHARISK(1) => '0',
      TXCHARISK(0) => '0',
      TXCOMFINISH => NLW_gthe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(63) => '0',
      TXDATA(62) => '0',
      TXDATA(61) => '0',
      TXDATA(60) => '0',
      TXDATA(59) => '0',
      TXDATA(58) => '0',
      TXDATA(57) => '0',
      TXDATA(56) => '0',
      TXDATA(55) => '0',
      TXDATA(54) => '0',
      TXDATA(53) => '0',
      TXDATA(52) => '0',
      TXDATA(51) => '0',
      TXDATA(50) => '0',
      TXDATA(49) => '0',
      TXDATA(48) => '0',
      TXDATA(47) => '0',
      TXDATA(46) => '0',
      TXDATA(45) => '0',
      TXDATA(44) => '0',
      TXDATA(43) => '0',
      TXDATA(42) => '0',
      TXDATA(41) => '0',
      TXDATA(40) => '0',
      TXDATA(39) => '0',
      TXDATA(38) => '0',
      TXDATA(37) => '0',
      TXDATA(36) => '0',
      TXDATA(35) => '0',
      TXDATA(34) => '0',
      TXDATA(33) => '0',
      TXDATA(32) => '0',
      TXDATA(31) => '0',
      TXDATA(30) => '0',
      TXDATA(29) => '0',
      TXDATA(28) => '0',
      TXDATA(27) => '0',
      TXDATA(26) => '0',
      TXDATA(25) => '0',
      TXDATA(24) => '0',
      TXDATA(23) => '0',
      TXDATA(22) => '0',
      TXDATA(21) => '0',
      TXDATA(20) => '0',
      TXDATA(19) => '0',
      TXDATA(18) => '0',
      TXDATA(17) => '0',
      TXDATA(16) => '0',
      TXDATA(15) => '0',
      TXDATA(14) => '0',
      TXDATA(13) => '0',
      TXDATA(12) => '0',
      TXDATA(11) => '0',
      TXDATA(10) => '0',
      TXDATA(9) => '0',
      TXDATA(8) => '0',
      TXDATA(7) => '0',
      TXDATA(6) => '0',
      TXDATA(5) => '0',
      TXDATA(4) => '0',
      TXDATA(3) => '0',
      TXDATA(2) => '0',
      TXDATA(1) => '0',
      TXDATA(0) => '0',
      TXDEEMPH => '0',
      TXDETECTRX => '0',
      TXDIFFCTRL(3) => '1',
      TXDIFFCTRL(2) => '0',
      TXDIFFCTRL(1) => '0',
      TXDIFFCTRL(0) => '0',
      TXDIFFPD => '1',
      TXDLYBYPASS => '1',
      TXDLYEN => '0',
      TXDLYHOLD => '0',
      TXDLYOVRDEN => '0',
      TXDLYSRESET => '0',
      TXDLYSRESETDONE => NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED,
      TXDLYUPDOWN => '0',
      TXELECIDLE => '1',
      TXGEARBOXREADY => NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED,
      TXHEADER(2) => '0',
      TXHEADER(1) => '0',
      TXHEADER(0) => '0',
      TXINHIBIT => '0',
      TXMAINCURSOR(6) => '0',
      TXMAINCURSOR(5) => '0',
      TXMAINCURSOR(4) => '0',
      TXMAINCURSOR(3) => '0',
      TXMAINCURSOR(2) => '0',
      TXMAINCURSOR(1) => '0',
      TXMAINCURSOR(0) => '0',
      TXMARGIN(2) => '0',
      TXMARGIN(1) => '0',
      TXMARGIN(0) => '0',
      TXOUTCLK => NLW_gthe2_i_TXOUTCLK_UNCONNECTED,
      TXOUTCLKFABRIC => NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED,
      TXOUTCLKPCS => NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED,
      TXOUTCLKSEL(2) => '0',
      TXOUTCLKSEL(1) => '1',
      TXOUTCLKSEL(0) => '0',
      TXPCSRESET => '0',
      TXPD(1) => '1',
      TXPD(0) => '1',
      TXPDELECIDLEMODE => '1',
      TXPHALIGN => '0',
      TXPHALIGNDONE => NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED,
      TXPHALIGNEN => '0',
      TXPHDLYPD => '1',
      TXPHDLYRESET => '0',
      TXPHDLYTSTCLK => '0',
      TXPHINIT => '0',
      TXPHINITDONE => NLW_gthe2_i_TXPHINITDONE_UNCONNECTED,
      TXPHOVRDEN => '0',
      TXPIPPMEN => '0',
      TXPIPPMOVRDEN => '0',
      TXPIPPMPD => '1',
      TXPIPPMSEL => '0',
      TXPIPPMSTEPSIZE(4) => '0',
      TXPIPPMSTEPSIZE(3) => '0',
      TXPIPPMSTEPSIZE(2) => '0',
      TXPIPPMSTEPSIZE(1) => '0',
      TXPIPPMSTEPSIZE(0) => '0',
      TXPISOPD => '1',
      TXPMARESET => '0',
      TXPMARESETDONE => NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED,
      TXPOLARITY => '0',
      TXPOSTCURSOR(4) => '0',
      TXPOSTCURSOR(3) => '0',
      TXPOSTCURSOR(2) => '0',
      TXPOSTCURSOR(1) => '0',
      TXPOSTCURSOR(0) => '0',
      TXPOSTCURSORINV => '0',
      TXPRBSFORCEERR => '0',
      TXPRBSSEL(2) => '0',
      TXPRBSSEL(1) => '0',
      TXPRBSSEL(0) => '0',
      TXPRECURSOR(4) => '0',
      TXPRECURSOR(3) => '0',
      TXPRECURSOR(2) => '0',
      TXPRECURSOR(1) => '0',
      TXPRECURSOR(0) => '0',
      TXPRECURSORINV => '0',
      TXQPIBIASEN => '0',
      TXQPISENN => NLW_gthe2_i_TXQPISENN_UNCONNECTED,
      TXQPISENP => NLW_gthe2_i_TXQPISENP_UNCONNECTED,
      TXQPISTRONGPDOWN => '0',
      TXQPIWEAKPUP => '0',
      TXRATE(2) => '0',
      TXRATE(1) => '0',
      TXRATE(0) => '0',
      TXRATEDONE => NLW_gthe2_i_TXRATEDONE_UNCONNECTED,
      TXRATEMODE => '0',
      TXRESETDONE => NLW_gthe2_i_TXRESETDONE_UNCONNECTED,
      TXSEQUENCE(6) => '0',
      TXSEQUENCE(5) => '0',
      TXSEQUENCE(4) => '0',
      TXSEQUENCE(3) => '0',
      TXSEQUENCE(2) => '0',
      TXSEQUENCE(1) => '0',
      TXSEQUENCE(0) => '0',
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYNCALLIN => '0',
      TXSYNCDONE => NLW_gthe2_i_TXSYNCDONE_UNCONNECTED,
      TXSYNCIN => '0',
      TXSYNCMODE => '0',
      TXSYNCOUT => NLW_gthe2_i_TXSYNCOUT_UNCONNECTED,
      TXSYSCLKSEL(1) => '0',
      TXSYSCLKSEL(0) => '0',
      TXUSERRDY => '0',
      TXUSRCLK => '0',
      TXUSRCLK2 => '0'
    );
gtrxreset_seq_i: entity work.gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq_6
    port map (
      AR(0) => AR(0),
      DRPADDR(8) => n_20_gtrxreset_seq_i,
      DRPADDR(7) => n_21_gtrxreset_seq_i,
      DRPADDR(6) => n_22_gtrxreset_seq_i,
      DRPADDR(5) => n_23_gtrxreset_seq_i,
      DRPADDR(4) => n_24_gtrxreset_seq_i,
      DRPADDR(3) => n_25_gtrxreset_seq_i,
      DRPADDR(2) => n_26_gtrxreset_seq_i,
      DRPADDR(1) => n_27_gtrxreset_seq_i,
      DRPADDR(0) => n_28_gtrxreset_seq_i,
      DRPDI(15) => n_2_gtrxreset_seq_i,
      DRPDI(14) => n_3_gtrxreset_seq_i,
      DRPDI(13) => n_4_gtrxreset_seq_i,
      DRPDI(12) => n_5_gtrxreset_seq_i,
      DRPDI(11) => n_6_gtrxreset_seq_i,
      DRPDI(10) => n_7_gtrxreset_seq_i,
      DRPDI(9) => n_8_gtrxreset_seq_i,
      DRPDI(8) => n_9_gtrxreset_seq_i,
      DRPDI(7) => n_10_gtrxreset_seq_i,
      DRPDI(6) => n_11_gtrxreset_seq_i,
      DRPDI(5) => n_12_gtrxreset_seq_i,
      DRPDI(4) => n_13_gtrxreset_seq_i,
      DRPDI(3) => n_14_gtrxreset_seq_i,
      DRPDI(2) => n_15_gtrxreset_seq_i,
      DRPDI(1) => n_16_gtrxreset_seq_i,
      DRPDI(0) => n_17_gtrxreset_seq_i,
      GTRXRESET_OUT => GTRXRESET_OUT,
      I1 => \^o1\,
      I5 => I5,
      O1 => n_1_gtrxreset_seq_i,
      O2 => n_18_gtrxreset_seq_i,
      O3 => n_19_gtrxreset_seq_i,
      data_in => n_33_gthe2_i,
      gt2_drpaddr_in(8 downto 0) => gt2_drpaddr_in(8 downto 0),
      gt2_drpclk_in => gt2_drpclk_in,
      gt2_drpdi_in(15 downto 0) => gt2_drpdi_in(15 downto 0),
      gt2_drpdo_out(15 downto 0) => \^gt2_drpdo_out\(15 downto 0),
      gt2_drpen_in => gt2_drpen_in,
      gt2_drpwe_in => gt2_drpwe_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_5\ is
  port (
    O1 : out STD_LOGIC;
    gt3_eyescandataerror_out : out STD_LOGIC;
    gt3_rxoutclk_out : out STD_LOGIC;
    gt3_rxresetdone_out : out STD_LOGIC;
    gt3_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt3_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt3_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GT3_DRP_BUSY_OUT : out STD_LOGIC;
    gt3_drpclk_in : in STD_LOGIC;
    gt3_eyescanreset_in : in STD_LOGIC;
    gt3_eyescantrigger_in : in STD_LOGIC;
    gt3_gthrxn_in : in STD_LOGIC;
    gt3_gthrxp_in : in STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC;
    gt3_rxbufreset_in : in STD_LOGIC;
    gt3_rxmcommaalignen_in : in STD_LOGIC;
    gt3_rxpcommaalignen_in : in STD_LOGIC;
    I3 : in STD_LOGIC;
    gt3_rxusrclk_in : in STD_LOGIC;
    gt3_rxusrclk2_in : in STD_LOGIC;
    gt3_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC;
    gt3_drpen_in : in STD_LOGIC;
    gt3_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpwe_in : in STD_LOGIC;
    gt3_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_5\ : entity is "gtwizard_32_Rx_GT";
end \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_5\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_5\ is
  signal GTRXRESET_OUT : STD_LOGIC;
  signal \^o1\ : STD_LOGIC;
  signal \^gt3_drpdo_out\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal n_10_gtrxreset_seq_i : STD_LOGIC;
  signal n_11_gtrxreset_seq_i : STD_LOGIC;
  signal n_12_gtrxreset_seq_i : STD_LOGIC;
  signal n_13_gtrxreset_seq_i : STD_LOGIC;
  signal n_14_gtrxreset_seq_i : STD_LOGIC;
  signal n_15_gtrxreset_seq_i : STD_LOGIC;
  signal n_16_gtrxreset_seq_i : STD_LOGIC;
  signal n_17_gtrxreset_seq_i : STD_LOGIC;
  signal n_18_gtrxreset_seq_i : STD_LOGIC;
  signal n_19_gtrxreset_seq_i : STD_LOGIC;
  signal n_1_gtrxreset_seq_i : STD_LOGIC;
  signal n_20_gtrxreset_seq_i : STD_LOGIC;
  signal n_21_gtrxreset_seq_i : STD_LOGIC;
  signal n_22_gtrxreset_seq_i : STD_LOGIC;
  signal n_23_gtrxreset_seq_i : STD_LOGIC;
  signal n_24_gtrxreset_seq_i : STD_LOGIC;
  signal n_25_gtrxreset_seq_i : STD_LOGIC;
  signal n_26_gtrxreset_seq_i : STD_LOGIC;
  signal n_270_gthe2_i : STD_LOGIC;
  signal n_27_gtrxreset_seq_i : STD_LOGIC;
  signal n_28_gtrxreset_seq_i : STD_LOGIC;
  signal n_2_gtrxreset_seq_i : STD_LOGIC;
  signal n_33_gthe2_i : STD_LOGIC;
  signal n_3_gtrxreset_seq_i : STD_LOGIC;
  signal n_4_gtrxreset_seq_i : STD_LOGIC;
  signal n_5_gtrxreset_seq_i : STD_LOGIC;
  signal n_6_gtrxreset_seq_i : STD_LOGIC;
  signal n_7_gtrxreset_seq_i : STD_LOGIC;
  signal n_8_gtrxreset_seq_i : STD_LOGIC;
  signal n_9_gtrxreset_seq_i : STD_LOGIC;
  signal NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_CPLLLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTHTXN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTHTXP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_PHYSTATUS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RSOSINTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCDRLOCK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMINITDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMMADET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMSASDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXELECIDLE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXPRBSERR_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_RXVALID_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXCOMFINISH_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLK_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPHINITDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXQPISENN_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXQPISENP_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXRATEDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXRESETDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXSYNCDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_TXSYNCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXCHARISK_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXCHBONDO_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXDATA_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 16 );
  signal NLW_gthe2_i_RXDATAVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXDISPERR_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXHEADER_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_gthe2_i_RXHEADERVALID_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_gthe2_i_RXPHMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gthe2_i_RXSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute box_type : string;
  attribute box_type of gthe2_i : label is "PRIMITIVE";
begin
  O1 <= \^o1\;
  gt3_drpdo_out(15 downto 0) <= \^gt3_drpdo_out\(15 downto 0);
  n_270_gthe2_i <= 'Z';
drp_busy_i1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => gt3_drpclk_in,
      CE => '1',
      D => n_19_gtrxreset_seq_i,
      Q => GT3_DRP_BUSY_OUT,
      R => '0'
    );
gthe2_i: unisim.vcomponents.GTHE2_CHANNEL
    generic map(
      ACJTAG_DEBUG_MODE => '0',
      ACJTAG_MODE => '0',
      ACJTAG_RESET => '0',
      ADAPT_CFG0 => X"00C10",
      ALIGN_COMMA_DOUBLE => "FALSE",
      ALIGN_COMMA_ENABLE => B"1111111111",
      ALIGN_COMMA_WORD => 2,
      ALIGN_MCOMMA_DET => "TRUE",
      ALIGN_MCOMMA_VALUE => B"1010000011",
      ALIGN_PCOMMA_DET => "TRUE",
      ALIGN_PCOMMA_VALUE => B"0101111100",
      A_RXOSCALRESET => '0',
      CBCC_DATA_SOURCE_SEL => "DECODED",
      CFOK_CFG => X"24800040E80",
      CFOK_CFG2 => B"100000",
      CFOK_CFG3 => B"100000",
      CHAN_BOND_KEEP_ALIGN => "FALSE",
      CHAN_BOND_MAX_SKEW => 1,
      CHAN_BOND_SEQ_1_1 => B"0000000000",
      CHAN_BOND_SEQ_1_2 => B"0000000000",
      CHAN_BOND_SEQ_1_3 => B"0000000000",
      CHAN_BOND_SEQ_1_4 => B"0000000000",
      CHAN_BOND_SEQ_1_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_1 => B"0000000000",
      CHAN_BOND_SEQ_2_2 => B"0000000000",
      CHAN_BOND_SEQ_2_3 => B"0000000000",
      CHAN_BOND_SEQ_2_4 => B"0000000000",
      CHAN_BOND_SEQ_2_ENABLE => B"1111",
      CHAN_BOND_SEQ_2_USE => "FALSE",
      CHAN_BOND_SEQ_LEN => 1,
      CLK_CORRECT_USE => "FALSE",
      CLK_COR_KEEP_IDLE => "FALSE",
      CLK_COR_MAX_LAT => 10,
      CLK_COR_MIN_LAT => 8,
      CLK_COR_PRECEDENCE => "TRUE",
      CLK_COR_REPEAT_WAIT => 0,
      CLK_COR_SEQ_1_1 => B"0100000000",
      CLK_COR_SEQ_1_2 => B"0000000000",
      CLK_COR_SEQ_1_3 => B"0000000000",
      CLK_COR_SEQ_1_4 => B"0000000000",
      CLK_COR_SEQ_1_ENABLE => B"1111",
      CLK_COR_SEQ_2_1 => B"0100000000",
      CLK_COR_SEQ_2_2 => B"0000000000",
      CLK_COR_SEQ_2_3 => B"0000000000",
      CLK_COR_SEQ_2_4 => B"0000000000",
      CLK_COR_SEQ_2_ENABLE => B"1111",
      CLK_COR_SEQ_2_USE => "FALSE",
      CLK_COR_SEQ_LEN => 1,
      CPLL_CFG => X"00BC07DC",
      CPLL_FBDIV => 5,
      CPLL_FBDIV_45 => 5,
      CPLL_INIT_CFG => X"00001E",
      CPLL_LOCK_CFG => X"01E8",
      CPLL_REFCLK_DIV => 1,
      DEC_MCOMMA_DETECT => "TRUE",
      DEC_PCOMMA_DETECT => "TRUE",
      DEC_VALID_COMMA_ONLY => "TRUE",
      DMONITOR_CFG => X"000A00",
      ES_CLK_PHASE_SEL => '0',
      ES_CONTROL => B"000000",
      ES_ERRDET_EN => "FALSE",
      ES_EYE_SCAN_EN => "TRUE",
      ES_HORZ_OFFSET => X"000",
      ES_PMA_CFG => B"0000000000",
      ES_PRESCALE => B"00000",
      ES_QUALIFIER => X"00000000000000000000",
      ES_QUAL_MASK => X"00000000000000000000",
      ES_SDATA_MASK => X"00000000000000000000",
      ES_VERT_OFFSET => B"000000000",
      FTS_DESKEW_SEQ_ENABLE => B"1111",
      FTS_LANE_DESKEW_CFG => B"1111",
      FTS_LANE_DESKEW_EN => "FALSE",
      GEARBOX_MODE => B"000",
      IS_CLKRSVD0_INVERTED => '0',
      IS_CLKRSVD1_INVERTED => '0',
      IS_CPLLLOCKDETCLK_INVERTED => '0',
      IS_DMONITORCLK_INVERTED => '0',
      IS_DRPCLK_INVERTED => '0',
      IS_GTGREFCLK_INVERTED => '0',
      IS_RXUSRCLK2_INVERTED => '0',
      IS_RXUSRCLK_INVERTED => '0',
      IS_SIGVALIDCLK_INVERTED => '0',
      IS_TXPHDLYTSTCLK_INVERTED => '0',
      IS_TXUSRCLK2_INVERTED => '0',
      IS_TXUSRCLK_INVERTED => '0',
      LOOPBACK_CFG => '0',
      OUTREFCLK_SEL_INV => B"11",
      PCS_PCIE_EN => "FALSE",
      PCS_RSVD_ATTR => X"000000000000",
      PD_TRANS_TIME_FROM_P2 => X"03C",
      PD_TRANS_TIME_NONE_P2 => X"3C",
      PD_TRANS_TIME_TO_P2 => X"64",
      PMA_RSV => B"00000000000111100111000010000000",
      PMA_RSV2 => B"00011100000000000000000000001010",
      PMA_RSV3 => B"00",
      PMA_RSV4 => B"000000000001000",
      PMA_RSV5 => B"0000",
      RESET_POWERSAVE_DISABLE => '0',
      RXBUFRESET_TIME => B"00001",
      RXBUF_ADDR_MODE => "FAST",
      RXBUF_EIDLE_HI_CNT => B"1000",
      RXBUF_EIDLE_LO_CNT => B"0000",
      RXBUF_EN => "TRUE",
      RXBUF_RESET_ON_CB_CHANGE => "TRUE",
      RXBUF_RESET_ON_COMMAALIGN => "FALSE",
      RXBUF_RESET_ON_EIDLE => "FALSE",
      RXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      RXBUF_THRESH_OVFLW => 61,
      RXBUF_THRESH_OVRD => "FALSE",
      RXBUF_THRESH_UNDFLW => 4,
      RXCDRFREQRESET_TIME => B"00001",
      RXCDRPHRESET_TIME => B"00001",
      RXCDR_CFG => X"0002007FE1000C2080018",
      RXCDR_FR_RESET_ON_EIDLE => '0',
      RXCDR_HOLD_DURING_EIDLE => '0',
      RXCDR_LOCK_CFG => B"010101",
      RXCDR_PH_RESET_ON_EIDLE => '0',
      RXDFELPMRESET_TIME => B"0001111",
      RXDLY_CFG => X"001F",
      RXDLY_LCFG => X"030",
      RXDLY_TAP_CFG => X"0000",
      RXGEARBOX_EN => "FALSE",
      RXISCANRESET_TIME => B"00001",
      RXLPM_HF_CFG => B"00001000000000",
      RXLPM_LF_CFG => B"001001000000000000",
      RXOOB_CFG => B"0000110",
      RXOOB_CLK_CFG => "PMA",
      RXOSCALRESET_TIME => B"00011",
      RXOSCALRESET_TIMEOUT => B"00000",
      RXOUT_DIV => 2,
      RXPCSRESET_TIME => B"00001",
      RXPHDLY_CFG => X"084020",
      RXPH_CFG => X"C00002",
      RXPH_MONITOR_SEL => B"00000",
      RXPI_CFG0 => B"00",
      RXPI_CFG1 => B"11",
      RXPI_CFG2 => B"11",
      RXPI_CFG3 => B"11",
      RXPI_CFG4 => '0',
      RXPI_CFG5 => '0',
      RXPI_CFG6 => B"100",
      RXPMARESET_TIME => B"00011",
      RXPRBS_ERR_LOOPBACK => '0',
      RXSLIDE_AUTO_WAIT => 7,
      RXSLIDE_MODE => "OFF",
      RXSYNC_MULTILANE => '1',
      RXSYNC_OVRD => '0',
      RXSYNC_SKIP_DA => '0',
      RX_BIAS_CFG => B"000011000000000000010000",
      RX_BUFFER_CFG => B"000000",
      RX_CLK25_DIV => 6,
      RX_CLKMUX_PD => '1',
      RX_CM_SEL => B"00",
      RX_CM_TRIM => B"0000",
      RX_DATA_WIDTH => 20,
      RX_DDI_SEL => B"000000",
      RX_DEBUG_CFG => B"00000000000000",
      RX_DEFER_RESET_BUF_EN => "TRUE",
      RX_DFELPM_CFG0 => B"0110",
      RX_DFELPM_CFG1 => '0',
      RX_DFELPM_KLKH_AGC_STUP_EN => '1',
      RX_DFE_AGC_CFG0 => B"00",
      RX_DFE_AGC_CFG1 => B"010",
      RX_DFE_AGC_CFG2 => B"0000",
      RX_DFE_AGC_OVRDEN => '1',
      RX_DFE_GAIN_CFG => X"0020C0",
      RX_DFE_H2_CFG => B"000000000000",
      RX_DFE_H3_CFG => B"000001000000",
      RX_DFE_H4_CFG => B"00011100000",
      RX_DFE_H5_CFG => B"00011100000",
      RX_DFE_H6_CFG => B"00000100000",
      RX_DFE_H7_CFG => B"00000100000",
      RX_DFE_KL_CFG => B"001000001000000000000001100010000",
      RX_DFE_KL_LPM_KH_CFG0 => B"01",
      RX_DFE_KL_LPM_KH_CFG1 => B"010",
      RX_DFE_KL_LPM_KH_CFG2 => B"0010",
      RX_DFE_KL_LPM_KH_OVRDEN => '1',
      RX_DFE_KL_LPM_KL_CFG0 => B"01",
      RX_DFE_KL_LPM_KL_CFG1 => B"010",
      RX_DFE_KL_LPM_KL_CFG2 => B"0010",
      RX_DFE_KL_LPM_KL_OVRDEN => '1',
      RX_DFE_LPM_CFG => X"0080",
      RX_DFE_LPM_HOLD_DURING_EIDLE => '0',
      RX_DFE_ST_CFG => X"00E100000C003F",
      RX_DFE_UT_CFG => B"00011100000000000",
      RX_DFE_VP_CFG => B"00011101010100011",
      RX_DISPERR_SEQ_MATCH => "TRUE",
      RX_INT_DATAWIDTH => 0,
      RX_OS_CFG => B"0000010000000",
      RX_SIG_VALID_DLY => 10,
      RX_XCLK_SEL => "RXREC",
      SAS_MAX_COM => 64,
      SAS_MIN_COM => 36,
      SATA_BURST_SEQ_LEN => B"1111",
      SATA_BURST_VAL => B"100",
      SATA_CPLL_CFG => "VCO_3000MHZ",
      SATA_EIDLE_VAL => B"100",
      SATA_MAX_BURST => 8,
      SATA_MAX_INIT => 21,
      SATA_MAX_WAKE => 7,
      SATA_MIN_BURST => 4,
      SATA_MIN_INIT => 12,
      SATA_MIN_WAKE => 4,
      SHOW_REALIGN_COMMA => "TRUE",
      SIM_CPLLREFCLK_SEL => B"001",
      SIM_RECEIVER_DETECT_PASS => "TRUE",
      SIM_RESET_SPEEDUP => "FALSE",
      SIM_TX_EIDLE_DRIVE_LEVEL => "X",
      SIM_VERSION => "2.0",
      TERM_RCAL_CFG => B"100001000010000",
      TERM_RCAL_OVRD => B"000",
      TRANS_TIME_RATE => X"0E",
      TST_RSV => X"00000000",
      TXBUF_EN => "TRUE",
      TXBUF_RESET_ON_RATE_CHANGE => "TRUE",
      TXDLY_CFG => X"001F",
      TXDLY_LCFG => X"030",
      TXDLY_TAP_CFG => X"0000",
      TXGEARBOX_EN => "FALSE",
      TXOOB_CFG => '0',
      TXOUT_DIV => 1,
      TXPCSRESET_TIME => B"00001",
      TXPHDLY_CFG => X"084020",
      TXPH_CFG => X"0780",
      TXPH_MONITOR_SEL => B"00000",
      TXPI_CFG0 => B"00",
      TXPI_CFG1 => B"00",
      TXPI_CFG2 => B"00",
      TXPI_CFG3 => '0',
      TXPI_CFG4 => '0',
      TXPI_CFG5 => B"100",
      TXPI_GREY_SEL => '0',
      TXPI_INVSTROBE_SEL => '0',
      TXPI_PPMCLK_SEL => "TXUSRCLK2",
      TXPI_PPM_CFG => B"00000000",
      TXPI_SYNFREQ_PPM => B"000",
      TXPMARESET_TIME => B"00001",
      TXSYNC_MULTILANE => '0',
      TXSYNC_OVRD => '0',
      TXSYNC_SKIP_DA => '0',
      TX_CLK25_DIV => 6,
      TX_CLKMUX_PD => '1',
      TX_DATA_WIDTH => 20,
      TX_DEEMPH0 => B"000000",
      TX_DEEMPH1 => B"000000",
      TX_DRIVE_MODE => "DIRECT",
      TX_EIDLE_ASSERT_DELAY => B"110",
      TX_EIDLE_DEASSERT_DELAY => B"100",
      TX_INT_DATAWIDTH => 0,
      TX_LOOPBACK_DRIVE_HIZ => "FALSE",
      TX_MAINCURSOR_SEL => '0',
      TX_MARGIN_FULL_0 => B"1001110",
      TX_MARGIN_FULL_1 => B"1001001",
      TX_MARGIN_FULL_2 => B"1000101",
      TX_MARGIN_FULL_3 => B"1000010",
      TX_MARGIN_FULL_4 => B"1000000",
      TX_MARGIN_LOW_0 => B"1000110",
      TX_MARGIN_LOW_1 => B"1000100",
      TX_MARGIN_LOW_2 => B"1000010",
      TX_MARGIN_LOW_3 => B"1000000",
      TX_MARGIN_LOW_4 => B"1000000",
      TX_QPI_STATUS_EN => '0',
      TX_RXDETECT_CFG => X"1832",
      TX_RXDETECT_PRECHARGE_TIME => X"155CC",
      TX_RXDETECT_REF => B"100",
      TX_XCLK_SEL => "TXOUT",
      UCODEER_CLR => '0',
      USE_PCS_CLK_PHASE_SEL => '0'
    )
    port map (
      CFGRESET => '0',
      CLKRSVD0 => '0',
      CLKRSVD1 => '0',
      CPLLFBCLKLOST => NLW_gthe2_i_CPLLFBCLKLOST_UNCONNECTED,
      CPLLLOCK => NLW_gthe2_i_CPLLLOCK_UNCONNECTED,
      CPLLLOCKDETCLK => '0',
      CPLLLOCKEN => '1',
      CPLLPD => '1',
      CPLLREFCLKLOST => NLW_gthe2_i_CPLLREFCLKLOST_UNCONNECTED,
      CPLLREFCLKSEL(2) => '0',
      CPLLREFCLKSEL(1) => '0',
      CPLLREFCLKSEL(0) => '1',
      CPLLRESET => '0',
      DMONFIFORESET => '0',
      DMONITORCLK => '0',
      DMONITOROUT(14 downto 0) => gt3_dmonitorout_out(14 downto 0),
      DRPADDR(8) => n_20_gtrxreset_seq_i,
      DRPADDR(7) => n_21_gtrxreset_seq_i,
      DRPADDR(6) => n_22_gtrxreset_seq_i,
      DRPADDR(5) => n_23_gtrxreset_seq_i,
      DRPADDR(4) => n_24_gtrxreset_seq_i,
      DRPADDR(3) => n_25_gtrxreset_seq_i,
      DRPADDR(2) => n_26_gtrxreset_seq_i,
      DRPADDR(1) => n_27_gtrxreset_seq_i,
      DRPADDR(0) => n_28_gtrxreset_seq_i,
      DRPCLK => gt3_drpclk_in,
      DRPDI(15) => n_2_gtrxreset_seq_i,
      DRPDI(14) => n_3_gtrxreset_seq_i,
      DRPDI(13) => n_4_gtrxreset_seq_i,
      DRPDI(12) => n_5_gtrxreset_seq_i,
      DRPDI(11) => n_6_gtrxreset_seq_i,
      DRPDI(10) => n_7_gtrxreset_seq_i,
      DRPDI(9) => n_8_gtrxreset_seq_i,
      DRPDI(8) => n_9_gtrxreset_seq_i,
      DRPDI(7) => n_10_gtrxreset_seq_i,
      DRPDI(6) => n_11_gtrxreset_seq_i,
      DRPDI(5) => n_12_gtrxreset_seq_i,
      DRPDI(4) => n_13_gtrxreset_seq_i,
      DRPDI(3) => n_14_gtrxreset_seq_i,
      DRPDI(2) => n_15_gtrxreset_seq_i,
      DRPDI(1) => n_16_gtrxreset_seq_i,
      DRPDI(0) => n_17_gtrxreset_seq_i,
      DRPDO(15 downto 0) => \^gt3_drpdo_out\(15 downto 0),
      DRPEN => n_1_gtrxreset_seq_i,
      DRPRDY => \^o1\,
      DRPWE => n_18_gtrxreset_seq_i,
      EYESCANDATAERROR => gt3_eyescandataerror_out,
      EYESCANMODE => '0',
      EYESCANRESET => gt3_eyescanreset_in,
      EYESCANTRIGGER => gt3_eyescantrigger_in,
      GTGREFCLK => '0',
      GTHRXN => gt3_gthrxn_in,
      GTHRXP => gt3_gthrxp_in,
      GTHTXN => NLW_gthe2_i_GTHTXN_UNCONNECTED,
      GTHTXP => NLW_gthe2_i_GTHTXP_UNCONNECTED,
      GTNORTHREFCLK0 => '0',
      GTNORTHREFCLK1 => '0',
      GTREFCLK0 => '0',
      GTREFCLK1 => '0',
      GTREFCLKMONITOR => NLW_gthe2_i_GTREFCLKMONITOR_UNCONNECTED,
      GTRESETSEL => '0',
      GTRSVD(15) => '0',
      GTRSVD(14) => '0',
      GTRSVD(13) => '0',
      GTRSVD(12) => '0',
      GTRSVD(11) => '0',
      GTRSVD(10) => '0',
      GTRSVD(9) => '0',
      GTRSVD(8) => '0',
      GTRSVD(7) => '0',
      GTRSVD(6) => '0',
      GTRSVD(5) => '0',
      GTRSVD(4) => '0',
      GTRSVD(3) => '0',
      GTRSVD(2) => '0',
      GTRSVD(1) => '0',
      GTRSVD(0) => '0',
      GTRXRESET => GTRXRESET_OUT,
      GTSOUTHREFCLK0 => '0',
      GTSOUTHREFCLK1 => '0',
      GTTXRESET => n_270_gthe2_i,
      LOOPBACK(2) => '0',
      LOOPBACK(1) => '0',
      LOOPBACK(0) => '0',
      PCSRSVDIN(15) => '0',
      PCSRSVDIN(14) => '0',
      PCSRSVDIN(13) => '0',
      PCSRSVDIN(12) => '0',
      PCSRSVDIN(11) => '0',
      PCSRSVDIN(10) => '0',
      PCSRSVDIN(9) => '0',
      PCSRSVDIN(8) => '0',
      PCSRSVDIN(7) => '0',
      PCSRSVDIN(6) => '0',
      PCSRSVDIN(5) => '0',
      PCSRSVDIN(4) => '0',
      PCSRSVDIN(3) => '0',
      PCSRSVDIN(2) => '0',
      PCSRSVDIN(1) => '0',
      PCSRSVDIN(0) => '0',
      PCSRSVDIN2(4) => '0',
      PCSRSVDIN2(3) => '0',
      PCSRSVDIN2(2) => '0',
      PCSRSVDIN2(1) => '0',
      PCSRSVDIN2(0) => '0',
      PCSRSVDOUT(15 downto 0) => NLW_gthe2_i_PCSRSVDOUT_UNCONNECTED(15 downto 0),
      PHYSTATUS => NLW_gthe2_i_PHYSTATUS_UNCONNECTED,
      PMARSVDIN(4) => '0',
      PMARSVDIN(3) => '0',
      PMARSVDIN(2) => '0',
      PMARSVDIN(1) => '0',
      PMARSVDIN(0) => '0',
      QPLLCLK => GT0_QPLLOUTCLK_IN,
      QPLLREFCLK => GT0_QPLLOUTREFCLK_IN,
      RESETOVRD => '0',
      RSOSINTDONE => NLW_gthe2_i_RSOSINTDONE_UNCONNECTED,
      RX8B10BEN => '1',
      RXADAPTSELTEST(13) => '0',
      RXADAPTSELTEST(12) => '0',
      RXADAPTSELTEST(11) => '0',
      RXADAPTSELTEST(10) => '0',
      RXADAPTSELTEST(9) => '0',
      RXADAPTSELTEST(8) => '0',
      RXADAPTSELTEST(7) => '0',
      RXADAPTSELTEST(6) => '0',
      RXADAPTSELTEST(5) => '0',
      RXADAPTSELTEST(4) => '0',
      RXADAPTSELTEST(3) => '0',
      RXADAPTSELTEST(2) => '0',
      RXADAPTSELTEST(1) => '0',
      RXADAPTSELTEST(0) => '0',
      RXBUFRESET => gt3_rxbufreset_in,
      RXBUFSTATUS(2 downto 0) => gt3_rxbufstatus_out(2 downto 0),
      RXBYTEISALIGNED => NLW_gthe2_i_RXBYTEISALIGNED_UNCONNECTED,
      RXBYTEREALIGN => NLW_gthe2_i_RXBYTEREALIGN_UNCONNECTED,
      RXCDRFREQRESET => '0',
      RXCDRHOLD => '0',
      RXCDRLOCK => NLW_gthe2_i_RXCDRLOCK_UNCONNECTED,
      RXCDROVRDEN => '0',
      RXCDRRESET => '0',
      RXCDRRESETRSV => '0',
      RXCHANBONDSEQ => NLW_gthe2_i_RXCHANBONDSEQ_UNCONNECTED,
      RXCHANISALIGNED => NLW_gthe2_i_RXCHANISALIGNED_UNCONNECTED,
      RXCHANREALIGN => NLW_gthe2_i_RXCHANREALIGN_UNCONNECTED,
      RXCHARISCOMMA(7 downto 2) => NLW_gthe2_i_RXCHARISCOMMA_UNCONNECTED(7 downto 2),
      RXCHARISCOMMA(1 downto 0) => gt3_rxchariscomma_out(1 downto 0),
      RXCHARISK(7 downto 2) => NLW_gthe2_i_RXCHARISK_UNCONNECTED(7 downto 2),
      RXCHARISK(1 downto 0) => gt3_rxcharisk_out(1 downto 0),
      RXCHBONDEN => '0',
      RXCHBONDI(4) => '0',
      RXCHBONDI(3) => '0',
      RXCHBONDI(2) => '0',
      RXCHBONDI(1) => '0',
      RXCHBONDI(0) => '0',
      RXCHBONDLEVEL(2) => '0',
      RXCHBONDLEVEL(1) => '0',
      RXCHBONDLEVEL(0) => '0',
      RXCHBONDMASTER => '0',
      RXCHBONDO(4 downto 0) => NLW_gthe2_i_RXCHBONDO_UNCONNECTED(4 downto 0),
      RXCHBONDSLAVE => '0',
      RXCLKCORCNT(1 downto 0) => NLW_gthe2_i_RXCLKCORCNT_UNCONNECTED(1 downto 0),
      RXCOMINITDET => NLW_gthe2_i_RXCOMINITDET_UNCONNECTED,
      RXCOMMADET => NLW_gthe2_i_RXCOMMADET_UNCONNECTED,
      RXCOMMADETEN => '1',
      RXCOMSASDET => NLW_gthe2_i_RXCOMSASDET_UNCONNECTED,
      RXCOMWAKEDET => NLW_gthe2_i_RXCOMWAKEDET_UNCONNECTED,
      RXDATA(63 downto 16) => NLW_gthe2_i_RXDATA_UNCONNECTED(63 downto 16),
      RXDATA(15 downto 0) => gt3_rxdata_out(15 downto 0),
      RXDATAVALID(1 downto 0) => NLW_gthe2_i_RXDATAVALID_UNCONNECTED(1 downto 0),
      RXDDIEN => '0',
      RXDFEAGCHOLD => '0',
      RXDFEAGCOVRDEN => '1',
      RXDFEAGCTRL(4) => '1',
      RXDFEAGCTRL(3) => '0',
      RXDFEAGCTRL(2) => '0',
      RXDFEAGCTRL(1) => '0',
      RXDFEAGCTRL(0) => '0',
      RXDFECM1EN => '0',
      RXDFELFHOLD => '0',
      RXDFELFOVRDEN => '0',
      RXDFELPMRESET => '0',
      RXDFESLIDETAP(4) => '0',
      RXDFESLIDETAP(3) => '0',
      RXDFESLIDETAP(2) => '0',
      RXDFESLIDETAP(1) => '0',
      RXDFESLIDETAP(0) => '0',
      RXDFESLIDETAPADAPTEN => '0',
      RXDFESLIDETAPHOLD => '0',
      RXDFESLIDETAPID(5) => '0',
      RXDFESLIDETAPID(4) => '0',
      RXDFESLIDETAPID(3) => '0',
      RXDFESLIDETAPID(2) => '0',
      RXDFESLIDETAPID(1) => '0',
      RXDFESLIDETAPID(0) => '0',
      RXDFESLIDETAPINITOVRDEN => '0',
      RXDFESLIDETAPONLYADAPTEN => '0',
      RXDFESLIDETAPOVRDEN => '0',
      RXDFESLIDETAPSTARTED => NLW_gthe2_i_RXDFESLIDETAPSTARTED_UNCONNECTED,
      RXDFESLIDETAPSTROBE => '0',
      RXDFESLIDETAPSTROBEDONE => NLW_gthe2_i_RXDFESLIDETAPSTROBEDONE_UNCONNECTED,
      RXDFESLIDETAPSTROBESTARTED => NLW_gthe2_i_RXDFESLIDETAPSTROBESTARTED_UNCONNECTED,
      RXDFESTADAPTDONE => NLW_gthe2_i_RXDFESTADAPTDONE_UNCONNECTED,
      RXDFETAP2HOLD => '0',
      RXDFETAP2OVRDEN => '0',
      RXDFETAP3HOLD => '0',
      RXDFETAP3OVRDEN => '0',
      RXDFETAP4HOLD => '0',
      RXDFETAP4OVRDEN => '0',
      RXDFETAP5HOLD => '0',
      RXDFETAP5OVRDEN => '0',
      RXDFETAP6HOLD => '0',
      RXDFETAP6OVRDEN => '0',
      RXDFETAP7HOLD => '0',
      RXDFETAP7OVRDEN => '0',
      RXDFEUTHOLD => '0',
      RXDFEUTOVRDEN => '0',
      RXDFEVPHOLD => '0',
      RXDFEVPOVRDEN => '0',
      RXDFEVSEN => '0',
      RXDFEXYDEN => '1',
      RXDISPERR(7 downto 2) => NLW_gthe2_i_RXDISPERR_UNCONNECTED(7 downto 2),
      RXDISPERR(1 downto 0) => gt3_rxdisperr_out(1 downto 0),
      RXDLYBYPASS => '1',
      RXDLYEN => '0',
      RXDLYOVRDEN => '0',
      RXDLYSRESET => '0',
      RXDLYSRESETDONE => NLW_gthe2_i_RXDLYSRESETDONE_UNCONNECTED,
      RXELECIDLE => NLW_gthe2_i_RXELECIDLE_UNCONNECTED,
      RXELECIDLEMODE(1) => '1',
      RXELECIDLEMODE(0) => '1',
      RXGEARBOXSLIP => '0',
      RXHEADER(5 downto 0) => NLW_gthe2_i_RXHEADER_UNCONNECTED(5 downto 0),
      RXHEADERVALID(1 downto 0) => NLW_gthe2_i_RXHEADERVALID_UNCONNECTED(1 downto 0),
      RXLPMEN => '1',
      RXLPMHFHOLD => '0',
      RXLPMHFOVRDEN => '0',
      RXLPMLFHOLD => '0',
      RXLPMLFKLOVRDEN => '0',
      RXMCOMMAALIGNEN => gt3_rxmcommaalignen_in,
      RXMONITOROUT(6 downto 0) => gt3_rxmonitorout_out(6 downto 0),
      RXMONITORSEL(1 downto 0) => gt3_rxmonitorsel_in(1 downto 0),
      RXNOTINTABLE(7 downto 2) => NLW_gthe2_i_RXNOTINTABLE_UNCONNECTED(7 downto 2),
      RXNOTINTABLE(1 downto 0) => gt3_rxnotintable_out(1 downto 0),
      RXOOBRESET => '0',
      RXOSCALRESET => '0',
      RXOSHOLD => '0',
      RXOSINTCFG(3) => '0',
      RXOSINTCFG(2) => '1',
      RXOSINTCFG(1) => '1',
      RXOSINTCFG(0) => '0',
      RXOSINTEN => '1',
      RXOSINTHOLD => '0',
      RXOSINTID0(3) => '0',
      RXOSINTID0(2) => '0',
      RXOSINTID0(1) => '0',
      RXOSINTID0(0) => '0',
      RXOSINTNTRLEN => '0',
      RXOSINTOVRDEN => '0',
      RXOSINTSTARTED => NLW_gthe2_i_RXOSINTSTARTED_UNCONNECTED,
      RXOSINTSTROBE => '0',
      RXOSINTSTROBEDONE => NLW_gthe2_i_RXOSINTSTROBEDONE_UNCONNECTED,
      RXOSINTSTROBESTARTED => NLW_gthe2_i_RXOSINTSTROBESTARTED_UNCONNECTED,
      RXOSINTTESTOVRDEN => '0',
      RXOSOVRDEN => '0',
      RXOUTCLK => gt3_rxoutclk_out,
      RXOUTCLKFABRIC => NLW_gthe2_i_RXOUTCLKFABRIC_UNCONNECTED,
      RXOUTCLKPCS => NLW_gthe2_i_RXOUTCLKPCS_UNCONNECTED,
      RXOUTCLKSEL(2) => '0',
      RXOUTCLKSEL(1) => '1',
      RXOUTCLKSEL(0) => '0',
      RXPCOMMAALIGNEN => gt3_rxpcommaalignen_in,
      RXPCSRESET => '0',
      RXPD(1 downto 0) => gt3_rxpd_in(1 downto 0),
      RXPHALIGN => '0',
      RXPHALIGNDONE => NLW_gthe2_i_RXPHALIGNDONE_UNCONNECTED,
      RXPHALIGNEN => '0',
      RXPHDLYPD => '0',
      RXPHDLYRESET => '0',
      RXPHMONITOR(4 downto 0) => NLW_gthe2_i_RXPHMONITOR_UNCONNECTED(4 downto 0),
      RXPHOVRDEN => '0',
      RXPHSLIPMONITOR(4 downto 0) => NLW_gthe2_i_RXPHSLIPMONITOR_UNCONNECTED(4 downto 0),
      RXPMARESET => '0',
      RXPMARESETDONE => n_33_gthe2_i,
      RXPOLARITY => '0',
      RXPRBSCNTRESET => '0',
      RXPRBSERR => NLW_gthe2_i_RXPRBSERR_UNCONNECTED,
      RXPRBSSEL(2) => '0',
      RXPRBSSEL(1) => '0',
      RXPRBSSEL(0) => '0',
      RXQPIEN => '0',
      RXQPISENN => NLW_gthe2_i_RXQPISENN_UNCONNECTED,
      RXQPISENP => NLW_gthe2_i_RXQPISENP_UNCONNECTED,
      RXRATE(2) => '0',
      RXRATE(1) => '0',
      RXRATE(0) => '0',
      RXRATEDONE => NLW_gthe2_i_RXRATEDONE_UNCONNECTED,
      RXRATEMODE => '0',
      RXRESETDONE => gt3_rxresetdone_out,
      RXSLIDE => '0',
      RXSTARTOFSEQ(1 downto 0) => NLW_gthe2_i_RXSTARTOFSEQ_UNCONNECTED(1 downto 0),
      RXSTATUS(2 downto 0) => NLW_gthe2_i_RXSTATUS_UNCONNECTED(2 downto 0),
      RXSYNCALLIN => '0',
      RXSYNCDONE => NLW_gthe2_i_RXSYNCDONE_UNCONNECTED,
      RXSYNCIN => '0',
      RXSYNCMODE => '0',
      RXSYNCOUT => NLW_gthe2_i_RXSYNCOUT_UNCONNECTED,
      RXSYSCLKSEL(1) => '1',
      RXSYSCLKSEL(0) => '1',
      RXUSERRDY => I3,
      RXUSRCLK => gt3_rxusrclk_in,
      RXUSRCLK2 => gt3_rxusrclk2_in,
      RXVALID => NLW_gthe2_i_RXVALID_UNCONNECTED,
      SETERRSTATUS => '0',
      SIGVALIDCLK => '0',
      TSTIN(19) => '1',
      TSTIN(18) => '1',
      TSTIN(17) => '1',
      TSTIN(16) => '1',
      TSTIN(15) => '1',
      TSTIN(14) => '1',
      TSTIN(13) => '1',
      TSTIN(12) => '1',
      TSTIN(11) => '1',
      TSTIN(10) => '1',
      TSTIN(9) => '1',
      TSTIN(8) => '1',
      TSTIN(7) => '1',
      TSTIN(6) => '1',
      TSTIN(5) => '1',
      TSTIN(4) => '1',
      TSTIN(3) => '1',
      TSTIN(2) => '1',
      TSTIN(1) => '1',
      TSTIN(0) => '1',
      TX8B10BBYPASS(7) => '0',
      TX8B10BBYPASS(6) => '0',
      TX8B10BBYPASS(5) => '0',
      TX8B10BBYPASS(4) => '0',
      TX8B10BBYPASS(3) => '0',
      TX8B10BBYPASS(2) => '0',
      TX8B10BBYPASS(1) => '0',
      TX8B10BBYPASS(0) => '0',
      TX8B10BEN => '0',
      TXBUFDIFFCTRL(2) => '1',
      TXBUFDIFFCTRL(1) => '0',
      TXBUFDIFFCTRL(0) => '0',
      TXBUFSTATUS(1 downto 0) => NLW_gthe2_i_TXBUFSTATUS_UNCONNECTED(1 downto 0),
      TXCHARDISPMODE(7) => '0',
      TXCHARDISPMODE(6) => '0',
      TXCHARDISPMODE(5) => '0',
      TXCHARDISPMODE(4) => '0',
      TXCHARDISPMODE(3) => '0',
      TXCHARDISPMODE(2) => '0',
      TXCHARDISPMODE(1) => '0',
      TXCHARDISPMODE(0) => '0',
      TXCHARDISPVAL(7) => '0',
      TXCHARDISPVAL(6) => '0',
      TXCHARDISPVAL(5) => '0',
      TXCHARDISPVAL(4) => '0',
      TXCHARDISPVAL(3) => '0',
      TXCHARDISPVAL(2) => '0',
      TXCHARDISPVAL(1) => '0',
      TXCHARDISPVAL(0) => '0',
      TXCHARISK(7) => '0',
      TXCHARISK(6) => '0',
      TXCHARISK(5) => '0',
      TXCHARISK(4) => '0',
      TXCHARISK(3) => '0',
      TXCHARISK(2) => '0',
      TXCHARISK(1) => '0',
      TXCHARISK(0) => '0',
      TXCOMFINISH => NLW_gthe2_i_TXCOMFINISH_UNCONNECTED,
      TXCOMINIT => '0',
      TXCOMSAS => '0',
      TXCOMWAKE => '0',
      TXDATA(63) => '0',
      TXDATA(62) => '0',
      TXDATA(61) => '0',
      TXDATA(60) => '0',
      TXDATA(59) => '0',
      TXDATA(58) => '0',
      TXDATA(57) => '0',
      TXDATA(56) => '0',
      TXDATA(55) => '0',
      TXDATA(54) => '0',
      TXDATA(53) => '0',
      TXDATA(52) => '0',
      TXDATA(51) => '0',
      TXDATA(50) => '0',
      TXDATA(49) => '0',
      TXDATA(48) => '0',
      TXDATA(47) => '0',
      TXDATA(46) => '0',
      TXDATA(45) => '0',
      TXDATA(44) => '0',
      TXDATA(43) => '0',
      TXDATA(42) => '0',
      TXDATA(41) => '0',
      TXDATA(40) => '0',
      TXDATA(39) => '0',
      TXDATA(38) => '0',
      TXDATA(37) => '0',
      TXDATA(36) => '0',
      TXDATA(35) => '0',
      TXDATA(34) => '0',
      TXDATA(33) => '0',
      TXDATA(32) => '0',
      TXDATA(31) => '0',
      TXDATA(30) => '0',
      TXDATA(29) => '0',
      TXDATA(28) => '0',
      TXDATA(27) => '0',
      TXDATA(26) => '0',
      TXDATA(25) => '0',
      TXDATA(24) => '0',
      TXDATA(23) => '0',
      TXDATA(22) => '0',
      TXDATA(21) => '0',
      TXDATA(20) => '0',
      TXDATA(19) => '0',
      TXDATA(18) => '0',
      TXDATA(17) => '0',
      TXDATA(16) => '0',
      TXDATA(15) => '0',
      TXDATA(14) => '0',
      TXDATA(13) => '0',
      TXDATA(12) => '0',
      TXDATA(11) => '0',
      TXDATA(10) => '0',
      TXDATA(9) => '0',
      TXDATA(8) => '0',
      TXDATA(7) => '0',
      TXDATA(6) => '0',
      TXDATA(5) => '0',
      TXDATA(4) => '0',
      TXDATA(3) => '0',
      TXDATA(2) => '0',
      TXDATA(1) => '0',
      TXDATA(0) => '0',
      TXDEEMPH => '0',
      TXDETECTRX => '0',
      TXDIFFCTRL(3) => '1',
      TXDIFFCTRL(2) => '0',
      TXDIFFCTRL(1) => '0',
      TXDIFFCTRL(0) => '0',
      TXDIFFPD => '1',
      TXDLYBYPASS => '1',
      TXDLYEN => '0',
      TXDLYHOLD => '0',
      TXDLYOVRDEN => '0',
      TXDLYSRESET => '0',
      TXDLYSRESETDONE => NLW_gthe2_i_TXDLYSRESETDONE_UNCONNECTED,
      TXDLYUPDOWN => '0',
      TXELECIDLE => '1',
      TXGEARBOXREADY => NLW_gthe2_i_TXGEARBOXREADY_UNCONNECTED,
      TXHEADER(2) => '0',
      TXHEADER(1) => '0',
      TXHEADER(0) => '0',
      TXINHIBIT => '0',
      TXMAINCURSOR(6) => '0',
      TXMAINCURSOR(5) => '0',
      TXMAINCURSOR(4) => '0',
      TXMAINCURSOR(3) => '0',
      TXMAINCURSOR(2) => '0',
      TXMAINCURSOR(1) => '0',
      TXMAINCURSOR(0) => '0',
      TXMARGIN(2) => '0',
      TXMARGIN(1) => '0',
      TXMARGIN(0) => '0',
      TXOUTCLK => NLW_gthe2_i_TXOUTCLK_UNCONNECTED,
      TXOUTCLKFABRIC => NLW_gthe2_i_TXOUTCLKFABRIC_UNCONNECTED,
      TXOUTCLKPCS => NLW_gthe2_i_TXOUTCLKPCS_UNCONNECTED,
      TXOUTCLKSEL(2) => '0',
      TXOUTCLKSEL(1) => '1',
      TXOUTCLKSEL(0) => '0',
      TXPCSRESET => '0',
      TXPD(1) => '1',
      TXPD(0) => '1',
      TXPDELECIDLEMODE => '1',
      TXPHALIGN => '0',
      TXPHALIGNDONE => NLW_gthe2_i_TXPHALIGNDONE_UNCONNECTED,
      TXPHALIGNEN => '0',
      TXPHDLYPD => '1',
      TXPHDLYRESET => '0',
      TXPHDLYTSTCLK => '0',
      TXPHINIT => '0',
      TXPHINITDONE => NLW_gthe2_i_TXPHINITDONE_UNCONNECTED,
      TXPHOVRDEN => '0',
      TXPIPPMEN => '0',
      TXPIPPMOVRDEN => '0',
      TXPIPPMPD => '1',
      TXPIPPMSEL => '0',
      TXPIPPMSTEPSIZE(4) => '0',
      TXPIPPMSTEPSIZE(3) => '0',
      TXPIPPMSTEPSIZE(2) => '0',
      TXPIPPMSTEPSIZE(1) => '0',
      TXPIPPMSTEPSIZE(0) => '0',
      TXPISOPD => '1',
      TXPMARESET => '0',
      TXPMARESETDONE => NLW_gthe2_i_TXPMARESETDONE_UNCONNECTED,
      TXPOLARITY => '0',
      TXPOSTCURSOR(4) => '0',
      TXPOSTCURSOR(3) => '0',
      TXPOSTCURSOR(2) => '0',
      TXPOSTCURSOR(1) => '0',
      TXPOSTCURSOR(0) => '0',
      TXPOSTCURSORINV => '0',
      TXPRBSFORCEERR => '0',
      TXPRBSSEL(2) => '0',
      TXPRBSSEL(1) => '0',
      TXPRBSSEL(0) => '0',
      TXPRECURSOR(4) => '0',
      TXPRECURSOR(3) => '0',
      TXPRECURSOR(2) => '0',
      TXPRECURSOR(1) => '0',
      TXPRECURSOR(0) => '0',
      TXPRECURSORINV => '0',
      TXQPIBIASEN => '0',
      TXQPISENN => NLW_gthe2_i_TXQPISENN_UNCONNECTED,
      TXQPISENP => NLW_gthe2_i_TXQPISENP_UNCONNECTED,
      TXQPISTRONGPDOWN => '0',
      TXQPIWEAKPUP => '0',
      TXRATE(2) => '0',
      TXRATE(1) => '0',
      TXRATE(0) => '0',
      TXRATEDONE => NLW_gthe2_i_TXRATEDONE_UNCONNECTED,
      TXRATEMODE => '0',
      TXRESETDONE => NLW_gthe2_i_TXRESETDONE_UNCONNECTED,
      TXSEQUENCE(6) => '0',
      TXSEQUENCE(5) => '0',
      TXSEQUENCE(4) => '0',
      TXSEQUENCE(3) => '0',
      TXSEQUENCE(2) => '0',
      TXSEQUENCE(1) => '0',
      TXSEQUENCE(0) => '0',
      TXSTARTSEQ => '0',
      TXSWING => '0',
      TXSYNCALLIN => '0',
      TXSYNCDONE => NLW_gthe2_i_TXSYNCDONE_UNCONNECTED,
      TXSYNCIN => '0',
      TXSYNCMODE => '0',
      TXSYNCOUT => NLW_gthe2_i_TXSYNCOUT_UNCONNECTED,
      TXSYSCLKSEL(1) => '0',
      TXSYSCLKSEL(0) => '0',
      TXUSERRDY => '0',
      TXUSRCLK => '0',
      TXUSRCLK2 => '0'
    );
gtrxreset_seq_i: entity work.gtwizard_32_Rx_gtwizard_32_rx_gtrxreset_seq
    port map (
      AR(0) => AR(0),
      DRPADDR(8) => n_20_gtrxreset_seq_i,
      DRPADDR(7) => n_21_gtrxreset_seq_i,
      DRPADDR(6) => n_22_gtrxreset_seq_i,
      DRPADDR(5) => n_23_gtrxreset_seq_i,
      DRPADDR(4) => n_24_gtrxreset_seq_i,
      DRPADDR(3) => n_25_gtrxreset_seq_i,
      DRPADDR(2) => n_26_gtrxreset_seq_i,
      DRPADDR(1) => n_27_gtrxreset_seq_i,
      DRPADDR(0) => n_28_gtrxreset_seq_i,
      DRPDI(15) => n_2_gtrxreset_seq_i,
      DRPDI(14) => n_3_gtrxreset_seq_i,
      DRPDI(13) => n_4_gtrxreset_seq_i,
      DRPDI(12) => n_5_gtrxreset_seq_i,
      DRPDI(11) => n_6_gtrxreset_seq_i,
      DRPDI(10) => n_7_gtrxreset_seq_i,
      DRPDI(9) => n_8_gtrxreset_seq_i,
      DRPDI(8) => n_9_gtrxreset_seq_i,
      DRPDI(7) => n_10_gtrxreset_seq_i,
      DRPDI(6) => n_11_gtrxreset_seq_i,
      DRPDI(5) => n_12_gtrxreset_seq_i,
      DRPDI(4) => n_13_gtrxreset_seq_i,
      DRPDI(3) => n_14_gtrxreset_seq_i,
      DRPDI(2) => n_15_gtrxreset_seq_i,
      DRPDI(1) => n_16_gtrxreset_seq_i,
      DRPDI(0) => n_17_gtrxreset_seq_i,
      GTRXRESET_OUT => GTRXRESET_OUT,
      I1 => \^o1\,
      I6 => I6,
      O1 => n_1_gtrxreset_seq_i,
      O2 => n_18_gtrxreset_seq_i,
      O3 => n_19_gtrxreset_seq_i,
      data_in => n_33_gthe2_i,
      gt3_drpaddr_in(8 downto 0) => gt3_drpaddr_in(8 downto 0),
      gt3_drpclk_in => gt3_drpclk_in,
      gt3_drpdi_in(15 downto 0) => gt3_drpdi_in(15 downto 0),
      gt3_drpdo_out(15 downto 0) => \^gt3_drpdo_out\(15 downto 0),
      gt3_drpen_in => gt3_drpen_in,
      gt3_drpwe_in => gt3_drpwe_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_multi_gt__parameterized0\ is
  port (
    O1 : out STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O2 : out STD_LOGIC;
    gt1_eyescandataerror_out : out STD_LOGIC;
    gt1_rxoutclk_out : out STD_LOGIC;
    gt1_rxresetdone_out : out STD_LOGIC;
    gt1_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt1_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt1_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O3 : out STD_LOGIC;
    gt2_eyescandataerror_out : out STD_LOGIC;
    gt2_rxoutclk_out : out STD_LOGIC;
    gt2_rxresetdone_out : out STD_LOGIC;
    gt2_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt2_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt2_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    O4 : out STD_LOGIC;
    gt3_eyescandataerror_out : out STD_LOGIC;
    gt3_rxoutclk_out : out STD_LOGIC;
    gt3_rxresetdone_out : out STD_LOGIC;
    gt3_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt3_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt3_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GT0_DRP_BUSY_OUT : out STD_LOGIC;
    GT1_DRP_BUSY_OUT : out STD_LOGIC;
    GT2_DRP_BUSY_OUT : out STD_LOGIC;
    GT3_DRP_BUSY_OUT : out STD_LOGIC;
    gt0_drpclk_in : in STD_LOGIC;
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_gthrxn_in : in STD_LOGIC;
    gt0_gthrxp_in : in STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxmcommaalignen_in : in STD_LOGIC;
    gt0_rxpcommaalignen_in : in STD_LOGIC;
    RXUSERRDY : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_drpclk_in : in STD_LOGIC;
    gt1_eyescanreset_in : in STD_LOGIC;
    gt1_eyescantrigger_in : in STD_LOGIC;
    gt1_gthrxn_in : in STD_LOGIC;
    gt1_gthrxp_in : in STD_LOGIC;
    gt1_rxbufreset_in : in STD_LOGIC;
    gt1_rxmcommaalignen_in : in STD_LOGIC;
    gt1_rxpcommaalignen_in : in STD_LOGIC;
    I1 : in STD_LOGIC;
    gt1_rxusrclk_in : in STD_LOGIC;
    gt1_rxusrclk2_in : in STD_LOGIC;
    gt1_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_drpclk_in : in STD_LOGIC;
    gt2_eyescanreset_in : in STD_LOGIC;
    gt2_eyescantrigger_in : in STD_LOGIC;
    gt2_gthrxn_in : in STD_LOGIC;
    gt2_gthrxp_in : in STD_LOGIC;
    gt2_rxbufreset_in : in STD_LOGIC;
    gt2_rxmcommaalignen_in : in STD_LOGIC;
    gt2_rxpcommaalignen_in : in STD_LOGIC;
    I2 : in STD_LOGIC;
    gt2_rxusrclk_in : in STD_LOGIC;
    gt2_rxusrclk2_in : in STD_LOGIC;
    gt2_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_drpclk_in : in STD_LOGIC;
    gt3_eyescanreset_in : in STD_LOGIC;
    gt3_eyescantrigger_in : in STD_LOGIC;
    gt3_gthrxn_in : in STD_LOGIC;
    gt3_gthrxp_in : in STD_LOGIC;
    gt3_rxbufreset_in : in STD_LOGIC;
    gt3_rxmcommaalignen_in : in STD_LOGIC;
    gt3_rxpcommaalignen_in : in STD_LOGIC;
    I3 : in STD_LOGIC;
    gt3_rxusrclk_in : in STD_LOGIC;
    gt3_rxusrclk2_in : in STD_LOGIC;
    gt3_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    gtrxreset_i : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    I6 : in STD_LOGIC;
    gt0_drpen_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpwe_in : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt1_drpen_in : in STD_LOGIC;
    gt1_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpwe_in : in STD_LOGIC;
    gt1_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt2_drpen_in : in STD_LOGIC;
    gt2_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpwe_in : in STD_LOGIC;
    gt2_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt3_drpen_in : in STD_LOGIC;
    gt3_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpwe_in : in STD_LOGIC;
    gt3_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_multi_gt__parameterized0\ : entity is "gtwizard_32_Rx_multi_gt";
end \gtwizard_32_Rx_gtwizard_32_Rx_multi_gt__parameterized0\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_multi_gt__parameterized0\ is
begin
gt0_gtwizard_32_Rx_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0\
    port map (
      AR(0) => AR(0),
      GT0_DRP_BUSY_OUT => GT0_DRP_BUSY_OUT,
      GT0_QPLLOUTCLK_IN => GT0_QPLLOUTCLK_IN,
      GT0_QPLLOUTREFCLK_IN => GT0_QPLLOUTREFCLK_IN,
      O1 => O1,
      RXUSERRDY => RXUSERRDY,
      gt0_dmonitorout_out(14 downto 0) => gt0_dmonitorout_out(14 downto 0),
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      gt0_drpdo_out(15 downto 0) => gt0_drpdo_out(15 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_drpwe_in => gt0_drpwe_in,
      gt0_eyescandataerror_out => gt0_eyescandataerror_out,
      gt0_eyescanreset_in => gt0_eyescanreset_in,
      gt0_eyescantrigger_in => gt0_eyescantrigger_in,
      gt0_gthrxn_in => gt0_gthrxn_in,
      gt0_gthrxp_in => gt0_gthrxp_in,
      gt0_rxbufreset_in => gt0_rxbufreset_in,
      gt0_rxbufstatus_out(2 downto 0) => gt0_rxbufstatus_out(2 downto 0),
      gt0_rxchariscomma_out(1 downto 0) => gt0_rxchariscomma_out(1 downto 0),
      gt0_rxcharisk_out(1 downto 0) => gt0_rxcharisk_out(1 downto 0),
      gt0_rxdata_out(15 downto 0) => gt0_rxdata_out(15 downto 0),
      gt0_rxdisperr_out(1 downto 0) => gt0_rxdisperr_out(1 downto 0),
      gt0_rxmcommaalignen_in => gt0_rxmcommaalignen_in,
      gt0_rxmonitorout_out(6 downto 0) => gt0_rxmonitorout_out(6 downto 0),
      gt0_rxmonitorsel_in(1 downto 0) => gt0_rxmonitorsel_in(1 downto 0),
      gt0_rxnotintable_out(1 downto 0) => gt0_rxnotintable_out(1 downto 0),
      gt0_rxoutclk_out => gt0_rxoutclk_out,
      gt0_rxpcommaalignen_in => gt0_rxpcommaalignen_in,
      gt0_rxpd_in(1 downto 0) => gt0_rxpd_in(1 downto 0),
      gt0_rxresetdone_out => gt0_rxresetdone_out,
      gt0_rxusrclk2_in => gt0_rxusrclk2_in,
      gt0_rxusrclk_in => gt0_rxusrclk_in,
      gtrxreset_i => gtrxreset_i
    );
gt1_gtwizard_32_Rx_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_3\
    port map (
      AR(0) => AR(0),
      GT0_QPLLOUTCLK_IN => GT0_QPLLOUTCLK_IN,
      GT0_QPLLOUTREFCLK_IN => GT0_QPLLOUTREFCLK_IN,
      GT1_DRP_BUSY_OUT => GT1_DRP_BUSY_OUT,
      I1 => I1,
      I4 => I4,
      O1 => O2,
      gt1_dmonitorout_out(14 downto 0) => gt1_dmonitorout_out(14 downto 0),
      gt1_drpaddr_in(8 downto 0) => gt1_drpaddr_in(8 downto 0),
      gt1_drpclk_in => gt1_drpclk_in,
      gt1_drpdi_in(15 downto 0) => gt1_drpdi_in(15 downto 0),
      gt1_drpdo_out(15 downto 0) => gt1_drpdo_out(15 downto 0),
      gt1_drpen_in => gt1_drpen_in,
      gt1_drpwe_in => gt1_drpwe_in,
      gt1_eyescandataerror_out => gt1_eyescandataerror_out,
      gt1_eyescanreset_in => gt1_eyescanreset_in,
      gt1_eyescantrigger_in => gt1_eyescantrigger_in,
      gt1_gthrxn_in => gt1_gthrxn_in,
      gt1_gthrxp_in => gt1_gthrxp_in,
      gt1_rxbufreset_in => gt1_rxbufreset_in,
      gt1_rxbufstatus_out(2 downto 0) => gt1_rxbufstatus_out(2 downto 0),
      gt1_rxchariscomma_out(1 downto 0) => gt1_rxchariscomma_out(1 downto 0),
      gt1_rxcharisk_out(1 downto 0) => gt1_rxcharisk_out(1 downto 0),
      gt1_rxdata_out(15 downto 0) => gt1_rxdata_out(15 downto 0),
      gt1_rxdisperr_out(1 downto 0) => gt1_rxdisperr_out(1 downto 0),
      gt1_rxmcommaalignen_in => gt1_rxmcommaalignen_in,
      gt1_rxmonitorout_out(6 downto 0) => gt1_rxmonitorout_out(6 downto 0),
      gt1_rxmonitorsel_in(1 downto 0) => gt1_rxmonitorsel_in(1 downto 0),
      gt1_rxnotintable_out(1 downto 0) => gt1_rxnotintable_out(1 downto 0),
      gt1_rxoutclk_out => gt1_rxoutclk_out,
      gt1_rxpcommaalignen_in => gt1_rxpcommaalignen_in,
      gt1_rxpd_in(1 downto 0) => gt1_rxpd_in(1 downto 0),
      gt1_rxresetdone_out => gt1_rxresetdone_out,
      gt1_rxusrclk2_in => gt1_rxusrclk2_in,
      gt1_rxusrclk_in => gt1_rxusrclk_in
    );
gt2_gtwizard_32_Rx_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_4\
    port map (
      AR(0) => AR(0),
      GT0_QPLLOUTCLK_IN => GT0_QPLLOUTCLK_IN,
      GT0_QPLLOUTREFCLK_IN => GT0_QPLLOUTREFCLK_IN,
      GT2_DRP_BUSY_OUT => GT2_DRP_BUSY_OUT,
      I2 => I2,
      I5 => I5,
      O1 => O3,
      gt2_dmonitorout_out(14 downto 0) => gt2_dmonitorout_out(14 downto 0),
      gt2_drpaddr_in(8 downto 0) => gt2_drpaddr_in(8 downto 0),
      gt2_drpclk_in => gt2_drpclk_in,
      gt2_drpdi_in(15 downto 0) => gt2_drpdi_in(15 downto 0),
      gt2_drpdo_out(15 downto 0) => gt2_drpdo_out(15 downto 0),
      gt2_drpen_in => gt2_drpen_in,
      gt2_drpwe_in => gt2_drpwe_in,
      gt2_eyescandataerror_out => gt2_eyescandataerror_out,
      gt2_eyescanreset_in => gt2_eyescanreset_in,
      gt2_eyescantrigger_in => gt2_eyescantrigger_in,
      gt2_gthrxn_in => gt2_gthrxn_in,
      gt2_gthrxp_in => gt2_gthrxp_in,
      gt2_rxbufreset_in => gt2_rxbufreset_in,
      gt2_rxbufstatus_out(2 downto 0) => gt2_rxbufstatus_out(2 downto 0),
      gt2_rxchariscomma_out(1 downto 0) => gt2_rxchariscomma_out(1 downto 0),
      gt2_rxcharisk_out(1 downto 0) => gt2_rxcharisk_out(1 downto 0),
      gt2_rxdata_out(15 downto 0) => gt2_rxdata_out(15 downto 0),
      gt2_rxdisperr_out(1 downto 0) => gt2_rxdisperr_out(1 downto 0),
      gt2_rxmcommaalignen_in => gt2_rxmcommaalignen_in,
      gt2_rxmonitorout_out(6 downto 0) => gt2_rxmonitorout_out(6 downto 0),
      gt2_rxmonitorsel_in(1 downto 0) => gt2_rxmonitorsel_in(1 downto 0),
      gt2_rxnotintable_out(1 downto 0) => gt2_rxnotintable_out(1 downto 0),
      gt2_rxoutclk_out => gt2_rxoutclk_out,
      gt2_rxpcommaalignen_in => gt2_rxpcommaalignen_in,
      gt2_rxpd_in(1 downto 0) => gt2_rxpd_in(1 downto 0),
      gt2_rxresetdone_out => gt2_rxresetdone_out,
      gt2_rxusrclk2_in => gt2_rxusrclk2_in,
      gt2_rxusrclk_in => gt2_rxusrclk_in
    );
gt3_gtwizard_32_Rx_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_GT__parameterized0_5\
    port map (
      AR(0) => AR(0),
      GT0_QPLLOUTCLK_IN => GT0_QPLLOUTCLK_IN,
      GT0_QPLLOUTREFCLK_IN => GT0_QPLLOUTREFCLK_IN,
      GT3_DRP_BUSY_OUT => GT3_DRP_BUSY_OUT,
      I3 => I3,
      I6 => I6,
      O1 => O4,
      gt3_dmonitorout_out(14 downto 0) => gt3_dmonitorout_out(14 downto 0),
      gt3_drpaddr_in(8 downto 0) => gt3_drpaddr_in(8 downto 0),
      gt3_drpclk_in => gt3_drpclk_in,
      gt3_drpdi_in(15 downto 0) => gt3_drpdi_in(15 downto 0),
      gt3_drpdo_out(15 downto 0) => gt3_drpdo_out(15 downto 0),
      gt3_drpen_in => gt3_drpen_in,
      gt3_drpwe_in => gt3_drpwe_in,
      gt3_eyescandataerror_out => gt3_eyescandataerror_out,
      gt3_eyescanreset_in => gt3_eyescanreset_in,
      gt3_eyescantrigger_in => gt3_eyescantrigger_in,
      gt3_gthrxn_in => gt3_gthrxn_in,
      gt3_gthrxp_in => gt3_gthrxp_in,
      gt3_rxbufreset_in => gt3_rxbufreset_in,
      gt3_rxbufstatus_out(2 downto 0) => gt3_rxbufstatus_out(2 downto 0),
      gt3_rxchariscomma_out(1 downto 0) => gt3_rxchariscomma_out(1 downto 0),
      gt3_rxcharisk_out(1 downto 0) => gt3_rxcharisk_out(1 downto 0),
      gt3_rxdata_out(15 downto 0) => gt3_rxdata_out(15 downto 0),
      gt3_rxdisperr_out(1 downto 0) => gt3_rxdisperr_out(1 downto 0),
      gt3_rxmcommaalignen_in => gt3_rxmcommaalignen_in,
      gt3_rxmonitorout_out(6 downto 0) => gt3_rxmonitorout_out(6 downto 0),
      gt3_rxmonitorsel_in(1 downto 0) => gt3_rxmonitorsel_in(1 downto 0),
      gt3_rxnotintable_out(1 downto 0) => gt3_rxnotintable_out(1 downto 0),
      gt3_rxoutclk_out => gt3_rxoutclk_out,
      gt3_rxpcommaalignen_in => gt3_rxpcommaalignen_in,
      gt3_rxpd_in(1 downto 0) => gt3_rxpd_in(1 downto 0),
      gt3_rxresetdone_out => gt3_rxresetdone_out,
      gt3_rxusrclk2_in => gt3_rxusrclk2_in,
      gt3_rxusrclk_in => gt3_rxusrclk_in
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \gtwizard_32_Rx_gtwizard_32_Rx_init__parameterized0\ is
  port (
    gt0_drprdy_out : out STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_drprdy_out : out STD_LOGIC;
    gt1_eyescandataerror_out : out STD_LOGIC;
    gt1_rxoutclk_out : out STD_LOGIC;
    gt1_rxresetdone_out : out STD_LOGIC;
    gt1_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt1_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt1_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_drprdy_out : out STD_LOGIC;
    gt2_eyescandataerror_out : out STD_LOGIC;
    gt2_rxoutclk_out : out STD_LOGIC;
    gt2_rxresetdone_out : out STD_LOGIC;
    gt2_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt2_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt2_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_drprdy_out : out STD_LOGIC;
    gt3_eyescandataerror_out : out STD_LOGIC;
    gt3_rxoutclk_out : out STD_LOGIC;
    gt3_rxresetdone_out : out STD_LOGIC;
    gt3_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt3_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt3_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    GT0_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT1_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT2_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT3_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_QPLLRESET_OUT : out STD_LOGIC;
    GT0_DRP_BUSY_OUT : out STD_LOGIC;
    GT1_DRP_BUSY_OUT : out STD_LOGIC;
    GT2_DRP_BUSY_OUT : out STD_LOGIC;
    GT3_DRP_BUSY_OUT : out STD_LOGIC;
    gt0_drpclk_in : in STD_LOGIC;
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_gthrxn_in : in STD_LOGIC;
    gt0_gthrxp_in : in STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxmcommaalignen_in : in STD_LOGIC;
    gt0_rxpcommaalignen_in : in STD_LOGIC;
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_drpclk_in : in STD_LOGIC;
    gt1_eyescanreset_in : in STD_LOGIC;
    gt1_eyescantrigger_in : in STD_LOGIC;
    gt1_gthrxn_in : in STD_LOGIC;
    gt1_gthrxp_in : in STD_LOGIC;
    gt1_rxbufreset_in : in STD_LOGIC;
    gt1_rxmcommaalignen_in : in STD_LOGIC;
    gt1_rxpcommaalignen_in : in STD_LOGIC;
    gt1_rxusrclk_in : in STD_LOGIC;
    gt1_rxusrclk2_in : in STD_LOGIC;
    gt1_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_drpclk_in : in STD_LOGIC;
    gt2_eyescanreset_in : in STD_LOGIC;
    gt2_eyescantrigger_in : in STD_LOGIC;
    gt2_gthrxn_in : in STD_LOGIC;
    gt2_gthrxp_in : in STD_LOGIC;
    gt2_rxbufreset_in : in STD_LOGIC;
    gt2_rxmcommaalignen_in : in STD_LOGIC;
    gt2_rxpcommaalignen_in : in STD_LOGIC;
    gt2_rxusrclk_in : in STD_LOGIC;
    gt2_rxusrclk2_in : in STD_LOGIC;
    gt2_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_drpclk_in : in STD_LOGIC;
    gt3_eyescanreset_in : in STD_LOGIC;
    gt3_eyescantrigger_in : in STD_LOGIC;
    gt3_gthrxn_in : in STD_LOGIC;
    gt3_gthrxp_in : in STD_LOGIC;
    gt3_rxbufreset_in : in STD_LOGIC;
    gt3_rxmcommaalignen_in : in STD_LOGIC;
    gt3_rxpcommaalignen_in : in STD_LOGIC;
    gt3_rxusrclk_in : in STD_LOGIC;
    gt3_rxusrclk2_in : in STD_LOGIC;
    gt3_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    SYSCLK_IN : in STD_LOGIC;
    GT0_DATA_VALID_IN : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC;
    SOFT_RESET_IN : in STD_LOGIC;
    GT1_DATA_VALID_IN : in STD_LOGIC;
    GT2_DATA_VALID_IN : in STD_LOGIC;
    GT3_DATA_VALID_IN : in STD_LOGIC;
    gt0_drpen_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpwe_in : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt1_drpen_in : in STD_LOGIC;
    gt1_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpwe_in : in STD_LOGIC;
    gt1_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt2_drpen_in : in STD_LOGIC;
    gt2_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpwe_in : in STD_LOGIC;
    gt2_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt3_drpen_in : in STD_LOGIC;
    gt3_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpwe_in : in STD_LOGIC;
    gt3_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \gtwizard_32_Rx_gtwizard_32_Rx_init__parameterized0\ : entity is "gtwizard_32_Rx_init";
end \gtwizard_32_Rx_gtwizard_32_Rx_init__parameterized0\;

architecture STRUCTURE of \gtwizard_32_Rx_gtwizard_32_Rx_init__parameterized0\ is
  signal \^gt0_qpllreset_out\ : STD_LOGIC;
  signal RXUSERRDY : STD_LOGIC;
  signal gt0_rx_cdrlock_counter : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal gt0_rx_cdrlock_counter_0 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \^gt0_rxresetdone_out\ : STD_LOGIC;
  signal \^gt1_rxresetdone_out\ : STD_LOGIC;
  signal \^gt2_rxresetdone_out\ : STD_LOGIC;
  signal \^gt3_rxresetdone_out\ : STD_LOGIC;
  signal gtrxreset_i : STD_LOGIC;
  signal \n_0_gt0_rx_cdrlock_counter[2]_i_2\ : STD_LOGIC;
  signal \n_0_gt0_rx_cdrlock_counter[7]_i_2\ : STD_LOGIC;
  signal \n_0_gt0_rx_cdrlock_counter[8]_i_2\ : STD_LOGIC;
  signal n_0_gt0_rx_cdrlocked_i_1 : STD_LOGIC;
  signal n_0_gt0_rx_cdrlocked_reg : STD_LOGIC;
  signal n_1_gt1_rxresetfsm_i : STD_LOGIC;
  signal n_1_gt2_rxresetfsm_i : STD_LOGIC;
  signal n_1_gt3_rxresetfsm_i : STD_LOGIC;
  signal n_2_gt1_rxresetfsm_i : STD_LOGIC;
  signal n_2_gt2_rxresetfsm_i : STD_LOGIC;
  signal n_2_gt3_rxresetfsm_i : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gt0_rx_cdrlock_counter[0]_i_1\ : label is "soft_lutpair137";
  attribute SOFT_HLUTNM of \gt0_rx_cdrlock_counter[1]_i_1\ : label is "soft_lutpair137";
  attribute SOFT_HLUTNM of \gt0_rx_cdrlock_counter[3]_i_1\ : label is "soft_lutpair138";
  attribute SOFT_HLUTNM of \gt0_rx_cdrlock_counter[4]_i_1\ : label is "soft_lutpair138";
begin
  GT0_QPLLRESET_OUT <= \^gt0_qpllreset_out\;
  gt0_rxresetdone_out <= \^gt0_rxresetdone_out\;
  gt1_rxresetdone_out <= \^gt1_rxresetdone_out\;
  gt2_rxresetdone_out <= \^gt2_rxresetdone_out\;
  gt3_rxresetdone_out <= \^gt3_rxresetdone_out\;
\gt0_rx_cdrlock_counter[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8000FFFF"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(3),
      I1 => gt0_rx_cdrlock_counter(4),
      I2 => \n_0_gt0_rx_cdrlock_counter[2]_i_2\,
      I3 => gt0_rx_cdrlock_counter(1),
      I4 => gt0_rx_cdrlock_counter(0),
      O => gt0_rx_cdrlock_counter_0(0)
    );
\gt0_rx_cdrlock_counter[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80FFFF00"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(3),
      I1 => gt0_rx_cdrlock_counter(4),
      I2 => \n_0_gt0_rx_cdrlock_counter[2]_i_2\,
      I3 => gt0_rx_cdrlock_counter(1),
      I4 => gt0_rx_cdrlock_counter(0),
      O => gt0_rx_cdrlock_counter_0(1)
    );
\gt0_rx_cdrlock_counter[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFFFF7F000000"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(3),
      I1 => gt0_rx_cdrlock_counter(4),
      I2 => \n_0_gt0_rx_cdrlock_counter[2]_i_2\,
      I3 => gt0_rx_cdrlock_counter(1),
      I4 => gt0_rx_cdrlock_counter(0),
      I5 => gt0_rx_cdrlock_counter(2),
      O => gt0_rx_cdrlock_counter_0(2)
    );
\gt0_rx_cdrlock_counter[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(8),
      I1 => gt0_rx_cdrlock_counter(6),
      I2 => gt0_rx_cdrlock_counter(5),
      I3 => gt0_rx_cdrlock_counter(2),
      I4 => gt0_rx_cdrlock_counter(7),
      O => \n_0_gt0_rx_cdrlock_counter[2]_i_2\
    );
\gt0_rx_cdrlock_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(3),
      I1 => gt0_rx_cdrlock_counter(0),
      I2 => gt0_rx_cdrlock_counter(1),
      I3 => gt0_rx_cdrlock_counter(2),
      O => gt0_rx_cdrlock_counter_0(3)
    );
\gt0_rx_cdrlock_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(4),
      I1 => gt0_rx_cdrlock_counter(2),
      I2 => gt0_rx_cdrlock_counter(1),
      I3 => gt0_rx_cdrlock_counter(0),
      I4 => gt0_rx_cdrlock_counter(3),
      O => gt0_rx_cdrlock_counter_0(4)
    );
\gt0_rx_cdrlock_counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(5),
      I1 => gt0_rx_cdrlock_counter(3),
      I2 => gt0_rx_cdrlock_counter(4),
      I3 => gt0_rx_cdrlock_counter(2),
      I4 => gt0_rx_cdrlock_counter(1),
      I5 => gt0_rx_cdrlock_counter(0),
      O => gt0_rx_cdrlock_counter_0(5)
    );
\gt0_rx_cdrlock_counter[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(6),
      I1 => \n_0_gt0_rx_cdrlock_counter[7]_i_2\,
      I2 => gt0_rx_cdrlock_counter(4),
      I3 => gt0_rx_cdrlock_counter(3),
      I4 => gt0_rx_cdrlock_counter(5),
      O => gt0_rx_cdrlock_counter_0(6)
    );
\gt0_rx_cdrlock_counter[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(7),
      I1 => gt0_rx_cdrlock_counter(5),
      I2 => gt0_rx_cdrlock_counter(3),
      I3 => gt0_rx_cdrlock_counter(4),
      I4 => \n_0_gt0_rx_cdrlock_counter[7]_i_2\,
      I5 => gt0_rx_cdrlock_counter(6),
      O => gt0_rx_cdrlock_counter_0(7)
    );
\gt0_rx_cdrlock_counter[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(2),
      I1 => gt0_rx_cdrlock_counter(1),
      I2 => gt0_rx_cdrlock_counter(0),
      O => \n_0_gt0_rx_cdrlock_counter[7]_i_2\
    );
\gt0_rx_cdrlock_counter[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(8),
      I1 => gt0_rx_cdrlock_counter(6),
      I2 => \n_0_gt0_rx_cdrlock_counter[8]_i_2\,
      I3 => gt0_rx_cdrlock_counter(7),
      O => gt0_rx_cdrlock_counter_0(8)
    );
\gt0_rx_cdrlock_counter[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(5),
      I1 => gt0_rx_cdrlock_counter(3),
      I2 => gt0_rx_cdrlock_counter(4),
      I3 => gt0_rx_cdrlock_counter(2),
      I4 => gt0_rx_cdrlock_counter(1),
      I5 => gt0_rx_cdrlock_counter(0),
      O => \n_0_gt0_rx_cdrlock_counter[8]_i_2\
    );
\gt0_rx_cdrlock_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(0),
      Q => gt0_rx_cdrlock_counter(0),
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(1),
      Q => gt0_rx_cdrlock_counter(1),
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(2),
      Q => gt0_rx_cdrlock_counter(2),
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(3),
      Q => gt0_rx_cdrlock_counter(3),
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(4),
      Q => gt0_rx_cdrlock_counter(4),
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(5),
      Q => gt0_rx_cdrlock_counter(5),
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(6),
      Q => gt0_rx_cdrlock_counter(6),
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(7),
      Q => gt0_rx_cdrlock_counter(7),
      R => gtrxreset_i
    );
\gt0_rx_cdrlock_counter_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => gt0_rx_cdrlock_counter_0(8),
      Q => gt0_rx_cdrlock_counter(8),
      R => gtrxreset_i
    );
gt0_rx_cdrlocked_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF80000000"
    )
    port map (
      I0 => gt0_rx_cdrlock_counter(3),
      I1 => gt0_rx_cdrlock_counter(4),
      I2 => \n_0_gt0_rx_cdrlock_counter[2]_i_2\,
      I3 => gt0_rx_cdrlock_counter(1),
      I4 => gt0_rx_cdrlock_counter(0),
      I5 => n_0_gt0_rx_cdrlocked_reg,
      O => n_0_gt0_rx_cdrlocked_i_1
    );
gt0_rx_cdrlocked_reg: unisim.vcomponents.FDRE
    port map (
      C => SYSCLK_IN,
      CE => '1',
      D => n_0_gt0_rx_cdrlocked_i_1,
      Q => n_0_gt0_rx_cdrlocked_reg,
      R => gtrxreset_i
    );
gt0_rxresetfsm_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0\
    port map (
      AR(0) => \^gt0_qpllreset_out\,
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      GT0_DATA_VALID_IN => GT0_DATA_VALID_IN,
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      GT0_RX_FSM_RESET_DONE_OUT => GT0_RX_FSM_RESET_DONE_OUT,
      I1 => n_0_gt0_rx_cdrlocked_reg,
      RXUSERRDY => RXUSERRDY,
      SOFT_RESET_IN => SOFT_RESET_IN,
      SYSCLK_IN => SYSCLK_IN,
      gt0_rxresetdone_out => \^gt0_rxresetdone_out\,
      gt0_rxusrclk_in => gt0_rxusrclk_in,
      gtrxreset_i => gtrxreset_i
    );
gt1_rxresetfsm_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_0\
    port map (
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      GT1_DATA_VALID_IN => GT1_DATA_VALID_IN,
      GT1_RX_FSM_RESET_DONE_OUT => GT1_RX_FSM_RESET_DONE_OUT,
      I1 => n_0_gt0_rx_cdrlocked_reg,
      O1 => n_1_gt1_rxresetfsm_i,
      O2 => n_2_gt1_rxresetfsm_i,
      SOFT_RESET_IN => SOFT_RESET_IN,
      SYSCLK_IN => SYSCLK_IN,
      gt1_rxresetdone_out => \^gt1_rxresetdone_out\,
      gt1_rxusrclk_in => gt1_rxusrclk_in
    );
gt2_rxresetfsm_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_1\
    port map (
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      GT2_DATA_VALID_IN => GT2_DATA_VALID_IN,
      GT2_RX_FSM_RESET_DONE_OUT => GT2_RX_FSM_RESET_DONE_OUT,
      I1 => n_0_gt0_rx_cdrlocked_reg,
      O1 => n_1_gt2_rxresetfsm_i,
      O2 => n_2_gt2_rxresetfsm_i,
      SOFT_RESET_IN => SOFT_RESET_IN,
      SYSCLK_IN => SYSCLK_IN,
      gt2_rxresetdone_out => \^gt2_rxresetdone_out\,
      gt2_rxusrclk_in => gt2_rxusrclk_in
    );
gt3_rxresetfsm_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_RX_STARTUP_FSM__parameterized0_2\
    port map (
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      GT3_DATA_VALID_IN => GT3_DATA_VALID_IN,
      GT3_RX_FSM_RESET_DONE_OUT => GT3_RX_FSM_RESET_DONE_OUT,
      I1 => n_0_gt0_rx_cdrlocked_reg,
      O1 => n_1_gt3_rxresetfsm_i,
      O2 => n_2_gt3_rxresetfsm_i,
      SOFT_RESET_IN => SOFT_RESET_IN,
      SYSCLK_IN => SYSCLK_IN,
      gt3_rxresetdone_out => \^gt3_rxresetdone_out\,
      gt3_rxusrclk_in => gt3_rxusrclk_in
    );
gtwizard_32_Rx_i: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_multi_gt__parameterized0\
    port map (
      AR(0) => \^gt0_qpllreset_out\,
      GT0_DRP_BUSY_OUT => GT0_DRP_BUSY_OUT,
      GT0_QPLLOUTCLK_IN => GT0_QPLLOUTCLK_IN,
      GT0_QPLLOUTREFCLK_IN => GT0_QPLLOUTREFCLK_IN,
      GT1_DRP_BUSY_OUT => GT1_DRP_BUSY_OUT,
      GT2_DRP_BUSY_OUT => GT2_DRP_BUSY_OUT,
      GT3_DRP_BUSY_OUT => GT3_DRP_BUSY_OUT,
      I1 => n_1_gt1_rxresetfsm_i,
      I2 => n_1_gt2_rxresetfsm_i,
      I3 => n_1_gt3_rxresetfsm_i,
      I4 => n_2_gt1_rxresetfsm_i,
      I5 => n_2_gt2_rxresetfsm_i,
      I6 => n_2_gt3_rxresetfsm_i,
      O1 => gt0_drprdy_out,
      O2 => gt1_drprdy_out,
      O3 => gt2_drprdy_out,
      O4 => gt3_drprdy_out,
      RXUSERRDY => RXUSERRDY,
      gt0_dmonitorout_out(14 downto 0) => gt0_dmonitorout_out(14 downto 0),
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      gt0_drpdo_out(15 downto 0) => gt0_drpdo_out(15 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_drpwe_in => gt0_drpwe_in,
      gt0_eyescandataerror_out => gt0_eyescandataerror_out,
      gt0_eyescanreset_in => gt0_eyescanreset_in,
      gt0_eyescantrigger_in => gt0_eyescantrigger_in,
      gt0_gthrxn_in => gt0_gthrxn_in,
      gt0_gthrxp_in => gt0_gthrxp_in,
      gt0_rxbufreset_in => gt0_rxbufreset_in,
      gt0_rxbufstatus_out(2 downto 0) => gt0_rxbufstatus_out(2 downto 0),
      gt0_rxchariscomma_out(1 downto 0) => gt0_rxchariscomma_out(1 downto 0),
      gt0_rxcharisk_out(1 downto 0) => gt0_rxcharisk_out(1 downto 0),
      gt0_rxdata_out(15 downto 0) => gt0_rxdata_out(15 downto 0),
      gt0_rxdisperr_out(1 downto 0) => gt0_rxdisperr_out(1 downto 0),
      gt0_rxmcommaalignen_in => gt0_rxmcommaalignen_in,
      gt0_rxmonitorout_out(6 downto 0) => gt0_rxmonitorout_out(6 downto 0),
      gt0_rxmonitorsel_in(1 downto 0) => gt0_rxmonitorsel_in(1 downto 0),
      gt0_rxnotintable_out(1 downto 0) => gt0_rxnotintable_out(1 downto 0),
      gt0_rxoutclk_out => gt0_rxoutclk_out,
      gt0_rxpcommaalignen_in => gt0_rxpcommaalignen_in,
      gt0_rxpd_in(1 downto 0) => gt0_rxpd_in(1 downto 0),
      gt0_rxresetdone_out => \^gt0_rxresetdone_out\,
      gt0_rxusrclk2_in => gt0_rxusrclk2_in,
      gt0_rxusrclk_in => gt0_rxusrclk_in,
      gt1_dmonitorout_out(14 downto 0) => gt1_dmonitorout_out(14 downto 0),
      gt1_drpaddr_in(8 downto 0) => gt1_drpaddr_in(8 downto 0),
      gt1_drpclk_in => gt1_drpclk_in,
      gt1_drpdi_in(15 downto 0) => gt1_drpdi_in(15 downto 0),
      gt1_drpdo_out(15 downto 0) => gt1_drpdo_out(15 downto 0),
      gt1_drpen_in => gt1_drpen_in,
      gt1_drpwe_in => gt1_drpwe_in,
      gt1_eyescandataerror_out => gt1_eyescandataerror_out,
      gt1_eyescanreset_in => gt1_eyescanreset_in,
      gt1_eyescantrigger_in => gt1_eyescantrigger_in,
      gt1_gthrxn_in => gt1_gthrxn_in,
      gt1_gthrxp_in => gt1_gthrxp_in,
      gt1_rxbufreset_in => gt1_rxbufreset_in,
      gt1_rxbufstatus_out(2 downto 0) => gt1_rxbufstatus_out(2 downto 0),
      gt1_rxchariscomma_out(1 downto 0) => gt1_rxchariscomma_out(1 downto 0),
      gt1_rxcharisk_out(1 downto 0) => gt1_rxcharisk_out(1 downto 0),
      gt1_rxdata_out(15 downto 0) => gt1_rxdata_out(15 downto 0),
      gt1_rxdisperr_out(1 downto 0) => gt1_rxdisperr_out(1 downto 0),
      gt1_rxmcommaalignen_in => gt1_rxmcommaalignen_in,
      gt1_rxmonitorout_out(6 downto 0) => gt1_rxmonitorout_out(6 downto 0),
      gt1_rxmonitorsel_in(1 downto 0) => gt1_rxmonitorsel_in(1 downto 0),
      gt1_rxnotintable_out(1 downto 0) => gt1_rxnotintable_out(1 downto 0),
      gt1_rxoutclk_out => gt1_rxoutclk_out,
      gt1_rxpcommaalignen_in => gt1_rxpcommaalignen_in,
      gt1_rxpd_in(1 downto 0) => gt1_rxpd_in(1 downto 0),
      gt1_rxresetdone_out => \^gt1_rxresetdone_out\,
      gt1_rxusrclk2_in => gt1_rxusrclk2_in,
      gt1_rxusrclk_in => gt1_rxusrclk_in,
      gt2_dmonitorout_out(14 downto 0) => gt2_dmonitorout_out(14 downto 0),
      gt2_drpaddr_in(8 downto 0) => gt2_drpaddr_in(8 downto 0),
      gt2_drpclk_in => gt2_drpclk_in,
      gt2_drpdi_in(15 downto 0) => gt2_drpdi_in(15 downto 0),
      gt2_drpdo_out(15 downto 0) => gt2_drpdo_out(15 downto 0),
      gt2_drpen_in => gt2_drpen_in,
      gt2_drpwe_in => gt2_drpwe_in,
      gt2_eyescandataerror_out => gt2_eyescandataerror_out,
      gt2_eyescanreset_in => gt2_eyescanreset_in,
      gt2_eyescantrigger_in => gt2_eyescantrigger_in,
      gt2_gthrxn_in => gt2_gthrxn_in,
      gt2_gthrxp_in => gt2_gthrxp_in,
      gt2_rxbufreset_in => gt2_rxbufreset_in,
      gt2_rxbufstatus_out(2 downto 0) => gt2_rxbufstatus_out(2 downto 0),
      gt2_rxchariscomma_out(1 downto 0) => gt2_rxchariscomma_out(1 downto 0),
      gt2_rxcharisk_out(1 downto 0) => gt2_rxcharisk_out(1 downto 0),
      gt2_rxdata_out(15 downto 0) => gt2_rxdata_out(15 downto 0),
      gt2_rxdisperr_out(1 downto 0) => gt2_rxdisperr_out(1 downto 0),
      gt2_rxmcommaalignen_in => gt2_rxmcommaalignen_in,
      gt2_rxmonitorout_out(6 downto 0) => gt2_rxmonitorout_out(6 downto 0),
      gt2_rxmonitorsel_in(1 downto 0) => gt2_rxmonitorsel_in(1 downto 0),
      gt2_rxnotintable_out(1 downto 0) => gt2_rxnotintable_out(1 downto 0),
      gt2_rxoutclk_out => gt2_rxoutclk_out,
      gt2_rxpcommaalignen_in => gt2_rxpcommaalignen_in,
      gt2_rxpd_in(1 downto 0) => gt2_rxpd_in(1 downto 0),
      gt2_rxresetdone_out => \^gt2_rxresetdone_out\,
      gt2_rxusrclk2_in => gt2_rxusrclk2_in,
      gt2_rxusrclk_in => gt2_rxusrclk_in,
      gt3_dmonitorout_out(14 downto 0) => gt3_dmonitorout_out(14 downto 0),
      gt3_drpaddr_in(8 downto 0) => gt3_drpaddr_in(8 downto 0),
      gt3_drpclk_in => gt3_drpclk_in,
      gt3_drpdi_in(15 downto 0) => gt3_drpdi_in(15 downto 0),
      gt3_drpdo_out(15 downto 0) => gt3_drpdo_out(15 downto 0),
      gt3_drpen_in => gt3_drpen_in,
      gt3_drpwe_in => gt3_drpwe_in,
      gt3_eyescandataerror_out => gt3_eyescandataerror_out,
      gt3_eyescanreset_in => gt3_eyescanreset_in,
      gt3_eyescantrigger_in => gt3_eyescantrigger_in,
      gt3_gthrxn_in => gt3_gthrxn_in,
      gt3_gthrxp_in => gt3_gthrxp_in,
      gt3_rxbufreset_in => gt3_rxbufreset_in,
      gt3_rxbufstatus_out(2 downto 0) => gt3_rxbufstatus_out(2 downto 0),
      gt3_rxchariscomma_out(1 downto 0) => gt3_rxchariscomma_out(1 downto 0),
      gt3_rxcharisk_out(1 downto 0) => gt3_rxcharisk_out(1 downto 0),
      gt3_rxdata_out(15 downto 0) => gt3_rxdata_out(15 downto 0),
      gt3_rxdisperr_out(1 downto 0) => gt3_rxdisperr_out(1 downto 0),
      gt3_rxmcommaalignen_in => gt3_rxmcommaalignen_in,
      gt3_rxmonitorout_out(6 downto 0) => gt3_rxmonitorout_out(6 downto 0),
      gt3_rxmonitorsel_in(1 downto 0) => gt3_rxmonitorsel_in(1 downto 0),
      gt3_rxnotintable_out(1 downto 0) => gt3_rxnotintable_out(1 downto 0),
      gt3_rxoutclk_out => gt3_rxoutclk_out,
      gt3_rxpcommaalignen_in => gt3_rxpcommaalignen_in,
      gt3_rxpd_in(1 downto 0) => gt3_rxpd_in(1 downto 0),
      gt3_rxresetdone_out => \^gt3_rxresetdone_out\,
      gt3_rxusrclk2_in => gt3_rxusrclk2_in,
      gt3_rxusrclk_in => gt3_rxusrclk_in,
      gtrxreset_i => gtrxreset_i
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity gtwizard_32_Rx is
  port (
    SYSCLK_IN : in STD_LOGIC;
    SOFT_RESET_IN : in STD_LOGIC;
    DONT_RESET_ON_DATA_ERROR_IN : in STD_LOGIC;
    GT0_DRP_BUSY_OUT : out STD_LOGIC;
    GT0_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT0_DATA_VALID_IN : in STD_LOGIC;
    GT1_DRP_BUSY_OUT : out STD_LOGIC;
    GT1_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT1_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT1_DATA_VALID_IN : in STD_LOGIC;
    GT2_DRP_BUSY_OUT : out STD_LOGIC;
    GT2_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT2_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT2_DATA_VALID_IN : in STD_LOGIC;
    GT3_DRP_BUSY_OUT : out STD_LOGIC;
    GT3_TX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT3_RX_FSM_RESET_DONE_OUT : out STD_LOGIC;
    GT3_DATA_VALID_IN : in STD_LOGIC;
    gt0_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt0_drpclk_in : in STD_LOGIC;
    gt0_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpen_in : in STD_LOGIC;
    gt0_drprdy_out : out STD_LOGIC;
    gt0_drpwe_in : in STD_LOGIC;
    gt0_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_rxuserrdy_in : in STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt0_rxusrclk_in : in STD_LOGIC;
    gt0_rxusrclk2_in : in STD_LOGIC;
    gt0_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_gthrxn_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxmcommaalignen_in : in STD_LOGIC;
    gt0_rxpcommaalignen_in : in STD_LOGIC;
    gt0_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxoutclk_out : out STD_LOGIC;
    gt0_gtrxreset_in : in STD_LOGIC;
    gt0_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_gthrxp_in : in STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_gttxreset_in : in STD_LOGIC;
    gt1_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt1_drpclk_in : in STD_LOGIC;
    gt1_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_drpen_in : in STD_LOGIC;
    gt1_drprdy_out : out STD_LOGIC;
    gt1_drpwe_in : in STD_LOGIC;
    gt1_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_eyescanreset_in : in STD_LOGIC;
    gt1_rxuserrdy_in : in STD_LOGIC;
    gt1_eyescandataerror_out : out STD_LOGIC;
    gt1_eyescantrigger_in : in STD_LOGIC;
    gt1_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt1_rxusrclk_in : in STD_LOGIC;
    gt1_rxusrclk2_in : in STD_LOGIC;
    gt1_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt1_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_gthrxn_in : in STD_LOGIC;
    gt1_rxbufreset_in : in STD_LOGIC;
    gt1_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt1_rxmcommaalignen_in : in STD_LOGIC;
    gt1_rxpcommaalignen_in : in STD_LOGIC;
    gt1_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt1_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxoutclk_out : out STD_LOGIC;
    gt1_gtrxreset_in : in STD_LOGIC;
    gt1_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt1_gthrxp_in : in STD_LOGIC;
    gt1_rxresetdone_out : out STD_LOGIC;
    gt1_gttxreset_in : in STD_LOGIC;
    gt2_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt2_drpclk_in : in STD_LOGIC;
    gt2_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_drpen_in : in STD_LOGIC;
    gt2_drprdy_out : out STD_LOGIC;
    gt2_drpwe_in : in STD_LOGIC;
    gt2_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_eyescanreset_in : in STD_LOGIC;
    gt2_rxuserrdy_in : in STD_LOGIC;
    gt2_eyescandataerror_out : out STD_LOGIC;
    gt2_eyescantrigger_in : in STD_LOGIC;
    gt2_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt2_rxusrclk_in : in STD_LOGIC;
    gt2_rxusrclk2_in : in STD_LOGIC;
    gt2_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt2_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_gthrxn_in : in STD_LOGIC;
    gt2_rxbufreset_in : in STD_LOGIC;
    gt2_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt2_rxmcommaalignen_in : in STD_LOGIC;
    gt2_rxpcommaalignen_in : in STD_LOGIC;
    gt2_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt2_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxoutclk_out : out STD_LOGIC;
    gt2_gtrxreset_in : in STD_LOGIC;
    gt2_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt2_gthrxp_in : in STD_LOGIC;
    gt2_rxresetdone_out : out STD_LOGIC;
    gt2_gttxreset_in : in STD_LOGIC;
    gt3_drpaddr_in : in STD_LOGIC_VECTOR ( 8 downto 0 );
    gt3_drpclk_in : in STD_LOGIC;
    gt3_drpdi_in : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpdo_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_drpen_in : in STD_LOGIC;
    gt3_drprdy_out : out STD_LOGIC;
    gt3_drpwe_in : in STD_LOGIC;
    gt3_rxpd_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_eyescanreset_in : in STD_LOGIC;
    gt3_rxuserrdy_in : in STD_LOGIC;
    gt3_eyescandataerror_out : out STD_LOGIC;
    gt3_eyescantrigger_in : in STD_LOGIC;
    gt3_dmonitorout_out : out STD_LOGIC_VECTOR ( 14 downto 0 );
    gt3_rxusrclk_in : in STD_LOGIC;
    gt3_rxusrclk2_in : in STD_LOGIC;
    gt3_rxdata_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt3_rxdisperr_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxnotintable_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_gthrxn_in : in STD_LOGIC;
    gt3_rxbufreset_in : in STD_LOGIC;
    gt3_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt3_rxmcommaalignen_in : in STD_LOGIC;
    gt3_rxpcommaalignen_in : in STD_LOGIC;
    gt3_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt3_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxoutclk_out : out STD_LOGIC;
    gt3_gtrxreset_in : in STD_LOGIC;
    gt3_rxchariscomma_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_rxcharisk_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt3_gthrxp_in : in STD_LOGIC;
    gt3_rxresetdone_out : out STD_LOGIC;
    gt3_gttxreset_in : in STD_LOGIC;
    GT0_QPLLLOCK_IN : in STD_LOGIC;
    GT0_QPLLREFCLKLOST_IN : in STD_LOGIC;
    GT0_QPLLRESET_OUT : out STD_LOGIC;
    GT0_QPLLOUTCLK_IN : in STD_LOGIC;
    GT0_QPLLOUTREFCLK_IN : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of gtwizard_32_Rx : entity is true;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of gtwizard_32_Rx : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of gtwizard_32_Rx : entity is "gtwizard_32_Rx,gtwizard_v3_2,{protocol_file=Start_from_scratch}";
  attribute core_generation_info : string;
  attribute core_generation_info of gtwizard_32_Rx : entity is "gtwizard_32_Rx,gtwizard_v3_2,{protocol_file=Start_from_scratch}";
end gtwizard_32_Rx;

architecture STRUCTURE of gtwizard_32_Rx is
begin
  GT0_TX_FSM_RESET_DONE_OUT <= 'Z';
  GT1_TX_FSM_RESET_DONE_OUT <= 'Z';
  GT2_TX_FSM_RESET_DONE_OUT <= 'Z';
  GT3_TX_FSM_RESET_DONE_OUT <= 'Z';
U0: entity work.\gtwizard_32_Rx_gtwizard_32_Rx_init__parameterized0\
    port map (
      DONT_RESET_ON_DATA_ERROR_IN => DONT_RESET_ON_DATA_ERROR_IN,
      GT0_DATA_VALID_IN => GT0_DATA_VALID_IN,
      GT0_DRP_BUSY_OUT => GT0_DRP_BUSY_OUT,
      GT0_QPLLLOCK_IN => GT0_QPLLLOCK_IN,
      GT0_QPLLOUTCLK_IN => GT0_QPLLOUTCLK_IN,
      GT0_QPLLOUTREFCLK_IN => GT0_QPLLOUTREFCLK_IN,
      GT0_QPLLRESET_OUT => GT0_QPLLRESET_OUT,
      GT0_RX_FSM_RESET_DONE_OUT => GT0_RX_FSM_RESET_DONE_OUT,
      GT1_DATA_VALID_IN => GT1_DATA_VALID_IN,
      GT1_DRP_BUSY_OUT => GT1_DRP_BUSY_OUT,
      GT1_RX_FSM_RESET_DONE_OUT => GT1_RX_FSM_RESET_DONE_OUT,
      GT2_DATA_VALID_IN => GT2_DATA_VALID_IN,
      GT2_DRP_BUSY_OUT => GT2_DRP_BUSY_OUT,
      GT2_RX_FSM_RESET_DONE_OUT => GT2_RX_FSM_RESET_DONE_OUT,
      GT3_DATA_VALID_IN => GT3_DATA_VALID_IN,
      GT3_DRP_BUSY_OUT => GT3_DRP_BUSY_OUT,
      GT3_RX_FSM_RESET_DONE_OUT => GT3_RX_FSM_RESET_DONE_OUT,
      SOFT_RESET_IN => SOFT_RESET_IN,
      SYSCLK_IN => SYSCLK_IN,
      gt0_dmonitorout_out(14 downto 0) => gt0_dmonitorout_out(14 downto 0),
      gt0_drpaddr_in(8 downto 0) => gt0_drpaddr_in(8 downto 0),
      gt0_drpclk_in => gt0_drpclk_in,
      gt0_drpdi_in(15 downto 0) => gt0_drpdi_in(15 downto 0),
      gt0_drpdo_out(15 downto 0) => gt0_drpdo_out(15 downto 0),
      gt0_drpen_in => gt0_drpen_in,
      gt0_drprdy_out => gt0_drprdy_out,
      gt0_drpwe_in => gt0_drpwe_in,
      gt0_eyescandataerror_out => gt0_eyescandataerror_out,
      gt0_eyescanreset_in => gt0_eyescanreset_in,
      gt0_eyescantrigger_in => gt0_eyescantrigger_in,
      gt0_gthrxn_in => gt0_gthrxn_in,
      gt0_gthrxp_in => gt0_gthrxp_in,
      gt0_rxbufreset_in => gt0_rxbufreset_in,
      gt0_rxbufstatus_out(2 downto 0) => gt0_rxbufstatus_out(2 downto 0),
      gt0_rxchariscomma_out(1 downto 0) => gt0_rxchariscomma_out(1 downto 0),
      gt0_rxcharisk_out(1 downto 0) => gt0_rxcharisk_out(1 downto 0),
      gt0_rxdata_out(15 downto 0) => gt0_rxdata_out(15 downto 0),
      gt0_rxdisperr_out(1 downto 0) => gt0_rxdisperr_out(1 downto 0),
      gt0_rxmcommaalignen_in => gt0_rxmcommaalignen_in,
      gt0_rxmonitorout_out(6 downto 0) => gt0_rxmonitorout_out(6 downto 0),
      gt0_rxmonitorsel_in(1 downto 0) => gt0_rxmonitorsel_in(1 downto 0),
      gt0_rxnotintable_out(1 downto 0) => gt0_rxnotintable_out(1 downto 0),
      gt0_rxoutclk_out => gt0_rxoutclk_out,
      gt0_rxpcommaalignen_in => gt0_rxpcommaalignen_in,
      gt0_rxpd_in(1 downto 0) => gt0_rxpd_in(1 downto 0),
      gt0_rxresetdone_out => gt0_rxresetdone_out,
      gt0_rxusrclk2_in => gt0_rxusrclk2_in,
      gt0_rxusrclk_in => gt0_rxusrclk_in,
      gt1_dmonitorout_out(14 downto 0) => gt1_dmonitorout_out(14 downto 0),
      gt1_drpaddr_in(8 downto 0) => gt1_drpaddr_in(8 downto 0),
      gt1_drpclk_in => gt1_drpclk_in,
      gt1_drpdi_in(15 downto 0) => gt1_drpdi_in(15 downto 0),
      gt1_drpdo_out(15 downto 0) => gt1_drpdo_out(15 downto 0),
      gt1_drpen_in => gt1_drpen_in,
      gt1_drprdy_out => gt1_drprdy_out,
      gt1_drpwe_in => gt1_drpwe_in,
      gt1_eyescandataerror_out => gt1_eyescandataerror_out,
      gt1_eyescanreset_in => gt1_eyescanreset_in,
      gt1_eyescantrigger_in => gt1_eyescantrigger_in,
      gt1_gthrxn_in => gt1_gthrxn_in,
      gt1_gthrxp_in => gt1_gthrxp_in,
      gt1_rxbufreset_in => gt1_rxbufreset_in,
      gt1_rxbufstatus_out(2 downto 0) => gt1_rxbufstatus_out(2 downto 0),
      gt1_rxchariscomma_out(1 downto 0) => gt1_rxchariscomma_out(1 downto 0),
      gt1_rxcharisk_out(1 downto 0) => gt1_rxcharisk_out(1 downto 0),
      gt1_rxdata_out(15 downto 0) => gt1_rxdata_out(15 downto 0),
      gt1_rxdisperr_out(1 downto 0) => gt1_rxdisperr_out(1 downto 0),
      gt1_rxmcommaalignen_in => gt1_rxmcommaalignen_in,
      gt1_rxmonitorout_out(6 downto 0) => gt1_rxmonitorout_out(6 downto 0),
      gt1_rxmonitorsel_in(1 downto 0) => gt1_rxmonitorsel_in(1 downto 0),
      gt1_rxnotintable_out(1 downto 0) => gt1_rxnotintable_out(1 downto 0),
      gt1_rxoutclk_out => gt1_rxoutclk_out,
      gt1_rxpcommaalignen_in => gt1_rxpcommaalignen_in,
      gt1_rxpd_in(1 downto 0) => gt1_rxpd_in(1 downto 0),
      gt1_rxresetdone_out => gt1_rxresetdone_out,
      gt1_rxusrclk2_in => gt1_rxusrclk2_in,
      gt1_rxusrclk_in => gt1_rxusrclk_in,
      gt2_dmonitorout_out(14 downto 0) => gt2_dmonitorout_out(14 downto 0),
      gt2_drpaddr_in(8 downto 0) => gt2_drpaddr_in(8 downto 0),
      gt2_drpclk_in => gt2_drpclk_in,
      gt2_drpdi_in(15 downto 0) => gt2_drpdi_in(15 downto 0),
      gt2_drpdo_out(15 downto 0) => gt2_drpdo_out(15 downto 0),
      gt2_drpen_in => gt2_drpen_in,
      gt2_drprdy_out => gt2_drprdy_out,
      gt2_drpwe_in => gt2_drpwe_in,
      gt2_eyescandataerror_out => gt2_eyescandataerror_out,
      gt2_eyescanreset_in => gt2_eyescanreset_in,
      gt2_eyescantrigger_in => gt2_eyescantrigger_in,
      gt2_gthrxn_in => gt2_gthrxn_in,
      gt2_gthrxp_in => gt2_gthrxp_in,
      gt2_rxbufreset_in => gt2_rxbufreset_in,
      gt2_rxbufstatus_out(2 downto 0) => gt2_rxbufstatus_out(2 downto 0),
      gt2_rxchariscomma_out(1 downto 0) => gt2_rxchariscomma_out(1 downto 0),
      gt2_rxcharisk_out(1 downto 0) => gt2_rxcharisk_out(1 downto 0),
      gt2_rxdata_out(15 downto 0) => gt2_rxdata_out(15 downto 0),
      gt2_rxdisperr_out(1 downto 0) => gt2_rxdisperr_out(1 downto 0),
      gt2_rxmcommaalignen_in => gt2_rxmcommaalignen_in,
      gt2_rxmonitorout_out(6 downto 0) => gt2_rxmonitorout_out(6 downto 0),
      gt2_rxmonitorsel_in(1 downto 0) => gt2_rxmonitorsel_in(1 downto 0),
      gt2_rxnotintable_out(1 downto 0) => gt2_rxnotintable_out(1 downto 0),
      gt2_rxoutclk_out => gt2_rxoutclk_out,
      gt2_rxpcommaalignen_in => gt2_rxpcommaalignen_in,
      gt2_rxpd_in(1 downto 0) => gt2_rxpd_in(1 downto 0),
      gt2_rxresetdone_out => gt2_rxresetdone_out,
      gt2_rxusrclk2_in => gt2_rxusrclk2_in,
      gt2_rxusrclk_in => gt2_rxusrclk_in,
      gt3_dmonitorout_out(14 downto 0) => gt3_dmonitorout_out(14 downto 0),
      gt3_drpaddr_in(8 downto 0) => gt3_drpaddr_in(8 downto 0),
      gt3_drpclk_in => gt3_drpclk_in,
      gt3_drpdi_in(15 downto 0) => gt3_drpdi_in(15 downto 0),
      gt3_drpdo_out(15 downto 0) => gt3_drpdo_out(15 downto 0),
      gt3_drpen_in => gt3_drpen_in,
      gt3_drprdy_out => gt3_drprdy_out,
      gt3_drpwe_in => gt3_drpwe_in,
      gt3_eyescandataerror_out => gt3_eyescandataerror_out,
      gt3_eyescanreset_in => gt3_eyescanreset_in,
      gt3_eyescantrigger_in => gt3_eyescantrigger_in,
      gt3_gthrxn_in => gt3_gthrxn_in,
      gt3_gthrxp_in => gt3_gthrxp_in,
      gt3_rxbufreset_in => gt3_rxbufreset_in,
      gt3_rxbufstatus_out(2 downto 0) => gt3_rxbufstatus_out(2 downto 0),
      gt3_rxchariscomma_out(1 downto 0) => gt3_rxchariscomma_out(1 downto 0),
      gt3_rxcharisk_out(1 downto 0) => gt3_rxcharisk_out(1 downto 0),
      gt3_rxdata_out(15 downto 0) => gt3_rxdata_out(15 downto 0),
      gt3_rxdisperr_out(1 downto 0) => gt3_rxdisperr_out(1 downto 0),
      gt3_rxmcommaalignen_in => gt3_rxmcommaalignen_in,
      gt3_rxmonitorout_out(6 downto 0) => gt3_rxmonitorout_out(6 downto 0),
      gt3_rxmonitorsel_in(1 downto 0) => gt3_rxmonitorsel_in(1 downto 0),
      gt3_rxnotintable_out(1 downto 0) => gt3_rxnotintable_out(1 downto 0),
      gt3_rxoutclk_out => gt3_rxoutclk_out,
      gt3_rxpcommaalignen_in => gt3_rxpcommaalignen_in,
      gt3_rxpd_in(1 downto 0) => gt3_rxpd_in(1 downto 0),
      gt3_rxresetdone_out => gt3_rxresetdone_out,
      gt3_rxusrclk2_in => gt3_rxusrclk2_in,
      gt3_rxusrclk_in => gt3_rxusrclk_in
    );
end STRUCTURE;
