-- Address decode logic for ipbus fabric
--
-- This file has been AUTOGENERATED from the address table - do not hand edit
--
-- We assume the synthesis tool is clever enough to recognise exclusive conditions
-- in the if statement.
--
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.ipbus.all;

package ipbus_addr_decode is

  function ipbus_addr_sel(signal addr : in std_logic_vector(31 downto 0)) return integer;

end ipbus_addr_decode;

package body ipbus_addr_decode is
  
  function ipbus_addr_sel(signal addr : in std_logic_vector(31 downto 0)) return integer is
    variable sel : integer;
  begin
                -- START automatically  generated VHDL the Tue Jan 21 22:26:41 2014 
		if    std_match(addr, "------------------00--------0001") then
			sel := 0; -- ctrlbus_error_counter / base 0x00000001 / mask 0x0000101e
		elsif std_match(addr, "------------------00--------1000") then
            sel := 2; -- playbackspy_control / base 0x00000008 / mask 0x0000101e
        elsif std_match(addr, "------------------00--------1001") then
            sel := 3; -- dataToPlaybackOnInput_charIsK / base 0x00000009 / mask 0x0000101e
		elsif std_match(addr, "------------------01------------") then
            sel := 4; -- playbackspyOnInput / base 0x00001000 / mask 0x0000101e
		elsif std_match(addr, "------------------00--------1011") then
            sel := 5; -- spiedDataOfInput_charIsK / base 0x0000000b / mask 0x0000101e
            
		elsif std_match(addr, "------------------00--------0010") then
            sel := 6; -- U1_idelay_counter_0 / base 0x00000002 / mask 0x0000101e
        elsif std_match(addr, "------------------00--------0011") then
            sel := 7; -- U1_idelay_counter_1 / base 0x00000003 / mask 0x0000101e
		elsif std_match(addr, "------------------00--------0100") then
            sel := 8; -- U1_idelay_counter_2 / base 0x00000004 / mask 0x0000101e
		elsif std_match(addr, "------------------00--------0101") then
            sel := 9; -- U1_idelay_counter_3 / base 0x00000005 / mask 0x0000101e
        elsif std_match(addr, "------------------00--------0110") then
            sel := 10; -- U1_idelay_counter_4 / base 0x00000006 / mask 0x0000101e
		elsif std_match(addr, "------------------10------------") then
			sel := 1; -- RAM / base 0x00002000 / mask 0x0000101e
		-- END automatic generated VHDL

                else
                        sel := 99;
                end if;
                return sel;
  end ipbus_addr_sel;
                
end ipbus_addr_decode;

