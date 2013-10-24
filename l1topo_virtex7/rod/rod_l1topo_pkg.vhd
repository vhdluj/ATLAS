library IEEE;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package rod_l1_topo_types_const is
  function log2_int (x : natural) return integer;
  
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
      


  
end rod_l1_topo_types_const;
