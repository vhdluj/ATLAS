-------------------------------------------------------------------------------
-- Design	:	KalmanMETCorrection
-- Author	:	Sebastian Artz
-- Email	:	sebastian.artz@cern.ch
-- Created	:	21.03.2014 Last Modified: 01.04.2014
-- Comments	:	Calculates a corrected MET using a correction Factor calculated by a
--				Kalman filter (proposed by Antonia Strubig, Sascha Caron, Jeroen Schouwenberg)
-------------------------------------------------------------------------------

--------------
-- includes --
--------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;

------------------------
-- entity declaration --
------------------------

entity KalmanMETCorrection is
	generic(InputWidth : integer := InputWidthJET;
		    jet_size   : integer := 2
	);
	Port(ClockBus            : in  std_logic_vector(2 downto 0);
		 Parameters          : in  ParameterArray;
		 JetTobArray         : in  JetArray(InputWidth - 1 downto 0);
		 signedEx            : in  std_logic_vector(METEnergyBitWidth - 1 downto 0);
		 signedEy            : in  std_logic_vector(METEnergyBitWidth - 1 downto 0);
		 lookupTableEtEta_in : in  std_logic_vector(KalmanMETCorrection_numberOfEtBins * KalmanMETCorrection_numberOfEtaBins * KalmanMETCorrection_correctionBitWidth - 1 downto 0);
		 METSqrCorrected     : out std_logic_vector(METSqrEnergyBitWidth - 1 downto 0);
		 METPhiCorrected     : out std_logic_vector(GenericPhiBitWidth - 1 downto 0);
		 Overflow_out        : out std_logic
	);
end KalmanMETCorrection;

-----------------------------------------
-- behavioral description of algorithm --
-----------------------------------------

architecture Behavioral of KalmanMETCorrection is

	---------------
	-- constants --
	---------------
	--	constant correctionFactorPreCommaDigits : integer := 2;
	--	constant resultBitLength : integer := sum_Ex'length + sum_Ey'length + 1 - 1 ;
	constant SumarrBitWidth              : integer := 1 + METEnergyBitWidth + CosSinBitWidth-2; -- overflow bit + 15 energy bits + 7 bits (cos/sin)
	constant SumArrLongBitWidth          : integer := 1 + METEnergyBitWidth + CosSinBitWidth + KalmanMETCorrection_correctionBitWidth-1;  -- overflow bit + 15 energy bits + 9 bits (cos/sin) + 8(-1) bit correction factor)

	----------------------
	-- type definitions --
	----------------------
	type lookupCorrEtaArray is array (natural range <>) of unsigned(KalmanMETCorrection_correctionBitWidth - 1 downto 0);
	type lookupTableEtEtaArray is array (natural range <>) of lookupCorrEtaArray(KalmanMETCorrection_numberOfEtaBins - 1 downto 0);
	type intArray is array (natural range <>) of natural;
	type corrFactorArray is array (natural range <>) of unsigned(KalmanMETCorrection_correctionBitWidth - 1 downto 0);
	type jetEtCorrectedArray is array (natural range <>) of std_logic_vector(METEnergyBitWidth + KalmanMETCorrection_correctionBitWidth - 1 downto 0);
	type triangResultArray is array (natural range <>) of std_logic_vector(CosSinBitWidth - 1 downto 0); -- sin/cos result array
	type sumarr is array (integer range <>) of std_logic_vector(SumarrBitWidth-1 downto 0);
	type sumarr_long is array (integer range <>) of std_logic_vector(SumArrLongBitWidth-1 downto 0);

	-------------
	-- signals --
	-------------
	-- parameters:
	signal threshold : std_logic_vector(GenericEtBitWidth - 1 downto 0); -- threshold to decide minimal energies used in the sum
		
	signal etBin            : intArray(InputWidth - 1 downto 0);
	signal etaBin           : intArray(InputWidth - 1 downto 0);
	signal jetEtCorrected   : jetEtCorrectedArray(InputWidth - 1 downto 0);
	signal cos_phi          : triangResultArray(InputWidth - 1 downto 0);
	signal sin_phi          : triangResultArray(InputWidth - 1 downto 0);
	signal corrFactor       : corrFactorArray(InputWidth - 1 downto 0);
	signal overflow         : std_logic_vector(2 * InputWidth - 2 downto 0);
	signal overflow_out_tmp : std_logic_vector(0 downto 0);
	signal lookupTableEtEta : lookupTableEtEtaArray(KalmanMETCorrection_numberOfEtBins - 1 downto 0);

	signal tmp_Ex : sumarr(InputWidth - 1 downto 0);
	signal tmp_Ey : sumarr(InputWidth - 1 downto 0);

	signal tmp_sum_Ex_1stStage : sumarr(InputWidth / 2 - 1 downto 0);
	signal tmp_sum_Ey_1stStage : sumarr(InputWidth / 2 - 1 downto 0);

	signal tmp_sum_Ex_2ndStage : sumarr(InputWidth - 2 downto 0);
	signal tmp_sum_Ey_2ndStage : sumarr(InputWidth - 2 downto 0);

	signal tmp_Ex_long : sumarr_long(InputWidth - 1 downto 0);
	signal tmp_Ey_long : sumarr_long(InputWidth - 1 downto 0);

	signal sum_Ex              : std_logic_vector(METEnergyBitWidth - 1 downto 0);
	signal sum_Ey              : std_logic_vector(METEnergyBitWidth - 1 downto 0);
	signal sum_Ex_inverse      : std_logic_vector(METEnergyBitWidth - 1 downto 0);
	signal sum_Ey_inverse      : std_logic_vector(METEnergyBitWidth - 1 downto 0);
	signal signed_Ex_corrected : std_logic_vector(METEnergyBitWidth - 1 downto 0);
	signal signed_Ey_corrected : std_logic_vector(METEnergyBitWidth - 1 downto 0);
	signal sum_METSqr          : std_logic_vector(METSqrEnergyBitWidth - 1 downto 0);

	signal phi_corrected : std_logic_vector(GenericPhiBitWidth - 1 downto 0);
	
	signal generic_in : TOBArray(InputWidth - 1 downto 0);
	
	signal sel_jets : TOBArray(InputWidth - 1 downto 0);



begin
	
	-- read parameters
	threshold <= Parameters(0)(GenericEtBitWidth - 1 downto 0);

	-- build lookup table from input signal "lookupTableEtEta_in"
	lookup_gen1 : for Eta in 0 to KalmanMETCorrection_numberOfEtaBins - 1 generate
		lookup_gen2 : for Et in 0 to KalmanMETCorrection_numberOfEtBins - 1 generate
			lookupTableEtEta(Et)(Eta) <= unsigned(lookupTableEtEta_in((Et*KalmanMETCorrection_numberOfEtaBins + Eta + 1)*KalmanMETCorrection_correctionBitWidth - 1 downto (Et*KalmanMETCorrection_numberOfEtaBins + Eta)*KalmanMETCorrection_correctionBitWidth));
		end generate;
	end generate;

	-- build generic TOBs from input jet TOBs
	sel_jet_size : for i in 0 to InputWidth - 1 generate
		generic_in(i).eta <= JetTobArray(i).Eta & '0';
		generic_in(i).phi <= JetTobArray(i).Phi & '0';
		size1 : if jet_size = 1 generate
			generic_in(i).Et <= '0' & JetTobArray(i).Et1;
		end generate;
		size2 : if jet_size /= 1 generate
			generic_in(i).Et <= JetTobArray(i).Et2;
		end generate;
	end generate;

	-- use threshold for input jets
	genInp : for i in 0 to InputWidth - 1 generate
		sel_jets(i) <= generic_in(i) when generic_in(i).Et > threshold else empty_tob;
	end generate;

	-- create array of sin(Phi) values for all jets
	genSin : for i in 0 to InputWidth - 1 generate
		genSin_i : entity work.Sin
			Port Map(inp => sel_jets(i).Phi,
				     oup => sin_phi(i)
			);
	end generate;

	-- create array of cos(Phi) values for all jets
	genCos : for i in 0 to InputWidth - 1 generate
		genCos_i : entity work.Cos
			Port Map(inp => sel_jets(i).Phi,
				     oup => cos_phi(i)
			);
	end generate;

	-- determine Et and Eta bin and look up correction factor
	genCorrection : for i in 0 to InputWidth - 1 generate
		-- select most significant bits of Et to determine Et bin
        etBin(i)  <= find_msb_1(sel_jets(i).Et);
		-- select most significant bits of Eta to determine Eta bin
		etaBin(i) <= to_integer(unsigned(sel_jets(i).Eta(sel_jets(i).Eta'length - 1 downto sel_jets(i).Eta'length - ld(KalmanMETCorrection_numberOfEtaBins))));

		corrFactor(i) <= lookupTableEtEta(etBin(i))(etaBin(i));
	end generate;

	-- apply correction factor to Et and calculate Ex and Ey
	genCalcExEy : for i in 0 to InputWidth - 1 generate
		jetEtCorrected(i) <= std_logic_vector(unsigned(resize(unsigned(sel_jets(i).Et), 15)) * corrFactor(i));

		tmp_Ex_long(i) <= std_logic_vector(signed(jetEtCorrected(i)) * signed(cos_phi(i))); -- TODO: check correctness
		tmp_Ey_long(i) <= std_logic_vector(signed(jetEtCorrected(i)) * signed(sin_phi(i)));

		tmp_Ex(i) <= tmp_Ex_long(i)(tmp_Ex_long(0)'length - 3 downto 7); -- discard the last 7 digits behind comma (-> keep 7 for max 0.01 error)
		tmp_Ey(i) <= tmp_Ey_long(i)(tmp_Ex_long(0)'length - 3 downto 7);

		overflow(i) <= (tmp_Ex(i)(tmp_Ex(i)'length - 1) xor tmp_Ex(i)(tmp_Ex(i)'length - 2)) -- set overflow bit considering the sign of tmp_sum_Ex
			or (tmp_Ey(i)(tmp_Ey(i)'length - 1) xor tmp_Ey(i)(tmp_Ey(i)'length - 2)); -- set overflow bit considering the sign of tmp_sum_Ey

	end generate;

	-- calculate the sums Ex and Ey of 64 jet-Et's in two steps (use register after first stage for timing/delay issues)
	-- 1st Stage
	genSum1stStage : for i in 0 to InputWidth / 2 - 1 generate
		tmp_sum_Ex_1stStage(i) <= std_logic_vector(signed(tmp_Ex(2 * i)) + signed(tmp_Ex(2 * i + 1)));
		tmp_sum_Ey_1stStage(i) <= std_logic_vector(signed(tmp_Ey(2 * i)) + signed(tmp_Ey(2 * i + 1)));
		Sum1stStage_reg_Ex : entity work.GenericRegister
			generic map(reg_width => SumarrBitWidth)
			port map(clk     => ClockBus(0),
				     enable  => '1',
				     reg_in  => tmp_sum_Ex_1stStage(i),
				     reg_out => tmp_sum_Ex_2ndStage(i)
			);
	end generate;
	-- 2nd Stage
	genSum2ndStage : for i in 0 to InputWidth / 2 - 2 generate
		tmp_sum_Ex_2ndStage(InputWidth / 2 + i) <= std_logic_vector(signed(tmp_sum_Ex_2ndStage(2 * i)) + signed(tmp_sum_Ex_2ndStage(2 * i + 1)));
		tmp_sum_Ey_2ndStage(InputWidth / 2 + i) <= std_logic_vector(signed(tmp_sum_Ey_2ndStage(2 * i)) + signed(tmp_sum_Ey_2ndStage(2 * i + 1)));
	end generate;

	-- calculate overflow TODO: Needs register for synchronous output (see below)
	genSumTree : for i in 0 to InputWidth - 2 generate
		overflow(InputWidth + i) <= overflow(2 * i) or overflow(2 * i + 1);
	end generate;

	-- get the element containing the whole sum (and the sign, first)
	sum_Ex <= tmp_sum_Ex_2ndStage(InputWidth - 2)(tmp_sum_Ex_2ndStage(0)'length - 1) & tmp_sum_Ex_2ndStage(InputWidth - 2)(tmp_sum_Ex_2ndStage(0)'length - 3 downto 7);
	sum_Ey <= tmp_sum_Ey_2ndStage(InputWidth - 2)(tmp_sum_Ey_2ndStage(0)'length - 1) & tmp_sum_Ey_2ndStage(InputWidth - 2)(tmp_sum_Ey_2ndStage(0)'length - 3 downto 7);

	-- invert vector to get correct direction of MET correction
	sum_Ex_inverse <= std_logic_vector(-signed(sum_Ex)); 
	sum_Ey_inverse <= std_logic_vector(-signed(sum_Ey));

	-- get the corrected Ex and Ey values from old MET and correction
	signed_Ex_corrected <= std_logic_vector(signed(signedEx) + signed(sum_Ex_inverse)); -- TODO: overflow not treated!
	signed_Ey_corrected <= std_logic_vector(signed(signedEy) + signed(sum_Ey_inverse)); -- TODO: overflow not treated!
	
	sum_METSqr <= std_logic_vector(signed(signed_Ex_corrected) * signed(signed_Ex_corrected) + signed(signed_Ey_corrected) * signed(signed_Ey_corrected));
	
	-- calculate corrected METPhi
	calcMETPhi : entity work.Arctan2
		Port Map(ClockBus => ClockBus,
			     Ex       => signed_Ex_corrected,
			     Ey       => signed_Ey_corrected,
			     Phi      => phi_corrected
		);

	-- buffer and output results:
	Oup_reg_MET : entity work.GenericRegister
		generic map(reg_width => sum_METSqr'length
		)
		port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => sum_METSqr,
			     reg_out => METSqrCorrected
		);

	Oup_reg_phi : entity work.GenericRegister
		generic map(reg_width => 6
		)
		port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => phi_corrected,
			     reg_out => METPhiCorrected
		);
		
	Oup_reg_overflow : entity work.GenericRegister
		generic map(reg_width => 1
		)
		port map(clk     => ClockBus(0),
			     enable  => '1',
			     reg_in  => overflow(2 * InputWidth - 2 downto 2 * InputWidth - 2),
			     reg_out => overflow_out_tmp
		);
	Overflow_out <= overflow_out_tmp(0);

end Behavioral;