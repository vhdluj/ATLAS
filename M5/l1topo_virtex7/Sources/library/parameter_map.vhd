library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.L1TopoDataTypes.all;

package parameter_map is

    constant NumberOfParameters: natural := 37;
    type ParameterRegisters is array (NumberOfParameters - 1 downto 0) of std_logic_vector(31 downto 0);

    function SortParameterMapper(reg: ParameterRegisters) return ParameterSpace;
    function AlgoParameterMapper(reg: ParameterRegisters) return ParameterSpace;

    

end parameter_map;

package body parameter_map is
  
    function SortParameterMapper(reg: ParameterRegisters) return ParameterSpace is
        variable result: ParameterSpace(NumberOfSortAlgorithms-1 downto 0);
    begin
        
        --JetSort
        result(0)(0) := reg( 0); --minEt
        result(0)(1) := reg( 1); --minEta
        result(0)(2) := reg( 2); --maxEta
        --ClusterSort
        result(1)(0) := reg( 3); --minEt
        result(1)(1) := reg( 4); --isoMask
        result(1)(2) := reg( 5); --minEta
        result(1)(3) := reg( 6); --maxEta
        --ClusterSort
        result(2)(0) := reg( 7); --minEt
        result(2)(1) := reg( 8); --isoMask
        result(2)(2) := reg( 9); --minEta
        result(2)(3) := reg(10); --maxEta
        
        
        return result;
    end function;
  
  
    function AlgoParameterMapper(reg: ParameterRegisters) return ParameterSpace is
        variable result: ParameterSpace(NumberOfAlgorithms-1 downto 0);
    begin
        
        --EtCut
        result( 0)(0) := reg(11);   --minEt
        --DeltaPhiIncl1
        result( 1)(0) := reg(12);   --minEt
        result( 1)(1) := reg(13);   --minPhi
        result( 1)(2) := reg(14);   --maxPhi
        --DeltaEtaIncl1
        result( 2)(0) := reg(15);   --minEt
        result( 2)(1) := reg(16);   --minEta
        result( 2)(2) := reg(17);   --maxEta
        --JetHT
        result( 3)(0) := reg(18);   --minEt
        result( 3)(1) := reg(19);   --minEta
        result( 3)(2) := reg(20);   --maxEta
        result( 3)(3) := reg(21);   --SumThreshold
        --EtCut
        result( 4)(0) := reg(22);   --minEt
        --DeltaPhiIncl1
        result( 5)(0) := reg(23);   --minEt
        result( 5)(1) := reg(24);   --minPhi
        result( 5)(2) := reg(25);   --maxPhi
        --DeltaEtaIncl1
        result( 6)(0) := reg(26);   --minEt
        result( 6)(1) := reg(27);   --minEta
        result( 6)(2) := reg(28);   --maxEta
        --EtCut
        result( 7)(0) := reg(29);   --minEt
        --DeltaPhiIncl1
        result( 8)(0) := reg(30);   --minEt
        result( 8)(1) := reg(31);   --minPhi
        result( 8)(2) := reg(32);   --maxPhi
        --DeltaEtaIncl1
        result( 9)(0) := reg(33);   --minEt
        result( 9)(1) := reg(34);   --minEta
        result( 9)(2) := reg(35);   --maxEta
        --METCut
        result(10)(0) := reg(36);   --minMEt
        
      
      return result;
    end function;
  


end package body;