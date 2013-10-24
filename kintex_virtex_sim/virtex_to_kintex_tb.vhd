library UNISIM;
use UNISIM.VComponents.all;
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;
use work.rod_l1_topo_types_const.all;

library work;
use work.all;

entity virtex_to_kintex_tb is
end virtex_to_kintex_tb;

architecture virtex_to_kinetx_tb of virtex_to_kintex_tb is
  component virtex_top_test
    port (
      CTRLBUS_P    : out std_logic_vector(7 downto 0);
      CTRLBUS_N    : out std_logic_vector(7 downto 0);
      CTRLBUS_P_IN : in  std_logic;
      CTRLBUS_N_IN : in  std_logic;
      MMCX         : in  std_logic;
      LhcClkInP    : in  std_logic;
      LhcClkInN    : in  std_logic;
      MMCX_U30     : in  std_logic);
  end component;

  component main
    generic (
      LINKS_NUMBER : integer range 0 to 40);
    port (
      SFP_TX_P      : out std_logic;
      SFP_TX_N      : out std_logic;
      SFP_RX_P      : in  std_logic;
      SFP_RX_N      : in  std_logic;
      GCLK2_P       : in  std_logic;
      GCLK2_N       : in  std_logic;
      GTXCLK_P      : in  std_logic;
      GTXCLK_N      : in  std_logic;
      SFP3_LOS      : in  std_logic;
      SFP3_TXDIS    : out std_logic;
      DATA_PIN_P_IN : in  std_logic_vector(LINKS_NUMBER - 1 downto 0);
      DATA_PIN_N_IN : in  std_logic_vector(LINKS_NUMBER - 1 downto 0);
      CTRLBUS_OUT_P : out std_logic_vector(1 downto 0);
      CTRLBUS_OUT_N : out std_logic_vector(1 downto 0);
      IPBUS_TX_P    : out std_logic;
      IPBUS_TX_N    : out std_logic;
      IPBUS_RX_P    : in  std_logic;
      IPBUS_RX_N    : in  std_logic;
      PHY_RESET_N   : out std_logic);
  end component;

  signal CTRLBUS_P    : std_logic_vector(7 downto 0);
  signal CTRLBUS_N    : std_logic_vector(7 downto 0);
  signal CTRLBUS_P_IN : std_logic;
  signal CTRLBUS_N_IN : std_logic;
  signal MMCX         : std_logic;
  signal LhcClkInP    : std_logic;
  signal LhcClkInN    : std_logic;
  signal MMCX_U30     : std_logic;

  -----------------------------------------------------------------------------
  -- ddr
  -----------------------------------------------------------------------------
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
  signal DATA_PIN_P_IN : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES*2 - 1 downto 0);
  signal DATA_PIN_N_IN : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES*2 - 1 downto 0);
  signal CTRLBUS_OUT_P : std_logic_vector(1 downto 0);
  signal CTRLBUS_OUT_N : std_logic_vector(1 downto 0);
  signal IPBUS_TX_P    : std_logic;
  signal IPBUS_TX_N    : std_logic;
  signal IPBUS_RX_P    : std_logic;
  signal IPBUS_RX_N    : std_logic;
  signal PHY_RESET_N   : std_logic;
  
  
begin

  virtex_top_test_1: virtex_top_test
    port map (
      CTRLBUS_P    => DATA_PIN_P_IN(15 downto 8),
      CTRLBUS_N    => DATA_PIN_N_IN(15 downto 8),
      CTRLBUS_P_IN => CTRLBUS_OUT_P(1),
      CTRLBUS_N_IN => CTRLBUS_OUT_N(1),
      MMCX         => MMCX,
      LhcClkInP    => GCLK2_P,
      LhcClkInN    => GCLK2_N,
      MMCX_U30     => MMCX_U30);

  main_1: main
    generic map (
      LINKS_NUMBER => NUMBER_OF_ROS_OUTPUT_BUSES*2)
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
      DATA_PIN_P_IN => DATA_PIN_P_IN,
      DATA_PIN_N_IN => DATA_PIN_N_IN,
      CTRLBUS_OUT_P => CTRLBUS_OUT_P,
      CTRLBUS_OUT_N => CTRLBUS_OUT_N,
      IPBUS_TX_P    => IPBUS_TX_P,
      IPBUS_TX_N    => IPBUS_TX_N,
      IPBUS_RX_P    => IPBUS_RX_P,
      IPBUS_RX_N    => IPBUS_RX_N,
      PHY_RESET_N   => PHY_RESET_N);

  clock40 : process
  begin
    GCLK2_P <= '1';
    GCLK2_N <= '0';
    wait for 25 ns; 
    GCLK2_P <= '0';
    GCLK2_N <= '1';
    wait for 25 ns;
  end process clock40;

  --my_proc : process
  --begin
    
  --  wait;                               -- will wait forever
  --end process my_proc;

  MMCX_U30 <= '0';

end virtex_to_kinetx_tb;
