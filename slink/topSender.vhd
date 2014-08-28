----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:41:52 07/06/2014 
-- Design Name: 
-- Module Name:    topSender - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topSender is
	generic(
		SIMULATION : integer := 0
	);
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
end topSender;

architecture Behavioral of topSender is
component slinkPckBuilder is
	generic(
		SIMULATION : integer := 0
	);
	port(
		--clocks
		sysClk : in std_logic;
		CLK_LOCKED_IN : in std_logic;
	
		--connection
		gt_clkp, gt_clkn : in std_logic;
		PHY_RESET_N      : in std_logic;
		SFP3_TXDIS       : out std_logic;
		SFP3_LOS         : in std_logic; 
		SFP3_RX_N, SFP3_RX_P : in std_logic;
		SFP3_TX_N, SFP3_TX_P : out std_logic;
	
		--control ports 
		enable_in : in std_logic;
		ready_out : out std_logic;
		busy_out : out std_logic;
		ureset_in : in std_logic;
		
		--header data
		headerSize          : in std_logic_vector(31 downto 0);
		minorFormatVersion  : in std_logic_vector(15 downto 0);
		subDetId            : in std_logic_vector (7 downto 0);
		moduleId            : in std_logic_vector (15 downto 0);
		runType 			: in std_logic_vector (7 downto 0);
		runNumber 			: in std_logic_vector(23 downto 0);
		ECRID 				: in std_logic_vector(7 downto 0);
		ROD_L1ID 			: in std_logic_vector(23 downto 0);
		ROD_BCN : in std_logic_vector(11 downto 0);
		triggerType : in std_logic_vector(7 downto 0);
		detectorEventType : in std_logic_vector(31 downto 0);
		numberOfStatEl : in std_logic_vector(1 downto 0);
		numberOfDataEl : in std_logic_vector(15 downto 0);
		statBlockPos   : in std_logic;
		
		--data
		statWord1_in    : in std_logic_vector(31 downto 0);
		statWord2_in    : in std_logic_vector(31 downto 0);
		payload_in		 : in std_logic_vector(31 downto 0)
	
	);
end component;

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


signal enable_in_sgn : std_logic  := '0';
signal ready_out_sgn : std_logic  := '0';  
signal busy_out_sgn      : std_logic  := '0';  
signal ureset_in_sgn     : std_logic  := '0';  
signal payload_in_sgn 	 : std_logic_vector (31 downto 0)  := (others => '0');
signal cnt 				 : std_logic_vector(7 downto 0)  := x"00";
signal runNumber_sgn	 : std_logic_vector(23 downto 0)  := x"00_0000";
signal numberOfDataEl_sgn	 : std_logic_vector(15 downto 0)  := x"0001";
signal pauseCnt : std_logic_vector(31 downto 0)   :=  (others => '0');
signal wordsCnt : std_logic_vector(3 downto 0)  := (others => '0');
signal rstCnt : std_logic_vector(28 downto 0) := (others => '0');
signal rstCnt_sgn : std_logic := '0';

--clocks
signal clk40 : std_logic  := '0';
signal clk100 : std_logic := '0';
signal clk400 : std_logic := '0';
signal ila_zegar_lock : std_logic := '0';

attribute keep : string;
attribute keep of rstCnt_sgn : signal is "true";

type state_type is (idle,reset,prepare2send, send , pause);
signal state, n_state : state_type  := idle;

begin

packerInterfGenSim : if SIMULATION = 1 generate
in_slinkPckBuilder : component slinkPckBuilder
	generic map( 
				SIMULATION => 1
	)
	port map(sysClk             => SYSCLK_P,
		     CLK_LOCKED_IN      => '1',
		     gt_clkp            => SYSCLK_P,
		     gt_clkn            => SYSCLK_P,
		     PHY_RESET_N        => PHY_RESET_N,
		     SFP3_TXDIS         => open,
		     SFP3_LOS           => SFP3_LOS,
		     SFP3_RX_N          => SFP3_RX_N,
		     SFP3_RX_P          => SFP3_RX_P,
		     SFP3_TX_N          => SFP3_TX_N,
		     SFP3_TX_P          => SFP3_TX_P,
		     enable_in          => enable_in_sgn,
		     ready_out          => ready_out_sgn,
		     busy_out           => busy_out_sgn,
		     ureset_in          => ureset_in_sgn,
		     headerSize         => x"0000_0009", --nine words in the header exluding control word
		     minorFormatVersion => x"1002",
		     subDetId           => x"91",
		     moduleId           => x"0001",
		     runType            => b"0000_1111", --0 = physics, 1 = Calibration, 2 = Cosmics, 15=test
		     runNumber          => runNumber_sgn,
		     ECRID              => x"00",
		     ROD_L1ID           => x"00_0000",
		     ROD_BCN            => x"000",
		     triggerType        => x"00",
		     detectorEventType  => x"0000_0000",
		     numberOfStatEl     =>  b"00",
		     numberOfDataEl     => numberOfDataEl_sgn,
		     statBlockPos       => '1',
		     statWord1_in       => x"0000_0000",
		     statWord2_in       => x"0000_0000",
		     payload_in         => payload_in_sgn);
		     
		     clk40  <=  SYSCLK_P;
end generate;

packerInterfGen : if SIMULATION = 0 generate
in_slinkPckBuilder : component slinkPckBuilder
	generic map( 
				SIMULATION => 0
	)
	port map(sysClk             => clk40,
		     CLK_LOCKED_IN      => ila_zegar_lock,
		     gt_clkp            => gt_clkp,
		     gt_clkn            => gt_clkn,
		     PHY_RESET_N        => PHY_RESET_N,
		     SFP3_TXDIS         => open,
		     SFP3_LOS           => SFP3_LOS,
		     SFP3_RX_N          => SFP3_RX_N,
		     SFP3_RX_P          => SFP3_RX_P,
		     SFP3_TX_N          => SFP3_TX_N,
		     SFP3_TX_P          => SFP3_TX_P,
		     enable_in          => enable_in_sgn,
		     ready_out          => ready_out_sgn,
		     busy_out           => busy_out_sgn,
		     ureset_in          => ureset_in_sgn,
		     headerSize         => x"0000_0009", --nine words in the header exluding control word
		     minorFormatVersion => x"1002",
		     subDetId           => x"91",
		     moduleId           => x"0001",
		     runType            => b"0000_1111", --0 = physics, 1 = Calibration, 2 = Cosmics, 15=test
		     runNumber          => runNumber_sgn,
		     ECRID              => x"00",
		     ROD_L1ID           => x"00_0000",
		     ROD_BCN            => x"000",
		     triggerType        => x"00",
		     detectorEventType  => x"0000_0000",
		     numberOfStatEl     =>  b"00",
		     numberOfDataEl     => numberOfDataEl_sgn,
		     statBlockPos       => '1',
		     statWord1_in       => x"0000_0000",
		     statWord2_in       => x"0000_0000",
		     payload_in         => payload_in_sgn);

ila_clock :zegar_dla_ila 
  port map
   (-- Clock in ports
    CLK_IN1_P => SYSCLK_P,
    CLK_IN1_N => SYSCLK_N,
    -- Clock out ports
    CLK_400 => CLK400,
    CLK_40 => clk40,
    CLK_100 => CLK100,
    -- Status and control signals
    RESET  => '0',
    LOCKED => ila_zegar_lock);
    
end generate;

FSM_sync : process(clk40,state) 
begin
	if rising_edge(clk40) then
		rstCnt <= rstCnt + 1;
		if(ila_zegar_lock = '0' or rstCnt_sgn = '1') then
			state <= idle;
		else
			state  <= n_state;
		end if;
		if(state = send) then
			numberOfDataEl_sgn  <= numberOfDataEl_sgn + 1;
		elsif(state = pause) then
			numberOfDataEl_sgn <= numberOfDataEl_sgn;
		else
			numberOfDataEl_sgn  <= x"0001";
		end if;
		if(state = pause) then
			pauseCnt  <=  pauseCnt + 1;
		else
			pauseCnt  <= (others  => '0');
		end if;
		if(state = send) then
			wordsCnt  <= wordsCnt -1;
		else
			wordsCnt  <= x"4";  --we send 4 words
		end if;
	end if;
end process;

FSM : process(clk40,ready_out_sgn,wordsCnt,pauseCnt,busy_out_sgn,enable_in_sgn)
begin
enable_in_sgn  <= '0';
--ready_out_sgn
--busy_out_sgn,
ureset_in_sgn  <= '0';
runNumber_sgn  <= runNumber_sgn;
	case state is 
		when idle =>
			n_state <= reset;
			ureset_in_sgn  <= '1';
		when reset =>	
--		enable_in_sgn <= '1';
			if (busy_out_sgn = '0') then	
				n_state  <= prepare2Send;
			else
				n_state  <= reset;
			end if;
		when prepare2Send => 
			enable_in_sgn <= '1';
			if (ready_out_sgn = '1') then
				n_state  <= send;
			else
				n_state  <= prepare2Send;
			end if;		
		when send =>
			enable_in_sgn <= '1';
			if(ready_out_sgn = '1' and wordsCnt >0 ) then
				n_state  <= send;
			else
				n_state  <= pause;
			end if;
		when pause =>
			if(pauseCnt > 100000 and busy_out_sgn = '0') then
				n_state   <= prepare2Send;
			else
				n_state  <= pause; 
			end if;
			--runNumber_sgn  <= runNumber_sgn + 1;
			
	end case;
end process;




DataGenerator : process (clk40)
begin
	if rising_edge ( clk40 ) then
		cnt  <=  cnt + 1;
	end if;
end process;


--One line signal assigmnet
payload_in_sgn  <= cnt & cnt & cnt & cnt;
LED_OUT <= '1';
SFP3_TXDIS <= '0';
rstCnt_sgn <= '1' when rstCnt = x"00_0000" else '0';
end Behavioral;

