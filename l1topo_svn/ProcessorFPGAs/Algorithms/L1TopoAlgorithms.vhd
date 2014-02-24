library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity L1TopoAlgorithms is
    Port (ClockBus    : in  std_logic_vector(2 downto 0);
          egTobArray  : in  ClusterArray(InputWidthEg-1 downto 0);
          TauTobArray : in  ClusterArray(InputwidthTau-1 downto 0);
          JetTobArray : in  JetArray(InputWidthJet-1 downto 0);
--          jetSelectThreshold : in std_logic_vector(9 downto 0);
--          egSelectThreshold : in std_logic_vector(9 downto 0);
--          tauSelectThreshold : in std_logic_vector(9 downto 0);
          Parameters  : in  ParameterSpace(NumAlgos+3-1 downto 0);
          signedEx    : in  std_logic_vector(14 downto 0);
          signedEy    : in  std_logic_vector(14 downto 0);
          Results     : out std_logic_vector(NumResultBits-1 downto 0);
		  Overflow    : out std_logic_vector(NumAlgos-1 downto 0)
         );
end L1TopoAlgorithms;

architecture Behavioral of L1TopoAlgorithms is

component Arctan2 
    Port (ClockBus : in  std_logic_vector(2 downto 0);
          Ex       : in  std_logic_vector(14 downto 0); 
          Ey       : in  std_logic_vector(14 downto 0);
          Phi      : out std_logic_vector( 5 downto 0)
         );
end component;

component BoxCutInclusive1 
generic (InputWidth    : integer:=20;
         NumResultBits : integer:=1
        );
   Port (ClockBus      : in  std_logic_vector(2 downto 0);
         Parameters    : in  ParameterArray;
         Tobs          : in  TOBArray(InputWidth-1 downto 0);
         Results       : out std_logic_vector(NumResultBits-1 downto 0);
         Overflow      : out std_logic
        );
end component;

component BoxCutInclusive2
generic (InputWidth1   : integer:=5;
         InputWidth2   : integer:=5;
         NumResultBits : integer:=1
        );
   Port (ClockBus      : std_logic_vector(2 downto 0);
         Parameters    : in  ParameterArray;
         Tobs1         : in  TOBArray(InputWidth1-1 downto 0);
         Tobs2         : in  TOBArray(InputWidth2-1 downto 0);
         Results       : out std_logic_vector(NumResultBits-1 downto 0);
         Overflow      : out std_logic
        );
end component;

component ClusterSelect 
generic(InputWidth         : integer:= 120; --number of input channels
        InputWidth1stStage : integer:= 15; --number of input channels per 1st stage module
        OutputWidth        : integer:= 9  --number of selected TOBs
       );
   Port(ClockBus           : in  std_logic_vector(2 downto 0);
        Parameters         : in  ParameterArray;
        ClusterTobArray    : in  clusterArray (InputWidth-1 downto 0);
        TobArrayOut        : out TOBArray (OutputWidth-1 downto 0)
        );
end component;

component ClusterSort
 generic (InputWidth         : integer:= 120; --number of TOBs to be sorted 
          InputWidth1stStage : integer:= 20;  --number of input channels for each module of the 1st sorting stage
		  OutputWidth        : integer:= 6    --number of input channels for each module of the 1st sorting stage
		 );
    Port (ClockBus           : in  std_logic_vector(2 downto 0);
          Parameters         : in  ParameterArray;
          ClusterTobArray    : in  ClusterArray (InputWidth-1 downto 0);
          TobArrayOut        : out TOBArray (OutputWidth-1 downto 0) 
         );
end component;

component ContratransverseMassInclusive1 
generic (InputWidth    : integer:=25;
         NumResultBits : integer:=1
        );
   Port (ClockBus      : in  std_logic_vector(2 downto 0);
         Parameters    : in  ParameterArray;
         Tobs          : in  TOBArray(InputWidth-1 downto 0);
         MET           : in  std_logic_vector(15 downto 0);
         METPhi        : in  std_logic_vector(5 downto 0);
         Results       : out std_logic_vector (NumResultBits-1 downto 0);
         Overflow      : out std_logic
        );
end component;

component InvariantMassInclusive1  
generic (InputWidth    : integer:=28;
         NumResultBits : integer:=1
        );
   Port (ClockBus      : in  std_logic_vector(2 downto 0);
         Tobs          : in  TOBArray(InputWidth-1 downto 0);
         Parameters    : in  ParameterArray;
         Results       : out std_logic_vector(NumResultBits-1 downto 0);
         Overflow      : out std_logic
        );
end component;

component InvariantMassInclusive2 
generic (InputWidth1   : integer:=5;
         InputWidth2   : integer:=5;
         NumResultBits : integer:=1
        );
   Port (ClockBus      : in  std_logic_vector(2 downto 0);
         Tobs1         : in  TOBArray(InputWidth1-1 downto 0);
         Tobs2         : in  TOBArray(InputWidth2-1 downto 0);
         Parameters    : in  ParameterArray;
         Results       : out std_logic_vector(NumResultBits-1 downto 0);
         Overflow      : out std_logic
        );
end component;

component JetHT 
generic(InputWidth    : integer:=64;
        NumResultBits : integer:=1;
        jet_size      : integer:=2
       );
   Port(ClockBus      : in  std_logic_vector(2 downto 0);
        Parameters    : in  ParameterArray;
        JetTobArray   : in  JetArray(InputWidth-1 downto 0);
        Results       : out std_logic_vector(NumResultBits-1 downto 0);
        Overflow      : out std_logic
       );
end component;

component JetMeff 
generic(InputWidth    : integer:=64;
        NumResultBits : integer:=1;
        jet_size      : integer:=2
       );
   Port(ClockBus      : in  std_logic_vector(2 downto 0);
        Parameters    : in  ParameterArray;
        JetTobArray   : in  JetArray(InputWidth-1 downto 0);
        MET           : in  std_logic_vector(15 downto 0);
        Results       : out std_logic_vector(NumResultBits-1 downto 0);
        Overflow      : out std_logic
      );
end component;

component JetSelect 
generic(InputWidth         : integer:= 64;  --number of input channels
        InputWidth1stStage : integer:= 16;  --number of input channels per 1st stage module
        OutputWidth        : integer:= 11;  --number of selected TOBs
        jet_size           : integer:=1     --which jet size to choose (1 or 2)
       );
   Port(ClockBus           : in  std_logic_vector(2 downto 0);
        Parameters         : in  ParameterArray;
        JetTobArray        : in  JetArray (InputWidth-1 downto 0);
        TobArrayOut        : out TOBArray (OutputWidth-1 downto 0)
        );
end component;

component JetSort
 generic (InputWidth         : integer:= 48; --number of input Jet TOBs to be sorted 
		  InputWidth1stStage : integer:= 16; --number of input channels for each module of the 1st sorting stage
		  OutputWidth        : integer:=  8; --width of the sort output 
          jet_size           : integer:=  1  -- which jet size to choose (1 or 2)
         );
    Port (ClockBus           : in  std_logic_vector(2 downto 0);
          JetTobArray        : in  JetArray(InputWidth-1 downto 0);
          TobArrayOut        : out TOBArray(OutputWidth-1 downto 0) 
         );
end component;

component JetTobRegister
generic(InputWidth : integer:=64
       );
   Port(clk        : in  std_logic;
        enable     : in  std_logic;
        reg_in     : in  JetArray(InputWidth-1 downto 0);
        reg_out    : out JetArray(InputWidth-1 downto 0)
       );
end component;

component METCalc
    Port(ClockBus : in  std_logic_vector(2 downto 0);
         SignedEx : in  std_logic_vector(14 downto 0);
         SignedEy : in  std_logic_vector(14 downto 0);
         MET      : out std_logic_vector(15 downto 0)
        );
end component;

component TransverseMassInclusive1 
generic (InputWidth    : integer:=25;
         NumResultBits : integer:=1
        );
   Port (ClockBus   : in  std_logic_vector(2 downto 0);
         Parameters : in  ParameterArray;
         Tobs       : in  TOBArray(InputWidth-1 downto 0);
         MET        : in  std_logic_vector(15 downto 0);
         METPhi     : in  std_logic_vector(5 downto 0);
         Results    : out std_logic_vector(NumResultBits-1 downto 0);
         Overflow   : out std_logic
        );
end component;

component TripleDotProduct is
   Port (ClockBus   : in  std_logic_vector(2 downto 0);
         Tob1       : in  GenericTOB;  
         Tob2       : in  GenericTOB;
         Tob3       : in  GenericTOB;
         Parameters : in  ParameterArray;
         Results    : out std_logic_vector (0 downto 0);
         Overflow   : out std_logic
        );
end component;

signal MET  : std_logic_vector(15 downto 0);
signal METPhi : std_logic_vector(5 downto 0);

signal jet : TOBArray(OutputWidthJet-1 downto 0);
signal eg  : TOBArray(OutputWidthEg-1 downto 0);
signal tau : TOBArray(OutputWidthTau-1 downto 0);
signal lep : TOBArray(OutputWidthTau+OutputWidthEg-1 downto 0);

begin

--sorting/selection and MET calculations

Arctan_inst: Arctan2 
 Port map(ClockBus => ClockBus,
          Ex       => signedEx,
          Ey       => signedEy,
          Phi      => METPhi
         );

MET_inst: METCalc
 Port map(ClockBus => ClockBus,
          SignedEx => signedEx,
          SignedEy => signedEy,
          MET      => MET
         );

EgSort_inst: ClusterSort
 generic map(InputWidth         => InputWidthEg,
             InputWidth1stStage => InputWidth1stStageEg,
		     OutputWidth        => OutputWidthEg
		    )                
    Port map(ClockBus           => ClockBus,
             Parameters         => Parameters(9),
             ClusterTobArray    => egTobArray,
             TobArrayOut        => eg
            );

--EgSelect_inst: ClusterSelect 
--generic map(InputWidth         =>InputWidthEg,
--            InputWidth1stStage =>15,
--            OutputWidth        =>11
--           )
--   Port map(ClockBus           => ClockBus,
--            Parameters         => Parameters(9),
--            ClusterTobArray    => egTobArray,
--	        TobArrayOut        => eg
--           );
--            
TauSort_inst: ClusterSort
 generic map(InputWidth         => InputWidthTau,
             InputWidth1stStage => InputWidth1stStageTau,
		     OutputWidth        => OutputWidthTau
		    )                
    Port map(ClockBus           => ClockBus,
             Parameters         => Parameters(10),
             ClusterTobArray    => TauTobArray,
             TobArrayOut        => tau
            );

--TauSelect_inst: ClusterSelect 
--generic map(InputWidth         =>InputWidthTau,
--            InputWidth1stStage =>15,
--            OutputWidth        =>11
--           )
--   Port map(ClockBus           => ClockBus,
--            Parameters         => Parameters(10),
--            ClusterTobArray    => TauTOBArray,
--            TobArrayOut        => tau
--           ); 
        
JetSort_inst: JetSort
 generic map(InputWidth         => InputWidthJet,
		     InputWidth1stStage => InputWidth1stStageJet,
		     OutputWidth        => OutputWidthJet,
             jet_size           => 2 
            )                   
    Port map(ClockBus           => ClockBus,
             JetTobArray        => JetTobArray,
             TobArrayOut        => jet
            );

--JetSelect_inst: JetSelect 
--generic map(InputWidth         => InputWidthJet,
--            InputWidth1stStage => 16,
--            OutputWidth        => 11,
--            jet_size           => 2
--           )
--   Port map(ClockBus           => ClockBus,
--            Parameters         => Parameters(11),
--            JetTobArray        => JetTobArray,
--            TobArrayOut        => jet
--           );
--        
genLepTOBsTau: for i in 0 to OutputWidthTau-1 generate
 lep(i) <= tau(i);
end generate;

genLepTOBsEg: for i in 0 to OutputWidthEg-1 generate
 lep(i+OutputWidthTau) <= eg(i);
end generate;

--topological algorithms

Algo0: BoxCutInclusive1 
generic map(InputWidth    => OutputWidthTau,
            NumResultBits => 1
           )              
   Port map(ClockBus      => ClockBus,
            Parameters    => Parameters(0),
            Tobs          => tau,
            Results       => Results(0 downto 0),
            Overflow      => Overflow(0)
           );

Algo1: BoxCutInclusive2
generic map(InputWidth1   => OutputWidthTau+OutputWidthEg,
            InputWidth2   => OutputwidthJet,
            NumResultBits => 1
           )              
   Port map(ClockBus      => ClockBus,
            Parameters    => Parameters(1),
            Tobs1         => lep,
            Tobs2         => jet,
            Results       => Results( 1 downto 1),
            Overflow      => Overflow(1)
           );

Algo2: ContratransverseMassInclusive1 
generic map(InputWidth    => OutputWidthTau+OutputWidthEg,
            NumResultBits => 1
           )              
   Port map(ClockBus      => ClockBus,
            Parameters    => Parameters(2),
            Tobs          => lep,
            MET           => MET,
            METPhi        => METPhi,
            Results       => Results( 2 downto 2),
            Overflow      => Overflow(2)
           );

Algo3: InvariantMassInclusive1  
generic map(InputWidth    => OutputWidthTau+OutputWidthEg,
            NumResultBits => 1
           )
   Port map(ClockBus      => ClockBus,
            Tobs          => lep,
            Parameters    => Parameters(3),
            Results       => Results(3 downto 3),
            Overflow      => Overflow(3)
           );	

Algo4: InvariantMassInclusive2 
generic map(InputWidth1   => OutputWidthTau+OutputWidthEg,
            InputWidth2   => OutputWidthJet,
            NumResultBits => 1
           )              
   Port map(ClockBus      => ClockBus,
            Tobs1         => lep,
            Tobs2         => jet,
            Parameters    => Parameters(4),
            Results       => Results(4 downto 4),
            Overflow      => Overflow(4)
           );

Algo5: TransverseMassInclusive1 
generic map(InputWidth    => OutputWidthTau+OutputWidthEg,
            NumResultBits => 1
           )             
   Port map(ClockBus      => ClockBus,
            Parameters    => Parameters(5),
            Tobs          => lep,
            MET           => MET,
            METPhi        => METPhi,
            Results       => Results(5 downto 5),
            Overflow      => Overflow(5)
           );

Algo6: TripleDotProduct 
   Port map(ClockBus   => ClockBus,
            Tob1       => jet(0),
            Tob2       => jet(1),
            Tob3       => jet(2),
            Parameters => Parameters(6),
            Results    => Results(6 downto 6),
            Overflow   => Overflow(6)
           );

Algo7: JetHT 
generic map(InputWidth    => InputWidthJet,
            NumResultBits => 1
           )             
   Port map(ClockBus      => ClockBus,
            Parameters    => Parameters(7),
            JetTobArray   => JetTobArray,
            Results       => Results(7 downto 7),
            Overflow      => Overflow(7)
           );

Algo8: JetMeff 
generic map(InputWidth    => InputWidthJet,
            NumResultBits => 1,
            jet_size      => 2
           )            
  Port map(ClockBus       => ClockBus,
           Parameters     => Parameters(8),
           JetTobArray    => JetTobArray,
           MET            => MET,
           Results        => Results(8 downto 8),
           Overflow       => Overflow(8)
          );	   
	  
end Behavioral;