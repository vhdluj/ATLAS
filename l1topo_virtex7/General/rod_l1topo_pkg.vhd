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
  constant NUMBER_OF_ROS_ROI_INPUT_BUSES : integer := 40;
  constant ROS_INPUT_GRANURALITY         : integer := 128;
  constant SIZE_OF_SLICE_VALUE           : integer := 4;
  constant MAX_NUMBER_OF_TOTAL_SLICES    : integer := NUMBER_OF_ROS_ROI_INPUT_BUSES*2**(SIZE_OF_SLICE_VALUE);
  constant NUMBER_OF_PARSERS             : integer := 16;
  function log2_int (x : natural) return integer;
  
  
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
  
  constant NUMBER_OF_OUTPUT_LINKS : integer := 12;
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
    
--  function calculate_pointers (link_assignment_in : in_cntrl_array; type_assignment_in: slice_parameters_array_u) return pointers_array;
  function tot_number_of_links(in_out_assigned_links : in_cntrl_array ; link_number : integer) return integer;
  --function set_number_of_type(link_assignment_in : in_cntrl_array) return types_number_array;
  --function link_number_of_parsers(assigned_ind_parsers_amount : types_number_array) return integer;
  function set_active_links (in_out_assigned_links : in_cntrl_array ; link_number : integer) return pointers_array;
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

end rod_l1_topo_types_const;
   

