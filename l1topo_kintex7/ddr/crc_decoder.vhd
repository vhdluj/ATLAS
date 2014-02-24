-------------------------------------------------------------------------------
-- Copyright (C) 2009 OutputLogic.com 
-- This source file may be used and distributed without restriction 
-- provided that this copyright statement is not removed from the file 
-- and that any derivative work contains the original copyright notice 
-- and the associated disclaimer. 
 -- 
-- THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS 
-- OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED 
-- WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE. 
-------------------------------------------------------------------------------
-- CRC module for data(7:0)
 --   lfsr(7:0)=1+x^1+x^2+x^3+x^8;
-------------------------------------------------------------------------------
 library ieee; 
use ieee.std_logic_1164.all;

entity crcDecoder is 
   port ( data_in : in std_logic_vector (7 downto 0);
     crc_en , rst, clk : in std_logic;
     data_out : out std_logic_vector (7 downto 0);
     crcOK : out std_logic
     );
end crcDecoder;

architecture imp_crc of crcDecoder is 
   signal lfsr_q: std_logic_vector (7 downto 0); 
   signal lfsr_c: std_logic_vector (7 downto 0); 
   signal crc_enHolder, reset_internal: std_logic := '0';
 begin 
    -- data_out <= lfsr_q;

     lfsr_c(0) <= lfsr_q(0) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor data_in(0) xor data_in(5) xor data_in(6) xor data_in(7);
     lfsr_c(1) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(5) xor data_in(0) xor data_in(1) xor data_in(5);
     lfsr_c(2) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(5) xor lfsr_q(7) xor data_in(0) xor data_in(1) xor data_in(2) xor data_in(5) xor data_in(7);
     lfsr_c(3) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(5) xor lfsr_q(7) xor data_in(0) xor data_in(1) xor data_in(2) xor data_in(3) xor data_in(5) xor data_in(7);
     lfsr_c(4) <= lfsr_q(1) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(6) xor data_in(1) xor data_in(2) xor data_in(3) xor data_in(4) xor data_in(6);
     lfsr_c(5) <= lfsr_q(2) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(7) xor data_in(2) xor data_in(3) xor data_in(4) xor data_in(5) xor data_in(7);
     lfsr_c(6) <= lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor data_in(3) xor data_in(4) xor data_in(5) xor data_in(6);
     lfsr_c(7) <= lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor data_in(4) xor data_in(5) xor data_in(6) xor data_in(7);


     CRC_processing: process (clk,rst,crc_en) begin 
       if (rst = '1' or reset_internal = '1') then 
         lfsr_q <= b"11111111";
         
       elsif (clk'EVENT and clk = '1') then 
         if (crc_en = '1' or crc_enHolder = '1') then 
           lfsr_q <= lfsr_c; 
           else
           lfsr_q<=lfsr_q;
         end if; 
       end if; 
     end process;	
 
	EnableHolder : process (clk) is
	begin
		if rising_edge(clk) then
			if rst = '1' then
				crc_enHolder  <= '0';
			else
				crc_enHolder <= crc_en;
			end if;
		end if;
	end process EnableHolder;

  --_____________________________________________________________________________________  
     CRC_correct: process(crc_en,crc_enHolder,data_in)
     begin
     	if(crc_en ='0' and crc_enHolder ='1' and lfsr_q = "00000000" )then
     		crcOK <= '1';
     	else
     		crcOK <= '0';
     	end if;	 
     end process;
   --_____________________________________________________________________________________      
     DataForwarding : process (clk, rst) is
     begin
--		if(crc_en ='1') then
--			data_out<=data_in;
--			else
--			data_out <= (others => '1');
--		end if;
		data_out <= data_in;
     end process DataForwarding;
     
	  process(clk)
	  begin
		if rising_edge(clk) then
			if (crc_en ='0' and crc_enHolder ='1') then
				reset_internal <= '1';
			else
				reset_internal <= '0';
			end if;
		end if;
		end process;
     
          
 end architecture imp_crc;
