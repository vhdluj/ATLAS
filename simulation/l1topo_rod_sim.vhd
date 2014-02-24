library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;




entity l1topo_rod_sim is
 
end l1topo_rod_sim;

library work;
use work.all;

architecture l1topo_rod_sim of l1topo_rod_sim is

  constant LINKS_NUMBER : integer := 8;
  
  signal A_CTRLBUS_P    : std_logic_vector(7 downto 0);
  signal A_CTRLBUS_N    : std_logic_vector(7 downto 0);
  signal A_CTRLBUS_P_IN : std_logic;
  signal A_CTRLBUS_N_IN : std_logic;
  
  signal B_CTRLBUS_P    : std_logic_vector(7 downto 0);
  signal B_CTRLBUS_N    : std_logic_vector(7 downto 0);
  signal B_CTRLBUS_P_IN : std_logic;
  signal B_CTRLBUS_N_IN : std_logic;

  signal MMCX         : std_logic;
  signal LhcClkInP    : std_logic;
  signal LhcClkInN    : std_logic;
  signal MMCX_U30     : std_logic;
  
  signal SFP_TX_P      : std_logic;
  signal SFP_TX_N      : std_logic;
  signal SFP_RX_P      : std_logic;
  signal SFP_RX_N      : std_logic;
  signal GCLK2_P       : std_logic;
  signal GCLK2_N       : std_logic;
  signal GTXCLK_P      : std_logic;
  signal GTXCLK_N      : std_logic;
  signal SFP3_LOS      : std_logic;
  signal SFP3_TXDIS    : std_logic;
  signal DATA_PIN_P_IN : std_logic_vector(LINKS_NUMBER - 1 downto 0);
  signal DATA_PIN_N_IN : std_logic_vector(LINKS_NUMBER - 1 downto 0);
  signal CTRLBUS_OUT_P : std_logic_vector(1 downto 0);
  signal CTRLBUS_OUT_N : std_logic_vector(1 downto 0);
  signal IPBUS_TX_P    : std_logic;
  signal IPBUS_TX_N    : std_logic;
  signal IPBUS_RX_P    : std_logic;
  signal IPBUS_RX_N    : std_logic;
  signal DATA_BANK18_IN_P : std_logic_vector(7 downto 0);
  signal DATA_BANK18_IN_N : std_logic_vector(7 downto 0);
  signal DATA_BANK16_IN_P : std_logic_vector(6 downto 0);
  signal DATA_BANK16_IN_N : std_logic_vector(6 downto 0);
begin

  VIRTEX_TOP_TEST_A: entity virtex_top_test
    port map (
      CTRLBUS_P    => A_CTRLBUS_P,
      CTRLBUS_N    => A_CTRLBUS_N,
      CTRLBUS_P_IN => A_CTRLBUS_P_IN,
      CTRLBUS_N_IN => A_CTRLBUS_N_IN,
      MMCX         => '0',--MMCX,
      LhcClkInP    => LhcClkInP,
      LhcClkInN    => LhcClkInN,
      MMCX_U30     => MMCX_U30);

   --VIRTEX_TOP_TEST_B: entity virtex_top_test
   -- port map (
   --   CTRLBUS_P    => B_CTRLBUS_P,
   --   CTRLBUS_N    => B_CTRLBUS_N,
   --   CTRLBUS_P_IN => B_CTRLBUS_P_IN,
   --   CTRLBUS_N_IN => B_CTRLBUS_N_IN,
   --   MMCX         => '0',--MMCX,
   --   LhcClkInP    => LhcClkInP,
   --   LhcClkInN    => LhcClkInN,
   --   MMCX_U30     => MMCX_U30);
  

  L1TOPO_KINTEX_TOP_INST: entity l1topo_kintex_top
    generic map (
      LINKS_NUMBER => LINKS_NUMBER)
    port map (
      SFP_TX_P      => SFP_TX_P,
      SFP_TX_N      => SFP_TX_N,
      SFP_RX_P      => SFP_RX_P,
      SFP_RX_N      => SFP_RX_N,
      GCLK2_P       => GCLK2_P,
      GCLK2_N       => GCLK2_N,
      GTXCLK_P      => GTXCLK_P,
      GTXCLK_N      => GTXCLK_N,
      SFP3_LOS      => '0',
      SFP3_TXDIS    => SFP3_TXDIS,
 --     DATA_PIN_P_IN => A_CTRLBUS_P,-- & B_CTRLBUS_P,
 --     DATA_PIN_N_IN => A_CTRLBUS_N,-- & B_CTRLBUS_N,
      DATA_BANK18_IN_P => DATA_BANK18_IN_P,
      DATA_BANK18_IN_N => DATA_BANK18_IN_N,
      DATA_BANK16_IN_P => DATA_BANK16_IN_P,
      DATA_BANK16_IN_N => DATA_BANK16_IN_N,
      
      CTRLBUS_OUT_P => CTRLBUS_OUT_P,
      CTRLBUS_OUT_N => CTRLBUS_OUT_N,
      IPBUS_TX_P    => IPBUS_TX_P,
      IPBUS_TX_N    => IPBUS_TX_N,
      IPBUS_RX_P    => IPBUS_RX_P,
      IPBUS_RX_N    => IPBUS_RX_N);


  DATA_BANK16_IN_P(0) <=  A_CTRLBUS_P(0);
  DATA_BANK16_IN_N(0) <=  A_CTRLBUS_N(0);

  DATA_BANK16_IN_P(1) <=  A_CTRLBUS_P(1);
  DATA_BANK16_IN_N(1) <=  A_CTRLBUS_N(1);
  
  DATA_BANK18_IN_P(4) <=  A_CTRLBUS_P(2);
  DATA_BANK18_IN_N(4) <=  A_CTRLBUS_N(2);
    
  DATA_BANK16_IN_P(2) <=  A_CTRLBUS_P(3);
  DATA_BANK16_IN_N(2) <=  A_CTRLBUS_N(3);

  DATA_BANK16_IN_P(3) <=   A_CTRLBUS_P(4);
  DATA_BANK16_IN_N(3) <=   A_CTRLBUS_N(4);
                                
  DATA_BANK18_IN_P(5) <=   A_CTRLBUS_P(5);
  DATA_BANK18_IN_N(5) <=   A_CTRLBUS_N(5); 
                                
  DATA_BANK18_IN_P(6) <=   A_CTRLBUS_P(6);
  DATA_BANK18_IN_N(6) <=   A_CTRLBUS_N(6);
                                
  DATA_BANK18_IN_P(7) <=   A_CTRLBUS_P(7);
  DATA_BANK18_IN_N(7) <=   A_CTRLBUS_N(7);

    
  A_CTRLBUS_P_IN <= CTRLBUS_OUT_P(0);
  A_CTRLBUS_N_IN <= CTRLBUS_OUT_N(0);
--  B_CTRLBUS_P_IN <= CTRLBUS_OUT_P(1);
--  B_CTRLBUS_N_IN <= CTRLBUS_OUT_N(1);
    
  CLOCK: process
  begin  -- process CLOCK
    GCLK2_P <= '1';
    GCLK2_N <= '0';
    wait for 12.5 ns;
    GCLK2_P <= '0';
    GCLK2_N <= '1';
    wait for 12.5 ns;
    
  end process CLOCK;
  
  LhcClkInP <= GCLK2_P; 
  LhcClkInN<= GCLK2_N; 
  
  process
  begin  -- process
    MMCX_U30 <= '0';
    wait for 5 us;
    MMCX_U30 <= '1';
    wait for 25 ns;
  end process;
  
end l1topo_rod_sim;
