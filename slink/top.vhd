library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity top is
port(
	LED_OUT : out std_logic;
	gt_clkp, gt_clkn, SYSCLK_P, SYSCLK_N: in std_logic;
	
	--GPIO_LED: out STD_LOGIC_VECTOR(7 downto 0);
	PHY_RESET_N : in std_logic;
	SFP3_TXDIS : out std_logic;
	SFP3_LOS : in std_logic; 
	
	SFP3_RX_N, SFP3_RX_P : in std_logic;
	SFP3_TX_N, SFP3_TX_P : out std_logic
	);
end top;

architecture Behavioral of top is

signal clkin, clk125_fr, sys_rst : std_logic;
signal ctr : std_logic_vector(29 downto 0) := b"00_0000_0000_0000_0000_0000_0000_0000";

signal led_driver : std_logic  := '0';
signal led_driver_cnt : std_logic_vector(27  downto 0)  :=  x"2625A00"; --200ms


attribute keep : string;
--attribute keep of object_name : signal is "true";

signal         GTX_RESETDONE_debbug : std_logic;
signal        LSC_RST_N_debbug : std_logic;
signal TX_ER_debbug : std_logic;

signal GTX_TXRESETDONE_DEBUG : std_logic;  
signal GTX_RESET_DEBUG : std_logic;        
signal GTX_CPLLOCK_DEBUG : std_logic;      

signal clk400 : std_logic;
signal clk100 : std_logic;
signal ila_zegar_lock : std_logic;

 signal     LFF_N_sgn  : std_logic;
 signal     LRL_sgn    : std_logic_vector(3 downto 0);
 signal     LDOWN_N_sgn: std_logic;
 signal 	Phys_rst_N_sgn : std_logic;
 signal     Sfp3_los_sgn : std_logic;
 signal uwen_cntr : std_logic_vector(2 downto 0) := "000";
 signal uwen_l : std_logic;
 
attribute keep of LFF_N_sgn : signal is "true";
attribute keep of LRL_sgn : signal is "true";
attribute keep of LDOWN_N_sgn : signal is "true";
attribute keep of GTX_RESETDONE_debbug : signal is "true";
attribute keep of LSC_RST_N_debbug : signal is "true";
attribute keep of TX_ER_debbug : signal is "true";
attribute keep of sys_rst : signal is "true";
attribute keep of GTX_TXRESETDONE_DEBUG : signal is "true";
attribute keep of GTX_RESET_DEBUG : signal is "true";
attribute keep of GTX_CPLLOCK_DEBUG : signal is "true";
attribute keep of Phys_rst_N_sgn : signal is "true";
attribute keep of Sfp3_los_sgn : signal is "true";


component zegar_dla_ila
port
 (-- Clock in ports
  CLK_IN1_P         : in     std_logic;
  CLK_IN1_N         : in     std_logic;
  -- Clock out ports
  CLK_40          : out    std_logic;
  CLK_100          : out    std_logic;
  CLK_400          : out    std_logic;
  -- Status and control signals
  RESET             : in     std_logic;
  LOCKED            : out    std_logic
 );
end component;

begin



process(clkin)
begin	    
	if rising_edge(clkin) then
	--	if (ctr < b"11_0000_0000_0000_0000_0000_0000_0000") then
			ctr <= ctr + x"1"; -- we dont reset counter. Counter self ro
	--	else
	--		ctr <= ctr;
	--	end if;
	end if;
end process;

led_blink : process(clkin)
begin
	if rising_edge(clkin) then
		if(led_driver_cnt = x"0000000") then
			led_driver_cnt  <= x"2625A00";
			led_driver  <= not led_driver;
		else
			led_driver_cnt  <= led_driver_cnt - 1;
			led_driver  <=  led_driver;
		end if;
	end if;
end process led_blink;

--reset intervals 20s.  Reset last for 6 seconds. Assuming clock 40Mhz
sys_rst <= '1' when ((ctr > b"11_0000_0000_0000_0000_0000_0000_0000")) else '0'; -- or PHY_RESET_N = '0'
SFP3_TXDIS <= '0';
Phys_rst_N_sgn  <=  PHY_RESET_N;
Sfp3_los_sgn  <= Sfp3_los;
LED_OUT  <= Sfp3_los_sgn or PHY_RESET_N; --this lines is needet to preserve the sfp3_los signal and PHY_RESET_N 
--	ibuf0: IBUFGDS port map(
--		i => SYSCLK_P,
--		ib => SYSCLK_N,
--		o => clkin
--	);
	
	 ila_clock :zegar_dla_ila 
  port map
   (-- Clock in ports
    CLK_IN1_P => SYSCLK_P,
    CLK_IN1_N => SYSCLK_N,
    -- Clock out ports
    CLK_400 => CLK400,
    CLK_40 => clkin,
    CLK_100 => CLK100,
    -- Status and control signals
    RESET  => '0',
    LOCKED => ila_zegar_lock);
--	
--	bufg_fr: BUFG port map(
--		i => clkin,
--		o => clk125_fr
--	);

 SET_UWEN_PROC : process(clkin)
 	begin
 	if rising_edge(clkin) then
 		if LFF_N_sgn = '0' or LDOWN_N_sgn = '0' or sys_rst = '0' then
 			uwen_cntr <= (others => '0');
 			uwen_l  <= '1';
 		elsif uwen_cntr < 5 then
 			uwen_cntr <= uwen_cntr + 1;
 			uwen_l  <= '1';
 		else 
 			uwen_cntr <= uwen_cntr;
 			uwen_l <= '0';
 		end if;
 	end if;
 	end process;	

	hola_inst : entity work.hola_lsc_vtx6
  port map(
        MGTREFCLK_P     => gt_clkp, --clk125_fr,
        MGTREFCLK_N     => gt_clkn, --'0',
        SYS_RST         => sys_rst,
        CLK_LOCKED      => ila_zegar_lock,
        -- S-LINK interface
        UD              => b"00" & ctr,--(others => '0'),
        URESET_N        => not sys_rst,--ila_zegar_lock,
        UTEST_N         => '1',
        UCTRL_N         => '1',
        UWEN_N          => uwen_l,
        UCLK            => clkin,--40 mhz
        LFF_N           => LFF_N_sgn,
        LRL             => LRL_sgn,
        LDOWN_N         => LDOWN_N_sgn,
        -- SFP serial interface
        TLK_SIN_P       => SFP3_RX_P,
        TLK_SIN_N       => SFP3_RX_N,
        TLK_SOUT_P      => SFP3_TX_P,
        TLK_SOUT_N      => SFP3_TX_N,
        -- LEDs
        TESTLED_N       => open,--GPIO_LED(0),
        LDERRLED_N      => open,--GPIO_LED(1),
        LUPLED_N        => open,--GPIO_LED(2),
        FLOWCTLLED_N    => open,--GPIO_LED(3),
        ACTIVITYLED_N   => open,--GPIO_LED(4),
        
        --debbug
        GTX_RESETDONE_OUT  => GTX_RESETDONE_debbug,
        LSC_RST_N_OUT  => LSC_RST_N_debbug,
        TX_ER_OUT  => TX_ER_debbug,
        GTX_TXRESETDONE_DEBUG  => GTX_TXRESETDONE_DEBUG,
        GTX_RESET_DEBUG        =>   GTX_RESET_DEBUG,
        GTX_CPLLOCK_DEBUG      => GTX_CPLLOCK_DEBUG
        );
		  
		  --GPIO_LED(5) <= '0';
		  --GPIO_LED(6) <= GTX_RESET_DEBUG;
		  --GPIO_LED(7) <= led_driver;

end Behavioral;

