library IEEE;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package rod_l1_topo_types_const is
  ------------------------------------------------------------------------------
  -- kintex & virtex
  ------------------------------------------------------------------------------
  constant NUMBER_OF_ROS_OUTPUT_BUSES : integer := 8;
  constant ROS_OUTPUT_GRANURALITY     : integer := 8;
  constant OUTPUT_DATA_WIDTH          : integer := NUMBER_OF_ROS_OUTPUT_BUSES*ROS_OUTPUT_GRANURALITY;
  constant NUMBER_OF_ROS_ROI_INPUT_BUSES : integer := 2;
  constant MAX_NUMBER_OF_ROS_ROI_INPUT_BUSES : integer := 80;
  constant ROS_INPUT_GRANURALITY         : integer := 128;
  constant SIZE_OF_SLICE_VALUE           : integer := 4;
  constant MAX_NUMBER_OF_TOTAL_SLICES    : integer := NUMBER_OF_ROS_ROI_INPUT_BUSES*2**(SIZE_OF_SLICE_VALUE);
  constant NUMBER_OF_PARSERS             : integer := 16;
  function log2_int (x : natural) return integer;
  --DDR 
  constant LINKS_NUMBER : integer := 8;
  -----------------------------------------------------------------------------
  -- virtex
  -----------------------------------------------------------------------------
  
  
  subtype  in_memory_address_range is natural range 7 downto 0;
  subtype  memory_selector_range is natural range log2_int(NUMBER_OF_ROS_ROI_INPUT_BUSES) downto 0;
  subtype  slice_values_range is natural range SIZE_OF_SLICE_VALUE-1 downto 0;
  type     in_data_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1) of std_logic_vector(ROS_INPUT_GRANURALITY-1 downto 0);
  type     memory_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES) of std_logic_vector(ROS_INPUT_GRANURALITY-1 downto 0);
  type     slice_parameters_array_u is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES) of unsigned(slice_values_range);

  -----------------------------------------------------------------------------
  -- kintex
  -----------------------------------------------------------------------------
  
  constant NUMBER_OF_OUTPUT_LINKS : integer := 1;
  constant all_data_sent_const_ones : std_logic_vector(NUMBER_OF_OUTPUT_LINKS-1 downto 0) := (others => '1');
  type in_ddr_data_array is array (0 to NUMBER_OF_ROS_OUTPUT_BUSES-1) of std_logic_vector(7 downto 0);
  type out_data_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of std_logic_vector(ROS_INPUT_GRANURALITY-1 downto 0);
  type in_cntrl_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1) of std_logic_vector(log2_int(NUMBER_OF_OUTPUT_LINKS)+1 downto 0);
  type kintex_memory_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1) of std_logic_vector(ROS_INPUT_GRANURALITY downto 0);
  type bus_number_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of unsigned(log2_int(NUMBER_OF_ROS_ROI_INPUT_BUSES) downto 0);
  type fifo_address_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES) of unsigned(log2_int(NUMBER_OF_ROS_ROI_INPUT_BUSES) downto 0);
  type link_pointer_array is array (0 to NUMBER_OF_OUTPUT_LINKS - 1) of fifo_address_array;
  type input_ros_roi_data_cntr_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1) of unsigned(SIZE_OF_SLICE_VALUE-1 downto 0);
  type output_link_data_cntr_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of unsigned(log2_int(MAX_NUMBER_OF_TOTAL_SLICES) downto 0);

  type links_number_1d_array is array (0 to NUMBER_OF_PARSERS-1) of integer range 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES;
  type types_number_1d_array is array (0 to NUMBER_OF_PARSERS-1) of integer range 0 to NUMBER_OF_PARSERS;
  type types_number_array is array (0 to NUMBER_OF_OUTPUT_LINKS-1) of integer range 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES;

  type pointers_array is array (0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1) of integer range 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES;

  -----------------------------------------------------------------------------
  -- TOB parsers
  -----------------------------------------------------------------------------
  constant EM_TOB_TYPE      : std_logic_vector(3 downto 0) := x"0";
  constant TAU_TOB_TYPE     : std_logic_vector(3 downto 0) := x"1";
  constant JET_TOB_TYPE     : std_logic_vector(3 downto 0) := x"4";
  constant ENERGY_TOB_TYPE  : std_logic_vector(3 downto 0) := x"6";
  constant MUON_TOB_TYPE    : std_logic_vector(3 downto 0) := x"2";
  constant TRIGGER_TOB_TYPE : std_logic_vector(3 downto 0) := x"7";
  constant STATUS_WORD_TYPE : std_logic_vector(3 downto 0) := x"e";
  constant BLOCK_WORD_TYPE  : std_logic_vector(3 downto 0) := x"c";
  constant FIBER_WORD_TYPE  : std_logic_vector(3 downto 0) := x"d";
  constant NOT_USED_TOB_TYPE  : std_logic_vector(3 downto 0) := x"f";
  constant MAX_TOB_NUMBER : integer := 8;
  type tob_map_array is array (0 to MAX_NUMBER_OF_ROS_ROI_INPUT_BUSES) of std_logic_vector(3 downto 0);
  constant TOB_MAP : tob_map_array :=
    (39 => ENERGY_TOB_TYPE, 38 downto 21 => JET_TOB_TYPE, 20 downto 6 => TAU_TOB_TYPE,5 downto 0 => EM_TOB_TYPE, others => NOT_USED_TOB_TYPE);

  type start_array is array (MAX_TOB_NUMBER-1 downto 0) of integer range 0 to 127;
  type length_array is array (MAX_TOB_NUMBER-1 downto 0) of integer range 0 to 127;
  type overflow_array is array (MAX_TOB_NUMBER-1 downto 0) of integer range 0 to 127;
  
  type tob_definition is record         -- used for individual types definition
    tob_start          : start_array;
    tob_length         : length_array;
    overflow_elements  : overflow_array;
    crc_start          : integer;
    crc_length         : integer;
    max_tob_number     : integer;
  end record;
  type all_tob_def_array is array (0 to 15) of tob_definition;
   
  constant ALL_TOB_ARRAY : all_tob_def_array :=
    (--tob start  , tob length  ,       OV     , crc start, end, max
    ((0,0,0,105,2,59,36,3),(0,0,0,23,23,23,23,23),(0,0,0,0,0,0,0,12),0,11,5),  --EM_TOB_TYPE_0
    ((0,0,0,105,82,59,36,13),(0,0,0,23,23,23,23,23),(0,0,0,0,0,0,0,12),0,11,5),  --TAU_TOB_TYPE_1
    ((0,0,0,0,100,72,44,16),(16,16,16,16,16,16,16,16),(0,0,0,0,0,0,0,15),0,11,8),   --MUON_TOB_TYPE_2 --what is exact data stream scheme ???
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 ),         --NOT_USED_TOB_TYPE_3
    ((0,0,0,0,100,72,44,16)   ,(0,0,0,0,28,28,28,28),(0,0,0,0,0,0,0,15),0,11,4),        --JET_TOB_TYPE_4/5
    ((0,0,0,0,100,72,44,16)   ,(0,0,0,0,28,28,28,28),(0,0,0,0,0,0,0,15),0,11,4),        --JET_TOB_TYPE_4/5
    ((0,112,96,80,72,44,28,12),(0,16,16,16,8,8,16,16),(0,0,127,111,95,79,43,27),0,11,6),--ENERGY_TOB_TYPE_6,44-72hasto be marged
    ((112,96,80,64,48,32,16,0),(8,8,8,8,8,8,8,8),(others => 0),    0     , 0  ,  7 ),   --TRIGGER_TOB_TYPE_7
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 ),    --NOT_USED_TOB_TYPE_8
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 ),    --NOT_USED_TOB_TYPE_9
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 ),    --NOT_USED_TOB_TYPE_10
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 ),    --NOT_USED_TOB_TYPE_11
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 ),    --NOT_USED_TOB_TYPE_12
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 ),    --NOT_USED_TOB_TYPE_13
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 ),    --NOT_USED_TOB_TYPE_14
    ((others => 0),(others => 0), (others => 0),    0     , 0  ,  0 )    --NOT_USED_TOB_TYPE_15
    );

      
--  function calculate_pointers (link_assignment_in : in_cntrl_array; type_assignment_in: slice_parameters_array_u) return pointers_array;
  function tot_number_of_links(in_out_assigned_links : in_cntrl_array ; link_number : integer) return integer;
  --function set_number_of_type(link_assignment_in : in_cntrl_array) return types_number_array;
  --function link_number_of_parsers(assigned_ind_parsers_amount : types_number_array) return integer;
  function set_active_links (in_out_assigned_links : in_cntrl_array ; link_number : integer) return pointers_array;

  function std_int (X : std_logic_vector) return integer;

  function max_offset(X : slice_parameters_array_u) return std_logic_vector;
  
end rod_l1_topo_types_const;

package body rod_l1_topo_types_const is

  function log2_int (x : natural) return integer is
    variable temp : integer := x;
    variable n    : integer := 0;
  begin
    while temp > 1 loop
      temp := temp / 2;
      n    := n + 1;
    end loop;
    return n;
  end function log2_int;

  
  --function set_number_of_type (link_assignment_in : in_cntrl_array; type_assignment_in: slice_parameters_array_u) return types_number_array is
  --  variable types_array : types_number_array := (others => (others => '0'));
  --  variable i : integer := 0;
  --begin
  --  while i < link_assignment_in'length loop
  --    if unsigned(link_assignment_in(i)) < NUMBER_OF_PARSERS and
  --      type_assignment_in(i) > 0 and type_assignment_in < NUMBER_OF_PARSERS then
  --      types_array(to_integer(unsigned(link_assignment_in(i))))(type_assignment_in(i)) := types_array(to_integer(unsigned(link_assignment_in(i))))(type_assignment_in(i)) + 1;
  --    end if;
  --    i := i + 1;
  --  end loop;
  --  return types_array;
  --end function set_number_of_type;
  

  function tot_number_of_links(in_out_assigned_links : in_cntrl_array ; link_number : integer) return integer is
    variable i : integer := 0;
    variable tot_number : integer := 0;
    begin
      while i < NUMBER_OF_ROS_ROI_INPUT_BUSES  loop
        if unsigned(in_out_assigned_links(i)) = link_number then
          tot_number := tot_number + 1;
        end if;
        i := i + 1;
      end loop;
    return tot_number;
  end function tot_number_of_links;
  
  --function calculate_pointers (link_assignment_in : in_cntrl_array; type_assignment_in: slice_parameters_array_u) return pointers_array is
  
  --variable calc_array_a, calc_array_b : pointers_array := (others => 0 );
    
  --variable i,j : integer := 0;
  --begin
  --  while i < NUMBER_OF_ROS_ROI_INPUT_BUSES-1 loop
  --    if unsigned(link_assignment_in(i)) = link_number then
  --      calc_array_a(j) := calc_array_b(to_integer(type_assignment_in(i)));
  --      calc_array_b(to_integer(type_assignment_in(i))) := calc_array_b(to_integer(type_assignment_in(i))) + 1;
  --    end if;
      
  --    i:= i + 1;
  --  end loop;
  --  return calc_array_a;
  --end function calculate_pointers;

  function set_active_links (in_out_assigned_links : in_cntrl_array ; link_number : integer) return pointers_array is
    variable i,j : integer := 0;
    variable active_links : pointers_array := (others => 0);
    begin
      while i < NUMBER_OF_ROS_ROI_INPUT_BUSES  loop
        if unsigned(in_out_assigned_links(i)) = link_number then
          active_links(j) := i;
          j := j + 1;
        end if;
        i := i + 1;
      end loop;
    return active_links;
  end function set_active_links;

  function std_int (XY : std_logic_vector) return integer is
  variable tmp : integer := 0;
  begin
	 tmp := to_integer(unsigned(XY));
    return tmp;
  end std_int;

  function max_offset(X : slice_parameters_array_u) return std_logic_vector is
    variable max : std_logic_vector(3 downto 0):=(others => '0');
    variable i : integer :=0;
    begin
      while i < NUMBER_OF_ROS_ROI_INPUT_BUSES  loop
        if X(i) > unsigned(max) then
          max := std_logic_vector(X(i));
          i := i + 1;
        else
          max := max;
          i := i + 1;
        end if;
      end loop;
    return max;
  end function max_offset;
        
end rod_l1_topo_types_const;
   

