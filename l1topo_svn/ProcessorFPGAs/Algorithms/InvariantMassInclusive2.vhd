library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.ALL;

entity InvariantMassInclusive2 is
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
end InvariantMassInclusive2;

architecture Behavioral of InvariantMassInclusive2 is


component InvMassCalc
    Port (eta1    : in  std_logic_vector( 5 downto 0);
          eta2    : in  std_logic_vector( 5 downto 0);
          phi1    : in  std_logic_vector( 5 downto 0);
          phi2    : in  std_logic_vector( 5 downto 0);
          energy1 : in  std_logic_vector( 9 downto 0);
          energy2 : in  std_logic_vector( 9 downto 0);
          mass    : out std_logic_vector(30 downto 0)
         );
end component;

component TobRegister 
generic(InputWidth : integer:=16          
       );
   Port(clk        : in  std_logic;
        enable     : in  std_logic;
        reg_in     : in  TOBArray(InputWidth-1 downto 0);
        reg_out    : out TOBArray(InputWidth-1 downto 0)
       );
end component;

component ParameterRegister 
port(clk    : in  std_logic;
     enable : in  std_logic;
     reg_in : in  ParameterArray;
     reg_out: out ParameterArray
    );
end component;

component GenericRegister 
generic(reg_width : integer:=5
       );
   port(clk       : in  std_logic;
        enable    : in  std_logic;
        reg_in    : in  std_logic_vector(reg_width-1 downto 0);
        reg_out   : out std_logic_vector(reg_width-1 downto 0)
       );
end component;

type acceptarr      is array (integer range <>) of std_logic;
type acceptmat      is array (integer range <>) of acceptarr(2*InputWidth2-2 downto 0);
type acceptmat_list is array (integer range <>) of acceptmat(2*InputWidth1-2 downto 0);

signal mass_accept_tmp : acceptmat_list(NumResultBits-1 downto 0);

type Resultsarr is array (integer range <>) of std_logic_vector(30 downto 0);
type Resultsmat is array (integer range <>) of Resultsarr(InputWidth2-1 downto 0);

type Mthreshold is array(integer range <>) of std_logic_vector(30 downto 0);

signal mass_results : Resultsmat(InputWidth1-1 downto 0);

signal sel_TOBs1 : TOBArray(InputWidth1-1 downto 0);
signal sel_TOBs2 : TOBArray(InputWidth2-1 downto 0);

signal dummyTOB : GenericTOB;

signal reg_Tobs1      : TOBArray(InputWidth1-1 downto 0);
signal reg_Tobs2      : TOBArray(InputWidth2-1 downto 0);
signal reg_parameters : ParameterArray;
signal reg_accept     : std_logic_vector(NumResultBits-1 downto 0);

signal threshold1     : std_logic_vector(9 downto 0);
signal threshold2     : std_logic_vector(9 downto 0);
signal threshold_mass : Mthreshold(NumResultBits-1 downto 0);

begin

Inp_reg1: TobRegister 
generic map(InputWidth => InputWidth1
           )
   Port map(clk        => ClockBus(0),
            enable     => '1',
            reg_in     => Tobs1,
            reg_out    => reg_tobs1
           ); 

Inp_reg2: TobRegister 
generic map(InputWidth =>InputWidth2
           )
   Port map(clk        => ClockBus(0),
            enable     => '1',
            reg_in     => Tobs2,
            reg_out    => reg_tobs2
           ); 
           
parameter_reg: ParameterRegister
   port map(clk       => ClockBus(0),
            enable    => '1',
            reg_in    => Parameters,
            reg_out   => reg_parameters
           );
           
dummyTOB.Et <=(others=>'0');
dummyTOB.eta<=(others=>'0');
dummyTOB.phi<=(others=>'0');

threshold1<=reg_parameters(0)(9 downto 0);
threshold2<=reg_parameters(1)(9 downto 0);

genThrArr: for i in 0 to NumResultBits-1 generate
 threshold_mass(i) <= reg_parameters(i+2)(30 downto 0);
end generate;

genInp1: for i in 0 to InputWidth1-1 generate
 sel_TOBs1(i) <= reg_tobs1(i) when reg_tobs1(i).Et>threshold1 else dummyTOB;
end generate;

genInp2: for i in 0 to InputWidth2-1 generate
 sel_TOBs2(i) <= reg_tobs2(i) when reg_tobs2(i).Et>threshold2 else dummyTOB;
end generate;

Overflow <= '1' when reg_tobs1(InputWidth1-1).Et > threshold1 OR reg_tobs2(InputWidth2-1).Et > threshold2 else '0';

gen1: for i in 0 to InputWidth1-1 generate
 gen2: for j in 0 to InputWidth2-1 generate
   Inv_mass_inst: InvMassCalc
    port map(eta1    => sel_TOBs1(i).Eta,
             eta2    => sel_TOBs2(j).Eta,
             phi1    => sel_TOBs1(i).Phi,
             phi2    => sel_TOBs2(j).Phi,
             energy1 => sel_TOBs1(i).Et,
             energy2 => sel_TOBs2(j).Et,
             mass    => mass_results(i)(j)
            );
 end generate;          
end generate;

genResults: for k in 0 to NumResultBits-1 generate

genTmpAccept1: for i in 0 to InputWidth1-1 generate
 genTmpAccept2: for j in 0 to InputWidth2-1 generate
   mass_accept_tmp(k)(i)(j)<='1'when(mass_results(i)(j)>threshold_mass(k)) else '0';
 end generate;          
end generate;

genOutAccept1: for i in 0 to InputWidth1-1 generate
 genx: for j in 0 to InputWidth2-2 generate
  mass_accept_tmp(k)(i)(InputWidth2+j)<=mass_accept_tmp(k)(i)(2*j) or mass_accept_tmp(k)(i)(2*j+1);
 end generate;
end generate;

genOutAccept2: for i in 0 to InputWidth1-2 generate
  mass_accept_tmp(k)(InputWidth1+i)(2*InputWidth2-2)<=mass_accept_tmp(k)(2*i)(2*InputWidth2-2) or mass_accept_tmp(k)(2*i+1)(2*InputWidth2-2);
end generate;

reg_accept(k)<=mass_accept_tmp(k)(2*InputWidth1-2)(2*InputWidth2-2);

end generate;

Oup_reg: GenericRegister
generic map(reg_width => NumResultBits
           )
   port map(clk       => ClockBus(0),
            enable    => '1',
            reg_in    => reg_accept,
            reg_out   => Results
           );
        
end Behavioral;

