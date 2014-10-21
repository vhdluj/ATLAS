-------------------------------------------------------------------------------
-- Title      : HOLA LSC implementation with on-chip SERDES for Virtex-6
-- Project    : S-LINK
-------------------------------------------------------------------------------
-- File       : hola_lsc_vtx6.vhd
-- Author     : Stefan Haas
-- Company    : CERN PH-ATE
-- Created    : 24-11-11
-- Last update: 2014-06-30
-- Platform   : Windows XP
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 CERN PH-ATE
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 24-11-11  1.0      haass     Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

entity hola_lsc_vtx6 is

  generic (SIMULATION : integer := 0);

  port (TLK_RXCLK_IN    : in  std_logic;
        TLK_GTXCLK_IN   : in  std_logic;
        SYS_RST         : in  std_logic;
        LSC_RESET_IN    : in  std_logic;
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
        -- LEDs
        TESTLED_N       : out std_logic;
        LDERRLED_N      : out std_logic;
        LUPLED_N        : out std_logic;
        FLOWCTLLED_N    : out std_logic;
        ACTIVITYLED_N   : out std_logic;
        
        LSC_RST_N_OUT : out std_logic;
        TX_ER_OUT : out std_logic;
        --ps debugging
		  
		  DBG_TXD_OUT, DBG_RXD_OUT : out std_logic_vector(15 downto 0);
		  DBG_TX_EN_OUT, DBG_TX_ER_OUT, DBG_RX_DV_OUT, DBG_RX_ER_OUT : out std_logic;
		  
        GTX_TXRESETDONE_DEBUG : out std_logic;
  		GTX_RESET_DEBUG  : out std_logic;
  		GTX_CPLLOCK_DEBUG  : out std_logic ;       
        TLK_RXCLK : out std_logic;
        
        
        -- GK connections to external gtx 
        TLK_SYS_RST            : in  std_logic;
        -- GTX receive ports
        GTX_RXUSRCLK2      : in  std_logic;
        GTX_RXDATA         : in  std_logic_vector(15 downto 0);
        GTX_RXCHARISK      : in  std_logic_vector(1 downto 0);
        GTX_RXENCOMMAALIGN : out std_logic;
        -- GTX transmit ports
        GTX_TXUSRCLK2      : in  std_logic;
        GTX_TXCHARISK      : out std_logic_vector(1 downto 0);
        GTX_TXDATA         : out std_logic_vector(15 downto 0)
        );

end entity hola_lsc_vtx6;

-------------------------------------------------------------------------------

architecture structure of hola_lsc_vtx6 is



  signal LSC_RST_N     : std_logic;
  signal TLK_GTXCLK    : std_logic;
  signal TLK_TXD       : std_logic_vector(15 downto 0);
  signal TLK_TXEN      : std_logic;
  signal TLK_TXER      : std_logic;
  --signal TLK_RXCLK     : std_logic;
  signal TLK_RXD       : std_logic_vector(15 downto 0);
  signal TLK_RXDV      : std_logic;
  signal TLK_RXER      : std_logic;
  signal TLK_ENABLE    : std_logic;
  --ps deb
   signal   GTX_TXRESETDONE_DEBUGsgn   : std_logic;  
   signal   GTX_RESET_DEBUGsgn         : std_logic;  
   signal   GTX_CPLLOCK_DEBUGsgn       : std_logic;
   signal    TLK_RXCLK_sgn : std_logic;  
  signal RX_cnt : std_logic_vector(7 downto 0) := x"00";
  
attribute keep : string;
attribute keep of RX_cnt : signal is "true";

  
  
begin  -- architecture structure

LSC_RST_N_OUT  <= LSC_RST_N;
TX_ER_OUT  <= TLK_TXER;


        --ps debugging
        GTX_TXRESETDONE_DEBUG  <= '0'; --GTX_TXRESETDONE_DEBUGsgn;
  		GTX_RESET_DEBUG  <= '0'; --GTX_RESET_DEBUGsgn;
  		GTX_CPLLOCK_DEBUG  <=  '0'; --GTX_CPLLOCK_DEBUGsgn;
		
		TLK_RXCLK <= TLK_RXCLK_sgn;
		
  holalsc_core_1 : entity work.holalsc_core
    generic map (SIMULATION      => SIMULATION,
                 ALTERA_XILINX   => 0,    -- XILINX
                 XCLK_FREQ       => 100,  -- XCLK = 100 MHz
                 USE_PLL         => 0,    -- Do not use PLL to generate ICLK_2
                 USE_ICLK2       => 0,    -- use external ICLK2 input
                 ACTIVITY_LENGTH => 15,
                 FIFODEPTH       => 64,
                 LOG2DEPTH       => 6,
                 FULLMARGIN      => 16)
    port map (POWER_UP_RST_N => LSC_RST_N,
              UD             => UD,
              URESET_N       => URESET_N,
              UTEST_N        => UTEST_N,
              UCTRL_N        => UCTRL_N,
              UWEN_N         => UWEN_N,
              UCLK           => UCLK,
              LFF_N          => LFF_N,
              LRL            => LRL,
              LDOWN_N        => LDOWN_N,
              TESTLED_N      => TESTLED_N,
              LDERRLED_N     => LDERRLED_N,
              LUPLED_N       => LUPLED_N,
              FLOWCTLLED_N   => FLOWCTLLED_N,
              ACTIVITYLED_N  => ACTIVITYLED_N,
              XCLK           => TLK_GTXCLK,
              ENABLE         => TLK_ENABLE,
              TXD            => TLK_TXD,
              TX_EN          => TLK_TXEN,
              TX_ER          => TLK_TXER,
              RXD            => TLK_RXD,
              RX_CLK         => TLK_RXCLK_sgn,
              RX_ER          => TLK_RXER,
              RX_DV          => TLK_RXDV);
				  
				  DBG_TXD_OUT <= TLK_TXD;
				  DBG_RXD_OUT <= TLK_RXD;
				  DBG_TX_EN_OUT <= TLK_TXEN;
				  DBG_TX_ER_OUT <= TLK_TXER;
				  DBG_RX_DV_OUT <= TLK_RXDV;
				  DBG_RX_ER_OUT <= TLK_RXER;

  --tlk_wrapper_vtx6_1 : entity work.tlk_wrapper_vtx6
--  tlk_wrapper_k7_1 :  entity work.tlk_wrapper_k7
--    generic map (SIM_GTXRESET_SPEEDUP => SIMULATION)
--    port map (MGTREFCLK_P   => MGTREFCLK_P,
--              MGTREFCLK_N   => MGTREFCLK_N,
--              CLK_LOCKED    => CLK_LOCKED,
--              GTX_RESET     => SYS_RST,  -- Reset the GTX on power-up
--              GTX_RESETDONE => GTX_RESETDONE,
--              GTX_RXN       => TLK_SIN_N,
--              GTX_RXP       => TLK_SIN_P,
--              GTX_TXN       => TLK_SOUT_N,
--              GTX_TXP       => TLK_SOUT_P,
--              TLK_GTXCLK    => TLK_GTXCLK,
--              TLK_TXD       => TLK_TXD,
--              TLK_TXEN      => TLK_TXEN,
--              TLK_TXER      => TLK_TXER,
--              TLK_RXCLK     => TLK_RXCLK_sgn,
--              TLK_RXD       => TLK_RXD,
--              TLK_RXDV      => TLK_RXDV,
--              TLK_RXER      => TLK_RXER,
--              --ps
--              GTX_TXRESETDONE_DEBUG  => GTX_TXRESETDONE_DEBUGsgn,
--  		      GTX_RESET_DEBUG  => GTX_RESET_DEBUGsgn, 
--  		      GTX_CPLLOCK_DEBUG   => GTX_CPLLOCK_DEBUGsgn
--              
--              
--              );

TLK_RXCLK_sgn <= TLK_RXCLK_IN;
TLK_GTXCLK <= TLK_GTXCLK_IN;

  -----------------------------------------------------------------------------
  -- Interface from TLK2501 ports to Virtex-6 GTX
  -----------------------------------------------------------------------------
  tlk_gtx_interface_1 : entity work.tlk_gtx_interface
    port map (SYS_RST            => TLK_SYS_RST,
              GTX_RXUSRCLK2      => GTX_RXUSRCLK2,
              GTX_RXDATA         => GTX_RXDATA,
              GTX_RXCHARISK      => GTX_RXCHARISK,
              GTX_RXENCOMMAALIGN => GTX_RXENCOMMAALIGN,
              GTX_TXUSRCLK2      => GTX_TXUSRCLK2,
              GTX_TXCHARISK      => GTX_TXCHARISK,
              GTX_TXDATA         => GTX_TXDATA,
              TLK_TXD            => TLK_TXD,
              TLK_TXEN           => TLK_TXEN,
              TLK_TXER           => TLK_TXER,
              TLK_RXD            => TLK_RXD,
              TLK_RXDV           => TLK_RXDV,
              TLK_RXER           => TLK_RXER);
              

  -----------------------------------------------------------------------------
  -- Resets
  -----------------------------------------------------------------------------
  -- Hold the LSC core in reset until the GTX is initialized
  LSC_RST_N <= (not SYS_RST) and LSC_RESET_IN;
  
  reconstructed_clock_Test : process(TLK_RXCLK_sgn)
  begin
  	if rising_edge(TLK_RXCLK_sgn) then
  		RX_cnt  <= RX_cnt + x"1";
  	end if;
  end process;
  
               
end architecture structure;
