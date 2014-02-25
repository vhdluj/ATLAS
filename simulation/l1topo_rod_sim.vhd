library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;




entity l1topo_rod_sim is 
end l1topo_rod_sim;



architecture l1topo_rod_sim of l1topo_rod_sim is
  constant SIMULATION           : boolean := true;
  
  --component top_TopoVirtex
  --  generic (
  --    LINES_NUMBER : integer;
  --    SIMULATION   : boolean);
  --  port (
  --    GCK2_IN_P, GCK2_IN_N             : in  std_logic;
  --    CTRLIPBUS_P_IN, CTRLIPBUS_N_IN   : in  std_logic_vector(4 downto 0);
  --    CTRLIPBUS_P_OUT, CTRLIPBUS_N_OUT : out std_logic_vector(2 downto 0);
  --    LED_OUT                          : out std_logic;
  --    CTRLBUS_P                        : out std_logic_vector(LINES_NUMBER-1 downto 0);
  --    CTRLBUS_N                        : out std_logic_vector(LINES_NUMBER-1 downto 0);
  --    CTRLBUS_P_IN                     : in  std_logic;
  --    CTRLBUS_N_IN                     : in  std_logic;
  --    ROD_CONTROL_P_IN                 : in  std_logic;
  --    ROD_CONTROL_N_IN                 : in  std_logic);
  --end component;

  --component top
  --  generic (
  --    LINKS_NUMBER : integer range 0 to 40;
  --    SIMULATION   : boolean);
  --  port (
  --    gt_clkp, gt_clkn                       : in  std_logic;
  --    gt_txp, gt_txn                         : out std_logic;
  --    gt_rxp, gt_rxn                         : in  std_logic;
  --    GCK2_IN_P, GCK2_IN_N                   : in  std_logic;
  --    CTRLBUS_U1_IN_P, CTRLBUS_U1_IN_N       : in  std_logic_vector(2 downto 0);
  --    CTRLBUS_U2_IN_P, CTRLBUS_U2_IN_N       : in  std_logic_vector(2 downto 0);
  --    CTRLBUS_U1_OUT_P, CTRLBUS_U1_OUT_N     : out std_logic_vector(4 downto 0);
  --    CTRLBUS_U2_OUT_P, CTRLBUS_U2_OUT_N     : out std_logic_vector(4 downto 0);
  --    DATA_U1_CTRL_OUT_P, DATA_U1_CTRL_OUT_N : out std_logic;
  --    DATA_U2_CTRL_OUT_P, DATA_U2_CTRL_OUT_N : out std_logic;
  --    DATA_U2_SYNC_OUT_P, DATA_U2_SYNC_OUT_N : out std_logic;
  --    DATA_BANK18_IN_P, DATA_BANK18_IN_N     : in  std_logic_vector(7 downto 0);
  --    DATA_BANK16_IN_P, DATA_BANK16_IN_N     : in  std_logic_vector(6 downto 0);
  --    PHY_RESET_OUT_N                        : out std_logic;
  --    LED_OUT                                : out STD_LOGIC_VECTOR(15 downto 0));
  --end component;
  
  constant LINKS_NUMBER         : integer              := 8;
  signal GCK2_IN_P, GCK2_IN_N             : std_logic;
  signal CTRLIPBUS_P_IN, CTRLIPBUS_N_IN   : std_logic_vector(4 downto 0);
  signal CTRLIPBUS_P_OUT, CTRLIPBUS_N_OUT : std_logic_vector(2 downto 0);

  signal CTRLBUS_P                        : std_logic_vector(LINKS_NUMBER-1 downto 0);
  signal CTRLBUS_N                        : std_logic_vector(LINKS_NUMBER-1 downto 0);
  signal CTRLBUS_P_IN                     : std_logic;
  signal CTRLBUS_N_IN                     : std_logic;
  signal ROD_CONTROL_P_IN                 : std_logic;
  signal ROD_CONTROL_N_IN                 : std_logic;

  


  signal   gt_clkp, gt_clkn     : std_logic;
  signal   gt_txp, gt_txn       : std_logic;
  signal   gt_rxp, gt_rxn       : std_logic;
  

  signal CTRLBUS_U1_IN_P, CTRLBUS_U1_IN_N   : std_logic_vector(2 downto 0);
  signal CTRLBUS_U2_IN_P, CTRLBUS_U2_IN_N   : std_logic_vector(2 downto 0);
  signal CTRLBUS_U1_OUT_P, CTRLBUS_U1_OUT_N : std_logic_vector(4 downto 0);
  signal CTRLBUS_U2_OUT_P, CTRLBUS_U2_OUT_N : std_logic_vector(4 downto 0);

  signal DATA_U1_CTRL_OUT_P, DATA_U1_CTRL_OUT_N : std_logic;
  signal DATA_U2_CTRL_OUT_P, DATA_U2_CTRL_OUT_N : std_logic;
  signal DATA_U2_SYNC_OUT_P, DATA_U2_SYNC_OUT_N : std_logic;
--signal--      DATA_BANK17_IN_P, DATA_BANK17_IN_N :  std_logic_vector(1 downto 0);
--signal--      DATA_BANK32_IN_P, DATA_BANK32_IN_N :  std_logic_vector(4 downto 0);
  signal DATA_BANK18_IN_P, DATA_BANK18_IN_N     : std_logic_vector(7 downto 0);
  signal DATA_BANK16_IN_P, DATA_BANK16_IN_N     : std_logic_vector(6 downto 0);

  signal PHY_RESET_OUT_N : std_logic;
 
--signal        SFP3_RX_N, SFP3_RX_P :  std_logic;
  signal SFP3_TX_N, SFP3_TX_P : std_logic;
  signal MMCX_U30_PIN : std_logic;
    


  

begin

  TOP_TOPOVIRTEX_INST: entity work.top_TopoVirtex(top_TopoVirtex)
    generic map (
      LINES_NUMBER => LINKS_NUMBER,
      SIMULATION   => SIMULATION)
    port map (
      GCK2_IN_P        => GCK2_IN_P,
      GCK2_IN_N        => GCK2_IN_N,
      CTRLIPBUS_P_IN   => CTRLIPBUS_P_IN,
      CTRLIPBUS_N_IN   => CTRLIPBUS_N_IN,
      CTRLIPBUS_P_OUT  => CTRLIPBUS_P_OUT,
      CTRLIPBUS_N_OUT  => CTRLIPBUS_N_OUT,
      LED_OUT          => open,
      CTRLBUS_P        => CTRLBUS_P,
      CTRLBUS_N        => CTRLBUS_N,
      CTRLBUS_P_IN     => DATA_U2_CTRL_OUT_P,
      CTRLBUS_N_IN     => DATA_U2_CTRL_OUT_N,
      ROD_CONTROL_P_IN => DATA_U2_SYNC_OUT_P, 
      ROD_CONTROL_N_IN => DATA_U2_SYNC_OUT_N,
      MMCX_U30_PIN     => MMCX_U30_PIN);

  KINTEX_TOP_INST : entity work.top 
    generic map(
      LINKS_NUMBER => LINKS_NUMBER,
      SIMULATION   => SIMULATION
      )
      port map(
        gt_clkp   => gt_clkp,
        gt_clkn   => gt_clkn,
        gt_txp    => gt_txp,
        gt_txn    => gt_txn,
        gt_rxp    => gt_rxp,
        gt_rxn    => gt_rxn,
        GCK2_IN_P => GCK2_IN_P,
        GCK2_IN_N => GCK2_IN_N,

        CTRLBUS_U1_IN_P  => CTRLBUS_U1_IN_P,
        CTRLBUS_U1_IN_N  => CTRLBUS_U1_IN_N,
        CTRLBUS_U2_IN_P  => CTRLBUS_U2_IN_P,
        CTRLBUS_U2_IN_N  => CTRLBUS_U2_IN_N,
        CTRLBUS_U1_OUT_P => CTRLBUS_U1_OUT_P,
        CTRLBUS_U1_OUT_N => CTRLBUS_U1_OUT_N,
        CTRLBUS_U2_OUT_P => CTRLBUS_U2_OUT_P,
        CTRLBUS_U2_OUT_N => CTRLBUS_U2_OUT_N,

        DATA_U1_CTRL_OUT_P => DATA_U1_CTRL_OUT_P,
        DATA_U1_CTRL_OUT_N => DATA_U1_CTRL_OUT_N,
        DATA_U2_CTRL_OUT_P => DATA_U2_CTRL_OUT_P,
        DATA_U2_CTRL_OUT_N => DATA_U2_CTRL_OUT_N,
        DATA_U2_SYNC_OUT_P => DATA_U2_SYNC_OUT_P,
        DATA_U2_SYNC_OUT_N => DATA_U2_SYNC_OUT_N,
--      DATA_BANK17_IN_P, DATA_BANK17_IN_N : in std_logic_vector(1 downto 0),
--      DATA_BANK32_IN_P, DATA_BANK32_IN_N : in std_logic_vector(4 downto 0),
        DATA_BANK18_IN_P   => DATA_BANK18_IN_P,
        DATA_BANK18_IN_N   => DATA_BANK18_IN_N,
        DATA_BANK16_IN_P   => DATA_BANK16_IN_P,
        DATA_BANK16_IN_N   => DATA_BANK16_IN_N,
        
        PHY_RESET_OUT_N => PHY_RESET_OUT_N,
        LED_OUT         => open

--      SFP3_RX_N, SFP3_RX_P : in std_logic,
--      SFP3_TX_N, SFP3_TX_P : out std_logic
        );



 DATA_BANK16_IN_P (0) <=  CTRLBUS_P(0);
 DATA_BANK16_IN_N (0) <=  CTRLBUS_N(0);

 DATA_BANK16_IN_P (1) <=  CTRLBUS_P(1);
 DATA_BANK16_IN_N (1) <=  CTRLBUS_N(1);
  
 DATA_BANK18_IN_P (2) <=  CTRLBUS_P(4);
 DATA_BANK18_IN_N (2) <=  CTRLBUS_N(4);
  
 DATA_BANK16_IN_P (2) <=  CTRLBUS_P(2);
 DATA_BANK16_IN_N (2) <=  CTRLBUS_N(2);

 DATA_BANK16_IN_P (3) <=  CTRLBUS_P(3);
 DATA_BANK16_IN_N (3) <=  CTRLBUS_N(3);
                                   
 DATA_BANK18_IN_P (5) <=  CTRLBUS_P(5);
 DATA_BANK18_IN_N (5) <=  CTRLBUS_N(5); 
                                   
 DATA_BANK18_IN_P (6) <=  CTRLBUS_P(6);
 DATA_BANK18_IN_N (6) <=  CTRLBUS_N(6);
                                   
 DATA_BANK18_IN_P (7) <=  CTRLBUS_P(7);
 DATA_BANK18_IN_N (7) <=  CTRLBUS_N(7);

    
-------------------------------------------------------------------------------
-- clocks
-------------------------------------------------------------------------------
  
  GT_CLOCK: process
  begin  -- process CLOCK
    gt_clkp <= '1';
    gt_clkn <= '0';
    wait for 4 ns;
    gt_clkp <= '0';
    gt_clkn <= '1';
    wait for 4 ns;
  end process GT_CLOCK;

  GC_CLOCK: process
  begin  -- process CLOCK
    GCK2_IN_P <= '1';
    GCK2_IN_N <= '0';
    wait for 12.5 ns;
    GCK2_IN_P <= '0';
    GCK2_IN_N <= '1';
    wait for 12.5 ns;
  end process GC_CLOCK;

  
  
  process
  begin  -- process
    MMCX_U30_PIN <= '0';
    wait for 5 us;
    MMCX_U30_PIN <= '1';
    wait for 25 ns;
  end process;
  
end l1topo_rod_sim;
