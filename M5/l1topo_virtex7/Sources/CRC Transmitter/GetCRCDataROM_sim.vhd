----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2014 11:58:50
-- Design Name: 
-- Module Name: simulation01 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GetCRCDataROM_sim is
end GetCRCDataROM_sim;

architecture behavioral of GetCRCDataROM_sim is

constant BC_TIME : time := 25 ns;

signal data32    : std_logic_vector(31 downto 0);
signal char_flag : std_logic_vector(3 downto 0);
signal regDelay  : std_logic_vector(1 downto 0) := "00";

signal clockBus : std_logic_vector(3 downto 0) := ("0000");

signal data128_out         : std_logic_vector(127 downto 0);
--signal chariskIn_sim       : std_logic_vector(3 downto 0);
signal chariskOut_sim      : std_logic_vector(15 downto 0);
signal CrcErrorOut_sim     : std_logic;
signal ShiftRegDelayIn_sim : std_logic_vector(4 downto 0) := "00010";--"00011" data
    

begin
    uut : entity work.GetCRCDataROM
    	Port map(clockBus      => clockBus,
    		     data32_out      => data32,
    		     char_flag_out => char_flag
    	);
  
    	
	uut2 : entity work.DeserializerCrc
		Port Map(GtRxData          => data32,
			     Data128         => data128_out,
			     ChariskIn       => char_flag,
			     ChariskOut      => chariskOut_sim,
			     shift_reg_delay => ShiftRegDelayIn_sim,
			     CrcError     => CrcErrorOut_sim,
			     clockBus         => clockBus
		);

	-- clocks
	clk40_process : process
	begin
		clockBus(0) <= not clockBus(0);
		wait for BC_TIME / 2;
	end process;

	clk80_process : process
	begin
		clockBus(1) <= not clockBus(1);
		wait for BC_TIME / 4;
	end process;

	clk160_process : process
	begin
		clockBus(2) <= not clockBus(2);
		wait for BC_TIME / 8;
	end process;
	
	clk320_process : process
	begin
		clockBus(3) <= not clockBus(3);
		wait for BC_TIME / 16;
	end process;
    
    sim_process:process
    begin

        wait for 2*BC_TIME;
        --assert (out1='0') report "test failed for a=0, b=0";
        
        --in1 <= "011";
        --in2 <= "110";
        --wait for 5ns;
        
        --in1 <= "010";
        --in2 <= "110";
        --wait for 5ns;
        
        wait;
    end process;

end;