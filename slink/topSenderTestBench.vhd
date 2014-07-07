--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:02:58 07/06/2014
-- Design Name:   
-- Module Name:   C:/Users/Paulek/Desktop/ProgramyPawel/XIL/ATLAS/hola_only_040714_slinkBuilder/topSenderTestBench.vhd
-- Project Name:  hola_only
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: topSender
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY topSenderTestBench IS
END topSenderTestBench;
 
ARCHITECTURE behavior OF topSenderTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT topSender
	 generic(
		SIMULATION : integer := 0
	 );
    PORT(
         LED_OUT : OUT  std_logic;
         gt_clkp : IN  std_logic;
         gt_clkn : IN  std_logic;
         SYSCLK_P : IN  std_logic;
         SYSCLK_N : IN  std_logic;
         PHY_RESET_N : IN  std_logic;
         SFP3_TXDIS : OUT  std_logic;
         SFP3_LOS : IN  std_logic;
         SFP3_RX_N : IN  std_logic;
         SFP3_RX_P : IN  std_logic;
         SFP3_TX_N : OUT  std_logic;
         SFP3_TX_P : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal gt_clkp : std_logic := '0';
   signal gt_clkn : std_logic := '0';
   signal SYSCLK_P : std_logic := '0';
   signal SYSCLK_N : std_logic := '0';
   signal PHY_RESET_N : std_logic := '0';
   signal SFP3_LOS : std_logic := '0';
   signal SFP3_RX_N : std_logic := '0';
   signal SFP3_RX_P : std_logic := '0';

 	--Outputs
   signal LED_OUT : std_logic;
   signal SFP3_TXDIS : std_logic;
   signal SFP3_TX_N : std_logic;
   signal SFP3_TX_P : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant SYSCLK_P_period : time := 25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: topSender 
	generic map(
		simulation => 1
	)
	PORT MAP (
          LED_OUT => LED_OUT,
          gt_clkp => gt_clkp,
          gt_clkn => gt_clkn,
          SYSCLK_P => SYSCLK_P,
          SYSCLK_N => SYSCLK_N,
          PHY_RESET_N => PHY_RESET_N,
          SFP3_TXDIS => SFP3_TXDIS,
          SFP3_LOS => SFP3_LOS,
          SFP3_RX_N => SFP3_RX_N,
          SFP3_RX_P => SFP3_RX_P,
          SFP3_TX_N => SFP3_TX_N,
          SFP3_TX_P => SFP3_TX_P
        );

   -- Clock process definitions
   SYSCLK_P_process :process
   begin
		SYSCLK_P <= '0';
		wait for SYSCLK_P_period/2;
		SYSCLK_P <= '1';
		wait for SYSCLK_P_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for SYSCLK_P_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
