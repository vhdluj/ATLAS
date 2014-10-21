----------------------------------------------------------------------------------
-- Create Date:    15:26:21 07/04/2014 
-- Design Name: 
-- Module Name:    slinkPckBuilder - Behavioral 
-- Project Name:   ROD implementation on L1Topo
-- Target Devices: L1Topo board. Kintex 7 325T FBG900
-- Tool versions: ISE 14.7
-- Description: This component is receiving TOB (trigger object) data and puts it into slink frames. It uses 
--				hola_lsc_vtx6 component for slink protocol implementation. hola_lsc_vtx6 accepts 32 bits words, 
--				these words are parts of complete slink packet which is built by slinkPckBuilder component. 
--				The slink pck building starts when user sets enable_in on 1 and the link itself is ready (internal
--				busy_out signal is low). Readiness of the component to built packetes is signalized by issuing 
--				ready_out to 1. This signal is set one clk cycle before the data form payload_in is transfered via
--				link. What is more the component takes as the input l1a_in signal which is level one accepted trigger
--				signal. Once the signal arrives the status of the ports:    MODULE_ID,RUN_TYPE,RUN_NUMBER,ECR_ID,
--			    ROD_L1_ID,ROD_BCN,TRIGGER_TYPE,DETECTOR_EVENT_TYPE is written to the fifo because the data (payload) 
--				corresponding to the given values arrives to the component with some delay. The signals which are saved
--				in fifo are part of slink header.

-- Dependencies: this component requires ip core fifo component. The settings of the ip core component are as follow:
--				+common clk built in fifo
--				+ standard fifo 132 bit width and 512 or 1024 deep
--				+ rest settings form core generator remains unchanged
--
-- Revision: 
-- 0.02 - buffering fifo added
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;


entity slinkPckBuilder is
  generic(
    SIMULATION : boolean := TRUE
    );
  port(
    --clocks
    SYSCLK        : in std_logic;       --sholud be 40.08 Mhz
    CLK_LOCKED_IN : in std_logic;
    URESET_IN : in  std_logic;          -- user reset valid also for gtx.
	 
	 SLINK_READY_OUT : out std_logic;
	 
    --connection
    GT_CLKP, GT_CLKN     : in  std_logic;  --gtx clock pins

    GT_RX_N, GT_RX_P : in  std_logic;
    GT_TX_N, GT_TX_P : out std_logic;

    --from parser to slink
    ENABLE_IN : in  std_logic;  -- static value on this line enables taking data from payload port and sending it. Another pulse ends data sending and starts trail sending.
    READY_OUT : out std_logic;  -- this line goes high one cycle before the user data (payload) can be send.
    PAYLOAD_IN   : in std_logic_vector(31 downto 0);  --user data. Data is send on each rising edge of sysClk
    L1A_IN : in std_logic := '0'; -- level one acceptance trigger signal. This signal cause some input ports (which are part of the header of slink packet) to be stored in fifo
	 
	 --header data
    MODULE_ID           : in std_logic_vector (15 downto 0);
    RUN_TYPE            : in std_logic_vector (7 downto 0);
    RUN_NUMBER          : in std_logic_vector(23 downto 0);
    ECR_ID              : in std_logic_vector(7 downto 0);  --
    ROD_L1_ID           : in std_logic_vector(23 downto 0);  --
    ROD_BCN             : in std_logic_vector(11 downto 0);  --
    TRIGGER_TYPE        : in std_logic_vector(7 downto 0);  --
    SUB_DET_ID_IN       : in std_logic_vector(7 downto 0);  --
    DETECTOR_EVENT_TYPE : in std_logic_vector(31 downto 0);  --
	 FORMAT_VERSION_IN : in std_logic_vector(31 downto 0);
	 BUSY_CNT_TIME_PERIOD_IN : in std_logic_vector (31 downto 0); -- This input defines a time period in which information about component 	 or idle state is gathered. The value should come from ipbus register
	 BUSY_CNT_OUT : out std_logic_vector (31 downto 0); -- as long as ldown or lff is blocking transmission, this counter is incr.
	 IDLE_CNT_OUT : out std_logic_vector (31 downto 0); -- as longas UWEN_N is set to 1 this counter is incremented.
	 
	 LFF_N_OUT : out std_logic;   -- link full flag 
	 LDOWN_N_OUT : out std_logic; --link down
	 FIFOFULL_OUT : out std_logic;
	 
	    -- GK connections to external gtx 
        TLK_SYS_RST            : in  std_logic;
        GTX_RESET_OUT      : out std_logic;
        LSC_RESET_IN       : in std_logic;
		  TLK_RXCLK_IN       : in std_logic;
		  TLK_GTXCLK_IN      : in std_logic;
        -- GTX receive ports
        GTX_RXUSRCLK2      : in  std_logic;
        GTX_RXDATA         : in  std_logic_vector(15 downto 0);
        GTX_RXCHARISK      : in  std_logic_vector(1 downto 0);
        GTX_RXENCOMMAALIGN : out std_logic;
        -- GTX transmit ports
        GTX_TXUSRCLK2      : in  std_logic;
        GTX_TXCHARISK      : out std_logic_vector(1 downto 0);
        GTX_TXDATA         : out std_logic_vector(15 downto 0);
	 
	 
	 DEBUG_OUT           : out std_logic_vector(47 downto 0);
	 
	 DBG_TXD_OUT, DBG_RXD_OUT : out std_logic_vector(15 downto 0);
	 DBG_TX_EN_OUT, DBG_TX_ER_OUT, DBG_RX_DV_OUT, DBG_RX_ER_OUT : out std_logic;
	 
    --stat data
    STAT_WORD1_IN : in std_logic_vector(31 downto 0);  --any spotted errors in data should be reported in 
    STAT_WORD2_IN : in std_logic_vector(31 downto 0)  --this two status words
	 
    );
end slinkPckBuilder;

architecture Behavioral of slinkPckBuilder is

  constant beginOfFrame       : std_logic_vector(31 downto 0) := x"B0F00000";
  constant endOfFrame         : std_logic_vector(31 downto 0) := x"E0F00000";
  constant startOfHeader      : std_logic_vector(31 downto 0) := x"EE1234EE";
  --constant majorFormatVersion : std_logic_vector(15 downto 0) := x"0301";
  constant HEADER_SIZE        : std_logic_vector(31 downto 0) := x"00000009";
  constant STAT_BLOCK_POS     : std_logic := '1';  --1 means data go first in payload, and after data status words
  --constant SUB_DET_ID         : std_logic_vector (7 downto 0) :=x"91";
  --constant MINOR_FORMAT_VER   : std_logic_vector(15 downto 0) :=x"1002";  -- format version
  constant NUMBER_OF_STAT_EL  : std_logic_vector(1 downto 0)  :="10";  --number of status words
                                                             
  type   state_type is (starting, reseting, idle, sendingHeader, sendingTrailer, sendingData);
  signal state, next_state : state_type := starting;

  signal link_rst, link_rst_fsm       : std_logic                     := '0';  -- signal used for gtx reseting
  signal ureset_n_sgn, ureset_n_sgn_fsm   : std_logic                     := '0';
  signal LDOWN_N_sgn    : std_logic                     := '0';
  signal uwen_cnt       : std_logic_vector(1 downto 0)  := "00";
  signal uwen_allowed_n : std_logic                     := '0';
  signal word2send      : std_logic_vector(31 downto 0) := (others => '0');
  signal LFF_N_sgn      : std_logic                     := '0';
  signal busy_out_sgn   : std_logic                     := '0';
  signal uctrl_n_sgn    : std_logic                     := '0';
  signal ready_out_l    : std_logic;
  signal oh_index : integer range 0 to 16:= 0;
  signal number_of_data_el : unsigned(15 downto 0) := (others => '0');
  signal l1a_sgn_q ,l1a_sgn,l1a_sgn_qq, headerSave : std_logic:= '0';
  --signal enable_in_sgn, enable_in_sgn_q,  enable_in_sgn_qq, readFifo : std_logic  := '0';
  signal enable_in_sgn, readFifo_flag_q,  readFifo_flag, readFifo : std_logic  := '0';
  signal savedHeader, inputFifo : std_logic_vector(131 downto 0) := (others => '0');
  signal fifo_empty : std_logic  := '0';
  
  type   overhead is array (17 downto 0) of std_logic_vector(31 downto 0);  --header and trailer words
  signal oh : overhead;
  signal debug, debug_fsm : std_logic_vector(2 downto 0);
  signal busy_out_sgn_synch : std_logic :='0';
  
  signal busy_cnt_sgn,time_cnt_for_idle_busy,idle_cnt_sgn : UNSIGNED(31 downto 0);
  
begin
	DEBUG_OUT(0) <= ureset_n_sgn;
	DEBUG_OUT(1) <= uctrl_n_sgn;
	DEBUG_OUT(2) <= link_rst;
	DEBUG_OUT(3) <= uwen_allowed_n;
	DEBUG_OUT(4) <= LFF_N_sgn;
	DEBUG_OUT(5) <= LDOWN_N_sgn;
	--DEBUG_OUT(9 downto 6) <= std_logic_vector(to_unsigned(oh_index,4));
	--DEBUG_OUT(12 downto 10) <= debug;
	
	DEBUG_OUT(12 downto 11) <= "00";	
	
	DEBUG_OUT(44 downto 13) <= word2send;
	
	GTX_RESET_OUT <= link_rst;
	
--Use following component for implementation:
  CompInst : if SIMULATION = FALSE generate
    hola_inst : entity work.hola_lsc_vtx6
      port map(
        TLK_RXCLK_IN  => TLK_RXCLK_IN,
		  TLK_GTXCLK_IN => TLK_GTXCLK_IN,
        SYS_RST       => link_rst,
        LSC_RESET_IN  => LSC_RESET_IN,
        CLK_LOCKED    => CLK_LOCKED_IN,
        -- S-LINK interface
        UD            => word2send,   
        URESET_N      => ureset_n_sgn,  --sys_rst,--not sys_rst,--ila_zegar_lock,
        UTEST_N       => '1',
        UCTRL_N       => uctrl_n_sgn,
        UWEN_N        => uwen_allowed_n,
        UCLK          => sysClk,        --should be 40.08 mhz
        LFF_N         => LFF_N_sgn,
        LRL           => open,
        LDOWN_N       => LDOWN_N_sgn,
        -- SFP serial interface
        TLK_SIN_P     => GT_RX_P,
        TLK_SIN_N     => GT_RX_N,
        TLK_SOUT_P    => GT_TX_P,
        TLK_SOUT_N    => GT_TX_N,
		  
		  GTX_RESETDONE_OUT => open,
        LSC_RST_N_OUT     => open,
        TX_ER_OUT         => open,
		  
		  DBG_TXD_OUT => DBG_TXD_OUT,
		  DBG_RXD_OUT => DBG_RXD_OUT,
		  DBG_TX_EN_OUT => DBG_TX_EN_OUT,
		  DBG_TX_ER_OUT => DBG_TX_ER_OUT,
		  DBG_RX_DV_OUT => DBG_RX_DV_OUT,
		  DBG_RX_ER_OUT => DBG_RX_ER_OUT,
		  
		  GTX_TXRESETDONE_DEBUG => open,
		  GTX_RESET_DEBUG  => open,
		  GTX_CPLLOCK_DEBUG  => open,
        TLK_RXCLK => open,
		  
		-- GK connections to external gtx 
        TLK_SYS_RST        => TLK_SYS_RST,
        -- GTX receive ports
        GTX_RXUSRCLK2      => GTX_RXUSRCLK2,
        GTX_RXDATA         => GTX_RXDATA,
        GTX_RXCHARISK      => GTX_RXCHARISK,
        GTX_RXENCOMMAALIGN => GTX_RXENCOMMAALIGN,
        -- GTX transmit ports
        GTX_TXUSRCLK2      => GTX_TXUSRCLK2,
        GTX_TXCHARISK      => GTX_TXCHARISK,
        GTX_TXDATA         => GTX_TXDATA,
		  
        -- LEDs
        TESTLED_N     => DEBUG_OUT(6), --open,          --GPIO_LED(0),
        LDERRLED_N    => DEBUG_OUT(7), --open,          --GPIO_LED(1),
        LUPLED_N      => DEBUG_OUT(8), --open,          --GPIO_LED(2),
        FLOWCTLLED_N  => DEBUG_OUT(9), --open,          --GPIO_LED(3),
        ACTIVITYLED_N => DEBUG_OUT(10) --open           --GPIO_LED(4),
        );
  end generate;
  
  LFF_N_OUT <= LFF_N_sgn;
  LDOWN_N_OUT <= LDOWN_N_sgn;

--Use following component for simulation purpose:
--    CompInst1 : if SIMULATION = TRUE generate
--    hola_inst : entity work.hola_lsc_vtx6_SIMULATION
--      port map(
--        MGTREFCLK_P   => gt_clkp,       --
--        MGTREFCLK_N   => gt_clkn,       --
--        SYS_RST       => link_rst,
--        CLK_LOCKED    => CLK_LOCKED_IN,
--        -- S-LINK interface
--        UD            => word2send,   
--        URESET_N      => ureset_n_sgn,  --sys_rst,--not sys_rst,--ila_zegar_lock,
--        UTEST_N       => '1',
--        UCTRL_N       => uctrl_n_sgn,
--        UWEN_N        => uwen_allowed_n,
--        UCLK          => sysClk,        --should be 40.08 mhz
--        LFF_N         => LFF_N_sgn,
--        LRL           => open,
--        LDOWN_N       => LDOWN_N_sgn,
--        -- SFP serial interface
--        TLK_SIN_P     => GT_RX_P,
--        TLK_SIN_N     => GT_RX_N,
--        TLK_SOUT_P    => GT_TX_P,
--        TLK_SOUT_N    => GT_TX_N,
--        -- LEDs
--        TESTLED_N     => open,          --GPIO_LED(0),
--        LDERRLED_N    => open,          --GPIO_LED(1),
--        LUPLED_N      => open,          --GPIO_LED(2),
--        FLOWCTLLED_N  => open,          --GPIO_LED(3),
--        ACTIVITYLED_N => open           --GPIO_LED(4),
--        );
--  end generate;
  
--  SET_LDOWN_FOR_SIM: if SIMULATION = true generate
--    LDOWN_N_sgn <= '1';
--    LFF_N_sgn <= '1';
--  end generate SET_LDOWN_FOR_SIM;

headerBuffering : entity work.slinkPckBuilder_headerBuffer_132b_1024w
  PORT MAP (
    clk => SYSCLK,
    rst => URESET_IN,
    din =>    inputFifo,
    wr_en => headerSave,
    rd_en => readFifo,
    dout => savedHeader,
    full => FIFOFULL_OUT,
    empty => fifo_empty
  );


  sendingFSM_sync : process(sysClk, state, ureset_in, LDOWN_N_sgn, uwen_cnt, busy_out_sgn)
  begin
    if ureset_in = '1' then
      state <= starting;
      link_rst <= '0';
      ureset_n_sgn <= '1';
		debug <= "000";
    elsif rising_edge(sysClk) then
      link_rst <= link_rst_fsm;
      ureset_n_sgn <= ureset_n_sgn_fsm;
      state <= next_state;
		debug <= debug_fsm;
      if(state = reseting and LDOWN_N_sgn = '1' and uwen_cnt /= "10") then
        uwen_cnt <= uwen_cnt + '1';
      else
        uwen_cnt <= "00";
      end if;
      if((state = sendingHeader or state = sendingTrailer or (state = sendingDATA and ENABLE_IN = '0')) and busy_out_sgn = '0')then
        oh_Index <= oh_Index + 1;
      elsif (state = idle) then
        oh_Index <= 0;
      else
        oh_Index <= oh_Index;
      end if;
    end if;
  end process;

  sendingFSM : process(sysClk, CLK_LOCKED_IN, LDOWN_N_sgn, uwen_cnt, ENABLE_IN, oh_index, ureset_in , state)
  begin
    link_rst_fsm     <= '0';
    ureset_n_sgn_fsm <= '1';
    readFifo_flag  <= '0';
	 debug_fsm <= "000";
    case state is
      when starting =>
		  debug_fsm <= "001";
        if(CLK_LOCKED_IN = '0') then
          next_state <= starting;
        else
          next_state <= reseting;
          link_rst_fsm   <= '1';
        end if;
      when reseting =>
		debug_fsm <= "010";
        ureset_n_sgn_fsm <= '0';
        if(LDOWN_N_sgn = '1' and uwen_cnt = "10") then  --link becomes ready
          next_state <= idle;
        else
          next_state <= reseting;
        end if;
      when idle =>
			debug_fsm <= "011";
        if(ENABLE_IN = '1') and fifo_empty = '0' then
          next_state <= sendingHeader;
        else
          next_state <= idle;
        end if;
      when sendingHeader =>
			debug_fsm <= "100";
      	readFifo_flag<= '1';
        if(oh_index < 9) then
          next_state <= sendingHeader;
        else
          next_state <= sendingData;
        end if;
      when sendingData =>
			debug_fsm <= "101";
        if(ENABLE_IN = '0') then
          next_state <= sendingTrailer;
        else
          next_state <= sendingData;
        end if;
      when sendingTrailer =>
			debug_fsm <= "110";
        if(oh_index < 15) then
          next_state <= sendingTrailer;
        else
          next_state <= idle;
        end if;
    end case;
  end process;
  
  process(sysClk)
  begin
	if rising_edge(sysClk) then
		if (state = idle or state = sendingData or state = sendingHeader or state = sendingTrailer) then
			SLINK_READY_OUT <= '1';
		else
			SLINK_READY_OUT <= '0';
		end if;
	end if;
  end process;

  COUNT_DATA_WORDS : process (sysCLK)
  begin
    if rising_edge(sysCLK) then
      if state = IDLE then
        number_of_data_el <= (others => '0');
      elsif ENABLE_IN = '1' and state = sendingData and busy_out_sgn = '0' then --and slink_status = '0' then
        --one less for reading out last word (which is marker)
        number_of_data_el <= number_of_data_el + 1;
      else
        number_of_data_el <= number_of_data_el;
      end if;  
    end if;  
  end process COUNT_DATA_WORDS;

  
--Why this process is not clocked !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!??????????????????????????????????????????
  UWEN_process : process(sysClk, state, busy_out_sgn)
--this process is responsible for controling user write enable. Each time we want the user data to be taken form UD port and 
--send via S-link we have to send UWEN_N to '0'. But one should remember that each time LinkFullFlag appears or LDOWN_N is
--set to '0' then we cannot send data because it will be lost
  begin
  if rising_edge(sysClk) then
    if(((state = sendingHeader) or (state = sendingData) or (state = sendingTrailer)) and busy_out_sgn_synch = '0') then
      uwen_allowed_n <= '0';
    else
      uwen_allowed_n <= '1';
    end if;
	end if;
  end process;

  ports_driver : process(sysClk, state, LFF_N_sgn, oh_index, payload_in, oh)
  begin
  if rising_edge(sysClk) then
--ready signal to output fifo used for reading 
    if(state = sendingData or oh_Index = 9) then  --9 read first word
      ready_out_l <= '1' and (not busy_out_sgn);  --newMP 
    else
      ready_out_l <= '0';
    end if;

--busy signal
    if(LFF_N_sgn = '0' or LDOWN_N_sgn = '0') then
      busy_out_sgn <= '1';
		busy_out_sgn_synch <= busy_out_sgn;
    else
      busy_out_sgn <= '0';
		busy_out_sgn_synch <= busy_out_sgn;
    end if;
--Multiplexing data source for the UD Slink port
    if(state = sendingData)then
      word2send <= payload_in;
    elsif(state = sendingHeader) then   -------
      word2send <= oh(oh_Index);
    elsif(state = sendingTrailer) then
      word2send <= oh(oh_Index);
    else
      word2send <= (others => '0');
    end if;
--what is purpose of this ? newMP
--uctrl line is used to signalize that the transfered data is payload (uctrl_n_sgn <= '1') or
--overhead (uctrl_n_sgn <= '0')
    if((state = sendingHeader and oh_Index = 0) or (state = sendingTrailer and oh_Index = 15)) and busy_out_sgn_synch = '0' then
      uctrl_n_sgn <= '0';
    else
      uctrl_n_sgn <= '1';
    end if;
	end if;
  end process;

  OverheadPrepare : process(sysClk, oh, MODULE_ID,savedHeader)
  begin
    oh(0)  <= beginOfFrame; --const
    oh(1)  <= startOfHeader;--const
    oh(2)  <= HEADER_SIZE;  --const
    oh(3)  <= FORMAT_VERSION_IN;--this part of header is read from ipbus register --majorFormatVersion & MINOR_FORMAT_VER; --const
    oh(4)  <= x"00" & SUB_DET_ID_IN & savedHeader(131 downto 116);--x"00" & SUB_DET_ID & MODULE_ID;
    oh(5)  <= savedHeader(115 downto 84); --RUN_TYPE & RUN_NUMBER; 8 and 24 bits
    oh(6)  <= savedHeader(83 downto 52); --    ECR_ID & ROD_L1_ID; 8 and 24 bits
    oh(7)  <= x"00000" & savedHeader(51 downto 40); --ROD_BCN
    oh(8)  <= x"000000"& savedHeader(39 downto 32); --TRIGGER_TYPE
    oh(9)  <= savedHeader(31 downto 0);--DETECTOR_EVENT_TYPE;
	 oh(10) <= (others => '0');
	 oh(11) <= (others => '0');
    oh(12) <= b"00_0000_0000_0000_0000_0000_0000_0000" & NUMBER_OF_STAT_EL;--const
    oh(13) <= x"0000" & std_logic_vector(number_of_data_el);
    oh(14) <= b"000_0000_0000_0000_0000_0000_0000_0000" & STAT_BLOCK_POS; --const
    oh(15) <= endOfFrame; --const
    oh(16) <= (others => '0');
  end process;


               
L1A_handling : process (sysClk)
begin
	if rising_edge(sysClk) then
		l1a_sgn_q <= l1a_sgn;
		l1a_sgn_qq <= l1a_sgn_q;
	end if;
end process;

readHeaderFifohandling : process(sysClk) 
begin 
	if rising_edge(sysClk) then
		--enable_in_sgn_q  <= enable_in_sgn;
		--enable_in_sgn_qq  <= enable_in_sgn_q;
		readFifo_flag_q  <= readFifo_flag;
	end if;
end process;

idle_cnt_process : process(sysClk,URESET_IN,uwen_allowed_n,BUSY_CNT_TIME_PERIOD_IN)
begin
	if (URESET_IN = '1' or time_cnt_for_idle_busy > unsigned(BUSY_CNT_TIME_PERIOD_IN)) then
		idle_cnt_sgn <= (others => '0');
		time_cnt_for_idle_busy <= (others=>'0');
	elsif rising_edge(sysClk) then
	time_cnt_for_idle_busy <= time_cnt_for_idle_busy + 1;
		if(uwen_allowed_n = '1') then
			idle_cnt_sgn <= idle_cnt_sgn + 1;
		else
			idle_cnt_sgn <= idle_cnt_sgn;
		end if;
	end if;
end process;

busy_cnt_process : process(sysClk,URESET_IN,uwen_allowed_n,BUSY_CNT_TIME_PERIOD_IN)
begin
	if (URESET_IN = '1'  or time_cnt_for_idle_busy > unsigned(BUSY_CNT_TIME_PERIOD_IN)) then
		busy_cnt_sgn <= (others => '0');
	elsif rising_edge(sysClk) then
		if( busy_out_sgn = '1') then
			busy_cnt_sgn <= busy_cnt_sgn + 1;
		else
			busy_cnt_sgn <= busy_cnt_sgn;
		end if;
	end if;
end process;

--one line signal assigment
  READY_OUT <= ready_out_l;
  l1a_sgn <= L1A_IN;
  headerSave <= '1' when (l1a_sgn_q = '1' and l1a_sgn_qq = '0') else '0';
  enable_in_sgn <= ENABLE_IN;
  --readFifo  <= '1' when (enable_in_sgn_q = '1' and enable_in_sgn_qq ='0') else '0';
  readFifo  <= '1' when (readFifo_flag = '1' and readFifo_flag_q ='0') else '0';
  inputFifo <= MODULE_ID & RUN_TYPE & RUN_NUMBER & ECR_ID & ROD_L1_ID &
               ROD_BCN & TRIGGER_TYPE & DETECTOR_EVENT_TYPE;
	BUSY_CNT_OUT <= std_logic_vector(busy_cnt_sgn);
	IDLE_CNT_OUT <= std_logic_vector(idle_cnt_sgn);
end Behavioral;

