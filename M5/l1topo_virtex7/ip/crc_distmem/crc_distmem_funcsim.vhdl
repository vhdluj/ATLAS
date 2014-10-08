-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 932637 Wed Jun 11 13:33:10 MDT 2014
-- Date        : Mon Sep 29 17:24:27 2014
-- Host        : Grzegorz-THINK running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/Grzegorz/Desktop/virtex7_sources/ProcessorU2_140926/TopoGTH_QPLL_AV2.srcs/sources_1/ip/crc_distmem/crc_distmem_funcsim.vhdl
-- Design      : crc_distmem
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \crc_distmem_rom__parameterized0\ is
  port (
    spo : out STD_LOGIC_VECTOR ( 6 downto 0 );
    a : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \crc_distmem_rom__parameterized0\ : entity is "rom";
end \crc_distmem_rom__parameterized0\;

architecture STRUCTURE of \crc_distmem_rom__parameterized0\ is
  signal n_0_g0_b0 : STD_LOGIC;
  signal n_0_g0_b11 : STD_LOGIC;
  signal n_0_g0_b2 : STD_LOGIC;
  signal n_0_g0_b3 : STD_LOGIC;
  signal n_0_g0_b4 : STD_LOGIC;
  signal n_0_g0_b5 : STD_LOGIC;
  signal n_0_g0_b6 : STD_LOGIC;
  signal n_0_g1_b0 : STD_LOGIC;
  signal n_0_g1_b11 : STD_LOGIC;
  signal n_0_g1_b2 : STD_LOGIC;
  signal n_0_g1_b3 : STD_LOGIC;
  signal n_0_g1_b4 : STD_LOGIC;
  signal n_0_g1_b5 : STD_LOGIC;
  signal n_0_g1_b6 : STD_LOGIC;
  signal n_0_g2_b0 : STD_LOGIC;
  signal n_0_g2_b11 : STD_LOGIC;
  signal n_0_g2_b2 : STD_LOGIC;
  signal n_0_g2_b3 : STD_LOGIC;
  signal n_0_g2_b4 : STD_LOGIC;
  signal n_0_g2_b5 : STD_LOGIC;
  signal n_0_g2_b6 : STD_LOGIC;
  signal n_0_g3_b0 : STD_LOGIC;
  signal n_0_g3_b11 : STD_LOGIC;
  signal n_0_g3_b2 : STD_LOGIC;
  signal n_0_g3_b3 : STD_LOGIC;
  signal n_0_g3_b4 : STD_LOGIC;
  signal n_0_g3_b5 : STD_LOGIC;
  signal n_0_g3_b6 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of g0_b2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of g0_b3 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of g0_b4 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of g0_b5 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g0_b6 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of g1_b2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of g1_b3 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g1_b4 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of g1_b5 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of g1_b6 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of g2_b2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of g2_b3 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of g2_b4 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of g2_b5 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of g2_b6 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of g3_b2 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of g3_b3 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g3_b4 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of g3_b5 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of g3_b6 : label is "soft_lutpair5";
begin
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      I5 => a(5),
      O => n_0_g0_b0
    );
g0_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      I5 => a(5),
      O => n_0_g0_b11
    );
g0_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => a(0),
      I1 => a(2),
      I2 => a(3),
      I3 => a(4),
      I4 => a(5),
      O => n_0_g0_b2
    );
g0_b3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(0),
      I1 => a(2),
      O => n_0_g0_b3
    );
g0_b4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(1),
      I1 => a(3),
      O => n_0_g0_b4
    );
g0_b5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(2),
      I1 => a(4),
      O => n_0_g0_b5
    );
g0_b6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(3),
      I1 => a(5),
      O => n_0_g0_b6
    );
g1_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      I5 => a(5),
      O => n_0_g1_b0
    );
g1_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      I5 => a(5),
      O => n_0_g1_b11
    );
g1_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
    port map (
      I0 => a(0),
      I1 => a(2),
      I2 => a(3),
      I3 => a(4),
      I4 => a(5),
      O => n_0_g1_b2
    );
g1_b3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(0),
      I1 => a(2),
      O => n_0_g1_b3
    );
g1_b4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(1),
      I1 => a(3),
      O => n_0_g1_b4
    );
g1_b5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(2),
      I1 => a(4),
      O => n_0_g1_b5
    );
g1_b6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(3),
      I1 => a(5),
      O => n_0_g1_b6
    );
g2_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      I5 => a(5),
      O => n_0_g2_b0
    );
g2_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669699669969669"
    )
    port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      I5 => a(5),
      O => n_0_g2_b11
    );
g2_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
    port map (
      I0 => a(0),
      I1 => a(2),
      I2 => a(3),
      I3 => a(4),
      I4 => a(5),
      O => n_0_g2_b2
    );
g2_b3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(0),
      I1 => a(2),
      O => n_0_g2_b3
    );
g2_b4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(1),
      I1 => a(3),
      O => n_0_g2_b4
    );
g2_b5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(2),
      I1 => a(4),
      O => n_0_g2_b5
    );
g2_b6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(3),
      I1 => a(5),
      O => n_0_g2_b6
    );
g3_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      I5 => a(5),
      O => n_0_g3_b0
    );
g3_b11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
    port map (
      I0 => a(0),
      I1 => a(1),
      I2 => a(2),
      I3 => a(3),
      I4 => a(4),
      I5 => a(5),
      O => n_0_g3_b11
    );
g3_b2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
    port map (
      I0 => a(0),
      I1 => a(2),
      I2 => a(3),
      I3 => a(4),
      I4 => a(5),
      O => n_0_g3_b2
    );
g3_b3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(0),
      I1 => a(2),
      O => n_0_g3_b3
    );
g3_b4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(1),
      I1 => a(3),
      O => n_0_g3_b4
    );
g3_b5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(2),
      I1 => a(4),
      O => n_0_g3_b5
    );
g3_b6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => a(3),
      I1 => a(5),
      O => n_0_g3_b6
    );
\spo[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_g3_b0,
      I1 => n_0_g2_b0,
      I2 => a(7),
      I3 => n_0_g1_b0,
      I4 => a(6),
      I5 => n_0_g0_b0,
      O => spo(0)
    );
\spo[11]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_g3_b11,
      I1 => n_0_g2_b11,
      I2 => a(7),
      I3 => n_0_g1_b11,
      I4 => a(6),
      I5 => n_0_g0_b11,
      O => spo(6)
    );
\spo[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_g3_b2,
      I1 => n_0_g2_b2,
      I2 => a(7),
      I3 => n_0_g1_b2,
      I4 => a(6),
      I5 => n_0_g0_b2,
      O => spo(1)
    );
\spo[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_g3_b3,
      I1 => n_0_g2_b3,
      I2 => a(7),
      I3 => n_0_g1_b3,
      I4 => a(6),
      I5 => n_0_g0_b3,
      O => spo(2)
    );
\spo[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_g3_b4,
      I1 => n_0_g2_b4,
      I2 => a(7),
      I3 => n_0_g1_b4,
      I4 => a(6),
      I5 => n_0_g0_b4,
      O => spo(3)
    );
\spo[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_g3_b5,
      I1 => n_0_g2_b5,
      I2 => a(7),
      I3 => n_0_g1_b5,
      I4 => a(6),
      I5 => n_0_g0_b5,
      O => spo(4)
    );
\spo[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
    port map (
      I0 => n_0_g3_b6,
      I1 => n_0_g2_b6,
      I2 => a(7),
      I3 => n_0_g1_b6,
      I4 => a(6),
      I5 => n_0_g0_b6,
      O => spo(5)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity crc_distmem_dist_mem_gen_v8_0_synth is
  port (
    spo : out STD_LOGIC_VECTOR ( 6 downto 0 );
    a : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of crc_distmem_dist_mem_gen_v8_0_synth : entity is "dist_mem_gen_v8_0_synth";
end crc_distmem_dist_mem_gen_v8_0_synth;

architecture STRUCTURE of crc_distmem_dist_mem_gen_v8_0_synth is
begin
\gen_rom.rom_inst\: entity work.\crc_distmem_rom__parameterized0\
    port map (
      a(7 downto 0) => a(7 downto 0),
      spo(6 downto 0) => spo(6 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \crc_distmem_dist_mem_gen_v8_0__parameterized0\ is
  port (
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    d : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 11 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 11 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 11 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is "dist_mem_gen_v8_0";
  attribute C_FAMILY : string;
  attribute C_FAMILY of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is "virtex7";
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 8;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 256;
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is "crc_distmem.mif";
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is "./";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 12;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ : entity is 1;
end \crc_distmem_dist_mem_gen_v8_0__parameterized0\;

architecture STRUCTURE of \crc_distmem_dist_mem_gen_v8_0__parameterized0\ is
  signal \<const0>\ : STD_LOGIC;
  signal \^a\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^spo\ : STD_LOGIC_VECTOR ( 11 downto 0 );
begin
  \^a\(7 downto 0) <= a(7 downto 0);
  dpo(11) <= \<const0>\;
  dpo(10) <= \<const0>\;
  dpo(9) <= \<const0>\;
  dpo(8) <= \<const0>\;
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qdpo(11) <= \<const0>\;
  qdpo(10) <= \<const0>\;
  qdpo(9) <= \<const0>\;
  qdpo(8) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(11) <= \<const0>\;
  qspo(10) <= \<const0>\;
  qspo(9) <= \<const0>\;
  qspo(8) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
  spo(11) <= \^spo\(11);
  spo(10 downto 9) <= \^a\(7 downto 6);
  spo(8 downto 2) <= \^spo\(8 downto 2);
  spo(1) <= \^a\(0);
  spo(0) <= \^spo\(0);
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
g1_b7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^a\(4),
      I1 => \^a\(6),
      O => \^spo\(7)
    );
g2_b8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^a\(5),
      I1 => \^a\(7),
      O => \^spo\(8)
    );
\synth_options.dist_mem_inst\: entity work.crc_distmem_dist_mem_gen_v8_0_synth
    port map (
      a(7 downto 0) => \^a\(7 downto 0),
      spo(6) => \^spo\(11),
      spo(5 downto 1) => \^spo\(6 downto 2),
      spo(0) => \^spo\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity crc_distmem is
  port (
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of crc_distmem : entity is true;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of crc_distmem : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of crc_distmem : entity is "dist_mem_gen_v8_0,Vivado 2014.2";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of crc_distmem : entity is "crc_distmem,dist_mem_gen_v8_0,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of crc_distmem : entity is "crc_distmem,dist_mem_gen_v8_0,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=dist_mem_gen,x_ipVersion=8.0,x_ipCoreRevision=5,x_ipLanguage=VHDL,C_FAMILY=virtex7,C_ADDR_WIDTH=8,C_DEFAULT_DATA=0,C_DEPTH=256,C_HAS_CLK=0,C_HAS_D=0,C_HAS_DPO=0,C_HAS_DPRA=0,C_HAS_I_CE=0,C_HAS_QDPO=0,C_HAS_QDPO_CE=0,C_HAS_QDPO_CLK=0,C_HAS_QDPO_RST=0,C_HAS_QDPO_SRST=0,C_HAS_QSPO=0,C_HAS_QSPO_CE=0,C_HAS_QSPO_RST=0,C_HAS_QSPO_SRST=0,C_HAS_SPO=1,C_HAS_WE=0,C_MEM_INIT_FILE=crc_distmem.mif,C_ELABORATION_DIR=./,C_MEM_TYPE=0,C_PIPELINE_STAGES=0,C_QCE_JOINED=0,C_QUALIFY_WE=0,C_READ_MIF=1,C_REG_A_D_INPUTS=0,C_REG_DPRA_INPUT=0,C_SYNC_ENABLE=1,C_WIDTH=12,C_PARSER_TYPE=1}";
end crc_distmem;

architecture STRUCTURE of crc_distmem is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "virtex7";
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of U0 : label is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of U0 : label is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of U0 : label is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute DONT_TOUCH : boolean;
  attribute DONT_TOUCH of U0 : label is std.standard.true;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 8;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 256;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_clk : integer;
  attribute c_has_clk of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "crc_distmem.mif";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 1;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 12;
begin
U0: entity work.\crc_distmem_dist_mem_gen_v8_0__parameterized0\
    port map (
      a(7 downto 0) => a(7 downto 0),
      clk => '0',
      d(11) => '0',
      d(10) => '0',
      d(9) => '0',
      d(8) => '0',
      d(7) => '0',
      d(6) => '0',
      d(5) => '0',
      d(4) => '0',
      d(3) => '0',
      d(2) => '0',
      d(1) => '0',
      d(0) => '0',
      dpo(11 downto 0) => NLW_U0_dpo_UNCONNECTED(11 downto 0),
      dpra(7) => '0',
      dpra(6) => '0',
      dpra(5) => '0',
      dpra(4) => '0',
      dpra(3) => '0',
      dpra(2) => '0',
      dpra(1) => '0',
      dpra(0) => '0',
      i_ce => '1',
      qdpo(11 downto 0) => NLW_U0_qdpo_UNCONNECTED(11 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(11 downto 0) => NLW_U0_qspo_UNCONNECTED(11 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(11 downto 0) => spo(11 downto 0),
      we => '0'
    );
end STRUCTURE;
