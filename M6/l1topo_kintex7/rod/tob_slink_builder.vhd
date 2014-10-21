library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rod_l1_topo_types_const.all;

entity tob_slink_builder is
  generic (
    VIVADO : boolean := false);
  port (
    RESET                      : in  std_logic;
    CLK                        : in  std_logic;
    --TOB data and configuration
    TOB_DATA_IN                : in  std_logic_vector(127 downto 0) := (others => '0'); --
    --data from input FIFOs already arranged as on the input Virtex
    LINK_NUMBER                : in  std_logic_vector(6 downto 0);
    BCID_OFFSET_IN             : in  std_logic_vector(3 downto 0);
    MAX_OFFSET_IN              : in  std_logic_vector(3 downto 0);
    CRATE_ASSIGNMENT           : in  std_logic_vector(NUMBER_OF_ROS_ROI_INPUT_BUSES*4-1 downto 0);
    --based on this different crate number is put into the data
    DATA_VALID_IN              : in  std_logic;
    BEGINNING_OF_DATA          : in  std_logic;
    END_OF_DATA                : in  std_logic;
--    SLINK_PACKET_BUSY          : in  std_logic;
    ACTIVE_LINKS_NUMBER        : in  std_logic_vector(log2_int(NUMBER_OF_ROS_ROI_INPUT_BUSES) downto 0);
    BUILDER_BUSY               : out std_logic;   
    --from/to slink wrapper
    SLINK_CLK                  : in  std_logic;
    SLINK_DATA_OUT             : out std_logic_vector(31 downto 0);
    SLINK_READY_IN             : in  std_logic;
    SLINK_EVENT_READY_OUT      : out std_logic
    );
end tob_slink_builder;

architecture tob_slink_builder of tob_slink_builder is
  
  type link_cntr_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1) of std_logic_vector(3 downto 0);
  type slice_link_cntr_array is array (0 to 6) of link_cntr_array;
  signal slice_link_cntr_a_saved, slice_link_cntr_a : slice_link_cntr_array :=(others => (others => (others => '0')));
  signal slice_link_cntr_2a : slice_link_cntr_array :=(others => (others => (others => '0')));
  signal slice_cntr, slice_cntr_delayed : unsigned(3 downto 0) := (others => '0');
  signal slice_fifo_wr_en, slice_fifo_rd_en, slice_fifo_rd_en_fsm : std_logic_vector(6 downto 0);
  signal link_fifo_full, link_fifo_empty : std_logic_vector(7 downto 0) := ('1',others => '0');
  type fifo_data_out_array is array (0 to 6) of std_logic_vector(135 downto 0);
  signal fifo_data_out_a : fifo_data_out_array;
  signal tob_data_out : std_logic_vector((MAX_TOB_NUMBER+1)*32-1 downto 0) := (others => '0');
  signal tob_data_in_sync, tob_data_in_sync_a : std_logic_vector(135 downto 0);
  signal event_saved, end_of_data_sync1, end_of_data_sync2, end_of_data_sync3 : std_logic := '0';
  type slink_fiber_cntr_data_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES/5) of std_logic_vector(31 downto 0);
  type slink_fiber_cntr_data_2array is array (0 to 6) of slink_fiber_cntr_data_array;
  signal slink_fiber_cntr_data_2a : slink_fiber_cntr_data_2array :=(others => (others => (others => '0')));
  signal tob_cntr_out_l : std_logic_vector(3 downto 0);
  signal prev_link_number, link_number_delayed : std_logic_vector(6 downto 0);
  signal data_valid_delayed_a, data_valid_delayed : std_logic;
  signal tob_conseq_nrs_l : std_logic_vector(4*9-1 downto 0) := (others => '0');
  signal tob_conseq_nrs_l_part : std_logic_vector(3 downto 0) := (others => '0');
  signal slink_slice_cntr : unsigned(2 downto 0);
  signal slink_data_in, slink_data_in_fsm, slink_data_out_l: std_logic_vector(32 downto 0);
  signal slink_fifo_wr_en, slink_fifo_rd_en, slink_fifo_wr_en_fsm, bcid_cntr_up, bcid_cntr_up_fsm, slink_slice_cntr_up, slink_slice_cntr_up_fsm : std_logic;
  signal cdc_cntr : std_logic_vector(3 downto 0) := (others => '0');
  signal slink_data_out_l_sync, slink_data_out_end_pulse : std_logic;
  signal cdc_event_finished, cdc_event_accepted : std_logic_vector(2 downto 0);
  --signal event_cntr : std_logic_vector(10 downto 0);
  signal tob_type_l : std_logic_vector(3 downto 0) := x"4";
  signal slink_fifo_full, slink_fifo_empty, event_readout_pulse : std_logic;
  signal fiber_cntr : unsigned(6 downto 0);
  signal tob_conseq_pntr, bcid_cntr : integer range 0 to 15 := 0;
  signal wait_cntr : unsigned(2 downto 0);
  signal link_number_l : std_logic_vector(6 downto 0) := (others => '0');
  signal tob_data_l : std_logic_vector(127 downto 0) := (others => '0');
  signal beginning_of_data_sync1,  beginning_of_data_sync2, beginning_of_data_sync3 : std_logic;
  signal next_event_cntr_up, next_event_cntr_up_fsm : std_logic;
  signal cdc_next_event_up_accepted : std_logic_vector(3 downto 0);
  type SLINK_DATA_SEND is (IDLE, DATA_SEND, FINISHED);
  signal SLINK_DATA_SEND_CURRENT, SLINK_DATA_SEND_NEXT : SLINK_DATA_SEND;
  signal slink_event_ready_pulse : std_logic;
  signal slink_event_cntr : std_logic_vector(7 downto 0);
  signal slink_fifo_rd_en_pulse_fsm, slink_fifo_rd_en_pulse : std_logic;
  signal event_accepted, event_accepted_fsm : std_logic;
  signal builder_busy_l : std_logic;
   
  component fifo_32b_1024W_kintex_vivado is
    port (
      rst       : in  std_logic;
      wr_clk    : in  std_logic;
      rd_clk    : in  std_logic;
      --clk       : in  std_logic;
      din       : in  std_logic_vector(32 downto 0);
      wr_en     : in  std_logic;
      rd_en     : in  std_logic;
      dout      : out std_logic_vector(32 downto 0);
      full      : out std_logic;
      empty     : out std_logic
      );
  end component;

  component fifo_136b_512W_kintex_vivado is
    port (
      rst       : in  std_logic;
      --wr_clk    : in  std_logic;
      --rd_clk    : in  std_logic;
      clk    : in  std_logic;
      din       : in  std_logic_vector(135 downto 0);
      wr_en     : in  std_logic;
      rd_en     : in  std_logic;
      dout      : out std_logic_vector(135 downto 0);
      full      : out std_logic;
      empty     : out std_logic
      );
  end component;


  component fifo_32b_1024W_kintex is
    port (
      rst       : in  std_logic;
      wr_clk    : in  std_logic;
      rd_clk    : in  std_logic;
      --clk       : in  std_logic;
      din       : in  std_logic_vector(32 downto 0);
      wr_en     : in  std_logic;
      rd_en     : in  std_logic;
      dout      : out std_logic_vector(32 downto 0);
      full      : out std_logic;
      empty     : out std_logic
      );
  end component;

  component fifo_136b_512W_kintex is
    port (
      rst       : in  std_logic;
      --wr_clk    : in  std_logic;
      --rd_clk    : in  std_logic;
      clk    : in  std_logic;
      din       : in  std_logic_vector(135 downto 0);
      wr_en     : in  std_logic;
      rd_en     : in  std_logic;
      dout      : out std_logic_vector(135 downto 0);
      full      : out std_logic;
      empty     : out std_logic
      );
  end component;

  type SLINK_BUILDER is (IDLE, BLOCK_HEADER, WAIT_FOR_FIFO_DATA, DATA_WRITE, FIBER_CNTRS, FINISHED, WAIT_FOR_SLINK);
  signal SLINK_BUILDER_CURRENT, SLINK_BUILDER_NEXT : SLINK_BUILDER;

begin
-------------------------------------------------------------------------------
-- PARSER
-------------------------------------------------------------------------------
  
  SYNC_DATA_IN_PROC: process (CLK)
  begin
    if rising_edge(CLK) then
      if end_of_data_sync1 = '0' then
        end_of_data_sync1 <= END_OF_DATA;
        end_of_data_sync2 <= end_of_data_sync1;
        end_of_data_sync3 <= end_of_data_sync2;
        tob_data_in_sync_a <= "0" & LINK_NUMBER & TOB_DATA_IN;
        tob_data_in_sync <= tob_data_in_sync_a;
        prev_link_number <= LINK_NUMBER;
        link_number_delayed <= prev_link_number;
        beginning_of_data_sync1 <= BEGINNING_OF_DATA;
        beginning_of_data_sync2 <= beginning_of_data_sync1;
        beginning_of_data_sync3 <= beginning_of_data_sync2;
      else
        beginning_of_data_sync1 <= BEGINNING_OF_DATA;
        beginning_of_data_sync2 <= beginning_of_data_sync1;
        beginning_of_data_sync3 <= beginning_of_data_sync2;
        end_of_data_sync1 <= END_OF_DATA;
        end_of_data_sync2 <= end_of_data_sync1;
        end_of_data_sync3 <= end_of_data_sync2;
        tob_data_in_sync_a <= "1" & LINK_NUMBER & TOB_DATA_IN;  --end of data marker
        tob_data_in_sync <= tob_data_in_sync_a;
        prev_link_number <= LINK_NUMBER;
        link_number_delayed <= prev_link_number;
      end if;
    end if;
  end process SYNC_DATA_IN_PROC;
  
  SLICE_CNTR_PROC: process (CLK)
  begin  
    if rising_edge(CLK) then
      if beginning_of_data_sync3 = '1' then
        slice_cntr <= unsigned(MAX_OFFSET_IN) - unsigned(BCID_OFFSET_IN);
        slice_cntr_delayed <= slice_cntr;
        --It is not possible to send more than 7 slices (the same for all links) !! 
      elsif prev_link_number /= LINK_NUMBER then
        slice_cntr <= unsigned(MAX_OFFSET_IN) - unsigned(BCID_OFFSET_IN);
        slice_cntr_delayed <= slice_cntr;
      elsif prev_link_number = LINK_NUMBER and data_valid_delayed_a = '1' and slice_cntr < 6 then
        slice_cntr <= slice_cntr + 1;
        slice_cntr_delayed <= slice_cntr;
      else
        slice_cntr <= slice_cntr;
        slice_cntr_delayed <= slice_cntr;
      end if;
    end if;
  end process SLICE_CNTR_PROC;

  GENERATE_FIFOS: for i in 0 to 6 generate
    SET_WR_EN: process (CLK)
    begin
      if rising_edge(CLK) then
        if data_valid_delayed_a = '1' and slice_cntr = i then
          slice_fifo_wr_en(i) <= '1';
        else
          slice_fifo_wr_en(i) <= '0';-- or end_of_data_sync;  --end of data saves end
                                                      --marker (33rd bit)
        end if;
      end if;
    end process SET_WR_EN;
  
    FIFO_VIVADO_TOB: if VIVADO = true generate
      SLICE_FIFO: fifo_136b_512W_kintex_vivado
        port map (
          rst       => RESET,
          clk       => CLK,
          din       => tob_data_in_sync,
          wr_en     => slice_fifo_wr_en(i),
          rd_en     => slice_fifo_rd_en(i),
          dout      => fifo_data_out_a(i),
          full      => link_fifo_full(i),
          empty     => link_fifo_empty(i)
          );
    end generate FIFO_VIVADO_TOB;

    FIFO_ISE_TOB: if VIVADO = false generate
      SLICE_FIFO: fifo_136b_512W_kintex
        port map (
          rst       => RESET,
          clk       => CLK,
          din       => tob_data_in_sync,
          wr_en     => slice_fifo_wr_en(i),
          rd_en     => slice_fifo_rd_en(i),
          dout      => fifo_data_out_a(i),
          full      => link_fifo_full(i),
          empty     => link_fifo_empty(i)
          );
    end generate FIFO_ISE_TOB;
    
  end generate GENERATE_FIFOS;  

  TOB_BCID_CNTR_INST: entity work.tob_bcid_cntr --depending on TOB type it
                                                --calculates ToBs amount
    port map (
      CLK            => CLK,
      TOB_DATA_IN    => TOB_DATA_IN,
      TOB_TYPE       => TOB_MAP(std_int(LINK_NUMBER)),
      TOB_CNTR_OUT   => tob_cntr_out_l,
      TOB_CONSEQ_NRS => open--tob_conseq_nrs
      );

  DELAY_DATA_VALID : process (CLK)
  begin
    if rising_edge(CLK) then
      data_valid_delayed_a <= DATA_VALID_IN;
      data_valid_delayed <= data_valid_delayed_a;
    end if;
  end process DELAY_DATA_VALID;
  
  SET_SLICE_LINK_CNTR_PROC : process (CLK, tob_cntr_out_l)
    --writing amount of TOBs for given fiber into array, later it is used to
    --create fiber data word
  begin
    if rising_edge(CLK) then
      if end_of_data_sync3 = '1' then
        slice_link_cntr_a <= (others => (others => "0000"));
        slice_link_cntr_a_saved <= slice_link_cntr_a;
      elsif data_valid_delayed = '1' then  
        slice_link_cntr_a(to_integer(slice_cntr_delayed))(std_int(link_number_delayed)) <= tob_cntr_out_l;
        --for a given link number and slice a number of TOBs is saved 
        slice_link_cntr_a_saved <= slice_link_cntr_a_saved;
      else
        slice_link_cntr_a <= slice_link_cntr_a;
        slice_link_cntr_a_saved <= slice_link_cntr_a_saved;
      end if;
    end if;
  end process SET_SLICE_LINK_CNTR_PROC;

  MUX_INPUT_TOB_DATA : process (CLK)
  begin
    if rising_edge(CLK) then
        link_number_l <= fifo_data_out_a(bcid_cntr)(134 downto 128);
        tob_data_l    <= fifo_data_out_a(bcid_cntr)(127 downto 0);
    end if;
  end process MUX_INPUT_TOB_DATA;
  
  TOB_PARSER_INST: entity work.tob_parser  --2 clocks latency
      port map (
        CLK          => CLK,
        LINK_NUMBER  => link_number_l,
        TOB_DATA_IN  => tob_data_l,
        TOB_DATA_OUT => tob_data_out);
    
  TOB_CONSEQ_CNTR_INST: entity work.tob_bcid_cntr  --2 clocks latency
    port map (
      CLK            => CLK,
      TOB_DATA_IN    => tob_data_l,
      TOB_TYPE       => TOB_MAP(std_int(link_number_l)), 
      TOB_CNTR_OUT   => open,
      TOB_CONSEQ_NRS => tob_conseq_nrs_l
      );
  
  SET_EVENT_SAVED : process (CLK)
  begin
    if rising_edge(CLK) then
      if end_of_data_sync2  = '1' then
        event_saved <= '1';
      elsif SLINK_BUILDER_CURRENT = BLOCK_HEADER then
        event_saved <= '0';
      else
        event_saved <= event_saved;
      end if;
    end if;
  end process SET_EVENT_SAVED;

  BCID_CNTR_SAVE: for j in 0 to 6 generate  --loop over one SLICE, data come
                                            --fiber by fiber number of TOBs for
                                            --given slice has to be now rearanged
                                            --slice/bcid by slice/bcid. See data format
                                            --of L1Topo - slices are forming
                                            --block of data, here fiber data words
                                            --are created
    MAKE_FIBER_CNTRS: for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
      slink_fiber_cntr_data_2a(j)(i/5)((27-(i mod 5)*5-1) downto 23-(i mod 5)*5) <= slice_link_cntr_a_saved(j)(i);
      --i/5 five fiber cntrs fit into 32 bit data format
      slink_fiber_cntr_data_2a(j)(i/5)(27-(i mod 5)*5) <= '0';
      --here "0" should be exchanged with one when special data is send (OV,
      --errors ....)
    end generate MAKE_FIBER_CNTRS;
  end generate BCID_CNTR_SAVE;
  
  SLINK_BUILDER_FSM_CLK : process (CLK)
  begin
    if rising_edge(CLK) then
      if RESET = '1' then
        SLINK_BUILDER_CURRENT   <= IDLE;
        slink_data_in       <= (others => '0');
        slink_fifo_wr_en    <= '1';
        slice_fifo_rd_en    <= (others => '0');
        bcid_cntr_up        <= '0';
        slink_slice_cntr_up <= '0';
        next_event_cntr_up  <= '0';
      else
        SLINK_BUILDER_CURRENT   <= SLINK_BUILDER_NEXT;
        slink_data_in       <= slink_data_in_fsm;
        slink_fifo_wr_en    <= slink_fifo_wr_en_fsm;
        slice_fifo_rd_en    <= slice_fifo_rd_en_fsm;
        bcid_cntr_up        <= bcid_cntr_up_fsm;
        slink_slice_cntr_up <= slink_slice_cntr_up_fsm;
        next_event_cntr_up  <= next_event_cntr_up_fsm;
      end if;
    end if;
  end process SLINK_BUILDER_FSM_CLK;
  
--ps 
	tob_conseq_nrs_l_part <= tob_conseq_nrs_l((tob_conseq_pntr+1)*4-1 downto tob_conseq_pntr*4);

  
  SLINK_BUILDER_FSM_PROC : process (CLK)
  begin
    slink_data_in_fsm       <= ('1',others => '0');
    slink_fifo_wr_en_fsm    <= '0';
    slice_fifo_rd_en_fsm    <= (others => '0');
    bcid_cntr_up_fsm        <= '0';
    slink_slice_cntr_up_fsm <= '0';
    next_event_cntr_up_fsm  <= '0';
    case (SLINK_BUILDER_CURRENT) is
      
      when IDLE      =>
        if event_saved = '1' then
          SLINK_BUILDER_NEXT <= BLOCK_HEADER;
        else
          SLINK_BUILDER_NEXT <= IDLE;
        end if;
        
      when BLOCK_HEADER =>
        slink_fifo_wr_en_fsm <= '1';
        slink_data_in_fsm(31 downto 5) <= BLOCK_WORD_TYPE & x"0" & ACTIVE_LINKS_NUMBER & x"0000" & "0";
        if slink_slice_cntr = 7 then
          slink_data_in_fsm(4) <= '1';  -- last block (data format)
        else
          slink_data_in_fsm(4) <=  link_fifo_empty(to_integer(slink_slice_cntr)+1);
          -- empty represents next BCID, here data is written always even without TOBs
          -- last block (data format) it will be not empty till markers are
          -- read out
        end if;
        if slink_slice_cntr > unsigned(MAX_OFFSET_IN) then  --saving current
                                                            --offset (data format)
          slink_data_in_fsm(2 downto 0) <= std_logic_vector(slink_slice_cntr(2 downto 0) - unsigned(MAX_OFFSET_IN(2 downto 0)) - 1);
          slink_data_in_fsm(3) <= '0';
        else
          slink_data_in_fsm(2 downto 0) <= std_logic_vector(unsigned(MAX_OFFSET_IN(2 downto 0)) - slink_slice_cntr(2 downto 0));
          slink_data_in_fsm(3) <= '1';  --for negative numbers
        end if;
        SLINK_BUILDER_NEXT <= FIBER_CNTRS;
        
      when FIBER_CNTRS =>        
        if fiber_cntr = to_unsigned(NUMBER_OF_ROS_ROI_INPUT_BUSES/5,7) + 1 then 
          --divided by 5 since 5 fiber cntrs fit into 32 bit data fomrat word
          slink_slice_cntr_up_fsm <= '1';  --next slice after
          slice_fifo_rd_en_fsm(bcid_cntr) <= '1';
          --fifo rd takes 1 clock, next one clock for mux and 2 for creating tobs
          SLINK_BUILDER_NEXT <= WAIT_FOR_FIFO_DATA;
        else
		    slink_fifo_wr_en_fsm <= '1';
          slink_data_in_fsm(31 downto 28) <= FIBER_WORD_TYPE;
          slink_data_in_fsm(27 downto 3) <= slink_fiber_cntr_data_2a(to_integer(slink_slice_cntr))(to_integer(fiber_cntr))(27 downto 3); 
          --see BCID_CNTR_SAVE
          slink_data_in_fsm(2 downto 0) <= (others => '0');
          slink_slice_cntr_up_fsm <= '0';
          SLINK_BUILDER_NEXT <= FIBER_CNTRS;
        end if;

      when WAIT_FOR_FIFO_DATA =>
        if wait_cntr = 3 then
          SLINK_BUILDER_NEXT <= DATA_WRITE;
        else
          SLINK_BUILDER_NEXT <= WAIT_FOR_FIFO_DATA;
        end if;
          
      when DATA_WRITE =>                
        if (link_fifo_empty(bcid_cntr) = '1' and link_fifo_empty((bcid_cntr)+1) = '0') and
          (tob_conseq_nrs_l((tob_conseq_pntr+1)*4-1 downto tob_conseq_pntr*4) = x"f" or tob_conseq_pntr = 9) then
        --link_fifo_empty - check if any data left for given slice/BCID, if not
        --next slice/BCID data block, but ...
        --link_fifo_empty + 1 - if nothing in next fifo than FINISHED (next elsif)
        --tob_conseq_nrs_l - all TOBs has to be transferred
        --tob_conseq_pntr - maximum 9 TOBs in one 128bit data   
          bcid_cntr_up_fsm <= '1';
          SLINK_BUILDER_NEXT <= BLOCK_HEADER;  --next BCID block data
        elsif (link_fifo_empty(bcid_cntr) = '1' and link_fifo_empty(bcid_cntr+1) = '1') and 
          (tob_conseq_nrs_l((tob_conseq_pntr+1)*4-1 downto tob_conseq_pntr*4) = x"f" or tob_conseq_pntr = 9) then
          SLINK_BUILDER_NEXT <= FINISHED;
        elsif tob_conseq_nrs_l((tob_conseq_pntr+1)*4-1 downto tob_conseq_pntr*4) = x"f" or tob_conseq_pntr = 9 then
          slice_fifo_rd_en_fsm(bcid_cntr) <= '1';
          --fifo rd takes 1 clock, next one clock for mux and 2 for creating tobs
          SLINK_BUILDER_NEXT <= WAIT_FOR_FIFO_DATA;
          --read next 128 bit data to convert it to TOBs
        else
          slink_fifo_wr_en_fsm <= '1';
          slink_data_in_fsm(31 downto 0) <=
          tob_data_out(
			 --32*(std_int(tob_conseq_nrs_l((tob_conseq_pntr+1)*4-1 downto tob_conseq_pntr*4))   +1)-1
			 32*(std_int(tob_conseq_nrs_l_part)   +1)-1
			 downto 
			 --32*(std_int(tob_conseq_nrs_l((tob_conseq_pntr+1)*4-1 downto tob_conseq_pntr*4)))
			 32*(std_int(tob_conseq_nrs_l_part))
			 );
          SLINK_BUILDER_NEXT <= DATA_WRITE;
        end if;

      when FINISHED =>
        slink_fifo_wr_en_fsm <= '1';
        slink_data_in_fsm(32) <= '0';
        SLINK_BUILDER_NEXT <= WAIT_FOR_SLINK;
        
      when WAIT_FOR_SLINK =>
        next_event_cntr_up_fsm <= '1';
        if cdc_event_accepted(2) = '1' then
          SLINK_BUILDER_NEXT <= IDLE;
        else
          SLINK_BUILDER_NEXT <= WAIT_FOR_SLINK;
        end if;
        --put coinstraint into UCF file - max delay, from to
        --for both signals cdc_next_event_up_accepted/next_event_cntr_up
        --then remove "cdc" (only when using clks in phase and this clk is
        --at least 2 times faster than slink clk)
      when others    =>
        SLINK_BUILDER_NEXT <= IDLE;
        
    end case;
  end process SLINK_BUILDER_FSM_PROC;

  TOB_CONSEQ_CNTR : process (CLK)
  begin
    if rising_edge(CLK) then
      if SLINK_BUILDER_CURRENT = WAIT_FOR_FIFO_DATA then
        tob_conseq_pntr <= 0;
      elsif SLINK_BUILDER_CURRENT = DATA_WRITE then
        tob_conseq_pntr <= tob_conseq_pntr + 1;
      else
        tob_conseq_pntr <= tob_conseq_pntr;
      end if;
    end if;
  end process TOB_CONSEQ_CNTR;
  
  FIBER_CNTR_INST : process (CLK)
  begin
    if rising_edge(CLK) then
      if SLINK_BUILDER_CURRENT /= FIBER_CNTRS then
        fiber_cntr <= (others => '0');
      elsif SLINK_BUILDER_CURRENT = FIBER_CNTRS then
        fiber_cntr <= fiber_cntr + 1;
      else
        fiber_cntr <= fiber_cntr;
      end if;
    end if;
  end process FIBER_CNTR_INST;

  BCID_CNTR_PROC : process (CLK)
  begin
    if rising_edge(CLK) then
      if SLINK_BUILDER_CURRENT = IDLE  then
        bcid_cntr <= 0;
      elsif bcid_cntr_up = '1' then
        bcid_cntr <= bcid_cntr + 1;
      else
        bcid_cntr <= bcid_cntr;
      end if;
    end if;
  end process BCID_CNTR_PROC;

  SLINK_SLICE_CNTR_PROC : process (CLK)
  begin
    if rising_edge(CLK) then
      if SLINK_BUILDER_CURRENT = IDLE  then
        slink_slice_cntr <= (others => '0');
      elsif slink_slice_cntr_up = '1' then
        slink_slice_cntr <= slink_slice_cntr + 1;
      else
        slink_slice_cntr <= slink_slice_cntr;
      end if;
    end if;
  end process SLINK_SLICE_CNTR_PROC;

  WAIT_CNTR_INST : process (CLK)
  begin
    if rising_edge(CLK) then
      if SLINK_BUILDER_CURRENT = WAIT_FOR_FIFO_DATA then
        wait_cntr <= wait_cntr + 1;
      else
        wait_cntr <= (others => '0');
      end if;
    end if;
  end process WAIT_CNTR_INST;

  AVOID_METASTABILITY_EVENT_ACCEPTED : process (SLINK_CLK)  --not necessary for clocks(CLK,SLINK_CLK)
                                                      --in phase and with constrains(kept for time being)
  begin
    if rising_edge(SLINK_CLK) then
      for i in 0 to 2 loop
        if i = 0 then
          cdc_event_accepted(i) <=  event_accepted;
        end if;
        if i > 0 then
          cdc_event_accepted(i) <=  cdc_event_accepted(i-1);
        end if;
      end loop;  
    end if;
  end process AVOID_METASTABILITY_EVENT_ACCEPTED;  

  -----------------------------------------------------------------------------
  -- SLINK
  -----------------------------------------------------------------------------

  VIVADO_FIFO_INT: if VIVADO = true generate  --in fifos data is saved from
                                              --given time slices
    SLINK_FIFO: fifo_32b_1024W_kintex_vivado
    port map (
      rst       => RESET,
      wr_clk    => CLK,
      rd_clk    => SLINK_CLK,
      din       => slink_data_in,
      wr_en     => slink_fifo_wr_en,
      rd_en     => slink_fifo_rd_en,
      dout      => slink_data_out_l,
      full      => slink_fifo_full,
      empty     => slink_fifo_empty
      );
  end generate VIVADO_FIFO_INT;

   ISE_FIFO_INT: if VIVADO = false generate
    SLINK_FIFO: fifo_32b_1024W_kintex
    port map (
      rst       => RESET,
      wr_clk    => CLK,
      rd_clk    => SLINK_CLK,
      din       => slink_data_in,
      wr_en     => slink_fifo_wr_en,
      rd_en     => slink_fifo_rd_en,
      dout      => slink_data_out_l,
      full      => slink_fifo_full,
      empty     => slink_fifo_empty
      );
  end generate ISE_FIFO_INT;
  
  SLINK_DATA_OUT   <= slink_data_out_l(31 downto 0);
  slink_fifo_rd_en <= SLINK_READY_IN or slink_fifo_rd_en_pulse;

  AVOID_METASTABILITY_EVENT_FINISHED : process (SLINK_CLK)  --not necessary for clocks(CLK,SLINK_CLK)
                                                      --in phase and with constrains(kept for time being)
  begin
    if rising_edge(SLINK_CLK) then
      for i in 0 to 2 loop
        if i = 0 then
          cdc_event_finished(i) <= next_event_cntr_up;
        end if;
        if i > 0 then
          cdc_event_finished(i) <= cdc_event_finished(i-1);
        end if;
      end loop;  
    end if;
  end process AVOID_METASTABILITY_EVENT_FINISHED;  

  SET_EVENT_CNTR_PULSE_DOWN : process (SLINK_CLK)
  begin
    if rising_edge(SLINK_CLK) then
      if cdc_event_finished(2) = '0' and cdc_event_finished(1) = '1' then
        slink_event_ready_pulse <= '1';
      else
        slink_event_ready_pulse <= '0';
      end if;
    end if;
  end process SET_EVENT_CNTR_PULSE_DOWN;

  COUNT_STORED_SLINK_EVENTS : process (SLINK_CLK, RESET)
  begin
    if rising_edge(SLINK_CLK) then
      if RESET = '1' then
        slink_event_cntr <= (others => '0');
      elsif slink_event_ready_pulse = '1' and slink_data_out_end_pulse = '0' then
        slink_event_cntr <= slink_event_cntr + 1;
      elsif slink_event_ready_pulse = '0' and slink_data_out_end_pulse = '1' then
        slink_event_cntr <= slink_event_cntr - 1;
      else
        slink_event_cntr <= slink_event_cntr;
      end if;
    end if;
  end process COUNT_STORED_SLINK_EVENTS;

  SLINK_DATA_SEND_CLK : process (SLINK_CLK, RESET)
  begin
    if rising_edge(SLINK_CLK) then
      if RESET = '1' then
        SLINK_DATA_SEND_CURRENT   <= IDLE;
        slink_fifo_rd_en_pulse    <= '0';
        event_accepted            <= '0'; 
      else
        SLINK_DATA_SEND_CURRENT   <= SLINK_DATA_SEND_NEXT;
        slink_fifo_rd_en_pulse    <= slink_fifo_rd_en_pulse_fsm;
        event_accepted            <= event_accepted_fsm; 
      end if;
    end if;
  end process SLINK_DATA_SEND_CLK;

  SLINK_DATA_SEND_PROC : process (SLINK_CLK)
  begin
    slink_fifo_rd_en_pulse_fsm <= '0';
    event_accepted_fsm         <= '0';  
    case (SLINK_DATA_SEND_CURRENT) is
      when IDLE      =>
        if slink_event_cntr /= 0 then
          SLINK_DATA_SEND_NEXT <= DATA_SEND;
          slink_fifo_rd_en_pulse_fsm <= '1';
        else
          SLINK_DATA_SEND_NEXT <= IDLE;
        end if;
      when DATA_SEND =>
        if slink_data_out_end_pulse = '1' then
          SLINK_DATA_SEND_NEXT <= FINISHED;
        else
          SLINK_DATA_SEND_NEXT <= DATA_SEND;
        end if;
      when FINISHED =>                  --one additional state for updating cntrs
        event_accepted_fsm <= '1'; 
        SLINK_DATA_SEND_NEXT <= IDLE;
      when others    =>
        SLINK_DATA_SEND_NEXT <= IDLE;
    end case;
  end process SLINK_DATA_SEND_PROC;
    
  SLINK_EVENT_READY_OUT <= slink_data_out_l(32);
  
  MAKE_EVENT_END_PULSE : process (SLINK_CLK)
  begin
    if rising_edge(SLINK_CLK) then
      if slink_data_out_l_sync = '1' and  slink_data_out_l(32) = '0' then
        slink_data_out_end_pulse <= '1';
        slink_data_out_l_sync <= slink_data_out_l(32);
      else
        slink_data_out_end_pulse <= '0';
        slink_data_out_l_sync <= slink_data_out_l(32);
      end if;
    end if;
  end process MAKE_EVENT_END_PULSE;
  
  SIMPLIFIED_BUSY : process (SLINK_CLK)
  begin
		if rising_edge(SLINK_CLK) then
			if slink_event_cntr /= 0 then
				builder_busy_l <=  '1';
			else
				builder_busy_l <=  '0';
			end if;
		end if;
  end process SIMPLIFIED_BUSY;
  BUILDER_BUSY <= builder_busy_l;
  
end tob_slink_builder;
    
 
