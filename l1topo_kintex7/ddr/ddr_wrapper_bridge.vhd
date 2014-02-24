--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:02:00 02/21/2014
-- Design Name:   
-- Module Name:   C:/Users/Grzegorz/SkyDrive/Atlas/kintx7_ipbus_ddr_ise/ddr_wrapper_bridge.vhd
-- Project Name:  kintx7_ipbus_ddr_ise
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ddr_links_wrapper
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
 
ENTITY ddr_wrapper_bridge IS
END ddr_wrapper_bridge;
 
ARCHITECTURE behavior OF ddr_wrapper_bridge IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ddr_links_wrapper
	 generic (
	DELAY_GROUP_NAME : string := "delay_group";
	AVAILABLE_LVDS_LINES : integer range 0 to 20 := 1;
	EXCLUDE_DCM_IDELAY_CTRL : boolean 
	
);
    PORT(
	GCLK_40_IN         : in std_logic; -- global buffer input
	EXT_DDR_CLK_IN     : in std_logic; -- external word clock (only if EXCLUDE... is true)
	EXT_DDR_CLK_X8_IN  : in std_logic; -- external word clock (only if EXCLUDE... is true)
	DELAY_CLK_IN       : in std_logic;
	RESET_IN           : in std_logic;
	
	LVDS_IN_P          : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	LVDS_IN_N          : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	
	LINKS_SYNCED_OUT   : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	RESET_TRANS_OUT    : out std_logic;
	
	DATA_OUT           : out std_logic_vector(AVAILABLE_LVDS_LINES * 8 - 1 downto 0);
	DATA_VALID_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal GCLK_40_IN : std_logic := '0';
   signal RESET_IN : std_logic := '0';
   signal LVDS_IN_P : std_logic_vector(3 downto 0) := (others => '0');
   signal LVDS_IN_N : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal LINKS_SYNCED_OUT : std_logic_vector(3 downto 0);
   signal DATA_OUT : std_logic_vector(4 * 8 - 1 downto 0);
   signal DATA_VALID_OUT : std_logic_vector(3 downto 0);
	
	signal tb_clk_400, delay_clk, tb_clk_80 : std_logic;
			    
   signal bit_ptr : integer range 0 to 9 := 0;
   signal data : std_logic_vector(9 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk40_period : time := 25 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ddr_links_wrapper 
	generic map(
				DELAY_GROUP_NAME     => "bleble",
				AVAILABLE_LVDS_LINES => 4,
				EXCLUDE_DCM_IDELAY_CTRL => TRUE
	)
	PORT MAP (
          GCLK_40_IN => GCLK_40_IN,
			 EXT_DDR_CLK_IN => tb_clk_80,
			 EXT_DDR_CLK_X8_IN => tb_clk_400,
			 DELAY_CLK_IN => delay_clk,
			 RESET_TRANS_OUT => open,
          RESET_IN => RESET_IN,
          LVDS_IN_P => LVDS_IN_P,
          LVDS_IN_N => LVDS_IN_N,
          LINKS_SYNCED_OUT => LINKS_SYNCED_OUT,
          DATA_OUT => DATA_OUT,
          DATA_VALID_OUT => DATA_VALID_OUT
        );

   -- Clock process definitions
   clk40_process :process
   begin
		GCLK_40_IN <= '0';
		wait for clk40_period/2;
		GCLK_40_IN <= '1';
		wait for clk40_period/2;
   end process;
	
	delay_clk_proc : process
	begin
		delay_clk <= '0';
		wait for 1666 ps;
		delay_clk <= '1';
		wait for 1666 ps;
	end process;
	
process
	begin
	tb_clk_400 <= '1'; wait for 1250 ps;
	tb_clk_400 <= '0'; wait for 1250 ps;
end process;

process
	begin
	tb_clk_80 <= '1'; wait for 6 ns;
	tb_clk_80 <= '0'; wait for 6 ns;
end process;

  LVDS_IN_N(0) <= not LVDS_IN_P(0);
  LVDS_IN_N(1) <= not LVDS_IN_P(1);
  LVDS_IN_N(2) <= not LVDS_IN_P(2);
  LVDS_IN_N(3) <= not LVDS_IN_P(3);
  
  process(tb_clk_400)
  begin
  	if tb_clk_400'event then
  		if (bit_ptr < 9) then
  			bit_ptr <= bit_ptr + 1;
  		else
  			bit_ptr <= 0;
  		end if;
  		
  		LVDS_IN_P(0) <= data(bit_ptr);
		LVDS_IN_P(1) <= data(bit_ptr);
		LVDS_IN_P(2) <= data(bit_ptr);
		LVDS_IN_P(3) <= data(bit_ptr);
  	end if;
  end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		data <= "00" & x"bc";
		RESET_IN <= '1';
      wait for 100 ns;	
		RESET_IN <= '0';
		
		
      wait for clk40_period*10;


		wait for 20 us;
		
		data <= (others => '0');
		
		wait for 1 us;
		
		data <= "00" & x"bc";
      -- insert stimulus here 

      wait;
   end process;

END;
