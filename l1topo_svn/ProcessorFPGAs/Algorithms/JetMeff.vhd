library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;

entity JetMeff is
generic(InputWidth    : integer:=64;
        NumResultBits : integer:=1;
        jet_size      : integer:=2
       );
  Port (ClockBus      : in  std_logic_vector(2 downto 0);
        Parameters    : in  ParameterArray;
        JetTobArray   : in  JetArray(InputWidth-1 downto 0);
        MET           : in  std_logic_vector(15 downto 0);
        Results       : out std_logic_vector(NumResultBits-1 downto 0);
        Overflow      : out std_logic
      );
end JetMeff;

architecture Behavioral of JetMeff is

component JetTobRegister 
generic(InputWidth : integer:=64
       );
   Port(clk        : in  std_logic;
        enable     : in  std_logic;
        reg_in     : in  JetArray(InputWidth-1 downto 0);
        reg_out    : out JetArray(InputWidth-1 downto 0)
       );
end component;

component ParameterRegister 
port(clk     : in  std_logic;
     enable  : in  std_logic;
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

type sumarr         is array (integer range <>) of integer range 0 to (2**10-1)*InputWidth;
type thresholdArray is array (integer range <>) of std_logic_vector(ld(((2**10-1)*InputWidth)+65535)-1 downto 0);

signal tmp_sum : sumarr (2*InputWidth-2 downto 0);

signal sum : std_logic_vector(ld(((2**10-1)*InputWidth)+65535)-1 downto 0); 

signal generic_in : TOBArray(InputWidth-1 downto 0);
signal sel_jets   : TOBArray(InputWidth-1 downto 0);

signal dummyTOB : GenericTOB;

signal threshold_sum : thresholdArray(NumResultBits-1 downto 0);
signal threshold     : std_logic_vector(9 downto 0);

signal reg_JetTobArray1 : JetArray(InputWidth-1 downto 0);
signal reg_JetTobArray2 : JetArray(InputWidth-1 downto 0);

signal reg_MET : std_logic_vector(15 downto 0);

signal reg_parameters : ParameterArray;

signal accept : std_logic_vector(NumResultBits-1 downto 0);

begin
Inp_reg1: JetTobRegister 
generic map(InputWidth => InputWidth
           )
   Port map(clk        => ClockBus(0),
            enable     => '1',
            reg_in     => JetTobArray,
            reg_out    => reg_JetTobArray1
           );
		   
Inp_reg2: JetTobRegister 
generic map(InputWidth => InputWidth
           )
   Port map(clk        => ClockBus(0),
            enable     => '1',
            reg_in     => reg_JetTobArray1,
            reg_out    => reg_JetTobArray2
           );

MET_reg: GenericRegister 
generic map(reg_width => 16
           )
   port map(clk       => ClockBus(0),
            enable    => '1',
            reg_in    => MET,
            reg_out   => reg_MET
           );
           
parameter_reg: ParameterRegister 
port map(clk     => ClockBus(0),
         enable  => '1',
         reg_in  => Parameters,
         reg_out => reg_parameters
        );
                
dummyTOB.Et  <= (others=>'0');
dummyTOB.eta <= (others=>'0');
dummyTOB.phi <= (others=>'0');

threshold <= reg_parameters(0)(9 downto 0);

genThrArr: for i in 1 to NumResultBits generate
threshold_sum(i-1) <= reg_parameters(i)(16 downto 0);
end generate;

sel_jet_size: for i in 0 to InputWidth-1 generate
    generic_in(i).eta <= reg_JetTobArray2(i).eta & '0';
    generic_in(i).phi <= reg_JetTobArray2(i).phi & '0';   
    size1: if jet_size = 1 generate
        generic_in(i).Et <= '0' & reg_JetTobArray2(i).Et1;
    end generate;
    size2: if jet_size /= 1 generate
        generic_in(i).Et <= reg_JetTobArray2(i).Et2;
    end generate;
end generate;
 
genInp: for i in 0 to InputWidth-1 generate
 sel_jets(i) <= generic_in(i) when generic_in(i).Et>threshold else dummyTOB;
end generate;

genTmpSum: for i in 0 to InputWidth-1 generate
 tmp_sum(i) <= to_integer(unsigned(generic_in(i).Et));
end generate;

genSumTree: for i in 0 to InputWidth-2 generate
 tmp_sum(InputWidth+i) <= tmp_sum(2*i) + tmp_sum(2*i+1);
end generate;

sum <= std_logic_vector(to_unsigned(tmp_sum(2*InputWidth-2),sum'length)+unsigned(reg_MET));

genAccept: for i in 0 to NumResultBits-1 generate
accept(i) <='1' when sum > threshold_sum(i) else '0';
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