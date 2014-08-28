library IEEE;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rod_l1_topo_types_const.all;

entity tob_bcid_cntr is
  port (
    CLK                        : in  std_logic;
    TOB_DATA_IN                : in  std_logic_vector(127 downto 0);
    TOB_TYPE                   : in  std_logic_vector(3 downto 0);
    TOB_CNTR_OUT               : out std_logic_vector(3 downto 0);
    TOB_CONSEQ_NRS             : out std_logic_vector(4*9-1 downto 0)
  );
end tob_bcid_cntr;

architecture tob_bcid_cntr of tob_bcid_cntr is
  signal local_tob_onehot : std_logic_vector(7 downto 0):=(others => '0');
  signal tob_cntr_out_l : std_logic_vector(3 downto 0);
  signal tob_conseq_nrs_l : std_logic_vector(TOB_CONSEQ_NRS'range):= (others => '0');
  function count_ones(X : std_logic_vector) return unsigned is
    variable ones_cntr : unsigned(3 downto 0) := (others => '0');
  begin
    for i in X'range loop
      if X(i) = '1' then
        ones_cntr := ones_cntr + 1;
      end if;
    end loop;
    return ones_cntr;
  end function count_ones;

  function count_conseq_nrs(X : std_logic_vector) return std_logic_vector is
    variable ones_cntr : integer := 0;
    variable data_markers : std_logic_vector(4*(X'length+1)-1 downto 0) := (others => '1');
  begin
    
    for i in X'range loop
      if X(i) = '1' then
        data_markers((ones_cntr+1)*4-1 downto ones_cntr*4) := std_logic_vector(to_unsigned(i,4));
        ones_cntr := ones_cntr + 1;
      else
        ones_cntr := ones_cntr;
        data_markers := data_markers;
      end if;
    end loop;
    
    return data_markers;
  end function count_conseq_nrs;
  
begin

  TOB_ENCAPSULATE: process (CLK)
  begin  -- process
    if rising_edge(CLK) then
      case TOB_TYPE is
        when EM_TOB_TYPE =>
          for i in 0 to ALL_TOB_ARRAY(std_int(EM_TOB_TYPE)).max_tob_number-1 loop
            
            if all_tob_array(std_int(EM_TOB_TYPE)).tob_start(i) /= 0 and
              TOB_DATA_IN( (all_tob_array(std_int(EM_TOB_TYPE)).tob_start(i) + all_tob_array(std_int(EM_TOB_TYPE)).tob_length(i)-1) downto
                            all_tob_array(std_int(EM_TOB_TYPE)).tob_start(i)) /= 0
            then
              local_tob_onehot(i) <= '1';
            else
              local_tob_onehot(i) <= '0';
            end if;
          end loop;  
        when TAU_TOB_TYPE =>
          for i in 0 to ALL_TOB_ARRAY(std_int(TAU_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(TAU_TOB_TYPE)).tob_start(i) /= 0 and
              TOB_DATA_IN( (all_tob_array(std_int(TAU_TOB_TYPE)).tob_start(i) + all_tob_array(std_int(TAU_TOB_TYPE)).tob_length(i)-1) downto
                            all_tob_array(std_int(TAU_TOB_TYPE)).tob_start(i)) /= 0
            then
              local_tob_onehot(i) <= '1';
            else
              local_tob_onehot(i) <= '0';
            end if;
          end loop;  

        when MUON_TOB_TYPE =>
          for i in 0 to ALL_TOB_ARRAY(std_int(MUON_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(MUON_TOB_TYPE)).tob_start(i) /= 0 and
              TOB_DATA_IN( (all_tob_array(std_int(MUON_TOB_TYPE)).tob_start(i) + all_tob_array(std_int(MUON_TOB_TYPE)).tob_length(i)-1) downto
                            all_tob_array(std_int(MUON_TOB_TYPE)).tob_start(i)) /= 0
            then
              local_tob_onehot(i) <= '1';
            else
              local_tob_onehot(i) <= '0';
            end if;
          end loop;  
        when JET_TOB_TYPE =>
          for i in 0 to ALL_TOB_ARRAY(std_int(JET_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(JET_TOB_TYPE)).tob_start(i) /= 0 and
              TOB_DATA_IN( (all_tob_array(std_int(JET_TOB_TYPE)).tob_start(i) + all_tob_array(std_int(JET_TOB_TYPE)).tob_length(i)-1) downto
                            all_tob_array(std_int(JET_TOB_TYPE)).tob_start(i)) /= 0
            then
              local_tob_onehot(i) <= '1';
            else
              local_tob_onehot(i) <= '0';
            end if;
          end loop;  
        when ENERGY_TOB_TYPE =>
          for i in 0 to ALL_TOB_ARRAY(std_int(ENERGY_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i) /= 0 and
              TOB_DATA_IN( (all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i) + all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_length(i)-1) downto
                            all_tob_array(std_int(ENERGY_TOB_TYPE)).tob_start(i)) /= 0
            then
              local_tob_onehot(i) <= '1';
            else
              local_tob_onehot(i) <= '0';
            end if;
          end loop;  
        when TRIGGER_TOB_TYPE =>
          for i in 0 to ALL_TOB_ARRAY(std_int(TRIGGER_TOB_TYPE)).max_tob_number-1 loop
            if all_tob_array(std_int(TRIGGER_TOB_TYPE)).tob_start(i) /= 0 and
              TOB_DATA_IN( (all_tob_array(std_int(TRIGGER_TOB_TYPE)).tob_start(i) + all_tob_array(std_int(TRIGGER_TOB_TYPE)).tob_length(i)-1) downto
                            all_tob_array(std_int(TRIGGER_TOB_TYPE)).tob_start(i)) /= 0
            then
              local_tob_onehot(i) <= '1';
            else
              local_tob_onehot(i) <= '0';
            end if;
          end loop;  
        when others =>
          local_tob_onehot <= (others => '0');
      end case;
    end if;
  end process;

  SET_CNTR_OUT : process (CLK)
  begin
    if rising_edge(CLK) then
      tob_cntr_out_l <= std_logic_vector(count_ones(local_tob_onehot));
      tob_conseq_nrs_l <= count_conseq_nrs(local_tob_onehot);
    end if;
  end process SET_CNTR_OUT;

  TOB_CONSEQ_NRS <= tob_conseq_nrs_l;
  TOB_CNTR_OUT <= tob_cntr_out_l;
  

  
end tob_bcid_cntr;
