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
                -- START automatically  generated VHDL the Fri Jul 11 01:46:31 2014 
		if    std_match(addr, "00-----------------0-------00000") then
			sel := 0; -- Module_Number / base 0x00000000 / mask 0xc000101f
		elsif std_match(addr, "00-----------------0-------00001") then
			sel := 1; -- Firmware_Version / base 0x00000001 / mask 0xc000101f
		elsif std_match(addr, "00-----------------0-------00010") then
			sel := 2; -- General_Status / base 0x00000002 / mask 0xc000101f
		elsif std_match(addr, "00-----------------0-------00100") then
			sel := 3; -- General_Control / base 0x00000004 / mask 0xc000101f
		elsif std_match(addr, "00-----------------0-------01000") then
			sel := 4; -- TTC_Serializer_Control / base 0x00000008 / mask 0xc000101f
		elsif std_match(addr, "00-----------------1------------") then
			sel := 5; -- TestRAM / base 0x00001000 / mask 0xc000101f
		elsif std_match(addr, "00-----------------0-------10000") then
			sel := 6; -- ipbBridge_idelayValue / base 0x00000010 / mask 0xc000101f
		elsif std_match(addr, "00-----------------0-------10010") then
			sel := 7; -- ipbBridgeIDelayCurrentValue_64bit / base 0x00000012 / mask 0xc000101f
		elsif std_match(addr, "00-----------------0-------10100") then
			sel := 8; -- ipbBridgeErrorCounter_64bit / base 0x00000014 / mask 0xc000101f
		elsif std_match(addr, "00-----------------0-------01110") then
			sel := 9; -- ipbBridgeErrorCounterReset_32bit / base 0x00000016 / mask 0xc000101f
		
		elsif std_match(addr, "10------------------------------") then
			sel := 10; -- ProcessorU1 / base 0x80000000 / mask 0xc000101f
		elsif std_match(addr, "11------------------------------") then
			sel := 11; -- ProcessorU2 / base 0xc0000000 / mask 0xc000101f
		-- END automatic generated VHDL

                else
                        sel := 99;
                end if;
                return sel;
  end ipbus_addr_sel;
                
end ipbus_addr_decode;
