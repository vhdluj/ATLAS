library ieee;
use ieee.std_logic_1164.all;

Package L1TopoGTConfiguration is

	--GT constants
	constant ProductionYes_PrototypeNo   : std_logic:='0';--decides whether we are using a production module or the prototype module with difffent routing of MGT reference clocks
	constant GTH_On_GTX_Off				 : std_logic:='0';--also indirect distinction between 485T and 690T
	constant GTH_IPCore_Version          : integer := 27;--27 means 2.7; 32 means 3.2
	constant GTX_IPCore_Version          : integer := 27;
	constant TTCMGTRefClkYes_CrystalMGTRefClkNo: std_logic:='1';
	constant GT_Speed_In_kbps			 : integer:=6412800;--state here the GT speed you want to have, not all speeds possible but 6412800 will work
	
	--comment this out for real firmware
	constant MGTHigh	                 : integer := 15;--<56 (485T) or <80 (690T)
	constant MGTLow  					 : integer := 12;--12 (485T) or 0 (690T)
	constant QuadMax					 : integer := 3;--maximum number of quads which use an MGT Ref Clk 13 or 19
	constant QuadHigh              		 : integer := 3;--<14 (485T) or <20 (690T)
	constant QuadLow				     : integer := 3;--3 (485T) or 0 (690T)
	
	constant TxMGTHigh					 : integer := 15;--between 12 and 23
	constant TxMGTLow					 : integer := 12;--between 12 and 23
	constant TxQuadHigh				     : integer := 3;--between 3 and 5
	constant TxQuadLow				     : integer := 3;--between 3 and 5
	
	
	--comment this out for simulation
--	 constant MGTHigh	                 : integer := 15;--<56 (485T) or <80 (690T)
--	 constant MGTLow  					 : integer := 12;--12 (485T) or 0 (690T)
--	 constant QuadMax					 : integer := 19;--maximum number of quads which use an MGT Ref Clk 13 or 19
--	 constant QuadHigh              		 : integer := 3;--<14 (485T) or <20 (690T)
--	 constant QuadLow				     : integer := 3;--3 (485T) or 0 (690T)
	
--	 constant TxMGTLow					 : integer := 12;--between 12 and 23
--	 constant TxMGTHigh					 : integer := 15;--between 12 and 23
--	 constant TxQuadLow				     : integer := 3;--between 3 and 5
--	 constant TxQuadHigh				     : integer := 3;--between 3 and 5	

	
	--arrays of std_logic_vectors
	type arraySLV128 is array (natural range <>) of std_logic_vector(128 - 1 downto 0);
	type arraySLV96 is array (natural range <>) of std_logic_vector(96 - 1 downto 0);
	type arraySLV36 is array (natural range <>) of std_logic_vector(36 - 1 downto 0);
	type arraySLV32 is array (natural range <>) of std_logic_vector(32 - 1 downto 0);
	type arraySLV16 is array (natural range <>) of std_logic_vector(16 - 1 downto 0);
	type arraySLV10 is array (natural range <>) of std_logic_vector(10 - 1 downto 0);
	type arraySLV8 is array (natural range <>) of std_logic_vector(8 - 1 downto 0);
	type arraySLV5 is array (natural range <>) of std_logic_vector(5 - 1 downto 0);
	type arraySLV4 is array (natural range <>) of std_logic_vector(4 - 1 downto 0);
	type arraySLV3 is array (natural range <>) of std_logic_vector(3 - 1 downto 0);
	type arraySLV2 is array (natural range <>) of std_logic_vector(2 - 1 downto 0);
	type arraySLV1 is array (natural range <>) of std_logic_vector(1 - 1 downto 0);
	type arraySL is array (natural range <>) of std_logic;   
	
	--36bit data type for playback/spy data(32bit) + charisk(4bit)
	type ArrayOf36bitVectors is array (natural range <>) of std_logic_vector(35 downto 0);

end L1TopoGTConfiguration;

package body L1TopoGTConfiguration is
end L1TopoGTConfiguration;  