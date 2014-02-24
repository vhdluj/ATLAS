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
--use work.all;


entity virtex_top_test is

  generic (
    SIMULATION : boolean := true);

  port (
    CTRLBUS_P                  : out std_logic_vector(7 downto 0);
    CTRLBUS_N                  : out std_logic_vector(7 downto 0);
    CTRLBUS_P_IN               : in  std_logic;
    CTRLBUS_N_IN               : in  std_logic;
    
    MMCX                       : in  std_logic;
    LhcClkInP : in std_logic;
    LhcClkInN : in std_logic;
    --TC_ReadRequestP         : in std_logic;
    --TTC_ReadRequestN : in std_logic;

    --TTC_BroadcastP : in std_logic;
    --TTC_BroadcastN : in std_logic;
    
    --TTC_BunchChounterResetP : in std_logic;
    --TTC_BunchChounterResetN : in std_logic;
    MMCX_U30 : in std_logic
    
  );
end virtex_top_test;

architecture virtex_top_test of virtex_top_test is

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
      OUT_DATA              : out std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0);
      DATA_VALID_OUT        : out std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
      L0_BUSY               : out std_logic;
      SPECIAL_CHARACTER_OUT : out std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0));
  end component;
  
  component TransmittersWrapper
    generic (
      LINKS_NUMBER : integer);
    port (
      RESET          : in  std_logic;
      CLK_BIT_IN     : in  std_logic;
      CLK_WORD_IN    : in  std_logic;
      DATA_IN        : in  std_logic_vector(8*LINKS_NUMBER-1 downto 0);
      DATA_VALID_IN  : in  std_logic_vector(LINKS_NUMBER-1 downto 0);
      DATA_KCTRL_IN  : in  std_logic_vector(LINKS_NUMBER-1 downto 0);
      DATA_PIN_P_OUT : out std_logic_vector(LINKS_NUMBER-1 downto 0);
      DATA_PIN_N_OUT : out std_logic_vector(LINKS_NUMBER-1 downto 0));
  end component;

  component simple_top
    port (
      CLK_IN_40 : in  std_logic;
      RESET     : in  std_logic;
      OUT_DATA  : out in_data_array);
  end component;
  
  component DCM
    port (
      clk_in1_p : in  std_logic;
      clk_in1_n : in  std_logic;
      clk_40    : out std_logic;
      clk_90    : out std_logic;
      clk_450   : out std_logic;
      reset     : in  std_logic;
      locked    : out std_logic);
  end component;
  
  signal read_request : std_logic;
  signal broadcast    : std_logic;
  signal bc_reset     : std_logic;

  signal bram_input_count_reset : std_logic;

  signal clk_400 : std_logic;
  signal clk_80  : std_logic;
  signal clk_40  : std_logic;
  signal mmcm_locked : std_logic;

  signal mmcx_u30_synch_a, mmcx_u30_synch_b  : std_logic;
  signal l1A_pulse : std_logic;

  signal local_reset, local_reset_synch, local_reset_synch_a, local_reset_synch_b, local_reset_synch_c : std_logic;
  
  -----------------------------------------------------------------------------
  -- virtex rod
  -----------------------------------------------------------------------------
  
  signal number_of_slices      : slice_parameters_array_u;
  signal slice_changes_aproved : std_logic;
  signal lvl0_accepted         : std_logic;
  signal lvl0_valid            : std_logic;
  --signal lvl0_full_thr         : std_logic_vector(7 downto 0);
  signal lvl0_offset           : slice_parameters_array_u;
  signal ros_roi_in_data       : in_data_array;
  signal data_valid_in         : std_logic_vector(0 downto 0);
  signal out_data              : std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0);
  signal data_valid_out        : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
  signal l0_busy               : std_logic;
  signal special_character_out : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0) := (others => '0');
  signal global_reset_cnt      : unsigned(15 downto 0):=(others => '0');
  signal kintex_ready, kintex_ready_synch_a, kintex_ready_synch_b, kintex_ready_pulse : std_logic:='0';
  signal ready_counter : unsigned(15 downto 0) := (others => '0');
  signal confirm_interal_settings : std_logic;
  signal cntr_for_ros_roi_bus : in_data_array := (others => (others => '0'));           

begin

  --IBUFDS_inst_0 : IBUFDS
  --  generic map (
  --    DIFF_TERM    => false,            -- Differential Termination 
  --    IBUF_LOW_PWR => true,  -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
  --    IOSTANDARD   => "DEFAULT")
  --  port map (
  --    O  => read_request,               -- Buffer output
  --    I  => TTC_ReadRequestP,  -- Diff_p buffer input (connect directly to top-level port)
  --    IB => TTC_ReadRequestN  -- Diff_n buffer input (connect directly to top-level port)
  --    );

  --IBUFDS_inst_1 : IBUFDS
  --  generic map (
  --    DIFF_TERM    => false,            -- Differential Termination 
  --    IBUF_LOW_PWR => true,  -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
  --    IOSTANDARD   => "DEFAULT")
  --  port map (
  --    O  => broadcast,                  -- Buffer output
  --    I  => TTC_BroadcastP,  -- Diff_p buffer input (connect directly to top-level port)
  --    IB => TTC_BroadcastN  -- Diff_n buffer input (connect directly to top-level port)
  --    );

  --IBUFDS_inst_2 : IBUFDS
  --  generic map (
  --    DIFF_TERM    => false,            -- Differential Termination 
  --    IBUF_LOW_PWR => true,  -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
  --    IOSTANDARD   => "DEFAULT")
  --  port map (
  --    O  => bc_reset,                   -- Buffer output
  --    I  => TTC_BunchChounterResetP,  -- Diff_p buffer input (connect directly to top-level port)
  --    IB => TTC_BunchChounterResetN  -- Diff_n buffer input (connect directly to top-level port)
  --    );

 --  bram_input_count_reset <= local_rest; broadcast;  --?????????? not ??????????

  --local_reset <= not mmcm_locked;
  
  IBUFDS_inst_0 : IBUFDS
    generic map (
      DIFF_TERM    => true,            -- Differential Termination 
      IBUF_LOW_PWR => false,  -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
      IOSTANDARD   => "DEFAULT")
    port map (
      O  => KINTEX_READY,               -- Buffer output
      I  => CTRLBUS_P_IN,  -- Diff_p buffer input (connect directly to top-level port)
      IB => CTRLBUS_N_IN  -- Diff_n buffer input (connect directly to top-level port)
      );
  
  DETECT_FALLING_EDGE : process (clk_40)
  begin
    if rising_edge(clk_40) then
      if kintex_ready_synch_a = '1' and kintex_ready_synch_b = '0'  then
        kintex_ready_pulse <= '1';
        kintex_ready_synch_a <= KINTEX_READY;
        kintex_ready_synch_b <= kintex_ready_synch_a; 
      else
        kintex_ready_pulse <= '0';
        kintex_ready_synch_a <= KINTEX_READY;
        kintex_ready_synch_b <= kintex_ready_synch_a; 
      end if;
    end if;
  end process DETECT_FALLING_EDGE;


  SET_APPROVE_INTERNAL_SETTINGS : process (clk_40)
  begin
    if rising_edge(clk_40) then
      if local_reset  = '1' then
        ready_counter <= (others => '0');
     -- elsif kintex_ready_pulse = '1' and ready_counter = 0 then
     --   ready_counter <= ready_counter + 1;
      elsif ready_counter /=x"ffff" then 
        ready_counter <= ready_counter + 1;
      else
        ready_counter <= ready_counter;
      end if;
    end if;
  end process SET_APPROVE_INTERNAL_SETTINGS;

  --SET_SLICE_CHANGES : process (clk_40)
  --begin
  --  if rising_edge(clk_40) then
  --    if ready_counter = x"000f" then
  --      slice_changes_aproved <= '1';
  --    else
  --      slice_changes_aproved <= '0';   
  --    end if;
  --  end if;
  --end process SET_SLICE_CHANGES;
  
  GLOBAL_RESET: process(clk_40)
  begin
    if rising_edge(clk_40) then
      if global_reset_cnt < x"000e" then
        global_reset_cnt <= global_reset_cnt + 1;
        local_reset <= '1';-- or kintex_ready_pulse;
        local_reset_synch <= '1';
        slice_changes_aproved <= '0';
      elsif global_reset_cnt = x"000e" and kintex_ready_synch_b = '1' then
        local_reset <= '0';
        local_reset_synch <= local_reset;
        global_reset_cnt <= x"000e";
        slice_changes_aproved <= '1';
      else
        local_reset <= local_reset;-- or kintex_ready_pulse;
        local_reset_synch <= '0';
        global_reset_cnt <= global_reset_cnt;
        slice_changes_aproved <= slice_changes_aproved;
      end if;
    end if;
  end process GLOBAL_RESET;

  SIMULATION_FAILURE_FIX: if SIMULATION = true generate
    MAKE_RESET_PULSE_FOR_SIM : process (clk_40)
    begin
      if rising_edge(clk_40) then
        if local_reset_synch = '0' and local_reset_synch_a = '1' then
          local_reset_synch_a <= local_reset_synch;
          local_reset_synch_b <= '1';
        else
          local_reset_synch_a <= local_reset_synch;
          local_reset_synch_b <= '0';
        end if;
      end if;
    end process MAKE_RESET_PULSE_FOR_SIM;
     local_reset_synch_c <= local_reset_synch_b'delayed(3000 ns) or local_reset_synch;  
  end generate SIMULATION_FAILURE_FIX;

  NO_SIM: if SIMULATION = false generate
    local_reset_synch_c <= local_reset_synch;
  end generate NO_SIM;
  
  
  --SIMPLE_TOP_MEMORY_GEN: simple_top
  --  port map (
  --    CLK_IN_40 => clk_40,
  --    RESET     => bram_input_count_reset,
  --    OUT_DATA  => ros_roi_in_data);


  GENERATE_CNTRS_FOR_ROS_ROI_DATA: for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
    CNTR_FOR_ROS_ROI_BUS_PROC : process (clk_40)
    begin
      if rising_edge(clk_40) then
        cntr_for_ros_roi_bus(i) <= std_logic_vector(unsigned(cntr_for_ros_roi_bus(i)) + 1);
      end if;
    end process CNTR_FOR_ROS_ROI_BUS_PROC;
  end generate GENERATE_CNTRS_FOR_ROS_ROI_DATA;

  
  MAKE_L1A : process (clk_40)
  begin
    if rising_edge(clk_40) then
      if mmcx_u30_synch_a = '1' and mmcx_u30_synch_b = '0' then
        l1A_pulse <= '1';
        mmcx_u30_synch_a <= MMCX_U30;
        mmcx_u30_synch_b <= mmcx_u30_synch_a;
      else
        l1A_pulse <= '0';
        mmcx_u30_synch_a <= MMCX_U30;
        mmcx_u30_synch_b <= mmcx_u30_synch_a;
      end if;
    end if;
  end process MAKE_L1A;

  SET_VALID_AFTER_FIRST_PULSE : process (clk_40 )
  begin
    if rising_edge(clk_40) then
      if local_reset = '1' then
        lvl0_valid <= '0';
        data_valid_in <= "0";
      elsif l1A_pulse = '1' then
        lvl0_valid <= '1';
        data_valid_in <= "1";
      else
        lvl0_valid <= lvl0_valid;
        data_valid_in <= data_valid_in;
      end if;
    end if;
  end process SET_VALID_AFTER_FIRST_PULSE;
  
  ASSIGN_NUMBER_OF_SLICES : for i in 0 to NUMBER_OF_SLICES'length-1 generate
    NUMBER_OF_SLICES(i) <= to_unsigned(5, NUMBER_OF_SLICES(0)'length);--to_unsigned(((i mod 16)+1), NUMBER_OF_SLICES(0)'length);
    LVL0_OFFSET(i)      <= to_unsigned(i mod 2, LVL0_OFFSET(0)'length); --to_unsigned(i mod 8, LVL0_OFFSET(0)'length);
  end generate ASSIGN_NUMBER_OF_SLICES;
  
  l1topo_to_ddr_1: l1topo_to_ddr
    generic map (
      MAKE_SYNCH_INPUT => 0)
    port map (
      RESET                 => local_reset,
      DATA_IN_CLK           => clk_40,
      DATA_OUT_CLK          => clk_80,
      NUMBER_OF_SLICES      => NUMBER_OF_SLICES,
      SLICE_CHANGES_APROVED => slice_changes_aproved,
      LVL0_ACCEPTED         => l1A_pulse,
      LVL0_VALID            => lvl0_valid,
      LVL0_FULL_THR         => x"d0",
      LVL0_OFFSET           => lvl0_offset,
      ROS_ROI_IN_DATA       => cntr_for_ros_roi_bus,-- ros_roi_in_data,
      DATA_VALID_IN         => data_valid_in,
      OUT_DATA              => out_data,
      DATA_VALID_OUT        => data_valid_out,
      L0_BUSY               => l0_busy,
      SPECIAL_CHARACTER_OUT => special_character_out);


    
  TransmittersWrapper_INST: TransmittersWrapper
    generic map (
      LINKS_NUMBER => NUMBER_OF_ROS_OUTPUT_BUSES)
    port map (
      RESET          => local_reset_synch_c,
      CLK_BIT_IN     => clk_400,
      CLK_WORD_IN    => clk_80,
      DATA_IN        => out_data,
      DATA_VALID_IN  => data_valid_out,
      DATA_KCTRL_IN  => special_character_out,
      DATA_PIN_P_OUT => CTRLBUS_P,
      DATA_PIN_N_OUT => CTRLBUS_N);

  
  --DCM_2: DCM
  --  port map (
  --    clk_in1_p => LhcClkInP,
  --    clk_in1_n => LhcClkInN,
  --    clk_40    => clk_40,
  --    clk_90    => clk_90,
  --    clk_450   => clk_450,
  --    reset     => '0',
  --    locked    => mmcm_locked);
clock_inst : entity work.rod_kintex_clk
port map(CLK_IN1_P   => LhcClkInP,
         CLK_IN1_N   => LhcClkInN,
         CLK_40  => clk_40,
         CLK_80  => clk_80,
         CLK_400 => clk_400,
         CLK_200 => open,
         LOCKED      => mmcm_locked);

  
end virtex_top_test;
