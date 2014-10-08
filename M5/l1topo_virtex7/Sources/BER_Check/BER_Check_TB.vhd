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

library std;
use std.textio.all;

entity BER_Check_TB is
end BER_Check_TB;

architecture Behavioral of BER_Check_TB is

	signal TimeElapsed: time:= 0 ps;
	constant clk_period_1 : time := 6.25 ns;

	signal wordclock : std_logic;
	signal rxdata : std_logic_vector(31 downto 0);
	signal charisk : std_logic_vector(3 downto 0);
	signal ber_reset : std_logic;
	signal ber_errors : std_logic_vector(31 downto 0);

component BER_Check_inter is
    Port (
	
	wordclock : in std_logic;
	rxdata : in std_logic_vector(31 downto 0);
	charisk : in std_logic_vector(3 downto 0);
	ber_reset : in std_logic;
	ber_errors : out std_logic_vector(31 downto 0)

	);
end component;

begin

	P_Time_Elapsed : process
	begin
		wait for clk_period_1/2;
		TimeElapsed <= TimeElapsed + clk_period_1/2;
		wait for clk_period_1/2;
		TimeElapsed <= TimeElapsed + clk_period_1/2;
	end process;

	P_Clock_1 : process
	begin
		wordclock<='1';
		wait for clk_period_1/2;
		wordclock<='0';
		wait for clk_period_1/2;
	end process;


	P_ReadInputFromFile : process 
		file file_pointer : text;
		variable line_content : string(1 to 39);
		variable line_num : line;
		variable j : integer := 0;
		variable char : character:='0'; 
    begin
		file_open(file_pointer,"D:\GTHFirstSteps\TopoGTH_QPLL_AV2_Multi24MGTs_v3_works_butBERproblem\Sources\input.txt",READ_MODE);--Open the file from the specified location for reading(READ_MODE).    
		while not endfile(file_pointer) loop --till the end of file is reached continue.
			wait until wordclock'event and wordclock='1';--clock trigger
			readline (file_pointer,line_num);  --Read the whole line from the file
			READ (line_num,line_content);--Read the contents of the line from the file into a variable.
			for j in 32 downto 1 loop        
				char := line_content(33-j);
				if(char = '0') then
					rxdata(j-1) <= '0';
				else
					rxdata(j-1) <= '1';
				end if; 
			end loop;
			for j in 37 downto 34 loop        
				char := line_content(71-j);
				if(char = '0') then
					charisk(j-34) <= '0';
				else
					charisk(j-34) <= '1';
				end if; 
			end loop;      
			char := line_content(39);
			if(char = '0') then
				ber_reset <= '0';
			else
				ber_reset <= '1';
			end if;
		end loop;
		file_close(file_pointer);  --after reading all the lines close the file.  
		wait;
	end process;

	P_WriteOutputToFile : process
   		file file_pointer : text;
   		variable line_num : line;
   		variable i : integer := 0;
       begin
   		--Open the file output.txt from the specified location for writing(WRITE_MODE).
   		file_open(file_pointer,"D:\GTHFirstSteps\TopoGTH_QPLL_AV2_Multi24MGTs_v3_works_butBERproblem\Sources\output.txt",WRITE_MODE);      
   		for i in 1 to 100 loop 
   			wait until wordclock'event and wordclock='1';--clock trigger
   			write(line_num,TimeElapsed); --write time at the beginning of the line
   
			write(line_num,character(';'));
			write(line_num,to_bitvector(ber_errors));
   			writeline (file_pointer,line_num); --write the contents into the file.
   		end loop;
   		file_close(file_pointer); --Close the file after writing.
   		wait;
        end process;

	BER_Check_inter_i : BER_Check_inter
	    Port Map (
		wordclock => wordclock,
		rxdata => rxdata,
		charisk => charisk,
		ber_reset => ber_reset,
		ber_errors => ber_errors
		);

end Behavioral;
