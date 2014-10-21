-- Generic ipbus ram block for testing
--
-- generic addr_width defines number of significant address bits
--
-- In order to allow Xilinx block RAM to be inferred:
-- 	Reset does not clear the RAM contents (not implementable in Xilinx)
--		There is one cycle of latency on the read / write
--
-- Note that the synthesis tool should automatically infer block or distributed RAM
-- according to the size requested. It is likely that it will NOT choose
-- an efficient implementation in terms of area / speed / power, so don't use this
-- method to infer large RAMs (noting also that reads are enabled at all times).
-- It's best to use the block ram core generator explicitly.
--
-- Occupies addr_width bits of ipbus address space
-- This RAM cannot be used with 100% bus utilisation due to the wait state
--
-- Dave Newbold, March 2011
--
-- $Id: ipbus_ram.vhd 1201 2012-09-28 08:49:12Z phdmn $

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_slave_testram is
	generic(addr_width : positive);
	port(
		clk: in STD_LOGIC;
		reset: in STD_LOGIC;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus
	);
	
end ipbus_slave_testram;

architecture rtl of ipbus_slave_testram is

	attribute s: string;

	type reg_array is array(2**addr_width-1 downto 0) of std_logic_vector(31 downto 0);
	signal reg: reg_array;
	signal sel: integer;
	signal ack: std_logic;
	signal addr, addr_reg: unsigned(addr_width-1 downto 0);
	signal strobe_reg: std_logic;
	
	attribute s of ack: signal is "true";
	attribute s of addr: signal is "true";
	attribute s of addr_reg: signal is "true";
	
begin

	sel <= to_integer(unsigned(ipbus_in.ipb_addr(addr_width-1 downto 0)));

	process(clk)
	begin
		if rising_edge(clk) then
			addr <= unsigned(ipbus_in.ipb_addr(addr_width-1 downto 0));
			addr_reg <= addr;
			strobe_reg <= ipbus_in.ipb_strobe;
			
			if ipbus_in.ipb_strobe='1' and ipbus_in.ipb_write='1' then
				reg(sel) <= ipbus_in.ipb_wdata;
			end if;
			
			if ipbus_in.ipb_strobe='1' and not(addr = addr_reg and strobe_reg='1') then
				ack <= '1';
			else ack <= '0';
			end if;
			
			
			
		end if;
	end process;
	
	ipbus_out.ipb_rdata <= reg(sel);
	
	--ack <= '1' when (ipbus_in.ipb_strobe='1' and not(addr=addr_reg and strobe_reg='1')) else '0';
	ipbus_out.ipb_ack <= ack;
	


	ipbus_out.ipb_err <= '0';

end rtl;