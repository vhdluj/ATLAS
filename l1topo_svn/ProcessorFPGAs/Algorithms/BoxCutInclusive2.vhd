library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.ALL;

entity BoxCutInclusive2 is
generic (InputWidth1   : integer:=5;
         InputWidth2   : integer:=3;
         NumResultBits : integer:=1
        );
   Port (ClockBus      : std_logic_vector(2 downto 0);
         Parameters    : in  ParameterArray;
         Tobs1         : in  TOBArray(InputWidth1-1 downto 0);
         Tobs2         : in  TOBArray(InputWidth2-1 downto 0);
         Results       : out std_logic_vector (NumResultBits-1 downto 0);
         Overflow      : out std_logic
        );
end BoxCutInclusive2;

architecture Behavioral of BoxCutInclusive2 is

component BoxCalc
    Port (eta1   : in  std_logic_vector(5 downto 0);
          eta2   : in  std_logic_vector(5 downto 0);
          phi1   : in  std_logic_vector(5 downto 0);
          phi2   : in  std_logic_vector(5 downto 0);
--        deltaR : out std_logic_vector(5 downto 0);
          deltaEta : out std_logic_vector(5 downto 0);
          deltaPhi : out std_logic_vector(5 downto 0)
         );
end component;

component ParameterRegister 
port(clk     : in std_logic;
     enable  : in std_logic;
     reg_in  : in  ParameterArray;
     reg_out : out ParameterArray
    );
end component;

component GenericRegister 
generic(reg_width : integer:=5
       );
   port(clk       : in  std_logic;
        enable    : in  std_logic;
        reg_in    : in  std_logic_vector(reg_width-1  downto 0);
        reg_out   : out std_logic_vector(reg_width-1 downto 0)
       );
end component;

component TobRegister 
generic(InputWidth : integer:=16          -- Width of the register (in generic TOBs)
       );
   Port(clk        : in  std_logic;
        enable     : in  std_logic;
        reg_in     : in  TOBArray(InputWidth-1 downto 0);
        reg_out    : out TOBArray(InputWidth-1 downto 0)
       );
end component;

type acceptarr      is array (integer range <>) of std_logic;
type acceptmat      is array (integer range <>) of acceptarr(2*InputWidth2-2 downto 0);
type acceptmat_list is array (integer range <>) of acceptmat(2*InputWidth1-2 downto 0);

type deltaarr is array (integer range <>) of std_logic_vector(5 downto 0);
type deltamat is array (integer range <>) of deltaarr(2*InputWidth2-2 downto 0);

type Rthreshold is array(integer range <>) of std_logic_vector(5 downto 0);

signal accept_tmp  : acceptmat_list(NumResultBits-1 downto 0);
signal accept_tmp2 : acceptmat_list(NumResultBits-1 downto 0);

signal thr_flag1 : std_logic_vector(InputWidth1-1 downto 0);
signal thr_flag2 : std_logic_vector(InputWidth2-1 downto 0);

--signal deltaR : deltamat(2*InputWidth1-2 downto 0);
signal deltaEta : deltamat(2*InputWidth1-2 downto 0);
signal deltaPhi : deltamat(2*InputWidth1-2 downto 0);

signal threshold1 : std_logic_vector(9 downto 0);
signal threshold2 : std_logic_vector(9 downto 0);
signal max_R      : Rthreshold(NumResultBits-1 downto 0);
signal min_R      : Rthreshold(NumResultBits-1 downto 0);

signal reg_Tobs1 : TOBArray(InputWidth1-1 downto 0);
signal reg_Tobs2 : TOBArray(InputWidth2-1 downto 0);

signal reg_parameters : ParameterArray;

signal accept : std_logic_vector(NumResultBits-1 downto 0);

begin

tob_reg1: TobRegister
generic map(InputWidth => InputWidth1       
           )
   Port map(clk        => ClockBus(0),
            enable     => '1',
            reg_in     => Tobs1,
            reg_out    => reg_Tobs1
           );

tob_reg2: TobRegister
generic map(InputWidth => InputWidth2       
           )
   Port map(clk        => ClockBus(0),
            enable     => '1',
            reg_in     => Tobs2,
            reg_out    => reg_Tobs2
           );
                      
parameter_reg: ParameterRegister 
port map(clk     => ClockBus(0),
         enable  => '1',
         reg_in  => Parameters,
         reg_out => reg_parameters
        );
 
threshold1 <= reg_parameters(0)(9 downto 0);
threshold2 <= reg_parameters(1)(9 downto 0);

genThrArr: for i in 0 to NumResultBits-1 generate
 max_R(i) <= reg_parameters(i*2+2)(5 downto 0);
 min_R(i) <= reg_parameters(i*2+3)(5 downto 0);
end generate;
               
genThrFlag1: for i in 0 to InputWidth1-1 generate
 thr_flag1(i) <= '1' when reg_Tobs1(i).Et>threshold1 else '0';
end generate;

genThrFlag2: for i in 0 to InputWidth2-1 generate
 thr_flag2(i) <= '1' when reg_Tobs2(i).Et>threshold2 else '0';
end generate;

Overflow <= thr_flag1(InputWidth1-1) OR thr_flag2(InputWidth2-1);

gen1: for i in 0 to InputWidth1-1 generate
 gen2: for j in 0 to InputWidth2-1 generate
   boxCut_inst: BoxCalc
    port map(eta1   => reg_TOBs1(i).Eta,
             eta2   => reg_TOBs2(j).Eta,
             phi1   => reg_TOBs1(i).Phi,
             phi2   => reg_TOBs2(j).Phi,
--           deltaR => deltaR(i)(j)
             deltaEta => deltaEta(i)(j),
             deltaPhi => deltaPhi(i)(j)
            );
 end generate;          
end generate;

genResults: for k in 0 to NumResultBits-1 generate
 
gen1: for i in 0 to InputWidth1-1 generate
 gen2: for j in 0 to InputWidth2-1 generate
-- accept_tmp(k)(i)(j) <= '1' when (deltaR(i)(j) < max_R(k)) AND (deltaR(i)(j) > min_R(k)) else '0';
   accept_tmp(k)(i)(j) <= '1' when (deltaEta(i)(j) < max_R(k)) AND (deltaEta(i)(j) > min_R(k) AND deltaPhi(i)(j) < max_R(k)) AND (deltaPhi(i)(j) > min_R(k)) else '0';
 end generate;
end generate;

genAcceptTmp2a: for i in 0 to InputWidth1-1 generate
 genAcceptTmp2b: for j in 0 to InputWidth2-1 generate
  accept_tmp2(k)(i)(j)<=accept_tmp(k)(i)(j) AND thr_flag1(i) AND thr_flag2(j);
 end generate;
end generate;

genOutAccept1: for i in 0 to InputWidth1-1 generate
 genx: for j in 0 to InputWidth2-2 generate
  accept_tmp2(k)(i)(InputWidth2+j)<=accept_tmp2(k)(i)(2*j) or accept_tmp2(k)(i)(2*j+1);
 end generate;
end generate;

genOutAccept2: for i in 0 to InputWidth1-2 generate
  accept_tmp2(k)(InputWidth1+i)(2*InputWidth2-2)<=accept_tmp2(k)(2*i)(2*InputWidth2-2) or accept_tmp2(k)(2*i+1)(2*InputWidth2-2);
end generate;

accept(k)<=accept_tmp2(k)(2*InputWidth1-2)(2*InputWidth2-2);

end generate;

Oup_reg: GenericRegister 
generic map(reg_width => NumResultBits
           )
   port map(clk       => ClockBus(0),
            enable    => '1',
            reg_in    => accept,
            reg_out   => Results
           );
          
end Behavioral;
