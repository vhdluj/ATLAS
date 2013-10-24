-- TestBench Template 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rod_l1_topo_types_const.all;
entity testbench is
end testbench;

architecture behavior of testbench is

  component l1topo_to_ddr
    generic (
      MAKE_SYNCH_INPUT : integer);
    port (
      RESET                 : in  std_logic;
      DATA_IN_CLK           : in  std_logic;
      DATA_OUT_CLK          : in  std_logic;
      NUMBER_OF_SLICES      : in  slice_parameters_array_u;
      SLICE_CHANGES_APROVED : in  std_logic;
      LVL0_ACCEPTED         : in  std_logic;
      LVL0_VALID            : in  std_logic;
      LVL0_FULL_THR         : in  std_logic_vector(7 downto 0);
      LVL0_OFFSET           : in  slice_parameters_array_u;
      ROS_ROI_IN_DATA       : in  in_data_array;
      DATA_VALID_IN         : in  std_logic_vector(0 downto 0);
      OUT_DATA              : out std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES*ROS_OUTPUT_GRANURALITY-1 downto 0);
      DATA_VALID_OUT        : out std_logic;
      L0_BUSY               : out std_logic);
  end component;

  signal RESET                 : std_logic;
  signal DATA_IN_CLK           : std_logic;
  signal DATA_OUT_CLK          : std_logic;
  signal NUMBER_OF_SLICES      : slice_parameters_array_u;
  signal SLICE_CHANGES_APROVED : std_logic;
  signal LVL0_ACCEPTED         : std_logic;
  signal LVL0_VALID            : std_logic;
  signal LVL0_FULL_THR         : std_logic_vector(7 downto 0);
  signal LVL0_OFFSET           : slice_parameters_array_u;
  signal ROS_ROI_IN_DATA       : in_data_array;
  signal DATA_VALID_IN         : std_logic_vector(0 downto 0);
  signal OUT_DATA              : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES*ROS_OUTPUT_GRANURALITY-1 downto 0);
  signal DATA_VALID_OUT        : std_logic;
  signal L0_BUSY               : std_logic;

  
begin
  l1topo_to_ddr_1: l1topo_to_ddr
    generic map (
      MAKE_SYNCH_INPUT => 0)
    port map (
      RESET                 => RESET,
      DATA_IN_CLK           => DATA_IN_CLK,
      DATA_OUT_CLK          => DATA_OUT_CLK,
      NUMBER_OF_SLICES      => NUMBER_OF_SLICES,
      SLICE_CHANGES_APROVED => SLICE_CHANGES_APROVED,
      LVL0_ACCEPTED         => LVL0_ACCEPTED,
      LVL0_VALID            => LVL0_VALID,
      LVL0_FULL_THR         => LVL0_FULL_THR,
      LVL0_OFFSET           => LVL0_OFFSET,
      ROS_ROI_IN_DATA       => ROS_ROI_IN_DATA,
      DATA_VALID_IN         => DATA_VALID_IN,
      OUT_DATA              => OUT_DATA,
      DATA_VALID_OUT        => DATA_VALID_OUT,
      L0_BUSY               => L0_BUSY);
  

  ASSIGN_NUMBER_OF_SLICES : for i in 0 to NUMBER_OF_SLICES'length-1 generate
    NUMBER_OF_SLICES(i) <= to_unsigned((i mod 16)+1, NUMBER_OF_SLICES(0)'length);
    LVL0_OFFSET(i)      <= to_unsigned(0, LVL0_OFFSET(0)'length);--to_unsigned(i mod 8, LVL0_OFFSET(0)'length);
  end generate ASSIGN_NUMBER_OF_SLICES;

  ASSIGN_ROS_DATA: for i in 0 to ROS_ROI_IN_DATA'length-1 generate
    ROS_ROI_IN_DATA(i) <= std_logic_vector(to_unsigned(((i mod ROS_ROI_IN_DATA'length)+1), ROS_ROI_IN_DATA(0)'length));
  end generate ASSIGN_ROS_DATA;
    
  LVL0_FULL_THR <= x"f0";

  clock40 : process
  begin
    DATA_IN_CLK <= '1';
    wait for 25 ns;
    DATA_IN_CLK <= '0';
    wait for 25 ns;
  end process clock40;

  clock125 : process
  begin
    DATA_out_CLK <= '1';
    wait for 8 ns;
    DATA_out_CLK <= '0';
    wait for 8 ns;
  end process clock125;



  reset_proc : process
  begin
    reset      <= '1';
    wait for 100 ns;  
    reset      <= '0';
    wait for 1 us;
    LVL0_VALID <= '1';
    wait;                               -- will wait forever
  end process reset_proc;

  set_slice : process
  begin  -- process
    SLICE_CHANGES_APROVED <= '0';
    wait for 1 us;
    SLICE_CHANGES_APROVED <= '1';
    wait;
  end process;

  set_l0_valid : process 
  begin
    LVL0_ACCEPTED <= '0';
    wait for 2 us;
    LVL0_ACCEPTED <= '1';
    wait for 25 ns;
    LVL0_ACCEPTED <= '0';
  end process;

  set_data_vaalid:process
  begin
    DATA_VALID_IN <= "0";
    wait for 100 ns;
    DATA_VALID_IN <= "1";
    wait;
  end process;
  
end;
