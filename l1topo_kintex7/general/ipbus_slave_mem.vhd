
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_slave_mem is
	generic(addr_width : positive);
	port(
		clk: in STD_LOGIC;
		reset: in STD_LOGIC;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus;
		
		ram_we_in : in std_logic_vector(0 downto 0);
		ram_waddr_in : in std_logic_vector(9 downto 0);
		ram_data_in : in std_logic_vector(31 downto 0)
	);
	
end ipbus_slave_mem;

architecture rtl of ipbus_slave_mem is

	type reg_array is array(2**addr_width-1 downto 0) of std_logic_vector(31 downto 0);
	signal reg: reg_array;
	signal sel: integer;
	signal ptr: unsigned(addr_width-1 downto 0);
	signal data, doutb: std_logic_vector(31 downto 0);
	signal we : std_logic_vector(0 downto 0);
	
begin

	ram_inst : entity work.rod_ipbus_ram
  PORT MAP (
    clka => clk,
    wea => ram_we_in,
    addra => ram_waddr_in,
    dina => ram_data_in,
    douta => open,
    clkb => clk,
    web => "0",
    addrb => std_logic_vector(ptr),
    dinb => (others => '0'),
    doutb => doutb
  );

	sel <= to_integer(ptr);

	process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				ptr <= (others=>'0');
			elsif ipbus_in.ipb_strobe='1' then
				if ipbus_in.ipb_addr(0)='0' and ipbus_in.ipb_write='1' then
					ptr <= unsigned(ipbus_in.ipb_wdata(addr_width-1 downto 0));
				elsif ipbus_in.ipb_addr(0)='1' then
					if ipbus_in.ipb_write='1' then
						reg(sel) <= ipbus_in.ipb_wdata;
					end if;
					ptr <= ptr + 1;
				end if;
			end if;

			data <= reg(sel);
						
		end if;
	end process;
	
	ipbus_out.ipb_ack <= ipbus_in.ipb_strobe;
	ipbus_out.ipb_err <= '0';
	ipbus_out.ipb_rdata <= std_logic_vector(to_unsigned(0, 32 - addr_width)) & std_logic_vector(ptr)
		when ipbus_in.ipb_addr(0)='0' else doutb;

end rtl;
