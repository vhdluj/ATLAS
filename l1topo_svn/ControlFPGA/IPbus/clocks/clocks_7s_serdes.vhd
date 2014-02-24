-- clocks_7s_serdes
--
-- Input is a free-running 125MHz clock (taken straight from MGT clock buffer)
--
-- Dave Newbold, April 2011
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.VComponents.all;

entity clocks_7s_serdes is
	port(
		clki_fr: in std_logic; -- Input free-running clock (125MHz)
		clki_125: in std_logic; -- Ethernet domain clk125
		clko_ipb: out std_logic; -- ipbus domain clock (31MHz)
		clko_p40: out std_logic; -- pseudo-40MHz clock
		clko_200: out std_logic; -- 200MHz clock for idelayctrl
		eth_locked: in std_logic; -- ethernet locked signal
		locked: out std_logic; -- global locked signal
		nuke: in std_logic; -- hard reset input
		rsto_125: out std_logic; -- clk125 domain reset (held until ethernet locked)
		rsto_ipb: out std_logic; -- ipbus domain reset
		rsto_eth: out std_logic; -- ethernet startup reset (required!)
		rsto_fr: out std_logic; -- clk40 domain reset
		onehz: out std_logic; -- blinkenlights output
		GCK2_IN_P, GCK2_IN_N: in std_logic;
		gck2_mmcm_locked_out: out std_logic;
		gck2_clk40_out: out std_logic;
		gck2_clk80_out: out std_logic;
		idelayctrl_refclk300_out: out std_logic
	);

end clocks_7s_serdes;

architecture rtl of clocks_7s_serdes is
	
	signal dcm_locked, sysclk, sysclk_ub, clk_ipb_i, clk_ipb_b, clkfb: std_logic;
	signal clk_p40_i, clk_p40_b: std_logic;
	signal d17, d17_d: std_logic;
	signal nuke_i, nuke_d, nuke_d2: std_logic := '0';
	signal rst, rst_ipb, rst_125, rst_eth: std_logic := '1';
	
	signal gck2: std_logic;
	signal gck2_mmcm_feedback, gck2_mmcm_feedback_unbuffered: std_logic;
	signal gck2_mmcm_locked: std_logic;
	signal gck2_clk80_unbuffered: std_logic;
	signal idelayctrl_refclk300_unbuffered: std_logic;
	signal gck2_clk40, gck2_clk40_unbuffered: std_logic;



begin
	
	sysclk <= clki_fr;

	bufgipb: BUFG port map(
		i => clk_ipb_i,
		o => clk_ipb_b
	);
	
	clko_ipb <= clk_ipb_b;
	
	bufgp40: BUFG port map(
		i => clk_p40_i,
		o => clk_p40_b
	);
	
	clko_p40 <= clk_p40_b;
	
	mmcm: MMCME2_BASE
		generic map(
			clkin1_period => 8.0,
			clkfbout_mult_f => 8.0, -- VCO freq 1000MHz
			clkout1_divide => 32,
			clkout2_divide => 25,
			clkout3_divide => 5
		)
		port map(
			clkin1 => sysclk,
			clkfbin => clkfb,
			clkfbout => clkfb,
			clkout1 => clk_ipb_i,
			clkout2 => clk_p40_i,
			clkout3 => clko_200, -- No BUFG needed here, goes to idelayctrl on local routing
			locked => dcm_locked,
			rst => '0',
			pwrdwn => '0'
		);
	
	clkdiv: entity work.clock_div port map(
		clk => sysclk,
		d17 => d17,
		d28 => onehz
	);
	
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			d17_d <= d17;
			if d17='1' and d17_d='0' then
				rst <= nuke_d2 or not dcm_locked;
				nuke_d <= nuke_i; -- ~1ms time bomb (allows return packet to be sent)
				nuke_d2 <= nuke_d;
			end if;
		end if;
	end process;
	
	locked <= dcm_locked;

--	process(clk_ipb_b)
--	begin
--		if rising_edge(clk_ipb_b) then
--			rst_ipb <= rst;
--			nuke_i <= nuke;
--		end if;
--	end process;
	
	process(gck2_clk40)
	begin
		if rising_edge(gck2_clk40) then
			rst_ipb <= rst;
			nuke_i <= nuke;
		end if;
	end process;
	
	rsto_ipb <= rst_ipb;
	
	process(clki_125)
	begin
		if rising_edge(clki_125) then
			rst_125 <= rst or not eth_locked;
		end if;
	end process;
	
	rsto_125 <= rst_125;
	
	process(sysclk)
	begin
		if rising_edge(sysclk) then
			rst_eth <= rst;
		end if;
	end process;
	
	rsto_eth <= rst_eth;
	
	rsto_fr <= rst;
		
		
	GCK2_IBUFGDS: IBUFGDS
		port map(
			I => GCK2_IN_P,
			IB => GCK2_IN_N,
			O => gck2
		);
		

	GCK2_MMCM: MMCME2_ADV
	generic map(
		BANDWIDTH					=>	"OPTIMIZED",
		CLKIN1_PERIOD			=> 24.95,		-- 40.08MHz
		REF_JITTER1					=> 0.010,
		DIVCLK_DIVIDE			=>	1,
		CLKFBOUT_MULT_F	=>	30.000,		--	1202.4 MHz
		CLKOUT0_DIVIDE_F	=>	4.000,		--	  300.6 MHz
		CLKOUT1_DIVIDE		=>	30,				--	    40.08 MHz
		CLKOUT2_DIVIDE		=>	15				--	    80.16 MHz
	)
	port map(
		CLKIN1 			=>	gck2,
		CLKFBIN		=>	gck2_mmcm_feedback,
		CLKFBOUT	=>	gck2_mmcm_feedback_unbuffered,
		CLKOUT0		=>	idelayctrl_refclk300_unbuffered,
		CLKOUT1		=>	gck2_clk40_unbuffered,
		CLKOUT2		=>	gck2_clk80_unbuffered,
		LOCKED			=> gck2_mmcm_locked,
		
		--unused ports
		CLKIN2=>'0', CLKINSEL=>'1',
		DADDR=>(others=>'0'), DCLK=>'0', DEN=>'0', DI=>(others=>'0'), DWE=>'0',
		PSCLK=>'0', PSEN=>'0', PSINCDEC=>'0', PWRDWN=>'0',
		RST=>'0'
	);

	gck2_mmcm_locked_out <= gck2_mmcm_locked;
	
	GCK2_MMCM_FEEDBACK_BUFG: BUFG
		port map(
			I	=>	gck2_mmcm_feedback_unbuffered,
			O	=>	gck2_mmcm_feedback
		);

	IDELAYCTRL_REFCLK_BUFG: BUFG
		port map(
			I => idelayctrl_refclk300_unbuffered,
			O => idelayctrl_refclk300_out
		);

	GCK2_CLK80_BUFG: BUFG
		port map(
			I	=>	gck2_clk80_unbuffered,
			O	=>	gck2_clk80_out
		);
	
	GCK2_BUFG: BUFG
		port map(
			I	=>	gck2_clk40_unbuffered,
			O	=>	gck2_clk40
		);

	gck2_clk40_out <= gck2_clk40;
		
		
		
end rtl;

