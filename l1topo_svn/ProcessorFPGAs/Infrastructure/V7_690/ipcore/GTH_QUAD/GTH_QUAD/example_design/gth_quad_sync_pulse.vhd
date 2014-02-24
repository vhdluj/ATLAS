--////////////////////////////////////////////////////////////////////////////////
--//   ____  ____ 
--//  /   /\/   / 
--// /___/  \  /    Vendor: Xilinx 
--// \   \   \/     Version : 2.6
--//  \   \         Application : 7 Series FPGAs Transceivers Wizard 
--//  /   /         Filename : gth_quad_sync_pulse.vhd
--// /___/   /\     
--// \   \  /  \ 
--//  \___\/\___\ 
--//
--//
--
-- Description: Used on signals crossing from faster clock domain 
--                     
--
-- Module GTH_QUAD_sync_pulse
-- Generated by Xilinx 7 Series FPGAs Transceivers Wizard
-- 
-- 
-- (c) Copyright 2010-2012 Xilinx, Inc. All rights reserved.
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





library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity gth_quad_sync_pulse is     
  Generic( 
           C_NUM_SRETCH_REGS                  : integer  := 3;
           C_NUM_SYNC_REGS                    : integer  := 3
         );     

    Port ( 
  -- Clock and Reset
           CLK          : in  STD_LOGIC;             
  -- User Interface
           USER_DONE    : out STD_LOGIC := '0';     
  -- GT Interface
           GT_DONE      : in  STD_LOGIC              
           
           );
end gth_quad_sync_pulse;

architecture RTL of gth_quad_sync_pulse is

-- ---------------------------------------------------------------------------
-- Wire and Register Declaration
-- ---------------------------------------------------------------------------
signal stretch_r : std_logic_vector (C_NUM_SRETCH_REGS-1 downto 0):= (others=>'0');
signal sync1_r   : std_logic_vector (C_NUM_SYNC_REGS-1 downto 0):= (others=>'0');
signal sync2_r   : std_logic_vector (C_NUM_SYNC_REGS-1 downto 0):= (others=>'0');

  -- These attributes will stop Vivado translating the desired flip-flops into an
  -- SRL based shift register.
  attribute ASYNC_REG                       : string;
  attribute ASYNC_REG of sync1_r            : signal is "TRUE";
  attribute ASYNC_REG of sync2_r            : signal is "TRUE";

 -- These attributes will stop XST translating the desired flip-flops into an
  -- SRL based shift register.
  attribute shreg_extract                   : string;
  attribute shreg_extract of sync1_r        : signal is "no";
  attribute shreg_extract of sync2_r        : signal is "no";


begin
------------------------------------------------------------------------------
-- Stretch GT_DONE Signal
------------------------------------------------------------------------------
     process (CLK,GT_DONE)
      begin
         if (GT_DONE = '0') then
           stretch_r <= (others=>'0');
         elsif (CLK'event and CLK = '1') then
           stretch_r <= ('1' & stretch_r(C_NUM_SRETCH_REGS-1 downto 1));
       end if;
      end process;     

------------------------------------------------------------------------------
-- Synchronizers
------------------------------------------------------------------------------
     process (CLK)
      begin
         if (CLK'event and CLK = '1') then
           sync1_r <= (stretch_r(0) & sync1_r(C_NUM_SYNC_REGS-1 downto 1));
         end if;
      end process;     

     process (CLK)
      begin
         if (CLK'event and CLK = '1') then
           sync2_r <= (GT_DONE & sync2_r(C_NUM_SYNC_REGS-1 downto 1));
         end if;
      end process;     

------------------------------------------------------------------------------
-- Final Flop Stage with AND of both synchronizers - keeps USER_DONE low 
-- when input is low for many cycles...
------------------------------------------------------------------------------
     process (CLK)
      begin
         if (CLK'event and CLK = '1') then
           USER_DONE <= sync1_r(0) and sync2_r(0);
         end if;
      end process;     

end RTL;


