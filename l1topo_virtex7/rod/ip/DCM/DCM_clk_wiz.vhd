-- file: DCM_clk_wiz.vhd
-- 
-- (c) Copyright 2008 - 2013 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
------------------------------------------------------------------------------
-- User entered comments
------------------------------------------------------------------------------
-- None
--
------------------------------------------------------------------------------
--  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
--   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
------------------------------------------------------------------------------
-- CLK_OUT1____40.000______0.000______50.0______112.895____121.972
-- CLK_OUT2____90.000______0.000______50.0______101.866____121.972
-- CLK_OUT3___450.000______0.000______50.0_______84.208____121.972
--
------------------------------------------------------------------------------
-- Input Clock   Freq (MHz)    Input Jitter (UI)
------------------------------------------------------------------------------
-- __primary__________40.000____________0.010

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity DCM_clk_wiz is
port
 (-- Clock in ports
  clk_in1_p         : in     std_logic;
  clk_in1_n         : in     std_logic;
  -- Clock out ports
  clk_40          : out    std_logic;
  clk_90          : out    std_logic;
  clk_450          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic
 );
end DCM_clk_wiz;

architecture xilinx of DCM_clk_wiz is
  -- Input clock buffering / unused connectors
  signal clk_in1_DCM      : std_logic;
  -- Output clock buffering / unused connectors
  signal clkfbout_DCM         : std_logic;
  signal clkfbout_buf_DCM     : std_logic;
  signal clkfboutb_unused : std_logic;
  signal clk_40_DCM          : std_logic;
  signal clkout0b_unused  : std_logic;
  signal clk_90_DCM          : std_logic;
  signal clkout1b_unused  : std_logic;
  signal clk_450_DCM          : std_logic;
  signal clkout2b_unused  : std_logic;
  signal clkout3_unused   : std_logic;
  signal clkout3b_unused  : std_logic;
  signal clkout4_unused   : std_logic;
  signal clkout5_unused   : std_logic;
  signal clkout6_unused   : std_logic;
  -- Dynamic programming unused signals
  signal do_unused        : std_logic_vector(15 downto 0);
  signal drdy_unused      : std_logic;
  -- Dynamic phase shift unused signals
  signal psdone_unused    : std_logic;
  signal locked_int : std_logic;
  -- Unused status signals
  signal clkfbstopped_unused : std_logic;
  signal clkinstopped_unused : std_logic;
  signal reset_high   : std_logic;

begin


  -- Input buffering
  --------------------------------------
  clkin1_ibufgds : IBUFGDS
  port map
   (O  => clk_in1_DCM,
    I  => clk_in1_p,
    IB => clk_in1_n);



  -- Clocking PRIMITIVE
  --------------------------------------
  -- Instantiation of the MMCM PRIMITIVE
  --    * Unused inputs are tied off
  --    * Unused outputs are labeled unused
  plle2_adv_inst : PLLE2_ADV
  generic map
   (BANDWIDTH            => "HIGH",
    COMPENSATION         => "ZHOLD",
    DIVCLK_DIVIDE        => 1,
    CLKFBOUT_MULT        => 45,
    CLKFBOUT_PHASE       => 0.000,
    CLKOUT0_DIVIDE       => 45,
    CLKOUT0_PHASE        => 0.000,
    CLKOUT0_DUTY_CYCLE   => 0.500,
    CLKOUT1_DIVIDE       => 20,
    CLKOUT1_PHASE        => 0.000,
    CLKOUT1_DUTY_CYCLE   => 0.500,
    CLKOUT2_DIVIDE       => 4,
    CLKOUT2_PHASE        => 0.000,
    CLKOUT2_DUTY_CYCLE   => 0.500,
    CLKIN1_PERIOD        => 25.0,
    REF_JITTER1          => 0.010)
  port map
    -- Output clocks
   (CLKFBOUT            => clkfbout_DCM,
    CLKOUT0             => clk_40_DCM,
    CLKOUT1             => clk_90_DCM,
    CLKOUT2             => clk_450_DCM,
    CLKOUT3             => clkout3_unused,
    CLKOUT4             => clkout4_unused,
    CLKOUT5             => clkout5_unused,
    -- Input clock control
    CLKFBIN             => clkfbout_buf_DCM,
    CLKIN1              => clk_in1_DCM,
    CLKIN2              => '0',
    -- Tied to always select the primary input clock
    CLKINSEL            => '1',
    -- Ports for dynamic reconfiguration
    DADDR               => (others => '0'),
    DCLK                => '0',
    DEN                 => '0',
    DI                  => (others => '0'),
    DO                  => do_unused,
    DRDY                => drdy_unused,
    DWE                 => '0',
    -- Other control and status signals
    LOCKED              => locked_int,
    PWRDWN              => '0',
    RST                 => reset_high);

  reset_high <= reset; 
  locked <= locked_int;

  -- Output buffering
  -------------------------------------

  clkf_buf : BUFG
  port map
   (O => clkfbout_buf_DCM,
    I => clkfbout_DCM);



  clkout1_buf : BUFG
  port map
   (O   => clk_40,
    I   => clk_40_DCM);



  clkout2_buf : BUFG
  port map
   (O   => clk_90,
    I   => clk_90_DCM);

  clkout3_buf : BUFG
  port map
   (O   => clk_450,
    I   => clk_450_DCM);

end xilinx;
