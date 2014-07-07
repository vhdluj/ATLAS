----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:21 07/04/2014 
-- Design Name: 
-- Module Name:    slinkPckBuilder - Behavioral 
-- Project Name: 
-- Target Devices: L1Topo board. Kintex 7 325T FBG900
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
use IEEE.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;

entity slinkPckBuilder is
	generic(
		SIMULATION : integer := 0
	);
	port(
		--clocks
		sysClk : in std_logic;					  --sholud be 40.08 Mhz
		CLK_LOCKED_IN : in std_logic;				
	
		--connection
		gt_clkp, gt_clkn : in std_logic;      --gtx clock pins
		PHY_RESET_N : in std_logic;			  -- external reset
		SFP3_TXDIS : out std_logic;			  
		SFP3_LOS : in std_logic; 				  
		SFP3_RX_N, SFP3_RX_P : in std_logic;
		SFP3_TX_N, SFP3_TX_P : out std_logic;
	
		--control ports 
		enable_in : in std_logic;	-- pulse on this line enables taking data from payload port and sending it. Another pulse ends data sending and starts trail sending.
		ready_out : out std_logic; -- this line goes high one cycle before the user data (payload) can be send.
		busy_out : out std_logic;  -- this line is high if link is not ready or LDC cannot accept more data (LFF_N = 0).
		ureset_in : in std_logic;  -- user reset valid also for gtx.
		
		--header data
		headerSize         : in std_logic_vector(31 downto 0);	-- header size without control word (should be 9)
		minorFormatVersion : in std_logic_vector(15 downto 0);	-- format version 
		subDetId           : in std_logic_vector (7 downto 0);	--
		moduleId           : in std_logic_vector (15 downto 0);
		runType 				 : in std_logic_vector (7 downto 0);
		runNumber 			 : in std_logic_vector(23 downto 0);	
		ECRID 				 : in std_logic_vector(7 downto 0);		--
		ROD_L1ID 			 : in std_logic_vector(23 downto 0);	--
		ROD_BCN 				 : in std_logic_vector(11 downto 0);	--
		triggerType 		 : in std_logic_vector(7 downto 0);		--
		detectorEventType  : in std_logic_vector(31 downto 0);	--
		numberOfStatEl 	 : in std_logic_vector(1 downto 0);		--number of status words (max 2)
		numberOfDataEl 	 : in std_logic_vector(15 downto 0);   --number of data elements
		statBlockPos   	 : in std_logic;								--1 means data go first in payload, and after data status words 
		
		--data
		statWord1_in    : in std_logic_vector(31 downto 0);--any spotted errors in data should be reported in 
		statWord2_in    : in std_logic_vector(31 downto 0);--this two status words
		payload_in		 : in std_logic_vector(31 downto 0) --user data. Data is send on each rising edge of sysClk
	
	);
end slinkPckBuilder;

architecture Behavioral of slinkPckBuilder is

constant beginOfFrame  : std_logic_vector(31 downto 0):= x"B0F00000"; 
constant endOfFrame    : std_logic_vector(31 downto 0):= x"E0F00000";
constant startOfHeader : std_logic_vector(31 downto 0):= x"EE1234EE";
constant majorFormatVersion : std_logic_vector(15 downto 0):= x"0301";

type state_type is (starting, reseting, idle, sendingHeader, sendingTrailer, sendingData);
signal state, next_state : state_type := reseting;

signal link_rst : std_logic:= '0'; -- signal used for gtx reseting
signal ureset_n_sgn : std_logic  := '0';
signal LDOWN_N_sgn : std_logic  := '0';
signal uwen_cnt : std_logic_vector(1 downto 0)  := "00";
signal uwen_allowed_n : std_logic  := '0';
signal word2send : std_logic_vector(31 downto 0) := (others => '0');
signal LFF_N_sgn : std_logic  := '0';
--signal ready_out_fsm : std_logic := '0';
signal uctrl_n_sgn : std_logic := '0';

signal  oh_index : integer range  0 to 14  := 0; 
 
type overhead is array (14 downto 0) of std_logic_vector(31 downto 0);--header and trailer words
signal oh : overhead; 
 
--simCompDec : if SIMULATION = 1 generate 
 component hola_lsc_vtx6_SIMULATION is
  port (MGTREFCLK_P     : in  std_logic;  -- MGT reference clock input,
        MGTREFCLK_N     : in  std_logic;  -- should be 125 MHz in the current configuration.
        SYS_RST         : in  std_logic;
        CLK_LOCKED      : in  std_logic;
        -- S-LINK interface
        UD              : in  std_logic_vector(31 downto 0);
        URESET_N        : in  std_logic;
        UTEST_N         : in  std_logic;
        UCTRL_N         : in  std_logic;
        UWEN_N          : in  std_logic;
        UCLK            : in  std_logic;
        LFF_N           : out std_logic;
        LRL             : out std_logic_vector(3 downto 0);
        LDOWN_N         : out std_logic;
        -- SFP serial interface
        TLK_SIN_P       : in std_logic;   -- GTX serial input 
        TLK_SIN_N       : in std_logic;
        TLK_SOUT_P      : out std_logic;  -- GTX serial output
        TLK_SOUT_N      : out std_logic;
        -- LEDs
        TESTLED_N       : out std_logic;
        LDERRLED_N      : out std_logic;
        LUPLED_N        : out std_logic;
        FLOWCTLLED_N    : out std_logic;
        ACTIVITYLED_N   : out std_logic;
        
        GTX_RESETDONE_OUT : out std_logic;
        LSC_RST_N_OUT : out std_logic;
        TX_ER_OUT : out std_logic
        );
end component;
--end generate; 
 
begin

simCompInst : if SIMULATION = 1 generate
hola_inst : hola_lsc_vtx6_SIMULATION--entity work.hola_lsc_vtx6
--generic map(
--		SIMULATION => 1
--	)
  port map(
        MGTREFCLK_P     => gt_clkp, --
        MGTREFCLK_N     => gt_clkn, --
        SYS_RST         => link_rst,
        CLK_LOCKED      => CLK_LOCKED_IN,
        -- S-LINK interface
        UD              => word2send,--(others => '0'),
        URESET_N        => ureset_n_sgn,--sys_rst,--not sys_rst,--ila_zegar_lock,
        UTEST_N         => '1',
        UCTRL_N         => uctrl_n_sgn,
        UWEN_N          => uwen_allowed_n,
        UCLK            => sysClk,--should be 40.08 mhz
        LFF_N           => LFF_N_sgn,
        LRL             => open,
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
        ACTIVITYLED_N   => open--GPIO_LED(4),
        );
end generate;

CompInst : if SIMULATION = 0  generate
hola_inst : entity work.hola_lsc_vtx6
--generic map(
--		SIMULATION => 1
--	)
  port map(
        MGTREFCLK_P     => gt_clkp, --
        MGTREFCLK_N     => gt_clkn, --
        SYS_RST         => link_rst,
        CLK_LOCKED      => CLK_LOCKED_IN,
        -- S-LINK interface
        UD              => word2send,--(others => '0'),
        URESET_N        => ureset_n_sgn,--sys_rst,--not sys_rst,--ila_zegar_lock,
        UTEST_N         => '1',
        UCTRL_N         => uctrl_n_sgn,
        UWEN_N          => uwen_allowed_n,
        UCLK            => sysClk,--should be 40.08 mhz
        LFF_N           => LFF_N_sgn,
        LRL             => open,
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
        ACTIVITYLED_N   => open--GPIO_LED(4),
        );
end generate;


sendingFSM_sync : process(sysClk,state)
begin
	if ureset_in = '1' then
		state  <= starting;
	elsif rising_edge(sysClk) then
		state <= next_state;
		if(state = reseting and LDOWN_N_sgn = '1' and uwen_cnt /= "10") then 
			uwen_cnt  <=  uwen_cnt + '1';
		else
			uwen_cnt  <= "00";	
		end if;
		if(state = sendingHeader or state = sendingTrailer)then
			oh_Index   <= oh_Index + 1;
		elsif (state = sendingData) then
			oh_Index <= oh_Index;
		else
			oh_Index <= 0;
		end if;
	end if;
end process;

sendingFSM : process(sysClk,CLK_LOCKED_IN,LDOWN_N_sgn,uwen_cnt,enable_in,oh_index,ureset_in )
begin
link_rst  <= '0';
ureset_n_sgn  <= '1';
uwen_allowed_n  <= '1';

	case state is 
		when starting =>
			if(CLK_LOCKED_IN = '0') then
				next_state  <= starting;				
			else
				next_state  <= reseting;
				link_rst  <= '1';
			end if;
		when reseting =>
			ureset_n_sgn  <= '0';
			if(LDOWN_N_sgn = '1' and uwen_cnt = "10") then --link becomes ready
				next_state  <= idle;			
			else
				next_state  <= reseting;
			end if;
		when idle =>
			if(enable_in ='1') then
				next_state  <=  sendingHeader;
			else
				next_state  <= idle;
			end if;
		when sendingHeader =>
			uwen_allowed_n  <= '0';
			if(oh_index < 9) then
				next_state  <= sendingHeader;
			else
				next_state  <= sendingData;
			end if;
		when sendingData =>
			uwen_allowed_n  <= '0';
			if(enable_in = '0') then
				next_state  <= sendingTrailer;
			else
				next_state  <= sendingData;
			end if;
		when sendingTrailer =>
			uwen_allowed_n  <= '0';
			if(oh_index < 13) then
				next_state  <= sendingTrailer;
			else
				next_state  <= idle;
			end if;
	end case;
end process;

ports_driver : process(sysClk,state, LFF_N_sgn,oh_index,payload_in,oh)
begin
if(state = sendingData or oh_Index = 9) then
	ready_out <= '1';
else
	ready_out  <=  '0';
end if;

if(state = idle and LFF_N_sgn ='1') then
	busy_out  <= '0';
elsif (state = sendingData and LFF_N_sgn = '1') then
	busy_out <= '0';
else
	busy_out  <= '1';
end if;

if(state = sendingData)then
	word2send <= payload_in;
elsif(state = sendingHeader) then -------
	word2send  <= oh(oh_Index);
elsif(state = sendingTrailer) then
	word2send  <= oh(oh_Index);
else
	word2send  <= (others => '0');
end if;

if((state = sendingHeader and oh_Index = 0) or (state = sendingTrailer and oh_Index = 13)) then
	uctrl_n_sgn <= '0';
else
	uctrl_n_sgn <= '1';
end if;


end process;




OverheadPrepare : process(sysClk,oh,headerSize,subDetId,moduleId)
begin
	oh(0) <=  beginOfFrame;
	oh(1) <=  startOfHeader;
	oh(2) <= headerSize;
	oh(3) <= majorFormatVersion & minorFormatVersion;
	oh(4) <= x"00" & subDetId & moduleId;
	oh(5) <= runType & runNumber;
	oh(6) <= ECRID & ROD_L1ID;
	oh(7) <= x"00000" & ROD_BCN;
	oh(8) <= x"000000"&triggerType;
	oh(9) <= detectorEventType;
	oh(10) <= b"00_0000_0000_0000_0000_0000_0000_0000" & numberOfStatEl;
	oh(11) <= x"0000" & numberOfDataEl;
	oh(12) <= b"000_0000_0000_0000_0000_0000_0000_0000" & statBlockPos;
	oh(13) <= endOfFrame;
	oh(14) <= (others => '0');
end process;

end Behavioral;

