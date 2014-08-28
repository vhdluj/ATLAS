library IEEE;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;
--use ieee.std_logic_arith.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;
use work.rod_l1_topo_types_const.all;

entity l1topo_to_ddr is
  generic (
    MAKE_SYNCH_INPUT : integer := 0);
  port (
    RESET                 : in  std_logic;
    DATA_IN_CLK           : in  std_logic;
    DATA_OUT_CLK          : in  std_logic;
    NUMBER_OF_SLICES      : in  slice_parameters_array_u;
    SLICE_CHANGES_APROVED : in  std_logic;
    --NUMBER_OF_SLICES after ineteresting event (minus global offset)
    LVL0_ACCEPTED         : in  std_logic;
    LVL0_VALID            : in  std_logic;
    LVL0_FULL_THR         : in  std_logic_vector(7 downto 0);
    LVL0_OFFSET           : in  slice_parameters_array_u;
    ROS_ROI_IN_DATA       : in  in_data_array;
    DATA_VALID_IN         : in  std_logic_vector(0 downto 0);
    OUT_DATA              : out std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0);
    DATA_VALID_OUT        : out std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
    L0_BUSY               : out std_logic;
    SPECIAL_CHARACTER_OUT : out std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0)
    );
end l1topo_to_ddr;

architecture l1topo_to_ddr of l1topo_to_ddr is
  component delay
    generic (
      VECTOR_WIDTH : natural;
      DELAY_INT    : integer range 0 to 31);
    port (
      CLK              : in  std_logic;
      DELAY_VECTOR_IN  : in  std_logic_vector(VECTOR_WIDTH - 1 downto 0);
      DELAY_VECTOR_OUT : out std_logic_vector(VECTOR_WIDTH - 1 downto 0));
  end component;

  component ring_buffer_128b_256W
    port (
      WEA   : in  std_logic_vector(0 downto 0);
      ADDRA : in  std_logic_vector(in_memory_address_range);
      DINA  : in  std_logic_vector(127 downto 0);
      CLKA  : in  std_logic;
      ADDRB : in  std_logic_vector(in_memory_address_range);
      DOUTB : out std_logic_vector(127 downto 0);
      CLKB  : in  std_logic);
  end component;

  component l0a_trigger_fifo
    port (
      rst              : in  std_logic;
      wr_clk           : in  std_logic;
      rd_clk           : in  std_logic;
      din              : in  std_logic_vector(31 downto 0);
      wr_en            : in  std_logic;
      rd_en            : in  std_logic;
      prog_full_thresh : in  std_logic_vector(7 downto 0);
      dout             : out std_logic_vector(31 downto 0);
      full             : out std_logic;
      empty            : out std_logic;
      prog_full        : out std_logic);
  end component;

  component memory_selector_add_modifier  --2048 x 16 b
    port (
      clka  : in  std_logic;
      wea   : in  std_logic_vector(0 downto 0);
      addra : in  std_logic_vector(10 downto 0);
      dina  : in  std_logic_vector(15 downto 0);
      clkb  : in  std_logic;
      addrb : in  std_logic_vector(10 downto 0);
      doutb : out std_logic_vector(15 downto 0));
  end component;
   
  signal number_of_slices_synch, lvl0_offset_synch                                             : slice_parameters_array_u;
  signal memory_data                                                                           : memory_array;
  type   SEND_DATA_AND_CONF_FSM is (IDLE, PREPARE_DATA_A, PREPARE_DATA_B, SEND_DATA, SEND_CONF, SEND_LAST_CONF, WAIT_FOR_READOUT_FIFO_A, WAIT_FOR_READOUT_FIFO_B);
  signal SEND_DATA_AND_CONF_FSM_CURRENT, SEND_DATA_AND_CONF_FSM_NEXT                           : SEND_DATA_AND_CONF_FSM;
  signal time_slice_cntr                                                                       : unsigned(10 downto 0)                          := (others => '0');
  signal bus_cntr                                                                              : unsigned(5 downto 0)                := (others => '0');
  signal memory_base_addr_cntr, memory_base_addr_cntr_saved, actual_memory_address             : unsigned(in_memory_address_range)              := (others => '0');
  signal individual_bus_cntr                                                                   : unsigned(3 downto 0)            := (others => '0');
  signal send_slice_configuration, l0_trigger_read, l0_trigger_read_fsm, data_valid            : std_logic                                      := '0';
  signal l0_fifo_empty, l0_fifo_full, data_valid_fsm, data_valid_delay, data_valid_delay_end   : std_logic                                      := '0';
  signal special_character_fsm, special_character, special_character_delay                     : std_logic                                      := '0';
  signal slice_changes_aproved_pulse, slice_changes_aproved_synch, memory_selector_written     : std_logic                                      := '0';
  signal rewrite_memory_selector                                                               : std_logic_vector(0 downto 0)                   := (others => '0');
  signal addr_input_data_cntr                                                                  : unsigned(in_memory_address_range)              := (others => '0');
  signal out_data_mem                                                                          : std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0) := (others => '0');
  signal mem_addr_of_sel_addr_mod_data                                                         : unsigned(10 downto 0)                          := (others => '0');
  signal l0_trigger_value_in, l0_trigger_value_out                                             : std_logic_vector(31 downto 0)                  := (others => '0');
  signal mem_sel_addr_mod_data_out, mem_sel_addr_mod_data_in                                              : std_logic_vector(15 downto 0)                  := (others => '0');
  signal first_data_word, second_data_word : std_logic_vector(ROS_INPUT_GRANURALITY-1 downto 0);
  signal merged_data_words : std_logic_vector(ROS_INPUT_GRANURALITY*2-1 downto 0);
  signal read_next_cntr, data_readout_shift : unsigned(log2_int(ROS_INPUT_GRANURALITY) downto 0);
  signal ddr_synch_data : std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0);
  signal save_base_address : std_logic;
  signal wait_cntr_reset, wait_cntr_reset_fsm : std_logic;
  signal wait_cntr : unsigned(3 downto 0);
begin

  MAKE_NONSYNCH_INPUTS_COND : if MAKE_SYNCH_INPUT = 0 generate
    lvl0_offset_synch      <= LVL0_OFFSET;
    number_of_slices_synch <= NUMBER_OF_SLICES;
  end generate MAKE_NONSYNCH_INPUTS_COND;
  MAKE_SYNCH_INPUTS_COND : if MAKE_SYNCH_INPUT = 1 generate
    SYNCH_INPUTS : process (DATA_OUT_CLK, RESET)
    begin
      if rising_edge(DATA_OUT_CLK) then
        lvl0_offset_synch      <= LVL0_OFFSET;
        number_of_slices_synch <= NUMBER_OF_SLICES;
      end if;
    end process SYNCH_INPUTS;
  end generate MAKE_SYNCH_INPUTS_COND;

  SET_MEM_SEL_ADDR_MOD_DATA : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' then
        mem_sel_addr_mod_data_in <= (others => '0');
      elsif bus_cntr < NUMBER_OF_ROS_ROI_INPUT_BUSES then
        mem_sel_addr_mod_data_in <= "00" & std_logic_vector(lvl0_offset_synch(to_integer(bus_cntr))) & std_logic_vector(individual_bus_cntr) & std_logic_vector(bus_cntr);
      else
       -- mem_sel_addr_mod_data_in <= (others => '1');
        mem_sel_addr_mod_data_in(mem_sel_addr_mod_data_in'high-1 downto 0) <= mem_sel_addr_mod_data_in(mem_sel_addr_mod_data_in'high-1 downto 0);
        mem_sel_addr_mod_data_in(15) <= '1';
      end if;
    end if;
  end process SET_MEM_SEL_ADDR_MOD_DATA;

  MEMORY_SELECTOR_ADD_MODIFIER_INST : memory_selector_add_modifier
    port map (
      CLKA  => DATA_OUT_CLK,
      WEA   => rewrite_memory_selector,
      ADDRA => std_logic_vector(time_slice_cntr),
      DINA  => mem_sel_addr_mod_data_in,
      CLKB  => DATA_OUT_CLK,
      ADDRB => std_logic_vector(mem_addr_of_sel_addr_mod_data),
      DOUTB => mem_sel_addr_mod_data_out);

  INCREASE_TIME_SLICE_CNTR : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' or slice_changes_aproved_pulse = '1' then
        time_slice_cntr <= (others => '0');
      elsif rewrite_memory_selector = "1" then
        time_slice_cntr <= time_slice_cntr + 1;
      else
        time_slice_cntr <= time_slice_cntr;
      end if;
    end if;
  end process INCREASE_TIME_SLICE_CNTR;

  SLICE_CHANGES_APROVE_PROC : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' then
        slice_changes_aproved_pulse <= '0';
        slice_changes_aproved_synch <= '0';
      elsif SLICE_CHANGES_APROVED = '1' and slice_changes_aproved_synch = '0' then
        slice_changes_aproved_pulse <= '1';
        slice_changes_aproved_synch <= SLICE_CHANGES_APROVED;
      else
        slice_changes_aproved_pulse <= '0';
        slice_changes_aproved_synch <= SLICE_CHANGES_APROVED;
      end if;
    end if;
  end process SLICE_CHANGES_APROVE_PROC;


  INCREASE_BUS_CNTR_PROC : process (DATA_OUT_CLK, RESET)  --used to fill memory
                                                          --with offsets and
                                                          --number of slices
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' or slice_changes_aproved_pulse = '1' then
        bus_cntr                <= (others => '0');
        individual_bus_cntr     <= (others => '0');
        rewrite_memory_selector <= "0";
        memory_selector_written <= '0';
      elsif individual_bus_cntr = number_of_slices_synch(to_integer(bus_cntr)) and bus_cntr < (NUMBER_OF_ROS_ROI_INPUT_BUSES) then
        bus_cntr                <= bus_cntr + 1;
        individual_bus_cntr     <= (others => '0');
        rewrite_memory_selector <= "0";
        memory_selector_written <= memory_selector_written;
      elsif bus_cntr = NUMBER_OF_ROS_ROI_INPUT_BUSES then
        individual_bus_cntr     <= (others => '0');
        bus_cntr                <= bus_cntr;
        rewrite_memory_selector <= "1" and not mem_sel_addr_mod_data_in(15 downto 15);
        memory_selector_written <= '1';
      else
        individual_bus_cntr     <= individual_bus_cntr + 1;
        bus_cntr                <= bus_cntr;
        rewrite_memory_selector <= "1";
        memory_selector_written <= memory_selector_written;
      end if;
    end if;
  end process INCREASE_BUS_CNTR_PROC;

  CHECK_FOR_SLICE_UPDATE : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' or SEND_DATA_AND_CONF_FSM_CURRENT = SEND_CONF then
        send_slice_configuration <= '0';
      elsif slice_changes_aproved_pulse = '1' then
        send_slice_configuration <= '1';
      else
        send_slice_configuration <= send_slice_configuration;
      end if;
    end if;
  end process CHECK_FOR_SLICE_UPDATE;

  SAVE_INPUT_ROS_ROI_DATA : for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
    RING_BUFF_128B_256W_ROS_INST : ring_buffer_128b_256W
      port map (
        WEA   => DATA_VALID_IN,
        ADDRA => std_logic_vector(addr_input_data_cntr),
        DINA  => ROS_ROI_IN_DATA(i),
        CLKA  => DATA_IN_CLK,
        ADDRB => std_logic_vector(actual_memory_address),
        DOUTB => memory_data(i),
        CLKB  => DATA_OUT_CLK);
  end generate SAVE_INPUT_ROS_ROI_DATA;

  INCREASE_INPUT_BUFFER_ADDRESS : process (DATA_IN_CLK, RESET) --continous writing into ring buffer
  begin
    if rising_edge(DATA_IN_CLK) then
      if RESET = '1' then
        addr_input_data_cntr <= (others => '0');
      elsif DATA_VALID_IN = "1" then
        addr_input_data_cntr <= addr_input_data_cntr + 1;
      else
        addr_input_data_cntr <= addr_input_data_cntr;
      end if;
    end if;
  end process INCREASE_INPUT_BUFFER_ADDRESS;

  -----------------------------------------------------------------------------
  -- sending data out
  -----------------------------------------------------------------------------

  PREPARE_DATA_TO_SEND : process (DATA_OUT_CLK, RESET, SEND_DATA_AND_CONF_FSM_CURRENT, read_next_cntr)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' or SEND_DATA_AND_CONF_FSM_CURRENT = IDLE then
        first_data_word               <= (others => '0');
        second_data_word              <= (others => '0');
        mem_addr_of_sel_addr_mod_data <= (others => '0');
        data_readout_shift            <= (others => '0');
      elsif (--SEND_DATA_AND_CONF_FSM_CURRENT = PREPARE_DATA_A or
             --SEND_DATA_AND_CONF_FSM_CURRENT = PREPARE_DATA_B or
             SEND_DATA_AND_CONF_FSM_CURRENT = SEND_CONF or
            ((SEND_DATA_AND_CONF_FSM_CURRENT = SEND_DATA or SEND_DATA_AND_CONF_FSM_CURRENT = WAIT_FOR_READOUT_FIFO_A) and OUTPUT_DATA_WIDTH * (read_next_cntr + 1) >= ROS_INPUT_GRANURALITY)) --and
             --mem_sel_addr_mod_data_out(15) /= '1'--x"ffff"
      then
        second_data_word              <= memory_data(to_integer(unsigned(mem_sel_addr_mod_data_out(5 downto 0))));
        first_data_word               <= second_data_word;
        mem_addr_of_sel_addr_mod_data <= mem_addr_of_sel_addr_mod_data + 1;
        data_readout_shift            <= to_unsigned(OUTPUT_DATA_WIDTH*to_integer(read_next_cntr+2)-ROS_INPUT_GRANURALITY,log2_int(ROS_INPUT_GRANURALITY)+1); --
        --data_readout_shift used to allign data to the output bus e.g. output bus 3 lines input
        --data 8 bit width
      --elsif SEND_DATA_AND_CONF_FSM_CURRENT = WAIT_FOR_READOUT_FIFO_A then
        
      --  first_data_word               <= second_data_word;
      --  mem_addr_of_sel_addr_mod_data <= mem_addr_of_sel_addr_mod_data + 1;
      --  data_readout_shift            <= data_readout_shift;
      else
        first_data_word               <= first_data_word;
        second_data_word              <= second_data_word;
        mem_addr_of_sel_addr_mod_data <= mem_addr_of_sel_addr_mod_data;
        data_readout_shift            <= data_readout_shift;
      end if;
    end if;
  end process PREPARE_DATA_TO_SEND;

  merged_data_words <= second_data_word & first_data_word;

  UPDATE_READ_CNTR : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' or
        ((SEND_DATA_AND_CONF_FSM_CURRENT = SEND_DATA or SEND_DATA_AND_CONF_FSM_CURRENT = WAIT_FOR_READOUT_FIFO_A) and
          OUTPUT_DATA_WIDTH * (read_next_cntr + 1) >= ROS_INPUT_GRANURALITY) or SEND_DATA_AND_CONF_FSM_CURRENT = IDLE then
        read_next_cntr     <= (others => '0');
      elsif SEND_DATA_AND_CONF_FSM_CURRENT = SEND_DATA or SEND_DATA_AND_CONF_FSM_CURRENT = WAIT_FOR_READOUT_FIFO_A then 
        read_next_cntr     <= read_next_cntr + 1;
      else
        read_next_cntr     <= read_next_cntr;
      end if;
    end if;
  end process UPDATE_READ_CNTR;

  SELECT_OUTPUT_DATA_MEMORY : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if SEND_DATA_AND_CONF_FSM_CURRENT = SEND_DATA or SEND_DATA_AND_CONF_FSM_CURRENT = WAIT_FOR_READOUT_FIFO_A then
        out_data_mem <= merged_data_words(
          ((OUTPUT_DATA_WIDTH*(to_integer(read_next_cntr)+1)+to_integer(data_readout_shift))-1) downto
          (OUTPUT_DATA_WIDTH*(to_integer(read_next_cntr  ))+to_integer(data_readout_shift))
          --(OUTPUT_DATA_WIDTH*(1))-1 downto 0
          );
      else
        out_data_mem <= (others => '1');
      end if;
    end if;
  end process SELECT_OUTPUT_DATA_MEMORY;

  SET_MEMORY_ADDRESS_BASE : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' then
        memory_base_addr_cntr <= (others => '0');
      elsif l0_trigger_read = '1' then  --base address has to be synch with
                                        --actually read out trigger
        memory_base_addr_cntr <= memory_base_addr_cntr + 1;
      else
        memory_base_addr_cntr <= memory_base_addr_cntr;
      end if;
    end if;
  end process SET_MEMORY_ADDRESS_BASE;

  SAVE_BASE_ADRESS_FOR_GIVEN_EVENT : process (DATA_OUT_CLK)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if SEND_DATA_AND_CONF_FSM_CURRENT = PREPARE_DATA_A then
        memory_base_addr_cntr_saved <= memory_base_addr_cntr;
      else
        memory_base_addr_cntr_saved <= memory_base_addr_cntr_saved;
      end if;
    end if;
  end process SAVE_BASE_ADRESS_FOR_GIVEN_EVENT;

  CALCULATE_ACTUAL_ADDRESS : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      --if RESET = '1' then
      --  actual_memory_address <= (others => '0');
      --elsif data_valid = '1' and data_valid_delay = '1' then
        actual_memory_address <= memory_base_addr_cntr_saved + unsigned(mem_sel_addr_mod_data_out(9 downto 6)) - unsigned(mem_sel_addr_mod_data_out(13 downto 10));
      --else
      --  actual_memory_address <= (others => '0');
      --end if;
    end if;
  end process CALCULATE_ACTUAL_ADDRESS;

  l0_trigger_value_in(31)          <= LVL0_ACCEPTED;
  l0_trigger_value_in(30 downto 0) <= (others => '0');

  L0A_TRIGGER_FIFO_INST : l0a_trigger_fifo  --to record incoming triggers -
                                            --data flow can be slower than triggers
    port map (
      rst              => RESET,
      wr_clk           => DATA_IN_CLK,
      rd_clk           => DATA_OUT_CLK,
      din              => l0_trigger_value_in,
      wr_en            => LVL0_VALID,
      rd_en            => l0_trigger_read,
      prog_full_thresh => LVL0_FULL_THR,
      dout             => l0_trigger_value_out,
      full             => open,
      empty            => l0_fifo_empty,
      prog_full        => l0_fifo_full);

  SEND_DATA_AND_CONF_FSM_CLK : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' then
        SEND_DATA_AND_CONF_FSM_CURRENT <= IDLE;
        l0_trigger_read                <= '0';
        data_valid                     <= '0';
        special_character              <= '0';
        SPECIAL_CHARACTER_OUT(0)          <= '0';
        save_base_address              <= '1';
        wait_cntr_reset                <= '1';
      else
        SEND_DATA_AND_CONF_FSM_CURRENT <= SEND_DATA_AND_CONF_FSM_NEXT;
        l0_trigger_read                <= l0_trigger_read_fsm or (not(l0_fifo_empty) and not(l0_trigger_value_out(31)));
        data_valid                     <= data_valid_fsm;
        special_character              <= special_character_fsm;
        SPECIAL_CHARACTER_OUT(0)       <= special_character;-- and special_character_delay;
        save_base_address              <= l0_trigger_read_fsm;
        wait_cntr_reset                <= wait_cntr_reset_fsm;
      end if;
    end if;
  end process SEND_DATA_AND_CONF_FSM_CLK;

  SPECIAL_CHARACTER_OUT(SPECIAL_CHARACTER_OUT'high downto 1) <= (others => '0');
                                                                
  --ALIGN_SPECIAL_CHAR: delay
  --  generic map (
  --    VECTOR_WIDTH => 1,
  --    DELAY_INT    => 2)
  --  port map (
  --    CLK              => DATA_OUT_CLK,
  --    DELAY_VECTOR_IN(0)  => special_character,
  --    DELAY_VECTOR_OUT(0) => special_character_delay);
  --SPECIAL_CHARACTER_OUT          <= special_character;
  
  SEND_DATA_AND_CONF_FSM_PROC : process (DATA_OUT_CLK)
  begin
    l0_trigger_read_fsm   <= '0';
    data_valid_fsm        <= '0';
    special_character_fsm <= '0';
    wait_cntr_reset_fsm   <= '1';
    case (SEND_DATA_AND_CONF_FSM_CURRENT) is
      when IDLE =>
        if send_slice_configuration = '1' and bus_cntr = NUMBER_OF_ROS_ROI_INPUT_BUSES then
          SEND_DATA_AND_CONF_FSM_NEXT <= SEND_CONF;
        elsif l0_trigger_value_out(31) = '1' and l0_fifo_empty = '0' and memory_selector_written ='1' then
          SEND_DATA_AND_CONF_FSM_NEXT <= PREPARE_DATA_A;
        else
          SEND_DATA_AND_CONF_FSM_NEXT <= IDLE;
        end if;
      when PREPARE_DATA_A =>
        SEND_DATA_AND_CONF_FSM_NEXT <= PREPARE_DATA_B;
      when PREPARE_DATA_B =>
        data_valid_fsm              <= '1';
        SEND_DATA_AND_CONF_FSM_NEXT <= SEND_DATA;
      when SEND_DATA =>
        data_valid_fsm <= '1';
        if mem_sel_addr_mod_data_out(15) = '1' then -- x"ffff" then
          l0_trigger_read_fsm <= '1';
          SEND_DATA_AND_CONF_FSM_NEXT <= WAIT_FOR_READOUT_FIFO_A;
        else
          SEND_DATA_AND_CONF_FSM_NEXT <= SEND_DATA;
        end if;
      when WAIT_FOR_READOUT_FIFO_A =>
         data_valid_fsm <= '1';
         wait_cntr_reset_fsm <= '0';
        if wait_cntr = x"6" then 
          SEND_DATA_AND_CONF_FSM_NEXT <= IDLE;
        else
          SEND_DATA_AND_CONF_FSM_NEXT <= WAIT_FOR_READOUT_FIFO_A;
        end if;
        
      --when WAIT_FOR_READOUT_FIFO_B =>
      --  data_valid_fsm <= '1';
      --  SEND_DATA_AND_CONF_FSM_NEXT <= IDLE;
          
      when SEND_CONF =>
        
        if mem_sel_addr_mod_data_out(15) = '1' then -- x"ffff" then
          special_character_fsm       <= '0';
          --data_valid_fsm <= '0';
          SEND_DATA_AND_CONF_FSM_NEXT <= SEND_LAST_CONF;
        else
          special_character_fsm       <= '1';
          --data_valid_fsm <= '1';
          SEND_DATA_AND_CONF_FSM_NEXT <= SEND_CONF;
        end if;
      when SEND_LAST_CONF =>
        SEND_DATA_AND_CONF_FSM_NEXT <= IDLE;
      when others =>
        SEND_DATA_AND_CONF_FSM_NEXT <= IDLE;
    end case;
  end process SEND_DATA_AND_CONF_FSM_PROC;

  WAIT_CNTR_PROC : process (DATA_OUT_CLK )
  begin
    if rising_edge(DATA_OUT_CLK) then
      if wait_cntr_reset = '1' then
        wait_cntr <= (others => '0');
      else 
        wait_cntr <= wait_cntr + 1;
      end if;
    end if;
  end process WAIT_CNTR_PROC;
    


  SET_DDR_SYNCH_DATA: for i in 0 to OUT_DATA'high/8 generate
    ddr_synch_data((i+1)*8-1 downto i*8) <= x"1C";
  end generate SET_DDR_SYNCH_DATA;
  
  SEND_CONF_DATA : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if data_valid = '1' and  special_character = '0' then
        OUT_DATA <= out_data_mem;
      elsif reset = '1' then
        OUT_DATA <= ddr_synch_data;
      elsif SEND_DATA_AND_CONF_FSM_CURRENT = SEND_CONF or SEND_DATA_AND_CONF_FSM_CURRENT = SEND_LAST_CONF then
        OUT_DATA(7 downto 0) <= x"5C";
        OUT_DATA(23 downto 8) <= mem_sel_addr_mod_data_out;
        OUT_DATA(OUTPUT_DATA_WIDTH-1 downto 24) <= (others => '1');
      else
        OUT_DATA <= ddr_synch_data;
      end if;
    end if;
  end process SEND_CONF_DATA;
  
  L0_BUSY <= l0_fifo_full;
  
  DELAY_START_DATA_VALID: delay
    generic map (
      VECTOR_WIDTH => 1,
      DELAY_INT    => 9)
    port map (
      CLK              => DATA_OUT_CLK,
      DELAY_VECTOR_IN(0)  => data_valid,
      DELAY_VECTOR_OUT(0) => data_valid_delay);

  --DELAY_END_DATA_VALID: delay
  --  generic map (
  --    VECTOR_WIDTH => 1,
  --    DELAY_INT    => 2)
  --  port map (
  --    CLK              => DATA_OUT_CLK,
  --    DELAY_VECTOR_IN(0)  => data_valid,
  --    DELAY_VECTOR_OUT(0) => data_valid_delay_end);
  
  
  DATA_VALID_OUT(DATA_VALID_OUT'high downto 1) <= (others => ((data_valid_delay and data_valid)) or special_character);-- or RESET;
  DATA_VALID_OUT(0)                            <= ((data_valid_delay and data_valid)) and (not special_character);
    
  
end l1topo_to_ddr;
