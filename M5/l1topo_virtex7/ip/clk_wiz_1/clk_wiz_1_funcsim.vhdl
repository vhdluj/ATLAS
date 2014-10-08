-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (win64) Build 928826 Thu Jun  5 18:21:07 MDT 2014
-- Date        : Thu Jul 10 21:05:55 2014
-- Host        : WETAP137 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               D:/TP_P_F_690T/TopoQPLL_80GTs_v3.7_485Update/TopoGTH_QPLL_AV2.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_funcsim.vhdl
-- Design      : clk_wiz_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx485tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_1_clk_wiz_1_clk_wiz is
  port (
    LHCClkIn_p : in STD_LOGIC;
    LHCClkIn_n : in STD_LOGIC;
    SysClk40 : out STD_LOGIC;
    SysClk80 : out STD_LOGIC;
    SysClk160 : out STD_LOGIC;
    SysClk320 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of clk_wiz_1_clk_wiz_1_clk_wiz : entity is "clk_wiz_1_clk_wiz";
end clk_wiz_1_clk_wiz_1_clk_wiz;

architecture STRUCTURE of clk_wiz_1_clk_wiz_1_clk_wiz is
  signal CLKFBOUT : STD_LOGIC;
  signal CLKIN1 : STD_LOGIC;
  signal CLKOUT0 : STD_LOGIC;
  signal CLKOUT1 : STD_LOGIC;
  signal CLKOUT2 : STD_LOGIC;
  signal CLKOUT3 : STD_LOGIC;
  signal O : STD_LOGIC;
  signal \^locked\ : STD_LOGIC;
  signal n_0_clkout1_buf_en : STD_LOGIC;
  signal n_0_clkout2_buf_en : STD_LOGIC;
  signal n_0_clkout3_buf_en : STD_LOGIC;
  signal n_0_clkout4_buf_en : STD_LOGIC;
  signal seq_reg1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal seq_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal seq_reg3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal seq_reg4 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute box_type : string;
  attribute box_type of clkf_buf : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufgds : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufgds : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufgds : label is "AUTO";
  attribute box_type of clkin1_ibufgds : label is "PRIMITIVE";
  attribute CE_TYPE : string;
  attribute CE_TYPE of clkout1_buf : label is "SYNC";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of clkout1_buf : label is "BUFGCE";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of clkout1_buf : label is "CE:CE0 I:I0";
  attribute box_type of clkout1_buf : label is "PRIMITIVE";
  attribute box_type of clkout1_buf_en : label is "PRIMITIVE";
  attribute CE_TYPE of clkout2_buf : label is "SYNC";
  attribute XILINX_LEGACY_PRIM of clkout2_buf : label is "BUFGCE";
  attribute XILINX_TRANSFORM_PINMAP of clkout2_buf : label is "CE:CE0 I:I0";
  attribute box_type of clkout2_buf : label is "PRIMITIVE";
  attribute box_type of clkout2_buf_en : label is "PRIMITIVE";
  attribute CE_TYPE of clkout3_buf : label is "SYNC";
  attribute XILINX_LEGACY_PRIM of clkout3_buf : label is "BUFGCE";
  attribute XILINX_TRANSFORM_PINMAP of clkout3_buf : label is "CE:CE0 I:I0";
  attribute box_type of clkout3_buf : label is "PRIMITIVE";
  attribute box_type of clkout3_buf_en : label is "PRIMITIVE";
  attribute CE_TYPE of clkout4_buf : label is "SYNC";
  attribute XILINX_LEGACY_PRIM of clkout4_buf : label is "BUFGCE";
  attribute XILINX_TRANSFORM_PINMAP of clkout4_buf : label is "CE:CE0 I:I0";
  attribute box_type of clkout4_buf : label is "PRIMITIVE";
  attribute box_type of clkout4_buf_en : label is "PRIMITIVE";
  attribute box_type of mmcm_adv_inst : label is "PRIMITIVE";
  attribute KEEP : string;
  attribute KEEP of \seq_reg1_reg[0]\ : label is "yes";
  attribute KEEP of \seq_reg1_reg[1]\ : label is "yes";
  attribute KEEP of \seq_reg1_reg[2]\ : label is "yes";
  attribute KEEP of \seq_reg1_reg[3]\ : label is "yes";
  attribute KEEP of \seq_reg1_reg[4]\ : label is "yes";
  attribute KEEP of \seq_reg1_reg[5]\ : label is "yes";
  attribute KEEP of \seq_reg1_reg[6]\ : label is "yes";
  attribute KEEP of \seq_reg1_reg[7]\ : label is "yes";
  attribute KEEP of \seq_reg2_reg[0]\ : label is "yes";
  attribute KEEP of \seq_reg2_reg[1]\ : label is "yes";
  attribute KEEP of \seq_reg2_reg[2]\ : label is "yes";
  attribute KEEP of \seq_reg2_reg[3]\ : label is "yes";
  attribute KEEP of \seq_reg2_reg[4]\ : label is "yes";
  attribute KEEP of \seq_reg2_reg[5]\ : label is "yes";
  attribute KEEP of \seq_reg2_reg[6]\ : label is "yes";
  attribute KEEP of \seq_reg2_reg[7]\ : label is "yes";
  attribute KEEP of \seq_reg3_reg[0]\ : label is "yes";
  attribute KEEP of \seq_reg3_reg[1]\ : label is "yes";
  attribute KEEP of \seq_reg3_reg[2]\ : label is "yes";
  attribute KEEP of \seq_reg3_reg[3]\ : label is "yes";
  attribute KEEP of \seq_reg3_reg[4]\ : label is "yes";
  attribute KEEP of \seq_reg3_reg[5]\ : label is "yes";
  attribute KEEP of \seq_reg3_reg[6]\ : label is "yes";
  attribute KEEP of \seq_reg3_reg[7]\ : label is "yes";
  attribute KEEP of \seq_reg4_reg[0]\ : label is "yes";
  attribute KEEP of \seq_reg4_reg[1]\ : label is "yes";
  attribute KEEP of \seq_reg4_reg[2]\ : label is "yes";
  attribute KEEP of \seq_reg4_reg[3]\ : label is "yes";
  attribute KEEP of \seq_reg4_reg[4]\ : label is "yes";
  attribute KEEP of \seq_reg4_reg[5]\ : label is "yes";
  attribute KEEP of \seq_reg4_reg[6]\ : label is "yes";
  attribute KEEP of \seq_reg4_reg[7]\ : label is "yes";
begin
  locked <= \^locked\;
clkf_buf: unisim.vcomponents.BUFG
    port map (
      I => CLKFBOUT,
      O => O
    );
clkin1_ibufgds: unisim.vcomponents.IBUFDS
    generic map(
      DQS_BIAS => "FALSE",
      IOSTANDARD => "DEFAULT"
    )
    port map (
      I => LHCClkIn_p,
      IB => LHCClkIn_n,
      O => CLKIN1
    );
clkout1_buf: unisim.vcomponents.BUFGCTRL
    generic map(
      INIT_OUT => 0,
      PRESELECT_I0 => true,
      PRESELECT_I1 => false
    )
    port map (
      CE0 => seq_reg1(7),
      CE1 => '0',
      I0 => CLKOUT0,
      I1 => '1',
      IGNORE0 => '0',
      IGNORE1 => '1',
      O => SysClk40,
      S0 => '1',
      S1 => '0'
    );
clkout1_buf_en: unisim.vcomponents.BUFH
    port map (
      I => CLKOUT0,
      O => n_0_clkout1_buf_en
    );
clkout2_buf: unisim.vcomponents.BUFGCTRL
    generic map(
      INIT_OUT => 0,
      PRESELECT_I0 => true,
      PRESELECT_I1 => false
    )
    port map (
      CE0 => seq_reg2(7),
      CE1 => '0',
      I0 => CLKOUT1,
      I1 => '1',
      IGNORE0 => '0',
      IGNORE1 => '1',
      O => SysClk80,
      S0 => '1',
      S1 => '0'
    );
clkout2_buf_en: unisim.vcomponents.BUFH
    port map (
      I => CLKOUT1,
      O => n_0_clkout2_buf_en
    );
clkout3_buf: unisim.vcomponents.BUFGCTRL
    generic map(
      INIT_OUT => 0,
      PRESELECT_I0 => true,
      PRESELECT_I1 => false
    )
    port map (
      CE0 => seq_reg3(7),
      CE1 => '0',
      I0 => CLKOUT2,
      I1 => '1',
      IGNORE0 => '0',
      IGNORE1 => '1',
      O => SysClk160,
      S0 => '1',
      S1 => '0'
    );
clkout3_buf_en: unisim.vcomponents.BUFH
    port map (
      I => CLKOUT2,
      O => n_0_clkout3_buf_en
    );
clkout4_buf: unisim.vcomponents.BUFGCTRL
    generic map(
      INIT_OUT => 0,
      PRESELECT_I0 => true,
      PRESELECT_I1 => false
    )
    port map (
      CE0 => seq_reg4(7),
      CE1 => '0',
      I0 => CLKOUT3,
      I1 => '1',
      IGNORE0 => '0',
      IGNORE1 => '1',
      O => SysClk320,
      S0 => '1',
      S1 => '0'
    );
clkout4_buf_en: unisim.vcomponents.BUFH
    port map (
      I => CLKOUT3,
      O => n_0_clkout4_buf_en
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 24.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 24.950001,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 24.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 12,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 6,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 3,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.000000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
    port map (
      CLKFBIN => O,
      CLKFBOUT => CLKFBOUT,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => CLKIN1,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => CLKOUT0,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => CLKOUT1,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => CLKOUT2,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => CLKOUT3,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6) => '0',
      DADDR(5) => '0',
      DADDR(4) => '0',
      DADDR(3) => '0',
      DADDR(2) => '0',
      DADDR(1) => '0',
      DADDR(0) => '0',
      DCLK => '0',
      DEN => '0',
      DI(15) => '0',
      DI(14) => '0',
      DI(13) => '0',
      DI(12) => '0',
      DI(11) => '0',
      DI(10) => '0',
      DI(9) => '0',
      DI(8) => '0',
      DI(7) => '0',
      DI(6) => '0',
      DI(5) => '0',
      DI(4) => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => \^locked\,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => '0'
    );
\seq_reg1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout1_buf_en,
      CE => '1',
      D => \^locked\,
      Q => seq_reg1(0),
      R => '0'
    );
\seq_reg1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout1_buf_en,
      CE => '1',
      D => seq_reg1(0),
      Q => seq_reg1(1),
      R => '0'
    );
\seq_reg1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout1_buf_en,
      CE => '1',
      D => seq_reg1(1),
      Q => seq_reg1(2),
      R => '0'
    );
\seq_reg1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout1_buf_en,
      CE => '1',
      D => seq_reg1(2),
      Q => seq_reg1(3),
      R => '0'
    );
\seq_reg1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout1_buf_en,
      CE => '1',
      D => seq_reg1(3),
      Q => seq_reg1(4),
      R => '0'
    );
\seq_reg1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout1_buf_en,
      CE => '1',
      D => seq_reg1(4),
      Q => seq_reg1(5),
      R => '0'
    );
\seq_reg1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout1_buf_en,
      CE => '1',
      D => seq_reg1(5),
      Q => seq_reg1(6),
      R => '0'
    );
\seq_reg1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout1_buf_en,
      CE => '1',
      D => seq_reg1(6),
      Q => seq_reg1(7),
      R => '0'
    );
\seq_reg2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout2_buf_en,
      CE => '1',
      D => \^locked\,
      Q => seq_reg2(0),
      R => '0'
    );
\seq_reg2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout2_buf_en,
      CE => '1',
      D => seq_reg2(0),
      Q => seq_reg2(1),
      R => '0'
    );
\seq_reg2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout2_buf_en,
      CE => '1',
      D => seq_reg2(1),
      Q => seq_reg2(2),
      R => '0'
    );
\seq_reg2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout2_buf_en,
      CE => '1',
      D => seq_reg2(2),
      Q => seq_reg2(3),
      R => '0'
    );
\seq_reg2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout2_buf_en,
      CE => '1',
      D => seq_reg2(3),
      Q => seq_reg2(4),
      R => '0'
    );
\seq_reg2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout2_buf_en,
      CE => '1',
      D => seq_reg2(4),
      Q => seq_reg2(5),
      R => '0'
    );
\seq_reg2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout2_buf_en,
      CE => '1',
      D => seq_reg2(5),
      Q => seq_reg2(6),
      R => '0'
    );
\seq_reg2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout2_buf_en,
      CE => '1',
      D => seq_reg2(6),
      Q => seq_reg2(7),
      R => '0'
    );
\seq_reg3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout3_buf_en,
      CE => '1',
      D => \^locked\,
      Q => seq_reg3(0),
      R => '0'
    );
\seq_reg3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout3_buf_en,
      CE => '1',
      D => seq_reg3(0),
      Q => seq_reg3(1),
      R => '0'
    );
\seq_reg3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout3_buf_en,
      CE => '1',
      D => seq_reg3(1),
      Q => seq_reg3(2),
      R => '0'
    );
\seq_reg3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout3_buf_en,
      CE => '1',
      D => seq_reg3(2),
      Q => seq_reg3(3),
      R => '0'
    );
\seq_reg3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout3_buf_en,
      CE => '1',
      D => seq_reg3(3),
      Q => seq_reg3(4),
      R => '0'
    );
\seq_reg3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout3_buf_en,
      CE => '1',
      D => seq_reg3(4),
      Q => seq_reg3(5),
      R => '0'
    );
\seq_reg3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout3_buf_en,
      CE => '1',
      D => seq_reg3(5),
      Q => seq_reg3(6),
      R => '0'
    );
\seq_reg3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout3_buf_en,
      CE => '1',
      D => seq_reg3(6),
      Q => seq_reg3(7),
      R => '0'
    );
\seq_reg4_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout4_buf_en,
      CE => '1',
      D => \^locked\,
      Q => seq_reg4(0),
      R => '0'
    );
\seq_reg4_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout4_buf_en,
      CE => '1',
      D => seq_reg4(0),
      Q => seq_reg4(1),
      R => '0'
    );
\seq_reg4_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout4_buf_en,
      CE => '1',
      D => seq_reg4(1),
      Q => seq_reg4(2),
      R => '0'
    );
\seq_reg4_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout4_buf_en,
      CE => '1',
      D => seq_reg4(2),
      Q => seq_reg4(3),
      R => '0'
    );
\seq_reg4_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout4_buf_en,
      CE => '1',
      D => seq_reg4(3),
      Q => seq_reg4(4),
      R => '0'
    );
\seq_reg4_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout4_buf_en,
      CE => '1',
      D => seq_reg4(4),
      Q => seq_reg4(5),
      R => '0'
    );
\seq_reg4_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout4_buf_en,
      CE => '1',
      D => seq_reg4(5),
      Q => seq_reg4(6),
      R => '0'
    );
\seq_reg4_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => n_0_clkout4_buf_en,
      CE => '1',
      D => seq_reg4(6),
      Q => seq_reg4(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity clk_wiz_1 is
  port (
    LHCClkIn_p : in STD_LOGIC;
    LHCClkIn_n : in STD_LOGIC;
    SysClk40 : out STD_LOGIC;
    SysClk80 : out STD_LOGIC;
    SysClk160 : out STD_LOGIC;
    SysClk320 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of clk_wiz_1 : entity is true;
  attribute core_generation_info : string;
  attribute core_generation_info of clk_wiz_1 : entity is "clk_wiz_1,clk_wiz_v5_1,{component_name=clk_wiz_1,use_phase_alignment=true,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=4,clkin1_period=24.95,clkin2_period=10.0,use_power_down=false,use_reset=false,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}";
end clk_wiz_1;

architecture STRUCTURE of clk_wiz_1 is
begin
U0: entity work.clk_wiz_1_clk_wiz_1_clk_wiz
    port map (
      LHCClkIn_n => LHCClkIn_n,
      LHCClkIn_p => LHCClkIn_p,
      SysClk160 => SysClk160,
      SysClk320 => SysClk320,
      SysClk40 => SysClk40,
      SysClk80 => SysClk80,
      locked => locked
    );
end STRUCTURE;
