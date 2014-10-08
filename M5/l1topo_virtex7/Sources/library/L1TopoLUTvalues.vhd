library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.L1TopoDataTypes.all;

Package L1TopoLUTvalues is

	function jetEtaLUT(index: std_logic_vector(JetEtaBitWidth-1 downto 0)) return std_logic_vector;
	function clusterEtaLUT(index: std_logic_vector(ClusterEtaBitWidth-1 downto 0)) return std_logic_vector;

end package L1TopoLUTvalues;

Package body L1TopoLUTvalues is

	function jetEtaLUT(index: std_logic_vector(JetEtaBitWidth-1 downto 0)) return std_logic_vector is
		variable eta: std_logic_vector(GenericEtaBitWidth-1 downto 0);
		type eta_lut_type is array (natural range 0 to 2**JetEtaBitWidth-1) of std_logic_vector(GenericEtaBitWidth-1 downto 0);
		constant eta_lut: eta_lut_type := (
		"1011001", 	 -- -3.9
		"1100010", 	 -- -3
		"1100101", 	 -- -2.7
		"1100111", 	 -- -2.5
		"1101010", 	 -- -2.2
		"1101100", 	 -- -2
		"1101110", 	 -- -1.8
		"1110000", 	 -- -1.6
		"1110010", 	 -- -1.4
		"1110100", 	 -- -1.2
		"1110110", 	 -- -1
		"1111000", 	 -- -0.8
		"1111010", 	 -- -0.6
		"1111100", 	 -- -0.4
		"1111110", 	 -- -0.2
		"0000000", 	 -- 0
		"0000010", 	 -- 0.2
		"0000100", 	 -- 0.4
		"0000110", 	 -- 0.6
		"0001000", 	 -- 0.8
		"0001010", 	 -- 1
		"0001100", 	 -- 1.2
		"0001110", 	 -- 1.4
		"0010000", 	 -- 1.6
		"0010010", 	 -- 1.8
		"0010100", 	 -- 2
		"0010110", 	 -- 2.2
		"0011001", 	 -- 2.5
		"0011011", 	 -- 2.7
		"0011110", 	 -- 3
		"0100111", 	 -- 3.9
		"0101001" 	 -- 4.1
			);
		begin
			eta := eta_lut(to_integer(unsigned(index)));
			return eta;
		end jetEtaLUT;

		
		

	function clusterEtaLUT(index: std_logic_vector(ClusterEtaBitWidth-1 downto 0)) return std_logic_vector is
		variable eta: std_logic_vector(GenericEtaBitWidth-1 downto 0);
		type eta_lut_type is array (natural range 0 to 2**ClusterEtaBitWidth-1) of std_logic_vector(GenericEtaBitWidth-1 downto 0);
		constant eta_lut: eta_lut_type := (
		"1101000", 	 -- -2.4
		"1101000", 	 -- -2.4
		"1101000", 	 -- -2.4
		"1101000", 	 -- -2.4
		"1101001", 	 -- -2.3
		"1101010", 	 -- -2.2
		"1101011", 	 -- -2.1
		"1101100", 	 -- -2
		"1101101", 	 -- -1.9
		"1101110", 	 -- -1.8
		"1101111", 	 -- -1.7
		"1110000", 	 -- -1.6
		"1110001", 	 -- -1.5
		"1110010", 	 -- -1.4
		"1110011", 	 -- -1.3
		"1110100", 	 -- -1.2
		"1110101", 	 -- -1.1
		"1110110", 	 -- -1
		"1110111", 	 -- -0.9
		"1111000", 	 -- -0.8
		"1111001", 	 -- -0.7
		"1111010", 	 -- -0.6
		"1111011", 	 -- -0.5
		"1111100", 	 -- -0.4
		"1111101", 	 -- -0.3
		"1111110", 	 -- -0.2
		"1111111", 	 -- -0.1
		"0000000", 	 -- 0
		"0000001", 	 -- 0.1
		"0000010", 	 -- 0.2
		"0000011", 	 -- 0.3
		"0000100", 	 -- 0.4
		"0000101", 	 -- 0.5
		"0000110", 	 -- 0.6
		"0000111", 	 -- 0.7
		"0001000", 	 -- 0.8
		"0001001", 	 -- 0.9
		"0001010", 	 -- 1
		"0001011", 	 -- 1.1
		"0001100", 	 -- 1.2
		"0001101", 	 -- 1.3
		"0001110", 	 -- 1.4
		"0001111", 	 -- 1.5
		"0010000", 	 -- 1.6
		"0010001", 	 -- 1.7
		"0010010", 	 -- 1.8
		"0010011", 	 -- 1.9
		"0010100", 	 -- 2
		"0010101", 	 -- 2.1
		"0010110", 	 -- 2.2
		"0010111", 	 -- 2.3
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000", 	 -- 2.4
		"0011000" 	 -- 2.4
        );
        begin
            eta := eta_lut(to_integer(unsigned(index)));
            return eta;
        end clusterEtaLUT;

		
		
end package body L1TopoLUTvalues;


