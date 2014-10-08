library ieee;
use ieee.std_logic_1164.all;

Package L1TopoDataTypes is

	-- generics for the algorithm modules

	constant InputWidthEM                : integer := 5;
	constant InputwidthTAU               : integer := 5;
	constant InputWidthJET               : integer := 4;
	constant InputWidthMU                : integer := 0;
	
	constant InputWidth1stStageSortEM    : integer := 5;
	constant InputWidth1stStageSelectEM  : integer := 5; --previous value: 15
	constant InputWidth1stStageSortTAU   : integer := 5;
	constant InputWidth1stStageSelectTAU : integer := 5; --previous value: 15
	constant InputWidth1stStageSortJET   : integer := 4;
	constant InputWidth1stStageSelectJET : integer := 4;
	constant InputWidth1stStageSortMU    : integer := 0;
	constant InputWidth1stStageSelectMU  : integer := 0;
	
	constant OutputWidthSortEM           : integer := 4;--5;
	constant OutputWidthSelectEM         : integer := 4;--5;
	constant OutputWidthSortTAU          : integer := 4;--5;
	constant OutputWidthSelectTAU        : integer := 4;--5;
	constant OutputWidthSortJET          : integer := 4;
	constant OutputWidthSelectJET        : integer := 4;
	constant OutputWidthSortMU           : integer := 0;
	constant NumberOfDelayedMuons        : integer := 0; -- to save timing resources: output only leading delayed muon
	constant OutputWidthSelectMU         : integer := 0;
	
	constant NumberOfAlgorithms          : integer := 11;
	constant NumberOfSortAlgorithms      : integer := 3;
	constant NumberOfResultBits          : integer := 11;  --ratio of results to overflow is adjustable (needs some more thoughts, which overflows are useful)
	constant NumberOfOverflowBits        : integer := 6;   --fixed! do not touch!
	constant NumberOfOutputBits          : integer := 32;  --there are only 32 lines from a L1Topo-Module to CTP => 16 lines per processor -> TODO: Change to 16! (but now 32 needed for testing)
	
	constant NumberOfMGTs_485            : integer := 56;
	constant NumberOfMGTs_690            : integer := 80;
	constant NumberOfQuads_485           : integer := 14;
	constant NumberOfQuads_690           : integer := 20;
	
	constant KalmanMETCorrection_numberOfEtaBins    : integer := 8;  -- needs to be multiple of 2
	constant KalmanMETCorrection_numberOfEtBins     : integer := 10; -- needs to be multiple of 2
	constant KalmanMETCorrection_correctionBitWidth : integer := 8;  -- assuming format unsigned [0.0000000]
	
	constant METEnergyBitWidth           : integer := 15;  --
	constant METSqrEnergyBitWidth        : integer := 2 * METEnergyBitWidth;
	
	constant CosSinBitWidth              : integer := 9;
	constant CoshBitWidth                : integer := 11;
	constant SechTanhBitWidth            : integer := 8;
	
	constant DefaultJetSize              : integer := 2;
	
	constant ClusterEtBitWidth           : integer := 8;
	constant ClusterIsolBitWidth         : integer := 5;
	constant ClusterEtaBitWidth          : integer := 6;
	constant ClusterPhiBitWidth          : integer := 6;
	
	constant JetEt1BitWidth              : integer := 9;
	constant JetEt2BitWidth              : integer := 10;
	constant JetEtaBitWidth              : integer := 5;
	constant JetPhiBitWidth              : integer := 5;
	
	constant MuonPtBitWidth              : integer := 2;
	constant MuonEtaBitWidth             : integer := 3;
	constant MuonPhiBitWidth             : integer := 3;
	
	constant GenericEtBitWidth           : integer := 10;
	constant GenericEtaBitWidth          : integer := 7;
	constant GenericPhiBitWidth          : integer := 6;
	
	-- compound constants
	
	constant MassSqrBitWidth             : integer := GenericEtBitWidth +  METEnergyBitWidth + 1 + CosSinBitWidth + 1;

	-- Maximum number of components that require parameters

	constant max_components : integer := 70; --TODO: unused!


	constant max_jets     : integer := 48; --TODO: unused!
	constant max_clusters : integer := 80; --TODO: unused!

	-- Max number of TOBs to be analysed by inclusive algorithms:

	constant max_incl_jets     : integer := 8; --TODO: unused!
	constant max_incl_clusters : integer := 8; --TODO: unused!

	--Internal Data width
	constant ParameterBitWidth : integer := 32;
	
	
	-- TOB data are arranged as arrays of records. Use these for unsorted/presorted TOBs:


	type ClusterTOB is record
		Et   : std_logic_vector(ClusterEtBitWidth-1 downto 0);
		Isol : std_logic_vector(ClusterIsolBitWidth-1 downto 0);
		Eta  : std_logic_vector(ClusterEtaBitWidth-1 downto 0);
		Phi  : std_logic_vector(ClusterPhiBitWidth-1 downto 0);
	end record;

	type JetTOB is record
		Et1 : std_logic_vector(JetEt1BitWidth-1 downto 0);
		Et2 : std_logic_vector(JetEt2BitWidth-1 downto 0);
		Eta : std_logic_vector(JetEtaBitWidth-1 downto 0);
		Phi : std_logic_vector(JetPhiBitWidth-1 downto 0);
	end record;

	type MuonTOB is record --TODO: How translate MuonTOB binning to GenericTOB??? Where? In Selection/Sort algos? Other Types converted correctly?
		Pt  : std_logic_vector(MuonPtBitWidth-1 downto 0);
		Eta : std_logic_vector(MuonEtaBitWidth-1 downto 0);
		Phi : std_logic_vector(MuonPhiBitWidth-1 downto 0);
	end record;

	type ClusterArray is array (natural range <>) of ClusterTOB;
	type JetArray is array (natural range <>) of JetTOB;
	type MuonArray is array (natural range <>) of MuonTOB;

	-- After selection and sorting, TOB data are all of same type.
	-- Use a generic TOB record for sorted TOBs:

	type GenericTOB is record
		Et  : std_logic_vector(GenericEtBitWidth-1 downto 0); -- Pad unused bits with zeros, they will be optimised away
		Eta : std_logic_vector(GenericEtaBitWidth-1 downto 0); -- Again, pad bottom bit with zero for muons and jets
		Phi : std_logic_vector(GenericPhiBitWidth-1 downto 0);
	end record;
	
	constant empty_tob : GenericTOB := (
		Et  => (others => '0'),
		Eta => (others => '0'),
		Phi => (others => '0')
	);

	type TOBArray is array (natural range <>) of GenericTOB;

	-- Parameters for configuring the trigger algorithms

	constant MaxParams : integer := 5;  -- Maximum number of parameters

	type ParameterArray is array (MaxParams - 1 downto 0) of std_logic_vector(ParameterBitWidth - 1 downto 0);
	type ParameterSpace is array (natural range <>) of ParameterArray;


    constant dPhiDebugWidth: natural := OutputWidthSortJET*(GenericEtBitWidth + GenericEtaBitWidth + GenericPhiBitWidth) + ((OutputWidthSortJET-2)*(OutputWidthSortJET-1) - ((OutputWidthSortJET-2)*(OutputWidthSortJET-3))/2)*GenericPhiBitWidth + GenericPhiBitWidth;

end L1TopoDataTypes;

package body L1TopoDataTypes is
end L1TopoDataTypes;  