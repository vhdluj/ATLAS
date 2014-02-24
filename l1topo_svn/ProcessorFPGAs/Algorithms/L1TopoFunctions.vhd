library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.L1TopoDataTypes.all;

Package L1TopoFunctions is
    function Jet_TOB_to_std_logic_vector(arg: JetTOB) return std_logic_vector;
    function std_logic_vector_to_Jet_TOB(arg: std_logic_vector(27 downto 0)) return JetTOB;
    function ld(m:positive) return natural;
    function  sqrt  ( d : UNSIGNED ) return UNSIGNED;
    function std_logic_vector_to_TOB(arg: std_logic_vector(22 downto 0);phi_bit4: std_logic; phi_bit5: std_logic) return ClusterTOB;
    function std_logic_vector_to_TOB(arg: std_logic_vector(21 downto 0)) return GenericTOB;
    function std_logic_vector_to_TOB(arg: std_logic_vector(27 downto 0); phi_bit1: std_logic) return JetTOB;
    function TOB_to_std_logic_vector(arg: ClusterTOB) return std_logic_vector;
    function TOB_to_std_logic_vector(arg: JetTOB) return std_logic_vector;
    function TOB_to_std_logic_vector(arg: GenericTOB) return std_logic_vector;
   
   
    function calc_crc(data: std_logic_vector(115 downto 0)) return std_logic_vector;

    
    
    
    

end package L1TopoFunctions;


Package body L1TopoFunctions is
 
    
-- Functions for converting Jet TOBs to std_logic_vector and vice-versa

   function Jet_TOB_to_std_logic_vector(arg: JetTOB) return std_logic_vector is
            variable result : std_logic_vector(28 downto 0);
        begin
            result(18 downto 10) := arg.Et1;
            result( 9 downto  0) := arg.Et2;
            result(23 downto 19) := arg.eta;
            result(28 downto 24) := arg.phi;
            return result;
        end function Jet_TOB_to_std_logic_vector;

    function std_logic_vector_to_Jet_TOB(arg: std_logic_vector(27 downto 0)) return JetTOB is
            variable result : JetTOB;
        begin
            result.Et1 := arg (18 downto 10);
            result.Et2 := arg( 9 downto  0);
            result.eta := arg(23 downto 19);
            result.phi := arg(28 downto 24);
            return result;
        end function std_logic_vector_to_Jet_TOB;
            -- Functions to convert TOBs from/to std_logic_vector
         
         function ld(m:positive) return natural is
         begin
            for n in 0 to integer'high loop
               if (2**n >= m) then
                  return n;
               end if;
            end loop;
         end function ld;
         
         --sqrt function
         
                  function  sqrt  ( d : UNSIGNED ) return UNSIGNED is
              variable a : unsigned(31 downto 0):=d;  --original input.
              variable q : unsigned(15 downto 0):=(others => '0');  --result.
              variable left,right,r : unsigned(17 downto 0):=(others => '0');  --input to adder/sub.r-remainder.
              variable i : integer:=0;
              
              begin
              for i in 0 to 15 loop
              right(0):='1';
              right(1):=r(17);
              right(17 downto 2):=q;
              left(1 downto 0):=a(31 downto 30);
              left(17 downto 2):=r(15 downto 0);
              a(31 downto 2):=a(29 downto 0);  --shifting by 2 bit.
              if ( r(17) = '1') then
              r := left + right;
              else
              r := left - right;
              end if;
              q(15 downto 1) := q(14 downto 0);
              q(0) := not r(17);
              end loop;
              return q;
              
              end sqrt;

         
         function std_logic_vector_to_TOB(arg: std_logic_vector(22 downto 0);phi_bit4: std_logic; phi_bit5: std_logic) return ClusterTOB is
          variable result : ClusterTOB ;
         begin
          result.Et   := arg( 7 downto  0);
          result.isol := arg(12 downto  8);
          result.eta  := arg(18 downto 13);
          result.phi(3 downto 0)  := arg(22 downto 19);
          result.phi(4)  := phi_bit4;--!
          result.phi(5)  := phi_bit5;--!
          return result;
         end function std_logic_vector_to_TOB;
         
         
         function std_logic_vector_to_TOB(arg: std_logic_vector(21 downto 0)) return GenericTOB is
          variable result : GenericTOB;
         begin
         result.Et  := arg( 9 downto  0);
         result.eta := arg(15 downto 10);
         result.phi := arg(21 downto 16);
          return result;
         end function std_logic_vector_to_TOB;
       
         function std_logic_vector_to_TOB(arg: std_logic_vector(27 downto 0); phi_bit1: std_logic) return JetTOB is
          variable result : JetTOB;
         begin
         result.Et1(8 downto 0) := arg(18 downto 10);
         result.Et2(9 downto 0) := arg( 9 downto  0);
         result.eta(4 downto 0) := arg(23 downto 19);
         result.phi(0)          := arg(24);
         result.phi(1)          := phi_bit1;--!
         result.phi(4 downto 2) := arg(27 downto 25);
          return result;
         end function std_logic_vector_to_TOB;
         
         function TOB_to_std_logic_vector(arg: ClusterTOB) return std_logic_vector is
          variable result : std_logic_vector(24 downto 0) ;
         begin
          result( 7 downto  0) := arg.Et;
          result(12 downto  8) := arg.isol;
          result(18 downto 13) := arg.eta;
          result(24 downto 19) := arg.phi;
          return result;
         end function TOB_to_std_logic_vector;
         
         function TOB_to_std_logic_vector(arg: JetTOB) return std_logic_vector is
          variable result : std_logic_vector(19 downto 0);
         begin
          --result(18 downto 10) := arg.Et1;
          result( 9 downto  0) := arg.Et2;
          result(14 downto 10) := arg.eta;
          result(19 downto 15) := arg.phi;
          return result;
         end function TOB_to_std_logic_vector;
         
         function TOB_to_std_logic_vector(arg: GenericTOB) return std_logic_vector is
          variable result : std_logic_vector(19 downto 0);
         begin
          result( 9 downto  0) := arg.Et;
          result(14 downto 10) := arg.eta(4 downto 0);
          result(19 downto 15) := arg.phi(4 downto 0);
          return result;
         end function TOB_to_std_logic_vector;
    
       
          function calc_crc(data: std_logic_vector(115 downto 0)) return std_logic_vector is
          variable d: std_logic_vector(115 downto 0);
          variable new_crc: std_logic_vector(11 downto 0);
          
          begin
            d:=data;
                           
             new_crc(0) := d(0) xor d(8) xor d(9) xor d(10) xor d(11) xor d(12) xor d(16) xor d(18) xor d(20) xor d(22) xor d(25) xor d(28) xor d(30) xor d(35) xor d(41) xor d(42) xor d(43) xor d(44) xor d(45) xor d(46) xor d(47) xor d(49) xor d(51) xor d(53) xor d(54) xor d(55) xor d(58) xor d(59) xor d(61) xor d(62) xor d(64) xor d(65) xor d(66) xor d(67) xor d(69) xor d(71) xor d(72) xor d(78) xor d(79) xor d(80) xor d(81) xor d(84) xor d(86) xor d(88) xor d(91) xor d(92) xor d(96) xor d(100) xor d(105) xor d(106) xor d(107) xor d(109) xor d(110) xor d(111) xor d(112) xor d(113) xor d(115);
             new_crc(1) := d(0) xor d(1) xor d(8) xor d(13) xor d(16) xor d(17) xor d(18) xor d(19) xor d(20) xor d(21) xor d(22) xor d(23) xor d(25) xor d(26) xor d(28) xor d(29) xor d(30) xor d(31) xor d(35) xor d(36) xor d(41) xor d(48) xor d(49) xor d(50) xor d(51) xor d(52) xor d(53) xor d(56) xor d(58) xor d(60) xor d(61) xor d(63) xor d(64) xor d(68) xor d(69) xor d(70) xor d(71) xor d(73) xor d(78) xor d(82) xor d(84) xor d(85) xor d(86) xor d(87) xor d(88) xor d(89) xor d(91) xor d(93) xor d(96) xor d(97) xor d(100) xor d(101) xor d(105) xor d(108) xor d(109) xor d(114) xor d(115);
             new_crc(2) := d(0) xor d(1) xor d(2) xor d(8) xor d(10) xor d(11) xor d(12) xor d(14) xor d(16) xor d(17) xor d(19) xor d(21) xor d(23) xor d(24) xor d(25) xor d(26) xor d(27) xor d(28) xor d(29) xor d(31) xor d(32) xor d(35) xor d(36) xor d(37) xor d(41) xor d(43) xor d(44) xor d(45) xor d(46) xor d(47) xor d(50) xor d(52) xor d(55) xor d(57) xor d(58) xor d(66) xor d(67) xor d(70) xor d(74) xor d(78) xor d(80) xor d(81) xor d(83) xor d(84) xor d(85) xor d(87) xor d(89) xor d(90) xor d(91) xor d(94) xor d(96) xor d(97) xor d(98) xor d(100) xor d(101) xor d(102) xor d(105) xor d(107) xor d(111) xor d(112) xor d(113);
             new_crc(3) := d(0) xor d(1) xor d(2) xor d(3) xor d(8) xor d(10) xor d(13) xor d(15) xor d(16) xor d(17) xor d(24) xor d(26) xor d(27) xor d(29) xor d(32) xor d(33) xor d(35) xor d(36) xor d(37) xor d(38) xor d(41) xor d(43) xor d(48) xor d(49) xor d(54) xor d(55) xor d(56) xor d(61) xor d(62) xor d(64) xor d(65) xor d(66) xor d(68) xor d(69) xor d(72) xor d(75) xor d(78) xor d(80) xor d(82) xor d(85) xor d(90) xor d(95) xor d(96) xor d(97) xor d(98) xor d(99) xor d(100) xor d(101) xor d(102) xor d(103) xor d(105) xor d(107) xor d(108) xor d(109) xor d(110) xor d(111) xor d(114) xor d(115);
             new_crc(4) := d(0) xor d(1) xor d(2) xor d(3) xor d(4) xor d(8) xor d(10) xor d(12) xor d(14) xor d(17) xor d(20) xor d(22) xor d(27) xor d(33) xor d(34) xor d(35) xor d(36) xor d(37) xor d(38) xor d(39) xor d(41) xor d(43) xor d(45) xor d(46) xor d(47) xor d(50) xor d(51) xor d(53) xor d(54) xor d(56) xor d(57) xor d(58) xor d(59) xor d(61) xor d(63) xor d(64) xor d(70) xor d(71) xor d(72) xor d(73) xor d(76) xor d(78) xor d(80) xor d(83) xor d(84) xor d(88) xor d(92) xor d(97) xor d(98) xor d(99) xor d(101) xor d(102) xor d(103) xor d(104) xor d(105) xor d(107) xor d(108) xor d(113);
             new_crc(5) := d(1) xor d(2) xor d(3) xor d(4) xor d(5) xor d(9) xor d(11) xor d(13) xor d(15) xor d(18) xor d(21) xor d(23) xor d(28) xor d(34) xor d(35) xor d(36) xor d(37) xor d(38) xor d(39) xor d(40) xor d(42) xor d(44) xor d(46) xor d(47) xor d(48) xor d(51) xor d(52) xor d(54) xor d(55) xor d(57) xor d(58) xor d(59) xor d(60) xor d(62) xor d(64) xor d(65) xor d(71) xor d(72) xor d(73) xor d(74) xor d(77) xor d(79) xor d(81) xor d(84) xor d(85) xor d(89) xor d(93) xor d(98) xor d(99) xor d(100) xor d(102) xor d(103) xor d(104) xor d(105) xor d(106) xor d(108) xor d(109) xor d(114);
             new_crc(6) := d(2) xor d(3) xor d(4) xor d(5) xor d(6) xor d(10) xor d(12) xor d(14) xor d(16) xor d(19) xor d(22) xor d(24) xor d(29) xor d(35) xor d(36) xor d(37) xor d(38) xor d(39) xor d(40) xor d(41) xor d(43) xor d(45) xor d(47) xor d(48) xor d(49) xor d(52) xor d(53) xor d(55) xor d(56) xor d(58) xor d(59) xor d(60) xor d(61) xor d(63) xor d(65) xor d(66) xor d(72) xor d(73) xor d(74) xor d(75) xor d(78) xor d(80) xor d(82) xor d(85) xor d(86) xor d(90) xor d(94) xor d(99) xor d(100) xor d(101) xor d(103) xor d(104) xor d(105) xor d(106) xor d(107) xor d(109) xor d(110) xor d(115);
             new_crc(7) := d(3) xor d(4) xor d(5) xor d(6) xor d(7) xor d(11) xor d(13) xor d(15) xor d(17) xor d(20) xor d(23) xor d(25) xor d(30) xor d(36) xor d(37) xor d(38) xor d(39) xor d(40) xor d(41) xor d(42) xor d(44) xor d(46) xor d(48) xor d(49) xor d(50) xor d(53) xor d(54) xor d(56) xor d(57) xor d(59) xor d(60) xor d(61) xor d(62) xor d(64) xor d(66) xor d(67) xor d(73) xor d(74) xor d(75) xor d(76) xor d(79) xor d(81) xor d(83) xor d(86) xor d(87) xor d(91) xor d(95) xor d(100) xor d(101) xor d(102) xor d(104) xor d(105) xor d(106) xor d(107) xor d(108) xor d(110) xor d(111);
             new_crc(8) := d(4) xor d(5) xor d(6) xor d(7) xor d(8) xor d(12) xor d(14) xor d(16) xor d(18) xor d(21) xor d(24) xor d(26) xor d(31) xor d(37) xor d(38) xor d(39) xor d(40) xor d(41) xor d(42) xor d(43) xor d(45) xor d(47) xor d(49) xor d(50) xor d(51) xor d(54) xor d(55) xor d(57) xor d(58) xor d(60) xor d(61) xor d(62) xor d(63) xor d(65) xor d(67) xor d(68) xor d(74) xor d(75) xor d(76) xor d(77) xor d(80) xor d(82) xor d(84) xor d(87) xor d(88) xor d(92) xor d(96) xor d(101) xor d(102) xor d(103) xor d(105) xor d(106) xor d(107) xor d(108) xor d(109) xor d(111) xor d(112);
             new_crc(9) := d(5) xor d(6) xor d(7) xor d(8) xor d(9) xor d(13) xor d(15) xor d(17) xor d(19) xor d(22) xor d(25) xor d(27) xor d(32) xor d(38) xor d(39) xor d(40) xor d(41) xor d(42) xor d(43) xor d(44) xor d(46) xor d(48) xor d(50) xor d(51) xor d(52) xor d(55) xor d(56) xor d(58) xor d(59) xor d(61) xor d(62) xor d(63) xor d(64) xor d(66) xor d(68) xor d(69) xor d(75) xor d(76) xor d(77) xor d(78) xor d(81) xor d(83) xor d(85) xor d(88) xor d(89) xor d(93) xor d(97) xor d(102) xor d(103) xor d(104) xor d(106) xor d(107) xor d(108) xor d(109) xor d(110) xor d(112) xor d(113);
             new_crc(10) := d(6) xor d(7) xor d(8) xor d(9) xor d(10) xor d(14) xor d(16) xor d(18) xor d(20) xor d(23) xor d(26) xor d(28) xor d(33) xor d(39) xor d(40) xor d(41) xor d(42) xor d(43) xor d(44) xor d(45) xor d(47) xor d(49) xor d(51) xor d(52) xor d(53) xor d(56) xor d(57) xor d(59) xor d(60) xor d(62) xor d(63) xor d(64) xor d(65) xor d(67) xor d(69) xor d(70) xor d(76) xor d(77) xor d(78) xor d(79) xor d(82) xor d(84) xor d(86) xor d(89) xor d(90) xor d(94) xor d(98) xor d(103) xor d(104) xor d(105) xor d(107) xor d(108) xor d(109) xor d(110) xor d(111) xor d(113) xor d(114);
             new_crc(11) := d(7) xor d(8) xor d(9) xor d(10) xor d(11) xor d(15) xor d(17) xor d(19) xor d(21) xor d(24) xor d(27) xor d(29) xor d(34) xor d(40) xor d(41) xor d(42) xor d(43) xor d(44) xor d(45) xor d(46) xor d(48) xor d(50) xor d(52) xor d(53) xor d(54) xor d(57) xor d(58) xor d(60) xor d(61) xor d(63) xor d(64) xor d(65) xor d(66) xor d(68) xor d(70) xor d(71) xor d(77) xor d(78) xor d(79) xor d(80) xor d(83) xor d(85) xor d(87) xor d(90) xor d(91) xor d(95) xor d(99) xor d(104) xor d(105) xor d(106) xor d(108) xor d(109) xor d(110) xor d(111) xor d(112) xor d(114) xor d(115);
             return new_crc;
          end calc_crc;

end package body L1TopoFunctions; -- Package

