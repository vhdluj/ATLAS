library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library work;
--use work.all;
use work.rod_l1_topo_types_const.all;


entity parser_wrapper is
  generic (

    LINK_NUMBER              : integer                  := 0;
    TOTAL_NUMBER_OF_IN_LINKS : integer                  := 4;
    ACTIVE_LINKS             : pointers_array           := (0, 1); --(0, 12, 24, 36, 0, 11, 23, 34, 0, 11, 23, 34, 0, 11, 23, 34, 0, 11, 23, 34, 0, 11, 23, 34, 0, 11, 23, 34, 0, 11, 23, 34, 0, 11, 23, 34, 0, 11, 23, 34);
    TYPE_ASSIGNMENT_INS      : slice_parameters_array_u := (x"4", x"4", x"4") --(x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4", x"2", x"8", x"3", x"4")  --type of parser--assigned to links
    );

  port (
    CLK_WR_IN          : in  std_logic;
    CLK_RD_IN          : in  std_logic;
    RESET_IN           : in  std_logic;
    BC_OFFSET_IN       : in  std_logic_vector(5 downto 0);
    BC_QTY_IN          : in  std_logic_vector(5 downto 0);
    DATA_IN            : in  std_logic_vector(127 downto 0);
    ROS_ROI_BUS_NUMBER : in  std_logic_vector(memory_selector_range);
    DATA_OUT           : out std_logic_vector(31 downto 0);
    DATA_RE_IN         : in  std_logic;
    DATA_RDY_OUT       : out std_logic;
    DATA_VALID_IN      : in  std_logic

    );
end parser_wrapper;

-- each parser has its individual state machine and fifo. For each link predefined
-- connection a corroesponding number of parsers has to be generated. This is
-- done in set_number_of_type - 1st is output link number 2nd is number of
-- given parser
architecture parser_wrapper of parser_wrapper is

  signal data_in_l       : std_logic_vector(TOTAL_NUMBER_OF_IN_LINKS * 32 - 1 downto 0);
  signal data_rdy_in_l   : std_logic_vector(TOTAL_NUMBER_OF_IN_LINKS - 1 downto 0);
  signal data_sizes_in_l : std_logic_vector(TOTAL_NUMBER_OF_IN_LINKS * 3 - 1 downto 0);
  signal data_re_out_l   : std_logic_vector(TOTAL_NUMBER_OF_IN_LINKS - 1 downto 0);
  signal update_bc_out_l : std_logic_vector(TOTAL_NUMBER_OF_IN_LINKS - 1 downto 0);

  signal data_valid_in_l : std_logic_vector(NUMBER_OF_ROS_ROI_INPUT_BUSES - 1 downto 0);
  signal data_in_synch   : std_logic_vector(ROS_INPUT_GRANURALITY-1 downto 0);
  signal bc_local        : unsigned(31 downto 0):= (others => '0');
begin


  SYNCH_DATA_IN : process (CLK_WR_IN)
  begin
    if rising_edge(CLK_WR_IN) then
      data_in_synch <= DATA_IN;
    end if;
  end process SYNCH_DATA_IN;

  CHECK_LINK_IS_ACTIVATED : if TOTAL_NUMBER_OF_IN_LINKS > 0 generate
    
    GENERATE_PARSERS : for i in 0 to TOTAL_NUMBER_OF_IN_LINKS - 1 generate

      SET_IND_DATA_VALID : process (CLK_WR_IN)
      begin
        if rising_edge(CLK_WR_IN) then
          if DATA_VALID_IN = '1' and ROS_ROI_BUS_NUMBER = ACTIVE_LINKS(i) then
            data_valid_in_l(i) <= '1';
          else
            data_valid_in_l(i) <= '0';
          end if;
        end if;
      end process SET_IND_DATA_VALID;

      GEN_MUON_PARSER : if TYPE_ASSIGNMENT_INS(i) = x"4" generate
        MUON_PARSER_INST : entity work.muon_parser
          port map (
            CLK_WR_IN         => CLK_WR_IN,
            CLK_RD_IN         => CLK_RD_IN,
            RESET_IN          => RESET_IN,
            BC_OFFSET_IN      => BC_OFFSET_IN,
            BC_QTY_IN         => BC_QTY_IN,
            DATA_IN           => data_in_synch,
            DATA_WE_IN        => data_valid_in_l(i),
            DATA_OUT          => data_in_l(31+i*32 downto i*32),
            DATA_RE_IN        => data_rdy_in_l(i),
            UPDATE_BC_IN      => update_bc_out_l(i),
            DATA_RDY_OUT      => data_rdy_in_l(i),
            TOB_COUNTER_OUT   => data_sizes_in_l(2+i*3 downto i*3),
            CRC_ERR_OUT       => open,
            FIFO_OVERFLOW_OUT => open);
      end generate GEN_MUON_PARSER;

      GEN_SUM_PARSER : if TYPE_ASSIGNMENT_INS(i) = x"8" generate
        MUON_PARSER_INST : entity work.sum_parser
          port map (
            CLK_WR_IN         => CLK_WR_IN,
            CLK_RD_IN         => CLK_RD_IN,
            RESET_IN          => RESET_IN,
            BC_OFFSET_IN      => BC_OFFSET_IN,
            BC_QTY_IN         => BC_QTY_IN,
            DATA_IN           => data_in_synch,
            DATA_WE_IN        => data_valid_in_l(i),
            DATA_OUT          => data_in_l(31+i*32 downto i*32),
            DATA_RE_IN        => data_rdy_in_l(i),
            UPDATE_BC_IN      => update_bc_out_l(i),
            DATA_RDY_OUT      => data_rdy_in_l(i),
            TOB_COUNTER_OUT   => data_sizes_in_l(2+i*3 downto i*3),
            CRC_ERR_OUT       => open,
            FIFO_OVERFLOW_OUT => open);
      end generate GEN_SUM_PARSER;

      GEN_JET_PARSER : if TYPE_ASSIGNMENT_INS(i) = x"3" generate
        MUON_PARSER_INST : entity work.jet_parser
          port map (
            CLK_WR_IN         => CLK_WR_IN,
            CLK_RD_IN         => CLK_RD_IN,
            RESET_IN          => RESET_IN,
            BC_OFFSET_IN      => BC_OFFSET_IN,
            BC_QTY_IN         => BC_QTY_IN,
            DATA_IN           => data_in_synch,
            DATA_WE_IN        => data_valid_in_l(i),
            DATA_OUT          => data_in_l(31+i*32 downto i*32),
            DATA_RE_IN        => data_rdy_in_l(i),
            UPDATE_BC_IN      => update_bc_out_l(i),
            DATA_RDY_OUT      => data_rdy_in_l(i),
            TOB_COUNTER_OUT   => data_sizes_in_l(2+i*3 downto i*3),
            CRC_ERR_OUT       => open,
            FIFO_OVERFLOW_OUT => open);
      end generate GEN_JET_PARSER;

      GEN_ENERGY_PARSER : if TYPE_ASSIGNMENT_INS(i) = x"2" generate
        MUON_PARSER_INST : entity work.energy_parser
          port map (
            CLK_WR_IN         => CLK_WR_IN,
            CLK_RD_IN         => CLK_RD_IN,
            RESET_IN          => RESET_IN,
            BC_OFFSET_IN      => BC_OFFSET_IN,
            BC_QTY_IN         => BC_QTY_IN,
            DATA_IN           => data_in_synch,
            DATA_WE_IN        => data_valid_in_l(i),
            DATA_OUT          => data_in_l(31+i*32 downto i*32),
            DATA_RE_IN        => data_re_out_l(i),
            UPDATE_BC_IN      => update_bc_out_l(i),
            DATA_RDY_OUT      => data_rdy_in_l(i),
            TOB_COUNTER_OUT   => data_sizes_in_l(2+i*3 downto i*3),
            CRC_ERR_OUT       => open,
            FIFO_OVERFLOW_OUT => open);
      end generate GEN_ENERGY_PARSER;

    end generate GENERATE_PARSERS;

--
      BLOCK_BUILDER_INST : entity work.block_builder
        generic map (
          FIBERS_QTY => TOTAL_NUMBER_OF_IN_LINKS
          )
        port map (
          CLK_IN        => CLK_RD_IN,
          RESET_IN      => RESET_IN,
          BC_OFFSET_IN  => BC_OFFSET_IN,
          BC_QTY_IN     => BC_QTY_IN,
          DATA_IN       => data_in_l,
          DATA_RDY_IN   => data_rdy_in_l,
          DATA_SIZES_IN => data_sizes_in_l,
          DATA_RE_OUT   => data_re_out_l,
          UPDATE_BC_OUT => update_bc_out_l,
          DATA_OUT      => DATA_OUT,
          DATA_RE_IN    => DATA_RE_IN,
          READY_OUT     => DATA_RDY_OUT,
          BC_SLINK      => std_logic_vector(bc_local)
          );

  end generate CHECK_LINK_IS_ACTIVATED;

  BC_DUMMY : process (CLK_RD_IN)
  begin
    if rising_edge(CLK_RD_IN) then
      bc_local <= bc_local+1;
    end if;
  end process BC_DUMMY;
  
  
  
end parser_wrapper;
