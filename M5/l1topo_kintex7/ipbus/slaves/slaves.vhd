-- The ipbus slaves live in this entity - modify according to requirements
--
-- Ports can be added to give ipbus slaves access to the chip top level.
--
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.ALL;

entity slaves is
	port(
		sysclk40: in std_logic;
		sysclk80: in std_logic;
		sysclk200: in std_logic;
		sysclk400: in std_logic;
		ipb_rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		gck_mmcm_locked: in std_logic;
		ctrlbus_u1_in, ctrlbus_u2_in: in std_logic_vector(2 downto 0);
		ctrlbus_u1_out, ctrlbus_u2_out: out std_logic_vector(4 downto 0);
		
		fakeTTCBroadcast: out std_logic;
		
		--debugIPBusBridgeU1: out std_logic_vector(227 downto 0);
		debugIPBusBridgeU2: out std_logic_vector(227 downto 0)
		
	);

end slaves;




architecture rtl of slaves is

	constant L1TOPO_MODULE_NUMBER: std_logic_vector := X"00000000";
	constant CONTROLLER_FIRMWARE_VERSION: std_logic_vector := X"00000001";

	constant NSLV: positive := 12;
	signal ipbw: ipb_wbus_array(NSLV-1 downto 0);
	signal ipbr: ipb_rbus_array(NSLV-1 downto 0);
	

	signal general_status: std_logic_vector(31 downto 0);
	signal general_control: std_logic_vector(31 downto 0);
	signal ttc_serializer_control: std_logic_vector(31 downto 0);

	signal ipbBridgeU1Control: std_logic_vector(15 downto 0);
	signal ipbBridgeU1Status:  std_logic_vector(14 downto 0);
	signal ipbBridgeU1ErrorCounter: std_logic_vector(17 downto 0);
	
	signal ipbBridgeU2Control: std_logic_vector(15 downto 0);
	signal ipbBridgeU2Status:  std_logic_vector(14 downto 0);
	signal ipbBridgeU2ErrorCounter: std_logic_vector(17 downto 0);
	
	signal ipbBridgeIDelayValue_64bit: std_logic_vector(63 downto 0);
	signal ipbBridgeIDelayCurrentValue_64bit: std_logic_vector(63 downto 0);
	signal ipbBridgeErrorCounter_64bit: std_logic_vector(63 downto 0);
	signal ipbBridgeErrorCounterReset_32bit: std_logic_vector(31 downto 0);


begin

  fabric: entity work.ipbus_fabric
    generic map(NSLV => NSLV)
    port map(
      ipb_in => ipb_in,
      ipb_out => ipb_out,
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );


ipbBridgeU1: entity work.ipbusBridge
generic map(
		DELAY_GROUP_NAME => "bank32_delay_group"
		)
	port map(
		sysclk => sysclk40,
		parallelclk => sysclk80,
		serialclk => sysclk400,
		idelayctrl_refclk => sysclk200,
		mmcm_locked => gck_mmcm_locked,
		ipb_write => ipbw(10),
		ipbBridgeBus_out => ctrlbus_u1_out,
		ipbBridgeBus_in => ctrlbus_u1_in,
		ipb_read => ipbr(10),
		control => ipbBridgeU1Control,
		status => ipbBridgeU1Status,
		errorCounter_out => ipbBridgeU1ErrorCounter,
		debugIPBusBridge => open --debugIPBusBridgeU1
	);


ipbBridgeU2: entity work.ipbusBridge
generic map(
		DELAY_GROUP_NAME => "bank17_delay_group"
		)
	port map(
		sysclk => sysclk40,
		parallelclk => sysclk80,
		serialclk => sysclk400,
		idelayctrl_refclk => sysclk200,
		mmcm_locked => gck_mmcm_locked,
		ipb_write => ipbw(11),
		ipbBridgeBus_out => ctrlbus_u2_out,
		ipbBridgeBus_in => ctrlbus_u2_in,
		ipb_read => ipbr(11),
		control => ipbBridgeU2Control,
		status => ipbBridgeU2Status,
		errorCounter_out => ipbBridgeU2ErrorCounter,
		debugIPBusBridge => debugIPBusBridgeU2
	);



--ctrlbus: entity work.ctrlbus
--	 port map(
--		sysclk40 => sysclk40,
--		sysclk80 => sysclk80,
--		sysclk200 => sysclk200,
--		sysclk400 => sysclk400,
--		gck_mmcm_locked => gck_mmcm_locked,
--
--		ctrlbus_u1_out => ctrlbus_u1_out,
--		ctrlbus_u2_out => ctrlbus_u2_out,
--		ctrlbus_u1_in => ctrlbus_u1_in,
--		ctrlbus_u2_in => ctrlbus_u2_in,
--		
--		ipb_write_U1_in => ipbw(18),
--		ipb_read_U1_out => ipbr(18),
--		ipb_write_U2_in => ipbw(19),
--		ipb_read_U2_out => ipbr(19),
--		
--		idelay_inc => K_idelay_inc,
--		idelay_counter_0 => K_idelay_counter_0,
--		idelay_counter_1 => K_idelay_counter_1,
--		idelay_counter_2 => K_idelay_counter_2
--    );



-- Slave 0: Module number
	slave0: entity work.ipbus_slave_status
		generic map(addr_width => 0)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(0),
			ipbus_out => ipbr(0),
			d => L1TOPO_MODULE_NUMBER
		);

-- Slave 1: Module number
	slave1: entity work.ipbus_slave_status
		generic map(addr_width => 0)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(1),
			ipbus_out => ipbr(1),
			d => CONTROLLER_FIRMWARE_VERSION
		);



-- Slave 2: General Status
		
general_status <= X"00000000";

	slave2: entity work.ipbus_slave_status
		generic map(addr_width => 0)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(2),
			ipbus_out => ipbr(2),
			d => general_status
		);


-- Slave 3: General Control
		
	slave3: entity work.ipbus_slave_control
		generic map(addr_width => 0)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(3),
			ipbus_out => ipbr(3),
			q => general_control
		);


-- Slave 4: TTC-Serializer Control

	slave4: entity work.ipbus_slave_control
		generic map(addr_width => 0)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(4),
			ipbus_out => ipbr(4),
			q => ttc_serializer_control
		);
		
	fakeTTCBroadcast <= ttc_serializer_control(0);
	
	
	

	
	
	
-- Slave5: 1kword RAM
	slave5: entity work.ipbus_ram
		generic map(addr_width => 10)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(5),
			ipbus_out => ipbr(5)
		);
	



-- Slave 6: ipbBridge_idelayValue
	
	slave6: entity work.ipbus_slave_control
		generic map(addr_width => 1)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(6),
			ipbus_out => ipbr(6),
			q => ipbBridgeIDelayValue_64bit
		);	


	ipbBridgeU1Control(14 downto 0) <= ipbBridgeIDelayValue_64bit(14 downto  0);
	ipbBridgeU2Control(14 downto 0) <= ipbBridgeIDelayValue_64bit(46 downto 32);




-- Slave 7: ipbBridge_idelayCurrentValue
	
	ipbBridgeIDelayCurrentValue_64bit(14 downto 0 ) <= ipbBridgeU1Status;
	ipbBridgeIDelayCurrentValue_64bit(31 downto 16) <= (others => '0');
	ipbBridgeIDelayCurrentValue_64bit(46 downto 32) <= ipbBridgeU2Status;
	ipbBridgeIDelayCurrentValue_64bit(63 downto 48) <= (others => '0');
	
	slave7: entity work.ipbus_slave_status
		generic map(addr_width => 1)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(7),
			ipbus_out => ipbr(7),
			d => ipbBridgeIDelayCurrentValue_64bit
		);
		
		

-- Slave 8: ipbBridge_errorCounter

	ipbBridgeErrorCounter_64bit(17 downto  0) <= ipbBridgeU1ErrorCounter;
	ipbBridgeErrorCounter_64bit(31 downto 18) <= (others => '0');
	ipbBridgeErrorCounter_64bit(49 downto 32) <= ipbBridgeU2ErrorCounter;
	ipbBridgeErrorCounter_64bit(63 downto 50) <= (others => '0');

	slave8: entity work.ipbus_slave_status
		generic map(addr_width => 1)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(8),
			ipbus_out => ipbr(8),
			d => ipbBridgeErrorCounter_64bit
		);



-- Slave 9: ipbBridge_errorCounter

	slave9: entity work.ipbus_slave_reg_pulse
		generic map(addr_width => 0)
		port map(
			clk => sysclk40,
			reset => ipb_rst,
			ipbus_in => ipbw(9),
			ipbus_out => ipbr(9),
			q => ipbBridgeErrorCounterReset_32bit
		);

	ipbBridgeU1Control(15) <= ipbBridgeErrorCounterReset_32bit(0);
	ipbBridgeU2Control(15) <= ipbBridgeErrorCounterReset_32bit(0);




end rtl;
