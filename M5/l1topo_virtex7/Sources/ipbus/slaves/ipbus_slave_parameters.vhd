----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.07.2014 16:09:16
-- Design Name: 
-- Module Name: ipbus_slave_parameters - Behavioral
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
use ieee.numeric_std.all;
USE ieee.math_real.log2;
USE ieee.math_real.ceil;

use work.ipbus.all;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;
use work.parameter_map.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ipbus_slave_parameters is port(
       clk : in std_logic;
       ipbus_in : in ipb_wbus;
       ipbus_out : out ipb_rbus;
       SortParameters : out ParameterSpace(NumberOfSortAlgorithms - 1 downto 0);
       AlgoParameters : out ParameterSpace(NumberOfAlgorithms - 1 downto 0);
       
       debug: out std_logic_vector(127 downto 0)
    );
    
end ipbus_slave_parameters;



architecture Behavioral of ipbus_slave_parameters is

    constant addr_width: integer := INTEGER(CEIL(LOG2(REAL(NumberOfParameters))));

	signal reg: ParameterRegisters;
	signal sel: integer;
	signal ack: std_logic;

    signal SortParameters_int : ParameterSpace(NumberOfSortAlgorithms - 1 downto 0);
    signal AlgoParameters_int : ParameterSpace(NumberOfAlgorithms - 1 downto 0);

begin


    sel <= to_integer(unsigned(ipbus_in.ipb_addr(addr_width - 1 downto 0))) when addr_width > 0 else 0;


    process(clk)
	begin
		if rising_edge(clk) then
			if ipbus_in.ipb_strobe='1' and ipbus_in.ipb_write='1' then
				reg(sel) <= ipbus_in.ipb_wdata;
			end if;

			ipbus_out.ipb_rdata <= reg(sel);
			
			ack <= ipbus_in.ipb_strobe and not ack;

		end if;
	end process;
	
	ipbus_out.ipb_ack <= ack;
	ipbus_out.ipb_err <= '0';


   SortParameters_int <= SortParameterMapper(reg);
   AlgoParameters_int <= AlgoParameterMapper(reg);
   
   SortParameters <= SortParameters_int;
   AlgoParameters <= AlgoParameters_int;
    
   debug(31 downto 0) <= SortParameters_int(0)(1);
   debug(63 downto 32) <= SortParameters_int(0)(2);
   debug(95 downto 64) <= AlgoParameters_int(1)(1);
   debug(127 downto 96) <= AlgoParameters_int(1)(2);
end Behavioral;
