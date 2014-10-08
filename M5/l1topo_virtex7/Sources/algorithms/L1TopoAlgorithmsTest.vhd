----------------------------------
-- L1Topo Algorithms Top Module --
-- Written for tests on FPGA    --
----------------------------------

--------------
-- includes --
--------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.L1TopoDataTypes.all;

------------------------
-- entity declaration --
------------------------

entity L1TopoAlgorithms is
	Port(ClockBus               : in  std_logic_vector(2 downto 0);

		 JetTobArray            : in  JetArray(InputWidthJET - 1 downto 0);
		 EmTobArray             : in  ClusterArray(InputWidthEM - 1 downto 0);
		 TauTobArray            : in  ClusterArray(InputWidthTAU - 1 downto 0);
--		 MuTobArray             : in  MuonArray(InputWidthMU - 1 downto 0); --TODO: NYI! use it!
		 signedEx               : in  std_logic_vector(14 downto 0);
		 signedEy               : in  std_logic_vector(14 downto 0);

		 AlgoParameters         : in  ParameterSpace(NumberOfAlgorithms - 1 downto 0);
		 SortParameters         : in  ParameterSpace(NumberOfSortAlgorithms - 1 downto 0);
--		 KalmanMETCorrectionLUT : in  std_logic_vector(KalmanMETCorrection_numberOfEtBins * KalmanMETCorrection_numberOfEtaBins * KalmanMETCorrection_correctionBitWidth - 1 downto 0);

		 Results                : out std_logic_vector(NumberOfResultBits - 1 downto 0);
		 Overflow               : out std_logic_vector(NumberOfOverflowBits - 1 downto 0);
		 
		 debugGenericArray: out std_logic_vector(127 downto 0);
		 debugDPhi: out std_logic_vector(dPhiDebugWidth-1 downto 0 )
	);
end L1TopoAlgorithms;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of L1TopoAlgorithms is

	-------------
	-- signals --
	-------------
	-- MET:
	signal METSqr      : std_logic_vector(METSqrEnergyBitWidth - 1 downto 0);
	signal METPhi      : std_logic_vector(5 downto 0);
	signal MET_generic : TOBArray(0 downto 0);
	-- output TOB lists after sort/select:
	signal AJ_s        : TOBArray(OutputWidthSortJET - 1 downto 0); -- sorted list, all jets (no eta restriction)
	signal EM_s        : TOBArray(OutputWidthSortEM - 1 downto 0);  -- sorted list, e/gamma
	signal TAU_s       : TOBArray(OutputWidthSortTAU - 1 downto 0); -- sorted list, tau

begin

	----------------------
	-- MET calculations --
	----------------------

--	KalmanMETCorrection_inst : entity work.KalmanMETCorrection
--		Port map(ClockBus            => ClockBus,
--			     Parameters          => Parameters(30),
--			     JetTobArray         => JetTobArray,
--			     signedEx            => signedEx,
--			     signedEy            => signedEy,
--			     lookupTableEtEta_in => KalmanMETCorrectionLUT,
--			     METSqrCorrected     => METSqr,
--			     METPhiCorrected     => METPhi,
--			     Overflow_out        => Overflow(31)
--		);

--	--Classical MET calculations without correction:
	
--	MET_inst : entity work.METCalc
--		Port map(ClockBus => ClockBus,
--			     SignedEx => signedEx,
--			     SignedEy => signedEy,
--			     METSqr   => METSqr
--		);

--	Arctan_inst : entity work.Arctan2 Port map(ClockBus => ClockBus,
--			                                   Ex       => signedEx,
--			                                   Ey       => signedEy,
--			                                   Phi      => METPhi
--		);

--	-- create generic object from METPhi
--	MET_generic(0).Et  <= (others => '0');
--	MET_generic(0).Eta <= (others => '0');
--	MET_generic(0).Phi <= METPhi;

	-----------------------
	-- Sorting/Selection --
	-----------------------
	
	------------------------------------------------------------------------------
	-- 0: All Jets Sorted List
	--    SortParameters: 0
	--    - threshold <= Parameters(0)(GenericEtBitWidth-1 downto 0); --unused
	--    - min_eta   <= Parameters(1)(JetEtaBitWidth-1 downto 0);
	--    - max_eta   <= Parameters(2)(JetEtaBitWidth-1 downto 0);
	--    Output: AJ_s
	------------------------------------------------------------------------------
	AJ_s_inst : entity work.JetSort
		generic map(InputWidth         => InputWidthJET,
			        InputWidth1stStage => InputWidth1stStageSortJET,
			        OutputWidth        => OutputWidthSortJET,
			        jet_size           => DefaultJetSize
		)
		Port map(ClockBus    => ClockBus,
			     Parameters  => SortParameters(0),
			     JetTobArray => JetTobArray,
			     TobArrayOut => AJ_s,
			     debug => debugGenericArray
		);
		
--	------------------------------------------------------------------------------
--	-- 1: e/gamma Sorted List
--	--    SortParameters: 1
--	--    - threshold <= Parameters(0)(GenericEtBitWidth-1 downto 0); --unused
--	--    - IsoMask   <= Parameters(1)(ClusterIsolBitWidth-1 downto 0);
--	--    - min_eta   <= Parameters(2)(ClusterEtaBitWidth-1 downto 0);
--	--    - max_eta   <= Parameters(3)(ClusterEtaBitWidth-1 downto 0);
--	--    Output: EM_s
--	------------------------------------------------------------------------------
--	EM_s_inst : entity work.ClusterSort
--		generic map(InputWidth         => InputWidthEM,
--			        InputWidth1stStage => InputWidth1stStageSortEM,
--			        OutputWidth        => OutputWidthSortEM
--		)
--		Port map(ClockBus        => ClockBus,
--			     Parameters      => SortParameters(1),
--			     ClusterTobArray => EmTobArray,
--			     TobArrayOut     => EM_s
--		);
		
--	------------------------------------------------------------------------------
--	-- 2: Tau Sorted List
--	--    SortParameters: 2
--	--    - threshold <= Parameters(0)(GenericEtBitWidth-1 downto 0); --unused
--	--    - IsoMask   <= Parameters(1)(ClusterIsolBitWidth-1 downto 0);
--	--    - min_eta   <= Parameters(2)(ClusterEtaBitWidth-1 downto 0);
--	--    - max_eta   <= Parameters(3)(ClusterEtaBitWidth-1 downto 0);
--	--    Output: TAU_s
--	------------------------------------------------------------------------------
--	TAU_s_inst : entity work.ClusterSort
--		generic map(InputWidth         => InputwidthTAU,
--			        InputWidth1stStage => InputWidth1stStageSortTAU,
--			        OutputWidth        => OutputWidthSortTAU
--		)
--		Port map(ClockBus        => ClockBus,
--			     Parameters      => SortParameters(2),
--			     ClusterTobArray => TauTobArray,
--			     TobArrayOut     => TAU_s
--		);

	--------------------------
	--topological algorithms--
	--------------------------

--	-- Jet testing

--	------------------------------------------------------------------------------
--	-- 0: J25
--	--    Parameters: 0
--	--    - thresholds(0) <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    Results:    0
--	--    Overflow:   -
--	------------------------------------------------------------------------------
--	Algo0_J25_inst : entity work.EtCut
--		generic map(InputWidth    => OutputWidthSortJET,
--			        NumResultBits => 1)
--		Port map(ClockBus   => ClockBus,
--			     Parameters => AlgoParameters(0),
--			     TOBs       => AJ_s,
--			     Results    => Results(0 downto 0)
--		);

	------------------------------------------------------------------------------
	-- 1: DPhi(J,J)16
	--    Parameters: 1
	--    - min_et     <= Parameters(0)(GenericEtBitWidth-1 downto 0);
	--    - lowphi(0)  <= Parameters(1)(GenericPhiBitWidth-1 downto 0);
	--    - highphi(0) <= Parameters(2)(GenericPhiBitWidth-1 downto 0);
	--    Results:    1
	--    Overflow:   0
	------------------------------------------------------------------------------
	Algo1_DPhi_JJ_16_inst: entity work.DeltaPhiIncl1
		generic map(InputWidth    => OutputWidthSortJET,
			        NumResultBits => 1)
		port map(TOBs       => AJ_s,
			     Parameters => AlgoParameters(1),
			     Clk        => ClockBus(0),
			     Results    => Results(1 downto 1),
			     Overflow   => Overflow(0),
			     debug => debugDPhi
		);

--	------------------------------------------------------------------------------
--	-- 2: DEta(J,J)10
--	--    Parameters: 2
--	--    - min_et     <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    - lowphi(0)  <= Parameters(1)(GenericEtaBitWidth-1 downto 0);
--	--    - highphi(0) <= Parameters(2)(GenericEtaBitWidth-1 downto 0);
--	--    Results:    2
--	--    Overflow:   1
--	------------------------------------------------------------------------------
--	Algo2_DEta_JJ_10_inst: entity work.DeltaEtaIncl1
--		generic map(InputWidth    => OutputWidthSortJET,
--			        NumResultBits => 1)
--		port map(Tob        => AJ_s,
--			     Parameters => AlgoParameters(2),
--			     Clk        => ClockBus(0),
--			     Results    => Results(2 downto 2),
--			     Overflow   => Overflow(1)
--		);

--	------------------------------------------------------------------------------
--	-- 3: HT200
--	--    Parameters: 3
--	--    - threshold        <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    - min_eta          <= Parameters(1)(JetEtaBitWidth-1 downto 0);
--	--    - max_eta          <= Parameters(2)(JetEtaBitWidth-1 downto 0);
--	--    - SumThresholds(0) <= Parameters(3)(16 downto 0);
--	--    Results:    3
--	--    Overflow:   -
--	------------------------------------------------------------------------------
--	Algo3_HT200_inst : entity work.JetHT
--		generic map(InputWidth    => InputWidthJet,
--			        NumResultBits => 1,
--			        jet_size      => DefaultJetSize
--		)
--		Port map(ClockBus    => ClockBus,
--			     Parameters  => AlgoParameters(3),
--			     JetTobArray => JetTobArray,
--			     Results     => Results(3 downto 3)
--		);



--	-- EM testing

--	------------------------------------------------------------------------------
--	-- 4: EM25
--	--    Parameters: 4
--	--    - thresholds(0) <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    Results:    4
--	--    Overflow:   -
--	------------------------------------------------------------------------------
--	Algo4_EM25_inst : entity work.EtCut
--		generic map(InputWidth    => OutputWidthSortEM,
--			        NumResultBits => 1)
--		Port map(ClockBus   => ClockBus,
--			     Parameters => AlgoParameters(4),
--			     TOBs       => EM_s,
--			     Results    => Results(4 downto 4)
--		);

--	------------------------------------------------------------------------------
--	-- 5: DPhi(EM,EM)16
--	--    Parameters: 5
--	--    - min_et     <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    - lowphi(0)  <= Parameters(1)(GenericPhiBitWidth-1 downto 0);
--	--    - highphi(0) <= Parameters(2)(GenericPhiBitWidth-1 downto 0);
--	--    Results:    5
--	--    Overflow:   2
--	------------------------------------------------------------------------------
--	Algo5_DPhi_EMEM_16_inst: entity work.DeltaPhiIncl1
--		generic map(InputWidth    => OutputWidthSortEM,
--			        NumResultBits => 1)
--		port map(TOBs       => EM_s,
--			     Parameters => AlgoParameters(5),
--			     Clk        => ClockBus(0),
--			     Results    => Results(5 downto 5),
--			     Overflow   => Overflow(2)
--		);

--	------------------------------------------------------------------------------
--	-- 6: DEta(EM,EM)10
--	--    Parameters: 6
--	--    - min_et     <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    - lowphi(0)  <= Parameters(1)(GenericEtaBitWidth-1 downto 0);
--	--    - highphi(0) <= Parameters(2)(GenericEtaBitWidth-1 downto 0);
--	--    Results:    6
--	--    Overflow:   3
--	------------------------------------------------------------------------------
--	Algo6_DEta_EMEM_10_inst: entity work.DeltaEtaIncl1
--		generic map(InputWidth    => OutputWidthSortEM,
--			        NumResultBits => 1)
--		port map(Tob        => EM_s,
--			     Parameters => AlgoParameters(6),
--			     Clk        => ClockBus(0),
--			     Results    => Results(6 downto 6),
--			     Overflow   => Overflow(3)
--		);



--	-- Tau testing

--	------------------------------------------------------------------------------
--	-- 7: TAU25
--	--    Parameters: 7
--	--    - thresholds(0) <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    Results:    7
--	--    Overflow:   -
--	------------------------------------------------------------------------------
--	Algo7_TAU25_inst : entity work.EtCut
--		generic map(InputWidth    => OutputWidthSortTAU,
--			        NumResultBits => 1)
--		Port map(ClockBus   => ClockBus,
--			     Parameters => AlgoParameters(7),
--			     TOBs       => TAU_s,
--			     Results    => Results(7 downto 7)
--		);

--	------------------------------------------------------------------------------
--	-- 8: DPhi(TAU,TAU)16
--	--    Parameters: 8
--	--    - min_et     <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    - lowphi(0)  <= Parameters(1)(GenericPhiBitWidth-1 downto 0);
--	--    - highphi(0) <= Parameters(2)(GenericPhiBitWidth-1 downto 0);
--	--    Results:    8
--	--    Overflow:   4
--	------------------------------------------------------------------------------
--	Algo8_DPhi_TAUTAU_16_inst: entity work.DeltaPhiIncl1
--		generic map(InputWidth    => OutputWidthSortTAU,
--			        NumResultBits => 1)
--		port map(TOBs       => TAU_s,
--			     Parameters => AlgoParameters(8),
--			     Clk        => ClockBus(0),
--			     Results    => Results(8 downto 8),
--			     Overflow   => Overflow(4)
--		);

--	------------------------------------------------------------------------------
--	-- 9: DEta(TAU,TAU)10
--	--    Parameters: 9
--	--    - min_et     <= Parameters(0)(GenericEtBitWidth-1 downto 0);
--	--    - lowphi(0)  <= Parameters(1)(GenericEtaBitWidth-1 downto 0);
--	--    - highphi(0) <= Parameters(2)(GenericEtaBitWidth-1 downto 0);
--	--    Results:    9
--	--    Overflow:   5
--	------------------------------------------------------------------------------
--	Algo9_DEta_TAUTAU_10_inst: entity work.DeltaEtaIncl1
--		generic map(InputWidth    => OutputWidthSortTAU,
--			        NumResultBits => 1)
--		port map(Tob        => TAU_s,
--			     Parameters => AlgoParameters(9),
--			     Clk        => ClockBus(0),
--			     Results    => Results(9 downto 9),
--			     Overflow   => Overflow(5)
--		);



--	-- MET testing

--	------------------------------------------------------------------------------
--	-- 10: EX25
--	--     Parameters: 10
--	--     - thresholds(0) <= Parameters(0)(METSqrEnergyBitWidth - 1 downto 0);
--	--     Results:    10
--	--     Overflow:   -
--	------------------------------------------------------------------------------
--	Algo10_XE25_inst: entity work.METCut
--		generic map(NumResultBits => 1)
--		port map(ClockBus   => ClockBus,
--			     Parameters => AlgoParameters(10),
--			     METSqr     => METSqr,
--			     Results    => Results(10 downto 10)
--		);

end Behavioral;