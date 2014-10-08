library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.L1TopoDataTypes.all;

entity L1TopoAlgorithms is
	Port(ClockBus    : in  std_logic_vector(2 downto 0);
		 
		 EmTobArray  : in  ClusterArray(InputWidthEM - 1 downto 0);
		 TauTobArray : in  ClusterArray(InputWidthTAU - 1 downto 0);
		 JetTobArray : in  JetArray(InputWidthJET - 1 downto 0);
		 MuTobArray  : in  MuonArray(InputWidthMU - 1 downto 0); --TODO: NYI! use it!
		 signedEx    : in  std_logic_vector(14 downto 0);
		 signedEy    : in  std_logic_vector(14 downto 0);
		 
		 Parameters  : in  ParameterSpace(NumberOfAlgorithms - 1 downto 0);
		 SortParameters     : in  ParameterSpace(NumberOfSortAlgorithms - 1 downto 0);
		 
		 Results     : out std_logic_vector(NumberOfResultBits - 1 downto 0);
		 Overflow    : out std_logic_vector(NumberOfOverflowBits - 1 downto 0)
	);
end L1TopoAlgorithms;

architecture Behavioral of L1TopoAlgorithms is

	
-- Menu Name   : Topo_M5
-- Menu Version: 1

-- Module/FPGA : 0/0
-- General configuration (<TopoConfig>):

  constant AlgoOffset0 : integer := 0;   --   DPhi_JsJs
 -- Ordered list of sorted TOBArrays:
  signal SortedJetsSize2  :    TOBArray((OutputWidthSortJET - 1)  downto 0);

begin

sortalgo0 : entity work.JetSort --  Algorithm name: JetSort_Size2
  generic map (
     InputWidth => InputWidthJET,
     InputWidth1stStage => InputWidth1stStageSortJET,
     OutputWidth => OutputWidthSortJET,
     jet_size => 2 )
  port map (
     JetTobArray => JetTobArray,
     TobArrayOut =>  SortedJetsSize2,
     Overflow => Overflow(0),
     ClockBus => ClockBus,
     Parameters => SortParameters(0)
 );

decisionalgo0 : entity work.DeltaPhiIncl1 --  Algorithm name: DPhi_JsJs
  generic map (
     InputWidth => OutputWidthSortJET,
     NumResultBits => 1 )
  port map (
     TOBs => SortedJetsSize2,
     Results => Results(AlgoOffset0+0 downto AlgoOffset0), 
     Overflow => Overflow(0),
     ClockBus => ClockBus,
     Parameters => Parameters(0)
 );

 
end Behavioral;