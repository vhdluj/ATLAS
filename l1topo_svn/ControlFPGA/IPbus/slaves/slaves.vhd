-- The ipbus slaves live in this entity - modify according to requirements
--
-- Ports can be added to give ipbus slaves access to the chip top level.
--
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.ALL;

entity slaves is
	generic ( lvds_lines : positive );
	port(
		ipb_clk: in std_logic;
		ipb_rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		rst_out: out std_logic;
		eth_err_ctrl: out std_logic_vector(35 downto 0);
		eth_err_stat: in std_logic_vector(47 downto 0) := X"000000000000";
		pkt_rx: in std_logic := '0';
		pkt_tx: in std_logic := '0';
		
		ipb_write_U1_out: out ipb_wbus;
		ipb_read_U1_in: in ipb_rbus;
		ipb_write_U2_out: out ipb_wbus;
		ipb_read_U2_in: in ipb_rbus;
		
		ctrlbus_idelay_value_out: out std_logic_vector(29 downto 0);
		ctrlbus_idelay_load_out: out std_logic_vector(5 downto 0);
		
		ROD_RAM_CLK_IN : in std_logic;
		ROD_RAM_WE_IN : in std_logic;
		ROD_RAM_ADDR_IN : in std_logic_vector(9 downto 0);
		ROD_RAM_DATA_IN : in std_logic_vector(31 downto 0);
		
		DELAY_VALS_OUT    : out std_logic_vector(lvds_lines * 5 - 1 downto 0);
		DELAY_LOAD_OUT   : out std_logic_vector(lvds_lines - 1 downto 0);
		
		DBG_LINKS_SYNCED_IN_U1 : in std_logic_vector(lvds_lines - 1 downto 0);
		DBG_STATE_IN_U1     : in std_logic_vector(lvds_lines * 4 - 1 downto 0);
		DBG_REG_DATA_IN_U1  : in std_logic_vector(lvds_lines * 10 - 1 downto 0);
		DBG_BITSLIP_IN_U1   : in std_logic_vector(lvds_lines * 4 - 1 downto 0);
		DBG_INC_IN_U1       : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		DBG_PAUSE_IN_U1     : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		DBG_STEP_IN_U1      : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		DBG_RETRY_IN_U1    : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		
		DBG_LINKS_SYNCED_IN_U2 : in std_logic_vector(lvds_lines - 1 downto 0);
		DBG_STATE_IN_U2     : in std_logic_vector(lvds_lines * 4 - 1 downto 0);
		DBG_REG_DATA_IN_U2  : in std_logic_vector(lvds_lines * 10 - 1 downto 0);
		DBG_BITSLIP_IN_U2   : in std_logic_vector(lvds_lines * 4 - 1 downto 0);
		DBG_INC_IN_U2       : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		DBG_PAUSE_IN_U2     : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		DBG_STEP_IN_U2      : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		DBG_RETRY_IN_U2    : in std_logic_vector(lvds_lines * 8 - 1 downto 0);
		
		soft_rst_out : out std_logic
	);

end slaves;

architecture rtl of slaves is

	constant NSLV: positive := 10;
	signal ipbw: ipb_wbus_array(NSLV-1 downto 0);
	signal ipbr, ipbr_d: ipb_rbus_array(NSLV-1 downto 0);
	signal ctrl_reg: std_logic_vector(31 downto 0);
	signal inj_ctrl, inj_stat: std_logic_vector(63 downto 0);
	
	signal ctrlbus_idelay_value_32bit: std_logic_vector(31 downto 0);
	signal ctrlbus_idelay_load_32bit: std_logic_vector(31 downto 0);
	
	signal load_delays : std_logic_vector(31 downto 0);
	signal values_delays : std_logic_vector(63 downto 0);
	

begin

  fabric: entity work.ipbus_fabric
    generic map(NSLV => NSLV)
    port map(
      ipb_in => ipb_in,
      ipb_out => ipb_out,
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );

-- Slave 0: id / rst reg

	slave0: entity work.ipbus_ctrlreg
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(0),
			ipbus_out => ipbr(0),
			d => X"abcdfedc",
			q => ctrl_reg
		);
		
		rst_out <= ctrl_reg(0);
		soft_rst_out <= ctrl_reg(1);

-- Slave 1: register

--	slave1: entity work.ipbus_reg
--		generic map(addr_width => 0)
--		port map(
--			clk => ipb_clk,
--			reset => ipb_rst,
--			ipbus_in => ipbw(1),
--			ipbus_out => ipbr(1),
--			q => open
--		);

	slave1: entity work.ipbus_slave_reg_readwrite
		generic map(addr_width => 1)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(1),
			ipbus_out => ipbr(1),
			q => values_delays
		);
		
	DELAY_VALS_OUT <= values_delays(lvds_lines * 5 - 1 downto 0);	
	


	slave2: entity work.ipbus_slave_reg_pulse
		generic map(addr_width => 0)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(2),
			ipbus_out => ipbr(2),
			q => load_delays
		);
		
		DELAY_LOAD_OUT <= load_delays(lvds_lines - 1 downto 0);
			
-- Slave 2: ethernet error injection

--	slave2: entity work.ipbus_ctrlreg
--		generic map(
--			ctrl_addr_width => 1,
--			stat_addr_width => 1
--		)
--		port map(
--			clk => ipb_clk,
--			reset => ipb_rst,
--			ipbus_in => ipbw(2),
--			ipbus_out => ipbr(2),
--			d => inj_stat,
--			q => inj_ctrl
--		);
		
--	eth_err_ctrl <= inj_ctrl(49 downto 32) & inj_ctrl(17 downto 0);
--	inj_stat <= X"00" & eth_err_stat(47 downto 24) & X"00" & eth_err_stat(23 downto 0);
	
-- Slave 3: packet counters

--	slave3: entity work.ipbus_pkt_ctr
--		port map(
--			clk => ipb_clk,
--			reset => ipb_rst,
--			ipbus_in => ipbw(3),
--			ipbus_out => ipbr(3),
--			pkt_rx => pkt_rx,
--			pkt_tx => pkt_tx
--		);

-- Slave 4: 1kword RAM

--	slave4: entity work.ipbus_ram
--		generic map(addr_width => 10)
--		port map(
--			clk => ipb_clk,
--			reset => ipb_rst,
--			ipbus_in => ipbw(4),
--			ipbus_out => ipbr(4)
--		);

	slave4 : entity work.ipbus_slave_ddr_debug
	generic map(lvds_lines => lvds_lines)
	port map(
		clk => ipb_clk,
		reset => ipb_rst,
		ipbus_in => ipbw(4),
		ipbus_out => ipbr(4),
		
		DBG_LINKS_SYNCED_IN => DBG_LINKS_SYNCED_IN_U1,
		DBG_STATE_IN     => DBG_STATE_IN_U1,
		DBG_REG_DATA_IN  => DBG_REG_DATA_IN_U1,
		DBG_BITSLIP_IN   => DBG_BITSLIP_IN_U1,
		DBG_INC_IN       => DBG_INC_IN_U1,
		DBG_PAUSE_IN     => DBG_PAUSE_IN_U1,
		DBG_STEP_IN      => DBG_STEP_IN_U1,
		DBG_RETRY_IN     => DBG_RETRY_IN_U1
	);
	
	slave5 : entity work.ipbus_slave_ddr_debug
	generic map(lvds_lines => lvds_lines)
	port map(
		clk => ipb_clk,
		reset => ipb_rst,
		ipbus_in => ipbw(5),
		ipbus_out => ipbr(5),
		
		DBG_LINKS_SYNCED_IN => DBG_LINKS_SYNCED_IN_U2,
		DBG_STATE_IN     => DBG_STATE_IN_U2,
		DBG_REG_DATA_IN  => DBG_REG_DATA_IN_U2,
		DBG_BITSLIP_IN   => DBG_BITSLIP_IN_U2,
		DBG_INC_IN       => DBG_INC_IN_U2,
		DBG_PAUSE_IN     => DBG_PAUSE_IN_U2,
		DBG_STEP_IN      => DBG_STEP_IN_U2,
		DBG_RETRY_IN     => DBG_RETRY_IN_U2
	);
	
-- Slave 5: peephole RAM

--	slave5: entity work.ipbus_peephole_ram
--		generic map(addr_width => 10)
--		port map(
--			clk => ipb_clk,
--			reset => ipb_rst,
--			ipbus_in => ipbw(5),
--			ipbus_out => ipbr(5)
--		);

--	slave5: entity work.ipbus_slave_mem
--		generic map(addr_width => 10)
--		port map(
--			clk => ipb_clk,
--			reset => ipb_rst,
--			ipbus_in => ipbw(5),
--			ipbus_out => ipbr(5),
--			
--			ram_clk_in => ROD_RAM_CLK_IN,
--			ram_we_in => ROD_RAM_WE_IN,
--			ram_waddr_in => ROD_RAM_ADDR_IN,
--			ram_data_in => ROD_RAM_DATA_IN
--		);

--------------------------------------------------------------

-- Slave 6: ctrlbus_idelay_value 	readwrite_register

	slave6: entity work.ipbus_slave_reg_readwrite
		generic map(addr_width => 0)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(6),
			ipbus_out => ipbr(6),
			q => ctrlbus_idelay_value_32bit
		);
	
	ctrlbus_idelay_value_out <= ctrlbus_idelay_value_32bit(29 downto 0);


-- Slave 7: ctrlbus_idelay_load 	pulse_register

	slave7: entity work.ipbus_slave_reg_pulse
		generic map(addr_width => 0)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(7),
			ipbus_out => ipbr(7),
			q => ctrlbus_idelay_load_32bit
		);

	ctrlbus_idelay_load_out <= ctrlbus_idelay_load_32bit(5 downto 0);

-- Slave 8: ctrlbus to/from U1
	ipb_write_U1_out <= ipbw(8);
	ipbr(8) <= ipb_read_U1_in;

-- Slave 9: ctrlbus to/from U2
	ipb_write_U2_out <= ipbw(9);
	ipbr(9) <= ipb_read_U2_in;

end rtl;
