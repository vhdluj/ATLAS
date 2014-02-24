library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.ALL;

entity ContratransverseMassInclusive1 is
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
end ContratransverseMassInclusive1;

architecture Behavioral of ContratransverseMassInclusive1 is

component ContratransverseMassCalc
    Port (phi1    : in  std_logic_vector( 5 downto 0);
          phi2    : in  std_logic_vector( 5 downto 0);
          energy1 : in  std_logic_vector( 9 downto 0);
          energy2 : in  std_logic_vector(15 downto 0);
          mass    : out std_logic_vector(34 downto 0)
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
        reg_in    : in  std_logic_vector(reg_width-1 downto 0);
        reg_out   : out std_logic_vector(reg_width-1 downto 0)
       );
end component;

type acceptlist is array (integer range <>) of std_logic_vector(2*InputWidth-2 downto 0);

signal mass_accept_tmp : acceptlist(NumResultBits-1 downto 0);

type Resultsarr is array (integer range <>) of std_logic_vector(34 downto 0);

type Mthreshold is array(integer range <>) of std_logic_vector(34 downto 0);

signal mass_results : Resultsarr(InputWidth-1 downto 0);

signal sel_TOBs : TOBArray(InputWidth-1 downto 0);

signal dummyTOB : GenericTOB;

signal reg_TOBs       : TOBArray(InputWidth-1 downto 0);
signal reg_parameters : ParameterArray;
signal reg_accept     : std_logic_vector(NumResultBits-1 downto 0);

signal threshold      : std_logic_vector(9 downto 0);
signal threshold_mass : Mthreshold(NumResultBits-1 downto 0);

signal reg_MET    : std_logic_vector(15 downto 0);
signal reg_METPhi : std_logic_vector(5 downto 0);

begin

MET_reg: GenericRegister 
generic map(reg_width => 16
           )
   port map(clk       => ClockBus(0),
            enable    => '1',
            reg_in    => MET,
            reg_out   => reg_MET
           );
           
METPhi_reg: GenericRegister 
generic map(reg_width => 6
           )
   port map(clk       => ClockBus(0),
            enable    => '1',
            reg_in    => METPhi,
            reg_out   => reg_METPhi
           );
           
Inp_reg: TobRegister 
generic map(InputWidth => InputWidth
           )
   Port map(clk        => ClockBus(0),
            enable     => '1',
            reg_in     => Tobs,
            reg_out    => reg_TOBs
           ); 

parameter_reg: ParameterRegister
   port map(clk     => ClockBus(0),
            enable  => '1',
            reg_in  => Parameters,
            reg_out => reg_parameters
           );
 
dummyTOB.Et <=(others=>'0');
dummyTOB.eta<=(others=>'0');
dummyTOB.phi<=(others=>'0');

threshold <= reg_parameters(0)(9 downto 0);

genThrArr: for i in 0 to NumResultBits-1 generate
 threshold_mass(i) <= reg_parameters(i+1) & '0' & '0'&'0';
end generate;

genInp: for i in 0 to InputWidth-1 generate
sel_TOBs(i) <= reg_tobs(i) when reg_tobs(i).Et>threshold else dummyTOB;
end generate;

Overflow <= '1' when reg_tobs(InputWidth-1).Et>threshold else '0';

gen1: for i in 0 to InputWidth-1 generate
   Contratransverse_mass_inst: ContratransverseMassCalc
    port map(phi1    => sel_TOBs(i).Phi,
             phi2    => reg_METPhi,
             energy1 => sel_TOBs(i).Et,
             energy2 => reg_MET,
             mass    => mass_results(i)
            );        
end generate;

genResults: for k in 0 to NumResultBits-1 generate
 
genTmpAccept: for i in 0 to InputWidth-1 generate
 mass_accept_tmp(k)(i)<='1'when(mass_results(i)>threshold_mass(k)) else '0';         
end generate;

genOutAccept2: for i in 0 to InputWidth-2 generate
 mass_accept_tmp(k)(InputWidth+i)<=mass_accept_tmp(k)(2*i) or mass_accept_tmp(k)(2*i+1);
end generate;

reg_accept(k)<=mass_accept_tmp(k)(2*InputWidth-2);

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