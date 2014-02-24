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

entity crc is 
   port ( data_in : in std_logic_vector (7 downto 0);
     crc_en , rst, clk : in std_logic;
     data_out : out std_logic_vector (7 downto 0);
     enable_out: out std_logic);
end crc;

architecture imp_crc of crc is 
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


     process (clk,rst,crc_en,reset_internal) begin 
       if (rst = '1' or reset_internal = '1') then 
         lfsr_q <= b"11111111";
         
       elsif (clk'EVENT and clk = '1') then 
         if (crc_en = '1') then 
           lfsr_q <= lfsr_c; 
           crc_enHolder <= '1';
           else
           crc_enHolder <= '0';
           lfsr_q<=lfsr_q;
         end if; 
       end if; 
     end process;
     
     En_out: process(crc_en,crc_en,crc_enHolder,rst,clk) 
     begin
     --if rising_edge (clk) then
     		if(rst = '1') then
     			enable_out <= '0';
     		else
	     		if(crc_en = '1'or (crc_en = '0' and crc_enHolder ='1') ) then--
	     			enable_out <= '1';
	     		else
	     			enable_out  <=  '0';
	     		end if;
     		end if;
     --end if;		 
     end process;
     
--     CRC_append: process(crc_en,crc_enHolder,data_in)
--     begin
--    -- if rising_edge(clk)then
--     	if(crc_en ='0' and crc_enHolder ='1')then
--     	data_out <= lfsr_q;
--     	else
--     	data_out <= data_in;
--     	end if;
--    -- end if;	 
--     end process;
     
         
     CRC_append: process(crc_en,crc_enHolder,data_in,lfsr_q)
     begin
    -- if rising_edge(clk)then
     	if(crc_en ='0' and crc_enHolder ='1')then
     	data_out <= lfsr_q;
     	elsif crc_en = '1' then
     	data_out <= data_in;
		else
		data_out <= x"1c";
     	end if;
    -- end if;	 
     end process;
	  
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
