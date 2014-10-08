library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;
use work.ipbus.ALL;

use work.rod_l1_topo_types_const.all;

entity top_L1TopoController is
generic (
	NUMBER_OF_OUTPUT_LINKS	: integer range 0 to 8 := 1;
	LINKS_NUMBER			: integer range 0 to 40 := 8;
	SIMULATION				: boolean := false;
	VIVADO					: boolean := false
);
port(
	-- clocks
	GCK2_IN_P, GCK2_IN_N	: in std_logic; -- ttc 40.08 mhz 
	GCK1_IN_P, GCK1_IN_N	: in std_logic;
	MGT5_CLK_P, MGT5_CLK_N	: in std_logic; --mgtrefclk0_118 125mhz
	
	-- ipbus ethernet
	VME_EXT_RX_P, VME_EXT_RX_N	: in std_logic; --mgtxrx3_118 rj45 mezzanine X0Y15
	VME_EXT_TX_P, VME_EXT_TX_N	: out std_logic; --mgtxtx3_118 rj45 mezzanine X0Y15
	PHY_RESET_OUT_N 				: out std_logic;
	
	-- ros minipod fiber
	OPTO_KT1_P, OPTO_KT1_N	: out std_logic; --mgtxtx0_117 minipod line 8  X0Y8
	OPTO_KR1_P, OPTO_KR1_N	: in std_logic; --mgtxrx0_117 minipod line 8 X0Y8
	
	-- ddr to u2
	DATA_BANK18_IN_P, DATA_BANK18_IN_N : in std_logic_vector(7 downto 0);
	DATA_BANK16_IN_P, DATA_BANK16_IN_N : in std_logic_vector(4 downto 0);
	
	-- ipbus to u1 and u2
	CTRLBUS_U1_IN_P, CTRLBUS_U1_IN_N	: in std_logic_vector(2 downto 0);
	CTRLBUS_U2_IN_P, CTRLBUS_U2_IN_N	: in std_logic_vector(2 downto 0);
	CTRLBUS_U1_OUT_P, CTRLBUS_U1_OUT_N	: out std_logic_vector(4 downto 0);
	CTRLBUS_U2_OUT_P, CTRLBUS_U2_OUT_N	: out std_logic_vector(4 downto 0);
	
	-- ttcrx
	TTC_RESET_OUT		: out std_logic;
	TTC_EVT_H_STR_IN	: in std_logic;
	TTC_L1A_IN			: in std_logic;
	TTC_BCNT_STR_IN	: in std_logic;
	TTC_EVT_L_STR_IN	: in std_logic;
	TTC_BCNT_IN			: in std_logic_vector(11 downto 0);

	-- u2 diverse
	DATA_U2_SYNC_OUT_P, DATA_U2_SYNC_OUT_N	: out std_logic;
	L1A_TO_U2_OUT_P, L1A_TO_U2_OUT_N		: out std_logic;
	BUSY_FROM_U2_IN_P, BUSY_FROM_U2_IN_N	: in std_logic;
	
	-- debug
	LED_OUT : out STD_LOGIC_VECTOR(15 downto 0)
);
end top_L1TopoController;

architecture rtl of top_L1TopoController is

	signal clk_locked, locked, eth_locked: std_logic;
	signal rst_ipb, ddr_rst, rod_rst : std_logic;
	signal mac_addr: std_logic_vector(47 downto 0);
	signal ip_addr: std_logic_vector(31 downto 0);
	signal pkt_rx_led, pkt_tx_led : std_logic;
	
	signal gck2_clk40: std_logic;
	signal gck2_clk80: std_logic;
	signal gck2_clk200: std_logic;
	signal idelayctrl_refclk300: std_logic;
	
	signal number_of_slices_out_l           : slice_parameters_array_u;
	signal lvl0_offset_out_l                : slice_parameters_array_u;
	signal data_out_l						: out_data_array;
	signal actual_bus_number_out_l          : bus_number_array;

	signal ddr_synced_u2 : std_logic;
	signal ddr_data_u2 : std_logic_vector(LINKS_NUMBER * 8 - 1 downto 0);
	signal ddr_dv_u2 : std_logic_vector(LINKS_NUMBER - 1 downto 0);
	signal ones : std_logic_vector(LINKS_NUMBER - 1 downto 0);
	signal ddr_kctrl_u2 : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES - 1 downto 0);
	signal rst_from_bank18  : std_logic;

	signal ttc_rst : std_logic;

	signal start_of_frame_l, end_of_frame_l : std_logic;

	signal slink_ready_in_l, slink_event_ready_out_l : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
	type slink_data_out_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of std_logic_vector(31 downto 0);
	signal slink_data_out_a : slink_data_out_array;

	signal busy_from_u2 : std_logic := '0';
	signal builder_busy_l : std_logic;
	signal l1_busy_l : std_logic;
	signal slink_status : std_logic_vector(47 downto 0);
	
	signal icon_control0, icon_control1 : std_logic_vector(35 downto 0);
	signal ila_trg_0, ila_trg_1  : std_logic_vector(255 downto 0);
	
	signal ldown_n, lff_n : std_logic;
	
	signal gck1, gck2 : std_logic;
	signal mgt5_clk, mgt5_clk_buffered : std_logic;
	signal sysclk200, sysclk400 : std_logic;
	signal eth_gt_txoutclk, ethclk62_5, ethclk125, rst_extphy : std_logic;
	
	signal ctrlbus_u1_in : std_logic_vector(2 downto 0);
	signal ctrlbus_u2_in : std_logic_vector(2 downto 0);
	signal ctrlbus_u1_out : std_logic_vector(4 downto 0);
	signal ctrlbus_u2_out : std_logic_vector(4 downto 0);
	
	signal slink_rst : std_logic;
	
	signal dbg_txd, dbg_rxd : std_logic_vector(15 downto 0);
	signal dbg_tx_en, dbg_tx_er, dbg_rx_dv, dbg_rx_er : std_logic;
	
	signal ttc_l1a : std_logic;
	signal ttc_bcid : std_logic_vector(11 downto 0);
	signal ttc_evtid : std_logic_vector(23 downto 0);
	
	signal rod_dbg : std_logic_vector(255 downto 0);
	

begin

ones <= (others => '1');


--##################   DEBUG


LED_OUT <= (others => '0');
 
icon : entity work.cs_icon
PORT map(
    CONTROL0 => icon_control0,
    CONTROL1 => icon_control1
);
 
ila0 : entity work.cs_ila
PORT map(
    CONTROL => icon_control0,
    CLK     => sysclk200,
    TRIG0   => ila_trg_0
);

ila1 : entity work.cs_ila
PORT map(
    CONTROL => icon_control1,
    CLK     => sysclk200,
    TRIG0   => ila_trg_1
);

ila_trg_0(0) <= ttc_l1a; 
ila_trg_0(1) <= l1_busy_l;
ila_trg_0(2) <= builder_busy_l;
ila_trg_0(3) <= ddr_dv_u2(0);
ila_trg_0(67 downto 4) <= ddr_data_u2(63 downto 0);
ila_trg_0(68) <= start_of_frame_l;
ila_trg_0(69) <= end_of_frame_l;
ila_trg_0(70) <= slink_event_ready_out_l(0);
ila_trg_0(71) <= slink_ready_in_l(0);
ila_trg_0(103 downto 72) <= slink_data_out_a(0);
ila_trg_0(183 downto 104) <= data_out_l(0)(79 downto 0);
ila_trg_0(231 downto 184) <= rod_dbg(47 downto 0);
ila_trg_0(247 downto 246) <= std_logic_vector(actual_bus_number_out_l(0));
ila_trg_0(251 downto 248) <= std_logic_vector(number_of_slices_out_l(0));
ila_trg_0(255 downto 252) <= std_logic_vector(lvl0_offset_out_l(0));

ila_trg_0(232) <= TTC_L1A_IN;

ila_trg_0(233) <= lff_n;
ila_trg_0(234) <= ldown_n;
ila_trg_0(245 downto 235) <= (others => '0');

ila_trg_1(0) <= clk_locked;
ila_trg_1(1) <= eth_locked;
ila_trg_1(2) <= rod_rst;
ila_trg_1(3) <= slink_rst;
ila_trg_1(4) <= ddr_synced_u2;
ila_trg_1(5) <= rst_extphy;
ila_trg_1(245 downto 6) <= (others => '0');

--ila_trg_1(0) <= l1a;
--ila_trg_1(1) <= start_of_frame_l;
--ila_trg_1(2) <= dbg_tx_en;
--ila_trg_1(3) <= dbg_tx_er;
--ila_trg_1(19 downto 4) <= dbg_txd;
--ila_trg_1(35 downto 20) <= dbg_rxd;
--ila_trg_1(36) <= dbg_rx_dv;
--ila_trg_1(37) <= dbg_rx_er;
--ila_trg_1(38) <= end_of_frame_l;
--ila_trg_1(39) <= ila_trg_0(187);
--ila_trg_1(71 downto 40) <= ila_trg_0(228 downto 197);
--ila_trg_1(72) <= ila_trg_0(185);
--ila_trg_1(255 downto 73) <= (others => '0');



--##################   ROD

	
SET_SIM_VALUES: if SIMULATION = TRUE generate
    clk_locked <= '1';
end generate SET_SIM_VALUES;   

rod_with_slink : entity work.rod_slink_wrapper
generic map(
	NUMBER_OF_OUTPUT_LINKS => NUMBER_OF_OUTPUT_LINKS,
	SIMULATION             => SIMULATION,
	VIVADO                 => VIVADO)
port map(
	GCK_CLK40        => gck2_clk40,
	GCK_CLK80        => gck2_clk80,
	MGT5_CLK         => MGT5_CLK,
	ROD_RESET        => rod_rst,
	SLINK_RESET      => slink_rst,
	CLK_LOCKED_IN    => clk_locked,
	
	DDR_DATA_IN      => ddr_data_u2,
	DDR_DV_IN        => ddr_dv_u2,
	DDR_KCTRL_IN     => ddr_kctrl_u2,
	
	OPTO_KR1_N       => OPTO_KR1_N,
	OPTO_KR1_P       => OPTO_KR1_P,
	OPTO_KT1_N       => OPTO_KT1_N,
	OPTO_KT1_P       => OPTO_KT1_P,
	SLINK_LFF_N_OUT  => lff_n,
	SLINK_DOWN_N_OUT => ldown_n,
	
	L1A_IN           => ttc_l1a,
	BCID_IN          => ttc_bcid,
	EVTID_IN         => ttc_evtid,
	
	BUSY_FROM_U2_IN  => busy_from_u2,
	DEBUG_OUT        => rod_dbg
);

rod_rst <= (not ddr_synced_u2) or not clk_locked;

slink_rst <= not clk_locked;

busy_u2_buf : IBUFDS port map ( I => BUSY_FROM_U2_IN_P, IB => BUSY_FROM_U2_IN_N, O => busy_from_u2);

--##################   TTC

ttcrx : entity work.ttcrx_interface 
port map(
	-- GK: only P is used, the clk40 clock from ttcrx is recovered in clocks component
	CLK_P				=>  gck2_clk40, 
	CLK_N				=>  '0',
	MMCX_OUT			=>  open,

	--input signals from ttcrx chip - physical connections on pcb
	TTC_EVT_H_STR_IN 	=> TTC_EVT_H_STR_IN,
	TTC_L1A_IN 			=> TTC_L1A_IN,
	TTC_BCNT_STR_IN 	=> TTC_BCNT_STR_IN,
	TTC_EVT_L_STR_IN	=> TTC_EVT_L_STR_IN, 
	TTC_BCNT_IN			=> TTC_BCNT_IN,
		
	--output signals
	TTC_RESET_OUT		=> ttc_rst,
	L1A_OUT				=> ttc_l1a, --level 1 accepted. Main trigger
	BCID_OUT				=> ttc_bcid, --BCID is other name for BCN (bunch crossing number)
	EVTID_OUT			=> open --ttc_evtid
);

-- GK temporary fix of evtid 
process(gck2_clk40)
begin
	if rising_edge(gck2_clk40) then
		if (clk_locked = '0') then
			ttc_evtid <= (others => '0');
		elsif (ttc_l1a = '1') then
			ttc_evtid <= ttc_evtid + 1;
		else
			ttc_evtid <= ttc_evtid;
		end if;
	end if;
end process;

TTC_RESET_OUT <= ttc_rst;

l1a_u2_buf : OBUFDS port map ( I => ttc_l1a, O => L1A_TO_U2_OUT_P, OB => L1A_TO_U2_OUT_N);

--##################   DDR

ddr_rst <= not locked;

ddr_u2 : entity work.ddr_u2_wrapper
generic map(
	SIMULATION			=> SIMULATION,
	VIVADO				=> VIVADO
)
port map(
	GCK40_IN				=> gck2_clk40,
	DELAY_CTRL_CLK_IN	=> sysclk200,
	DDR_RST_IN			=> ddr_rst,
		
	DATA_BANK18_IN_P	=> DATA_BANK18_IN_P,
	DATA_BANK18_IN_N	=> DATA_BANK18_IN_N,
	DATA_BANK16_IN_P	=> DATA_BANK16_IN_P,
	DATA_BANK16_IN_N	=> DATA_BANK16_IN_N,
	
	DATA_OUT				=> ddr_data_u2,
	DATA_DV_OUT			=> ddr_dv_u2,
	DATA_KCTRL_OUT		=> ddr_kctrl_u2,
	
	DDR_SYNCED_OUT		=> ddr_synced_u2,
	
	DEBUG_OUT			=> open	
);
	
vsyn_u2_buf : OBUFDS port map( I =>  ddr_synced_u2, O => DATA_U2_SYNC_OUT_P, OB => DATA_U2_SYNC_OUT_N);

--##################   CLOCKING

SIM_CLOCK: if SIMULATION generate
	
	GC_CLOCK: process
	begin  -- process CLOCK
		gck2_clk40 <= '1';
		wait for 12.5 ns;
		gck2_clk40 <= '0';
		wait for 12.5 ns;
	end process GC_CLOCK;

	DELAY_CLK: process
	begin  -- process
		idelayctrl_refclk300 <= '1';
		wait for 1.666 ns;
		idelayctrl_refclk300 <= '0';
		wait for 1.666 ns;
	end process DELAY_CLK;
	rst_ipb <= '0';
  
	locked <= not rst_from_bank18;

	GC80_CLOCK: process
	begin  -- process CLOCK
		gck2_clk80 <= '1';
		wait for 6.25 ns;
		gck2_clk80 <= '0';
    	wait for 6.25 ns;
	end process GC80_CLOCK;

	GC320_CLOCK: process
	begin  -- process CLOCK
		gck2_clk200 <= '1';
		wait for 2.5 ns;
		gck2_clk200 <= '0';
    	wait for 2.5 ns;
	end process GC320_CLOCK;
  
end generate SIM_CLOCK;
-----------------------------------------------------------------------
-- comment for sim
-----------------------------------------------------------------------                 

GCK1_IBUFGDS: IBUFGDS
	port map(
		I  => GCK1_IN_P,
		IB => GCK1_IN_N,
		O  => gck1
);


GCK2_IBUFGDS: IBUFGDS
	port map(
		I  => GCK2_IN_P,
		IB => GCK2_IN_N,
		O  => gck2
);

MGT5_IBUFGDS_GTE2: IBUFDS_GTE2 
	port map(
		I  => MGT5_CLK_P,
		IB => MGT5_CLK_N,
		O  => mgt5_clk,
		ceb=> '0'
);

MGT5_CLK_BUFG: BUFG
	port map(
		I => mgt5_clk,
		O => mgt5_clk_buffered
);

clk: entity work.clocks
port map(
	gck1					=> gck1,
	gck2					=> gck2,
	sysclk40_out		=> gck2_clk40,
	sysclk80_out		=> gck2_clk80,
	sysclk200_out		=> sysclk200,
	sysclk400_out		=> sysclk400,
	
	eth_gt_txoutclk	=> eth_gt_txoutclk,
	ethclk62_5_out		=> ethclk62_5,
	ethclk125_out		=> ethclk125,
	
	gck_mmcm_locked_out => clk_locked,
	eth_mmcm_locked_out => eth_locked
);



--------------------------------------------------------------------
-- end comment for sim
--------------------------------------------------------------------
       
locked <= clk_locked and eth_locked;

-------------------------------------------------------------------------------
-- comment for sim
-------------------------------------------------------------------------------


--##################   IPBUS


mac_addr <= X"000A3501F610";
ip_addr  <= X"898A5121"; --137.138.81.33

ipb: entity work.ipbus_module
port map(
	sysclk40 => gck2_clk40,
	sysclk80 => gck2_clk80,
	sysclk200 => sysclk200,
	sysclk400 => sysclk400,
	mgt5_clk_buffered => mgt5_clk_buffered,
	eth_gt_txoutclk => eth_gt_txoutclk,
	ethclk62_5 => ethclk62_5,
	ethclk125 => ethclk125,
	gck_mmcm_locked => clk_locked,
	eth_mmcm_locked => eth_locked,
	
	mgt5_clk => mgt5_clk,
	VME_EXT_RX_P => VME_EXT_RX_P,
	VME_EXT_RX_N => VME_EXT_RX_N,
	VME_EXT_TX_P => VME_EXT_TX_P,
	VME_EXT_TX_N => VME_EXT_TX_N,
	
	eth_sgmiiphy_done_out => open,
	rst_extphy => rst_extphy,
	mac_addr => mac_addr,
	ip_addr => ip_addr,
	pkt_rx_led => pkt_rx_led,
	pkt_tx_led => pkt_tx_led,
	
	ctrlbus_u1_in => ctrlbus_u1_in,
	ctrlbus_u2_in => ctrlbus_u2_in,
	ctrlbus_u1_out => ctrlbus_u1_out,
	ctrlbus_u2_out => ctrlbus_u2_out,
	
	fakeTTCBroadcast => open,
	
	debugIPBus => open,
	debugIPBusBridgeU2 => open
);
	
PHY_RESET_OUT_N <= not rst_extphy;

CTRLBUS_IN_IBUFDS_GEN: for i in 2 downto 0 generate
CTRLBUS_U1_IN_IBUFDS: IBUFDS
	port map(
		I  => ctrlbus_u1_in_p(i),
		IB => ctrlbus_u1_in_n(i),
		O  => ctrlbus_u1_in(i)
	);
CTRLBUS_U2_IN_IBUFDS: IBUFDS
	port map(
		I  => ctrlbus_u2_in_p(i),
		IB => ctrlbus_u2_in_n(i),
		O  => ctrlbus_u2_in(i)
	);
end generate;

CTRLBUS_U1_OUT_OBUFDS_GEN: for i in 4 downto 0 generate
CTRLBUS_U1_OUT_OBUFDS: OBUFDS
	port map(
		I  => ctrlbus_u1_out(i),
		O  => ctrlbus_u1_out_p(i),
		OB => ctrlbus_u1_out_n(i)
	);
end generate;

CTRLBUS_U2_OUT_OBUFDS_GEN: for i in 4 downto 0 generate
CTRLBUS_U2_OUT_OBUFDS: OBUFDS
	port map(
		I  => ctrlbus_u2_out(i),
		O  => ctrlbus_u2_out_p(i),
		OB => ctrlbus_u2_out_n(i)
	);
end generate;


end rtl;