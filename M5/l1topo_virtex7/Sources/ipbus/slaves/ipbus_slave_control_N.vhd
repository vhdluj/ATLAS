-- original filename ipbus_ctrlreg.vhd

-- Generic control / status register block
--
-- Provides 2**n control registers (32b each), rw
-- Provides 2**m status registers (32b each), ro
--
-- Bottom part of read address space is control, top is status
--
-- Useful for misc control of firmware block
-- Unused registers should be optimised away
--
-- Dave Newbold, July 2012

-- status registers cut out for pure control register block
-- Christian Kahra, September 2013


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.L1TopoFunctions.all;

entity ipbus_slave_control_N is
	generic(
		numberOfRegisters : natural := 1
	);
	port(
		clk: in std_logic;
		reset: in std_logic;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus;
		q: out std_logic_vector(numberOfRegisters * 32 - 1 downto 0)
	);
	
end ipbus_slave_control_N;

architecture rtl of ipbus_slave_control_N is

	type reg_array is array(numberOfRegisters - 1 downto 0) of std_logic_vector(31 downto 0);
	signal reg: reg_array;
	signal ctrl_sel: integer;
	signal ack: std_logic;

begin

	ctrl_sel <= to_integer(unsigned(ipbus_in.ipb_addr(ld(numberOfRegisters) - 1 downto 0))) when numberOfRegisters > 1 else 0;

	process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				reg <= (others=>(others=>'0'));
			elsif ipbus_in.ipb_strobe='1' and ipbus_in.ipb_write='1' then
				reg(ctrl_sel) <= ipbus_in.ipb_wdata;
			end if;

			ipbus_out.ipb_rdata <= reg(ctrl_sel);
			
			ack <= ipbus_in.ipb_strobe and not ack;

		end if;
	end process;
	
	ipbus_out.ipb_ack <= ack;
	ipbus_out.ipb_err <= '0';

	q_gen: for i in numberOfRegisters - 1 downto 0 generate
		q((i+1)*32-1 downto i*32) <= reg(i);
	end generate;
	
end rtl;
