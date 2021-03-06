library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rod_l1_topo_types_const.all;

entity tob_parser is
  port (
    CLK                        : in  std_logic;
    LINK_NUMBER                : in  std_logic_vector(6 downto 0);
    TOB_DATA_IN                : in  std_logic_vector(127 downto 0);
    TOB_DATA_OUT               : out std_logic_vector(9*32-1 downto 0) := (others => '0')
  );
end tob_parser;

architecture tob_parser of tob_parser is
  signal tob_type_l : std_logic_vector(3 downto 0);
begin

  SAT_TOB_TYPE : process (CLK)
  begin
    if rising_edge(CLK) then
      tob_type_l <= TOB_MAP(to_integer(unsigned(LINK_NUMBER)));
    end if;
  end process SAT_TOB_TYPE;

  
  TOB_ENCAPSULATE: process (CLK)
  begin  -- process
    if rising_edge(CLK) then
      case tob_type_l is
        
        when EM_TOB_TYPE =>
          for i in 0 to (all_tob_array(std_int(EM_TOB_TYPE)).max_tob_number-1) loop
--          for i in 0 to all_tob_array(0).max_tob_number-1 loop
            if all_tob_array(std_int(EM_TOB_TYPE)).tob_start(i) /= 0 then
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <=
                EM_TOB_TYPE & "00000" &
                TOB_DATA_IN(
                  all_tob_array(std_int(EM_TOB_TYPE)).tob_start(i) +
                all_tob_array(std_int(EM_TOB_TYPE)).tob_length(i)-1 downto
                all_tob_array(std_int(EM_TOB_TYPE)).tob_start(i));
            else
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <= (others => '0');
            end if;
          end loop;
          
        when TAU_TOB_TYPE =>
          for i in 0 to all_tob_array(std_int(TAU_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(TAU_TOB_TYPE)).tob_start(i) /= 0 then
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <=
                TAU_TOB_TYPE & "00000" &
                TOB_DATA_IN(
                  all_tob_array(std_int(TAU_TOB_TYPE)).tob_start(i) +
                all_tob_array(std_int(TAU_TOB_TYPE)).tob_length(i)-1 downto
                all_tob_array(std_int(TAU_TOB_TYPE)).tob_start(i));
            else
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <= (others => '0');
            end if;
          end loop;  

        when MUON_TOB_TYPE =>
          for i in 0 to all_tob_array(std_int(MUON_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(MUON_TOB_TYPE)).tob_start(i) /= 0 then
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <=
                MUON_TOB_TYPE & x"000" &
                TOB_DATA_IN(
                  all_tob_array(std_int(MUON_TOB_TYPE)).tob_start(i) +
                all_tob_array(std_int(MUON_TOB_TYPE)).tob_length(i)-1 downto
                all_tob_array(std_int(MUON_TOB_TYPE)).tob_start(i));
            else
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <= (others => '0');
            end if;
          end loop;
          
        when JET_TOB_TYPE =>
          for i in 0 to all_tob_array(std_int(JET_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(JET_TOB_TYPE)).tob_start(i) /= 0 then
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <=
                JET_TOB_TYPE(3 downto 1) & '0' &
                TOB_DATA_IN(
                  all_tob_array(std_int(JET_TOB_TYPE)).tob_start(i) +
                all_tob_array(std_int(JET_TOB_TYPE)).tob_length(i)-1 downto
                all_tob_array(std_int(JET_TOB_TYPE)).tob_start(i));
            else
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <= (others => '0');
            end if;
          end loop;  

--        when ENERGY_TOB_TYPE =>
--          for i in 0 to all_tob_array(std_int(ENERGY_TOB_TYPE)).max_tob_number-1 loop
--            if all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i) /= 0 then
--              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <=
--                ENERGY_TOB_TYPE(3 downto 0) & std_logic_vector(to_unsigned(i,4)) & x"00" &
--                TOB_DATA_IN(
--                  all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i) +
--                all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_length(i)-1 downto
--                all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i));
--            else
--              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <= (others => '0');
--            end if;
--          end loop;  


		when ENERGY_TOB_TYPE =>
         for i in 0 to all_tob_array(std_int(ENERGY_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i) /= 0 and (i /= 2 or i/=3) then
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <=
                ENERGY_TOB_TYPE(3 downto 0) & std_logic_vector(to_unsigned(i,4)) & x"00" & x"0000"; --ps
--                TOB_DATA_IN(
--                  all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i) +
--                all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_length(i)-1 downto
--                all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i));
            elsif all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i) /= 0 and i = 2 then
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <=
                ENERGY_TOB_TYPE(3 downto 0) & std_logic_vector(to_unsigned(i,4)) & x"00" & x"0000"; --ps
--                TOB_DATA_IN(
--                  all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i+1) +
--                all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_length(i+1)-1 downto
--                all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i+1)) &
--                TOB_DATA_IN(
--                  all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i) +
--                all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_length(i)-1 downto
--                all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i));
            else
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <= (others => '0');
            end if;
          end loop;


        when TRIGGER_TOB_TYPE =>
          for i in 0 to all_tob_array(std_int(TRIGGER_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(TRIGGER_TOB_TYPE)).tob_start(i) /= 0 then
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <=
                TRIGGER_TOB_TYPE(3 downto 0) & std_logic_vector(to_unsigned(i,4)) & x"00" & x"0000" ; --ps
--                TOB_DATA_IN(
--                  all_tob_array(std_int(TRIGGER_TOB_TYPE)).tob_start(i) +
--                all_tob_array(std_int(TRIGGER_TOB_TYPE)).tob_length(i)-1 downto
--                all_tob_array(std_int(TRIGGER_TOB_TYPE)).tob_start(i));
            else
              TOB_DATA_OUT(32*(i+1)-1 downto 32*i) <= (others => '0');
            end if;
          end loop;  
          
        when others =>
          TOB_DATA_OUT <= (others => '0');
      end case;
    end if;
  end process;
  
end tob_parser;
