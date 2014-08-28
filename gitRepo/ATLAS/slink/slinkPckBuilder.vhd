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
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;

entity slinkPckBuilder is
  generic(
    SIMULATION : boolean := FALSE
    );
  port(
    --clocks
    SYSCLK        : in std_logic;       --sholud be 40.08 Mhz
    CLK_LOCKED_IN : in std_logic;
    URESET_IN : in  std_logic;          -- user reset valid also for gtx.
    --connection
    GT_CLKP, GT_CLKN     : in  std_logic;  --gtx clock pins

    GT_RX_N, GT_RX_P : in  std_logic;
    GT_TX_N, GT_TX_P : out std_logic;

    --from parser to slink
    ENABLE_IN : in  std_logic;  -- static value on this line enables taking data from payload port and sending it. Another pulse ends data sending and starts trail sending.
    READY_OUT : out std_logic;  -- this line goes high one cycle before the user data (payload) can be send.
    PAYLOAD_IN   : in std_logic_vector(31 downto 0);  --user data. Data is send on each rising edge of sysClk
    --header data
    MODULE_ID           : in std_logic_vector (15 downto 0);
    RUN_TYPE            : in std_logic_vector (7 downto 0);
    RUN_NUMBER          : in std_logic_vector(23 downto 0);
    ECR_ID              : in std_logic_vector(7 downto 0);  --
    ROD_L1_ID           : in std_logic_vector(23 downto 0);  --
    ROD_BCN             : in std_logic_vector(11 downto 0);  --
    TRIGGER_TYPE        : in std_logic_vector(7 downto 0);  --
    DETECTOR_EVENT_TYPE : in std_logic_vector(31 downto 0);  --
    --stat data
    STAT_WORD1_IN : in std_logic_vector(31 downto 0);  --any spotted errors in data should be reported in 
    STAT_WORD2_IN : in std_logic_vector(31 downto 0)  --this two status words
    );
end slinkPckBuilder;

architecture Behavioral of slinkPckBuilder is

  constant beginOfFrame       : std_logic_vector(31 downto 0) := x"B0F00000";
  constant endOfFrame         : std_logic_vector(31 downto 0) := x"E0F00000";
  constant startOfHeader      : std_logic_vector(31 downto 0) := x"EE1234EE";
  constant majorFormatVersion : std_logic_vector(15 downto 0) := x"0301";
  constant HEADER_SIZE        : std_logic_vector(31 downto 0) := x"00000009";
  constant STAT_BLOCK_POS     : std_logic := '1';  --1 means data go first in payload, and after data status words
  constant SUB_DET_ID         : std_logic_vector (7 downto 0) :=x"91";
  constant MINOR_FORMAT_VER   : std_logic_vector(15 downto 0) :=x"1002";  -- format version
  constant NUMBER_OF_STAT_EL  : std_logic_vector(1 downto 0)  :="00";  --number of status words
                                                             
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
  signal oh_index : integer range 0 to 14 := 0;
  signal number_of_data_el : unsigned(15 downto 0) := (others => '0');
  
  type   overhead is array (14 downto 0) of std_logic_vector(31 downto 0);  --header and trailer words
  signal oh : overhead;

begin

  CompInst : if SIMULATION = FALSE generate
    hola_inst : entity work.hola_lsc_vtx6
      port map(
        MGTREFCLK_P   => gt_clkp,       --
        MGTREFCLK_N   => gt_clkn,       --
        SYS_RST       => link_rst,
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
        -- LEDs
        TESTLED_N     => open,          --GPIO_LED(0),
        LDERRLED_N    => open,          --GPIO_LED(1),
        LUPLED_N      => open,          --GPIO_LED(2),
        FLOWCTLLED_N  => open,          --GPIO_LED(3),
        ACTIVITYLED_N => open           --GPIO_LED(4),
        );
  end generate;
  
  SET_LDOWN_FOR_SIM: if SIMULATION = true generate
    LDOWN_N_sgn <= '1';
    LFF_N_sgn <= '1';
  end generate SET_LDOWN_FOR_SIM;

  sendingFSM_sync : process(sysClk, state, ureset_in, LDOWN_N_sgn, uwen_cnt, busy_out_sgn)
  begin
    if ureset_in = '1' then
      state <= starting;
      link_rst <= '0';
      ureset_n_sgn <= '1';
    elsif rising_edge(sysClk) then
      link_rst <= link_rst_fsm;
      ureset_n_sgn <= ureset_n_sgn_fsm;
      state <= next_state;
      if(state = reseting and LDOWN_N_sgn = '1' and uwen_cnt /= "10") then
        uwen_cnt <= uwen_cnt + '1';
      else
        uwen_cnt <= "00";
      end if;
      if((state = sendingHeader or state = sendingTrailer) and busy_out_sgn = '0')then
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

    case state is
      when starting =>
        if(CLK_LOCKED_IN = '0') then
          next_state <= starting;
        else
          next_state <= reseting;
          link_rst_fsm   <= '1';
        end if;
      when reseting =>
        ureset_n_sgn_fsm <= '0';
        if(LDOWN_N_sgn = '1' and uwen_cnt = "10") then  --link becomes ready
          next_state <= idle;
        else
          next_state <= reseting;
        end if;
      when idle =>
        if(ENABLE_IN = '1') then
          next_state <= sendingHeader;
        else
          next_state <= idle;
        end if;
      when sendingHeader =>
        if(oh_index < 9) then
          next_state <= sendingHeader;
        else
          next_state <= sendingData;
        end if;
      when sendingData =>
        if(ENABLE_IN = '0') then
          next_state <= sendingTrailer;
        else
          next_state <= sendingData;
        end if;
      when sendingTrailer =>
        if(oh_index < 13) then
          next_state <= sendingTrailer;
        else
          next_state <= idle;
        end if;
    end case;
  end process;

  COUNT_DATA_WORDS : process (sysCLK)
  begin
    if rising_edge(sysCLK) then
      if state = IDLE then
        number_of_data_el <= (others => '0');
      elsif ready_out_l = '1' and state = sendingData then
        --one less for reading out last word (which is marker)
        number_of_data_el <= number_of_data_el + 1;
      else
        number_of_data_el <= number_of_data_el;
      end if;  
    end if;  
  end process COUNT_DATA_WORDS;

  
--Why this process is not clocked !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!??????????????????????????????????????????
  UWEN_process : process(state, busy_out_sgn)
--this process is responsible for controling user write enable. Each time we want the user data to be taken form UD port and 
--send via S-link we have to send UWEN_N to '0'. But one should remember that each time LinkFullFlag appears or LDOWN_N is
--set to '0' then we cannot send data because it will be lost
  begin
    if(((state = sendingHeader) or (state = sendingData) or (state = sendingTrailer)) and busy_out_sgn = '0') then
      uwen_allowed_n <= '0';
    else
      uwen_allowed_n <= '1';
    end if;
  end process;

  ports_driver : process(sysClk, state, LFF_N_sgn, oh_index, payload_in, oh)
  begin
--ready signal to output fifo used for reading 
    if(state = sendingData or oh_Index = 9) then  --9 read first word
      ready_out_l <= '1' and (not busy_out_sgn);  --newMP 
    else
      ready_out_l <= '0';
    end if;

--busy signal
    if(LFF_N_sgn = '0' or LDOWN_N_sgn = '0') then
      busy_out_sgn <= '1';
    else
      busy_out_sgn <= '0';
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
    if((state = sendingHeader and oh_Index = 0) or (state = sendingTrailer and oh_Index = 13)) then
      uctrl_n_sgn <= '0';
    else
      uctrl_n_sgn <= '1';
    end if;
  end process;

  OverheadPrepare : process(sysClk, oh, MODULE_ID)
  begin
    oh(0)  <= beginOfFrame;
    oh(1)  <= startOfHeader;
    oh(2)  <= HEADER_SIZE;
    oh(3)  <= majorFormatVersion & MINOR_FORMAT_VER;
    oh(4)  <= x"00" & SUB_DET_ID & MODULE_ID;
    oh(5)  <= RUN_TYPE & RUN_NUMBER;
    oh(6)  <= ECR_ID & ROD_L1_ID;
    oh(7)  <= x"00000" & ROD_BCN;
    oh(8)  <= x"000000"&TRIGGER_TYPE;
    oh(9)  <= DETECTOR_EVENT_TYPE;
    oh(10) <= b"00_0000_0000_0000_0000_0000_0000_0000" & NUMBER_OF_STAT_EL;
    oh(11) <= x"0000" & std_logic_vector(number_of_data_el);
    oh(12) <= b"000_0000_0000_0000_0000_0000_0000_0000" & STAT_BLOCK_POS;
    oh(13) <= endOfFrame;
    oh(14) <= (others => '0');
  end process;

  READY_OUT <= ready_out_l;
end Behavioral;

