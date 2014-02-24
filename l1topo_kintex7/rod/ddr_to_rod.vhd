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

entity ddr_to_rod is
  port (
    RESET                       : in  std_logic;
    DATA_IN_CLK                 : in  std_logic;
    DATA_OUT_CLK                : in  std_logic;
    --LVL1_ACCEPTED         : in  std_logic;
    --LVL1_VALID            : in  std_logic;
    LVL1_FULL_THR               : in  std_logic_vector(7 downto 0);
    L1_BUSY                     : out std_logic;
    DDR_ROS_ROI_IN_DATA         : in  std_logic_vector(63 downto 0);
    DATA_VALID_IN               : in  std_logic;
    SPECIAL_CHAR_IN             : in  std_logic;
    OUT_DATA                    : out out_data_array;
    DATA_VALID_OUT              : out std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
    --Parametres of transmission
    ACTUAL_BUS_NUMBER_OUT       : out bus_number_array;          
    NUMBER_OF_SLICES_OUT        : out slice_parameters_array_u;
    LVL0_OFFSET_OUT             : out slice_parameters_array_u;
    --READ_LINK             : in  std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
    ROS_ROI_BUS_ASSIGNMENT      : in  in_cntrl_array;
    ROS_ROI_BUS_ASSIGNMENT_DONE : in  std_logic;
    ROS_ROI_OUT_DATA_CNTR       : out output_link_data_cntr_array;
    START_OF_FRAME              : out std_logic;
    END_OF_FRAME                : out std_logic
    );
end ddr_to_rod;

architecture ddr_to_rod of ddr_to_rod is

  component ros_roi_fifo_data_in
    port (
      rst    : in  std_logic;
      wr_clk : in  std_logic;
      rd_clk : in  std_logic;
      din    : in  std_logic_vector(128 downto 0);
      wr_en  : in  std_logic;
      rd_en  : in  std_logic;
      dout   : out std_logic_vector(128 downto 0);
      full   : out std_logic;
      empty  : out std_logic);
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

  component l1a_trigger_fifo
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

  type   SEND_DATA_AND_CONF_FSM is (IDLE, SEND_DATA, WAIT_FOR_READOUT_FIFO_A, WAIT_FOR_READOUT_FIFO_B);
  signal SEND_DATA_FSM_CURRENT, SEND_DATA_AND_CONF_FSM_NEXT                                                : SEND_DATA_AND_CONF_FSM;
  signal l1_fifo_empty, l1_fifo_full, l1_trigger_read, l1_trigger_read_fsm, output_link_data_cntr_finished : std_logic := '0';
  signal ros_roi_bus_assignment_done_pulse, ros_roi_bus_assignment_done_synch                              : std_logic;
  signal enable_mem_sel_addr_mod_data_wr, enable_mem_sel_addr_mod_data_wr_synch                            : std_logic_vector(0 downto 0):="0";
  signal time_slice_cntr                                                                                   : unsigned(10 downto 0):=(others => '0');
  signal mem_addr_of_sel_addr_mod_data                                                                     : unsigned(10 downto 0):=(others => '0');
  signal mem_sel_addr_mod_data_in, mem_sel_addr_mod_data_out                                               : std_logic_vector(15 downto 0):=(others => '0');
  signal mem_sel_addr_mod_data_out_synch                                                                   : std_logic_vector(5 downto 0):=(others => '0');
  signal cntr_for_mem_sel_addr, cntr_for_mem_sel_addr_synch                                                : unsigned(0 downto 0):="0";
  signal first_data_word, second_data_word                                                                 : std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0):=(others => '0');
  signal merged_data_words                                                                                 : std_logic_vector(ROS_INPUT_GRANURALITY-1 downto 0):=(others => '0');
  signal fifo_data_in, fifo_data_out                                                                       : kintex_memory_array;
  signal fifo_data_wr_en, fifo_data_rd_en                                                                  : std_logic_vector(NUMBER_OF_ROS_ROI_INPUT_BUSES-1 downto 0):=(others => '0');
  signal fifo_data_empty, fifo_data_full                                                                   : std_logic_vector(NUMBER_OF_ROS_ROI_INPUT_BUSES-1 downto 0);
  signal l1_trigger_value_in, l1_trigger_value_out                                                         : std_logic_vector(31 downto 0):=(others => '0');
  signal data_valid_in_synch, data_valid_finished, mem_sel_addr_mod_data_finished,special_char_in_synch    : std_logic:= '0';
  signal link_pointer                                                                                      : link_pointer_array;
  signal bus_number, bus_number_delay_a, bus_number_delay_b                                                : bus_number_array;
  signal input_ros_roi_data_cntr,number_of_read_out_fifo_data                                              : input_ros_roi_data_cntr_array;
  signal output_link_data_cntr                                                                             : output_link_data_cntr_array;
  signal number_of_fifos_per_output_link, link_cntr                                                        : bus_number_array;
  signal all_data_sent                                                                                     : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0):=(others => '0');
  signal end_of_transmission_fsm, end_of_transmission, l1_fifo_empty_synch, l1_fifo_empty_pulse            : std_logic;
  signal data_valid_out_delay_a, data_valid_out_delay_b, fifo_emty                                         : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0);
  signal next_pointer, scan                                                                                : bus_number_array;
  signal    number_of_slices_out_l, lvl0_offset_out_l                                                      :  slice_parameters_array_u := (others => (others => '0'));
    

begin

  -----------------------------------------------------------------------------
  -- saving parameters of transmission from virtex - slice number, offset, channel
  -----------------------------------------------------------------------------
  ENABLE_MEM_SEL_ADDR_MOD_DATA_WR_PROC : process (DATA_IN_CLK, RESET)
  begin
    if rising_edge(DATA_IN_CLK) then
      if DDR_ROS_ROI_IN_DATA(7 downto 0) = x"5C" and SPECIAL_CHAR_IN = '1' then
        enable_mem_sel_addr_mod_data_wr       <= "1";
        enable_mem_sel_addr_mod_data_wr_synch <= enable_mem_sel_addr_mod_data_wr;
        time_slice_cntr                       <= time_slice_cntr + 1;
        mem_sel_addr_mod_data_in              <= DDR_ROS_ROI_IN_DATA(23 downto 8);
      else
        time_slice_cntr                       <= (others => '0');
        enable_mem_sel_addr_mod_data_wr       <= "0";
        enable_mem_sel_addr_mod_data_wr_synch <= enable_mem_sel_addr_mod_data_wr;
        mem_sel_addr_mod_data_in              <= DDR_ROS_ROI_IN_DATA(23 downto 8);
      end if;
    end if;
  end process ENABLE_MEM_SEL_ADDR_MOD_DATA_WR_PROC;

  MEM_SEL_ADDR_MOD_DATA_FINISHED_PROC : process (DATA_IN_CLK, RESET)
  begin
    if rising_edge(DATA_IN_CLK) then
      if enable_mem_sel_addr_mod_data_wr = "0" and enable_mem_sel_addr_mod_data_wr_synch = "1" then
        mem_sel_addr_mod_data_finished <= '1';
      else
        mem_sel_addr_mod_data_finished <= '0';
      end if;
    end if;
  end process MEM_SEL_ADDR_MOD_DATA_FINISHED_PROC;

  MEMORY_SELECTOR_ADD_MODIFIER_INST : memory_selector_add_modifier
    port map (
      CLKA  => DATA_IN_CLK,
      WEA   => enable_mem_sel_addr_mod_data_wr,
      ADDRA => std_logic_vector(time_slice_cntr),
      DINA  => mem_sel_addr_mod_data_in,
      CLKB  => DATA_OUT_CLK,
      ADDRB => std_logic_vector(mem_addr_of_sel_addr_mod_data),
      DOUTB => mem_sel_addr_mod_data_out);

  SAVE_OFFSET_AND_NR_OF_SLICES_GEN: for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
    SAVE_OFFSETS_AND_NUMBER_OF_SLICES : process (DATA_IN_CLK)
    begin
      if rising_edge(DATA_IN_CLK) then
        if enable_mem_sel_addr_mod_data_wr = "1" and unsigned(mem_sel_addr_mod_data_in(memory_selector_range)) = i then
    
          number_of_slices_out_l(i) <= unsigned(mem_sel_addr_mod_data_in(memory_selector_range'high+1 +NUMBER_OF_SLICES_OUT(0)'high downto memory_selector_range'high+1)) + 1;
          
          lvl0_offset_out_l(i) <=  unsigned(mem_sel_addr_mod_data_in((memory_selector_range'high+1 + NUMBER_OF_SLICES_OUT(0)'high+1 + LVL0_OFFSET_OUT(0)'high) downto (memory_selector_range'high+1 + NUMBER_OF_SLICES_OUT(0)'high+1)));
        else
          number_of_slices_out_l(i) <= number_of_slices_out_l(i); 
          lvl0_offset_out_l(i) <= lvl0_offset_out_l(i);
        end if;
      end if;
    end process SAVE_OFFSETS_AND_NUMBER_OF_SLICES;
  end generate SAVE_OFFSET_AND_NR_OF_SLICES_GEN;
 NUMBER_OF_SLICES_OUT <=  number_of_slices_out_l;
 LVL0_OFFSET_OUT <= lvl0_offset_out_l;
  -----------------------------------------------------------------------------
  -- reading out parameters of transmission - slice number, offset, channel
  -- this to count amount of data for input channels (used for fifo rd en) *A
  -- individual output links (used for data valid out -> to readout ) *B
  -- number_of_fifos per output link (used for data valid out -> to readout ) *C
  -----------------------------------------------------------------------------
  CNTR_FOR_SET_MEM_SEL_ADDR : process (DATA_IN_CLK, RESET)
  begin
    if rising_edge(DATA_IN_CLK) then
      if RESET = '1' then
        cntr_for_mem_sel_addr       <= (others => '0');
        cntr_for_mem_sel_addr_synch <= (others => '0');
      elsif DATA_VALID_IN = '1' then
        --assuming 64 bit data transmission - has to be correct to generic -
        --cntr_for_mem_sel_addr = '1' saves the data *C
        cntr_for_mem_sel_addr       <= cntr_for_mem_sel_addr + 1;
        cntr_for_mem_sel_addr_synch <= cntr_for_mem_sel_addr;
      else
        cntr_for_mem_sel_addr       <= (others => '0');
        cntr_for_mem_sel_addr_synch <= cntr_for_mem_sel_addr;
      end if;
    end if;
  end process CNTR_FOR_SET_MEM_SEL_ADDR;

  UPDATE_MEM_ADDR_OF_SEL_ADDR_MOD_DATA : process (DATA_IN_CLK, RESET)
  begin
    if rising_edge(DATA_IN_CLK) then
      if RESET = '1' or DATA_VALID_IN = '0' then
        mem_addr_of_sel_addr_mod_data <= (others => '0');
      elsif DATA_VALID_IN = '1' and cntr_for_mem_sel_addr = "0" then
        --assuming 64 bit data transmission - has to be correct to generic
        mem_addr_of_sel_addr_mod_data <= mem_addr_of_sel_addr_mod_data + 1;
      else
        mem_addr_of_sel_addr_mod_data <= mem_addr_of_sel_addr_mod_data;
      end if;
    end if;
  end process UPDATE_MEM_ADDR_OF_SEL_ADDR_MOD_DATA;

  SYNCH_SPECIAL_CHAR : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
        special_char_in_synch <= SPECIAL_CHAR_IN;
    end if;
  end process SYNCH_SPECIAL_CHAR;
  
  CNTR_FOR_INCOMING_CHANNEL_DATA_GEN : for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
    CNTR_FOR_INCOMING_CHANNEL_DATA : process (DATA_IN_CLK, RESET)--*A
    begin
      if rising_edge(DATA_OUT_CLK) then
        if SPECIAL_CHAR_IN = '1' and special_char_in_synch = '0' then
          input_ros_roi_data_cntr(i) <= to_unsigned(0,input_ros_roi_data_cntr(0)'length);
        elsif SPECIAL_CHAR_IN = '1' and mem_sel_addr_mod_data_in(5 downto 0) = std_logic_vector(to_unsigned(i, 6)) and special_char_in_synch = '1' then
          input_ros_roi_data_cntr(i) <= input_ros_roi_data_cntr(i) + 1;
        else
          input_ros_roi_data_cntr(i) <= input_ros_roi_data_cntr(i);
        end if;
      end if;
    end process CNTR_FOR_INCOMING_CHANNEL_DATA;
  end generate CNTR_FOR_INCOMING_CHANNEL_DATA_GEN;

  ROS_ROI_BUS_ASSIGNMENT_DONE_PULSE_PROC : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if ROS_ROI_BUS_ASSIGNMENT_DONE = '1' and ROS_ROI_BUS_ASSIGNMENT_DONE_synch = '0' then
        ros_roi_bus_assignment_done_synch <= ROS_ROI_BUS_ASSIGNMENT_DONE;
        ros_roi_bus_assignment_done_pulse <= '1';
      else
        ros_roi_bus_assignment_done_synch <= ROS_ROI_BUS_ASSIGNMENT_DONE;
        ros_roi_bus_assignment_done_pulse <= '0';
      end if;
    end if;
  end process ROS_ROI_BUS_ASSIGNMENT_DONE_PULSE_PROC;
  
  COUNT_TOTAL_NUMBER_OF_OUT_LINK_DATA_GEN : for i in 0 to NUMBER_OF_OUTPUT_LINKS-1 generate
    COUNT_TOTAL_NUMBER_OF_OUT_LINK_DATA_PROC : process (DATA_IN_CLK, RESET) --*B
    begin
      if rising_edge(DATA_IN_CLK) then
        if RESET = '1' or ros_roi_bus_assignment_done_pulse = '1' then
          link_cntr(i)                      <= (others => '0');
          --output_link_data_cntr(i)       <= (others => '0');
          number_of_fifos_per_output_link(i) <= (others => '0');
        elsif link_cntr(i) < NUMBER_OF_ROS_ROI_INPUT_BUSES and ROS_ROI_BUS_ASSIGNMENT(to_integer(link_cntr(i))) = std_logic_vector(to_unsigned(i, ROS_ROI_BUS_ASSIGNMENT(0)'length)) then
          link_cntr(i)                      <= link_cntr(i) + 1;
          --output_link_data_cntr(i)       <= output_link_data_cntr(i) + input_ros_roi_data_cntr(link_cntr);
          number_of_fifos_per_output_link(i) <= number_of_fifos_per_output_link(i) + 1; --*C
        elsif link_cntr(i) < NUMBER_OF_ROS_ROI_INPUT_BUSES then
          --output_link_data_cntr(i)       <= output_link_data_cntr(i);
          link_cntr(i)                      <= link_cntr(i) + 1;
          number_of_fifos_per_output_link(i) <= number_of_fifos_per_output_link(i);
        else
          link_cntr(i)                      <= link_cntr(i);
          number_of_fifos_per_output_link(i) <= number_of_fifos_per_output_link(i);
        end if;
      end if;
    end process COUNT_TOTAL_NUMBER_OF_OUT_LINK_DATA_PROC;
    
  end generate COUNT_TOTAL_NUMBER_OF_OUT_LINK_DATA_GEN;
  
  --ROS_ROI_OUT_DATA_CNTR <= output_link_data_cntr;

  -----------------------------------------------------------------------------
  -- SAVING_INCOMIG_DATA
  -----------------------------------------------------------------------------
  SYNCH_MEM_SEL_ADDR_MOD_DATA : process (DATA_OUT_CLK)
  begin
    if rising_edge(DATA_OUT_CLK) then
      mem_sel_addr_mod_data_out_synch <= mem_sel_addr_mod_data_out(5 downto 0);
    end if;
  end process SYNCH_MEM_SEL_ADDR_MOD_DATA;

  PREPARE_DATA_TO_SAVE : process (DATA_OUT_CLK)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' or DATA_VALID_IN = '0' then
        first_data_word  <= (others => '0');
        second_data_word <= (others => '0');
        --merged_data_words <= (others => '0');
      elsif DATA_VALID_IN = '1' then
        first_data_word  <= second_data_word;
        second_data_word <= DDR_ROS_ROI_IN_DATA;
        --merged_data_words <= second_data_word & first_data_word;
      else
        first_data_word  <= first_data_word;
        second_data_word <= second_data_word;
        --merged_data_words <= second_data_word & first_data_word;
      end if;
    end if;
  end process PREPARE_DATA_TO_SAVE;
  merged_data_words <= second_data_word & first_data_word;
  

  SAVE_FIFO_DATA_GEN : for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
    SAVE_DATA_PROC : process (DATA_OUT_CLK, RESET)
    begin
      if rising_edge(DATA_OUT_CLK) then
        if RESET = '1' then
          fifo_data_in(i)    <= (others => '0');
          fifo_data_wr_en(i) <= '0';
        elsif mem_sel_addr_mod_data_out(5 downto 0) = std_logic_vector(to_unsigned(i, 6)) and cntr_for_mem_sel_addr_synch = "1" and DATA_VALID_IN = '1' then
          fifo_data_in(i)    <= '1' & merged_data_words;
          fifo_data_wr_en(i) <= '1';
        --elsif mem_sel_addr_mod_data_out(5 downto 0) /= mem_sel_addr_mod_data_out_synch and mem_sel_addr_mod_data_out_synch = std_logic_vector(to_unsigned(i, 6)) then
        --  --marker of current event data finished
        --  fifo_data_in(i)    <= (others => '0');
        --  fifo_data_wr_en(i) <= '1';
        else
          fifo_data_in(i)    <= (others => '0');
          fifo_data_wr_en(i) <= '0';
        end if;
      end if;
    end process SAVE_DATA_PROC;
  end generate SAVE_FIFO_DATA_GEN;

  GENERATE_INPUT_FIFOS : for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
    ROS_ROI_FIFO_DATA_IN_INST : ros_roi_fifo_data_in
      port map (
        rst    => RESET,
        wr_clk => DATA_IN_CLK,
        rd_clk => DATA_OUT_CLK,
        din    => fifo_data_in(i),
        wr_en  => fifo_data_wr_en(i),
        rd_en  => fifo_data_rd_en(i),
        dout   => fifo_data_out(i),
        full   => fifo_data_full(i),
        empty  => fifo_data_empty(i));
  end generate GENERATE_INPUT_FIFOS;


  -----------------------------------------------------------------------------
  -- send data to output links (parser -> builder -> s-link )
  -----------------------------------------------------------------------------

  GENERATE_OWN_LVL1 : process (DATA_IN_CLK)
  begin
    if rising_edge(DATA_IN_CLK) then
      if data_valid_in_synch = '1' and DATA_VALID_IN = '0' then
        data_valid_in_synch <= DATA_VALID_IN;
        data_valid_finished <= '1';
        --when the data is transmitted outside
        --then there can be new data incoming
        --therfore ... *D
      else
        data_valid_in_synch <= DATA_VALID_IN;
        data_valid_finished <= '0';
      end if;
    end if;
  end process GENERATE_OWN_LVL1;

  l1_trigger_value_in(31)          <= data_valid_finished;      
  l1_trigger_value_in(30 downto 0) <= (others => '0');

  L1A_TRIGGER_FIFO_INST : l1a_trigger_fifo  --*D fifo is used - it cen be used
                                            --later as real one lvl1 fifo
    port map (
      rst              => RESET,
      wr_clk           => DATA_IN_CLK,
      rd_clk           => DATA_OUT_CLK,
      din              => l1_trigger_value_in,
      wr_en            => l1_trigger_value_in(31),  --LVL1_VALID,
      rd_en            => l1_trigger_read,
      prog_full_thresh => LVL1_FULL_THR,
      dout             => l1_trigger_value_out,
      full             => open,
      empty            => l1_fifo_empty,
      prog_full        => l1_fifo_full);
  L1_BUSY <= l1_fifo_full;

  --READ_FIRST_WORD : process (DATA_OUT_CLK)
  --begin
  --  if rising_edge(DATA_OUT_CLK) then
  --    if l1_fifo_empty = '0' and l1_fifo_empty_synch = '1' then
  --      l1_fifo_empty_synch <= l1_fifo_empty;
  --      l1_fifo_empty_pulse <= '1';
  --    else
  --      l1_fifo_empty_synch <= l1_fifo_empty;
  --      l1_fifo_empty_pulse <= '1';
  --    end if;
  --  end if;
  --end process READ_FIRST_WORD;
  
  SEND_DATA_AND_CONF_FSM_CLK : process (DATA_OUT_CLK, RESET)
  begin
    if rising_edge(DATA_OUT_CLK) then
      if RESET = '1' then
        SEND_DATA_FSM_CURRENT <= IDLE;
        l1_trigger_read       <= '0';
        end_of_transmission   <= '0';
      else
        SEND_DATA_FSM_CURRENT <= SEND_DATA_AND_CONF_FSM_NEXT;
        l1_trigger_read       <= l1_trigger_read_fsm;
        end_of_transmission   <= end_of_transmission_fsm;
      end if;
    end if;
  end process SEND_DATA_AND_CONF_FSM_CLK;

  SEND_DATA_AND_CONF_FSM_PROC : process (DATA_OUT_CLK, l1_trigger_value_out, all_data_sent)
  begin
    l1_trigger_read_fsm         <= '0';
    end_of_transmission_fsm     <= '0';
    case (SEND_DATA_FSM_CURRENT) is
      when IDLE =>
        if l1_fifo_empty = '0' then--l1_trigger_value_out(31) = '1' then
          l1_trigger_read_fsm         <= '1';
          SEND_DATA_AND_CONF_FSM_NEXT <= SEND_DATA;
        else
          SEND_DATA_AND_CONF_FSM_NEXT <= IDLE;
        end if;
      when SEND_DATA =>
        if all_data_sent = all_data_sent_const_ones then
          end_of_transmission_fsm     <= '1';
          SEND_DATA_AND_CONF_FSM_NEXT <= WAIT_FOR_READOUT_FIFO_A;
        else
          SEND_DATA_AND_CONF_FSM_NEXT <= SEND_DATA;
        end if;
      when WAIT_FOR_READOUT_FIFO_A =>
        SEND_DATA_AND_CONF_FSM_NEXT <= WAIT_FOR_READOUT_FIFO_B;
      when WAIT_FOR_READOUT_FIFO_B =>
        SEND_DATA_AND_CONF_FSM_NEXT <= IDLE;
      when others =>
        SEND_DATA_AND_CONF_FSM_NEXT <= IDLE;
    end case;
  end process SEND_DATA_AND_CONF_FSM_PROC;

  SCAN_ALL_OUTPUT_POINTERS : for out_link_nr in 0 to NUMBER_OF_OUTPUT_LINKS - 1 generate
    SET_POINTRERS : process (DATA_OUT_CLK, RESET)
    begin
      if rising_edge(DATA_OUT_CLK) then
        if ros_roi_bus_assignment_done_pulse = '1' then
          next_pointer(out_link_nr) <= (others => '0');
          scan(out_link_nr)         <= (others => '0');
          link_pointer(out_link_nr) <= (others => (to_unsigned(0, link_pointer(0)(0)'length)));--)link_pointer(out_link_nr);
        elsif scan(out_link_nr) < NUMBER_OF_ROS_ROI_INPUT_BUSES and ROS_ROI_BUS_ASSIGNMENT(to_integer(scan(out_link_nr))) = std_logic_vector(to_unsigned(out_link_nr, ROS_ROI_BUS_ASSIGNMENT(0)'length)) then
          next_pointer(out_link_nr)               <= next_pointer(out_link_nr) + 1;
          scan(out_link_nr)                       <= scan(out_link_nr) + 1;
          link_pointer(out_link_nr)(to_integer(next_pointer(out_link_nr))) <= scan(out_link_nr);
        elsif scan(out_link_nr) < NUMBER_OF_ROS_ROI_INPUT_BUSES then
          next_pointer(out_link_nr) <= next_pointer(out_link_nr);
          scan(out_link_nr)         <= scan(out_link_nr) + 1;
          link_pointer(out_link_nr) <= link_pointer(out_link_nr);
         else
           next_pointer(out_link_nr) <= next_pointer(out_link_nr);
          scan(out_link_nr)         <= scan(out_link_nr);
          link_pointer(out_link_nr) <= link_pointer(out_link_nr);
        end if;
      end if;
    end process SET_POINTRERS;
  end generate SCAN_ALL_OUTPUT_POINTERS;

  SEND_INDIVIDUAL_LINK_DATA : for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES - 1 generate
    ENABLE_READ_FOR_IND_BUSES : process (DATA_OUT_CLK, RESET)
    begin
      if rising_edge(DATA_OUT_CLK) then
        if RESET = '1' or SEND_DATA_FSM_CURRENT = IDLE then
          fifo_data_rd_en(i) <= '0';
          number_of_read_out_fifo_data(i) <= (others => '0');
        elsif  --comparing actual fifo->link pointer value
          --with interesting link number
          --(constant value) - this can cause bad
          --timing performance !!!!
          link_pointer(0)(to_integer(bus_number(0))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(1)(to_integer(bus_number(1))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(2)(to_integer(bus_number(2))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(3)(to_integer(bus_number(3))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(4)(to_integer(bus_number(4))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(5)(to_integer(bus_number(5))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(6)(to_integer(bus_number(6))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(7)(to_integer(bus_number(7))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(8)(to_integer(bus_number(8))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(9)(to_integer(bus_number(9))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(10)(to_integer(bus_number(10))) = to_unsigned(i, link_pointer(0)(0)'length) or
          link_pointer(11)(to_integer(bus_number(11))) = to_unsigned(i, link_pointer(0)(0)'length)
        then
          fifo_data_rd_en(i) <= '1';
          number_of_read_out_fifo_data(i) <= number_of_read_out_fifo_data(i) + 1;
        else
          fifo_data_rd_en(i) <= '0';
          number_of_read_out_fifo_data(i) <= number_of_read_out_fifo_data(i);
        end if;
      end if;
    end process ENABLE_READ_FOR_IND_BUSES;
  end generate SEND_INDIVIDUAL_LINK_DATA;

  REDIRECT_DATA_GEN : for i in 0 to NUMBER_OF_OUTPUT_LINKS - 1 generate
    REDIRECT_OUT_DATA : process (DATA_OUT_CLK, RESET)
    begin
      if rising_edge(DATA_OUT_CLK) then
        if RESET = '1' or SEND_DATA_FSM_CURRENT = IDLE then
          OUT_DATA(i)       <= (others => '0');
          ACTUAL_BUS_NUMBER_OUT(i) <= (others => '0');
        elsif link_pointer(i)(to_integer(bus_number(i))) < NUMBER_OF_ROS_ROI_INPUT_BUSES then
          OUT_DATA(i)       <= fifo_data_out(to_integer(link_pointer(i)(to_integer(bus_number_delay_b(i)))))(127 downto 0);
          ACTUAL_BUS_NUMBER_OUT(i) <= link_pointer(i)(to_integer(bus_number_delay_b(i)));
        else
          OUT_DATA(i)       <= fifo_data_out(to_integer(link_pointer(i)(to_integer(bus_number_delay_b(i)))))(127 downto 0);--
          ACTUAL_BUS_NUMBER_OUT(i) <= link_pointer(i)(to_integer(bus_number_delay_b(i)));
          --(others => '0');
        end if;
      end if;
    end process REDIRECT_OUT_DATA;

    UPDATE_LINK_POINTER : process (DATA_OUT_CLK, RESET)
    begin
      if rising_edge(DATA_OUT_CLK) then
        if RESET = '1' or SEND_DATA_FSM_CURRENT = IDLE then
          bus_number(i) <= (others => '0');
          bus_number_delay_a(i) <= (others => '0');
          bus_number_delay_b(i) <= (others => '0');
        elsif --fifo_data_out(to_integer(link_pointer(i)(to_integer(bus_number(i))))) = std_logic_vector(to_unsigned(0, fifo_data_out(0)'length)) and bus_number(i) < number_of_fifos_per_output_link(i) then
          number_of_read_out_fifo_data(to_integer(link_pointer(i)(to_integer(bus_number(i))))) = input_ros_roi_data_cntr(to_integer(link_pointer(i)(to_integer(bus_number(i)))))-1  and bus_number(i) < number_of_fifos_per_output_link(i) then
          bus_number(i) <= bus_number(i) + 1;
          bus_number_delay_a(i) <= bus_number(i);
          bus_number_delay_b(i) <= bus_number_delay_a(i);
        else
          bus_number(i) <= bus_number(i);
          bus_number_delay_a(i) <= bus_number(i);
          bus_number_delay_b(i) <= bus_number_delay_a(i);
        end if;
      end if;
    end process UPDATE_LINK_POINTER;

    SEND_DATA_VALID_PROC : process (DATA_OUT_CLK)
    begin
      if rising_edge(DATA_OUT_CLK) then
        if SEND_DATA_FSM_CURRENT = SEND_DATA and bus_number(i) < number_of_fifos_per_output_link(i) then
          data_valid_out_delay_a(i) <= '1';
          data_valid_out_delay_b(i) <= data_valid_out_delay_a(i);
          DATA_VALID_OUT(i)         <= data_valid_out_delay_b(i);
        else
          data_valid_out_delay_a(i) <= '0';
          data_valid_out_delay_b(i) <= data_valid_out_delay_a(i);
          DATA_VALID_OUT(i)         <= data_valid_out_delay_b(i);
        end if;
      end if;
    end process SEND_DATA_VALID_PROC;

    SET_ALL_DATA_SEND : process (DATA_OUT_CLK, RESET)
    begin
      if rising_edge(DATA_OUT_CLK) then
        if SEND_DATA_FSM_CURRENT = IDLE then
          all_data_sent(i) <= '0';
        elsif  bus_number(i) = number_of_fifos_per_output_link(i) then
          all_data_sent(i) <= '1';
        else
          all_data_sent(i) <= '0';
        end if;
      end if;
    end process SET_ALL_DATA_SEND;
    
  end generate REDIRECT_DATA_GEN;

  
  
  START_OF_FRAME <= l1_trigger_read;
  END_OF_FRAME   <= end_of_transmission;

end ddr_to_rod;
