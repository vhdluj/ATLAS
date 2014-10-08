----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas Reiß (areiss@students.uni-mainz.de)
-- 
-- Create Date: 
-- Design Name: 
-- Module Name:
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Automatically generated with the Testbench Auto Generator
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: 
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.L1TopoDataTypes1Quad.all;

entity BER_Check_inter is
    Port (
	
	wordclock : in std_logic;
	rxdata : in std_logic_vector(31 downto 0);
	charisk : in std_logic_vector(3 downto 0);
	ber_reset : in std_logic;
	ber_errors : out std_logic_vector(31 downto 0)

	);
end BER_Check_inter;

architecture Behavioral of BER_Check_inter is



component BER_Check is
    port (
wordclock: in std_logic;
rxdata: in std_logic_vector(31 downto 0);
charisk: in std_logic_vector(3 downto 0);
ber_reset: in std_logic;
ber_errors: out std_logic_vector(31 downto 0)
);
end component BER_Check;

begin

BER_Check_i : BER_Check
    Port Map (
wordclock => wordclock,
rxdata => rxdata,
charisk => charisk,
ber_reset => ber_reset,
ber_errors => ber_errors
);



end Behavioral;
