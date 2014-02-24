library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity jetSelect is
 generic(inchn1stStage : integer:= 12; --number of input channels per 1st stage module
         inchn         : integer:= 48; --number of input channels
         selectnum     : integer:= 10  --number of selected TOBs
        );
    Port(clk40         : in  std_logic;
         threshold     : in  std_logic_vector(   9 downto 0);
         JetTOBarr     : in  JetArray (inchn-1     downto 0);
         selTOBarr     : out TOBArray (selectnum-1 downto 0)
         );
end jetSelect;

architecture Behavioral of jetSelect is

attribute S : string;

component generic_register 
generic(reg_width : integer:=5
       );
  port(clk    : in std_logic;
       enable : in std_logic;
       reg_in : in  std_logic_vector(reg_width-1 downto 0);
       reg_out: out std_logic_vector(reg_width-1 downto 0)
      );
end component;

component TOB_register
generic(num_TOBs : integer:=5
       );
   Port(clk    : in  std_logic;
        enable : in  std_logic;
        reg_in : in  TOBArray(num_TOBs-1 downto 0);
        reg_out: out TOBArray(num_TOBs-1 downto 0)
       );
end component;

component TOBselect is
generic(selectnum : integer:=  3; --number of selected TOBs
	    inchn     : integer:= 10; --number of input channels
	    do_presel : integer:=  1  --preselection
	   );                         
   Port(threshold   : in  std_logic_vector(      9 downto 0);
        pre_cmp_res : in  std_logic_vector(inchn-1 downto 0); --threshold flags of the previous stage
        TOBarr   : in  TOBArray (inchn-1     downto 0); --input TOBs
        selTOBarr   : out TOBArray (selectnum-1 downto 0); --selected TOBs
        end_cmp_res : out std_logic_vector(selectnum-1 downto 0) --threshold flags for the next stage
	 );
end component;

signal generic_in       : TOBArray(inchn-1 downto 0);
signal out_1stStage     : JetArray((selectnum*(inchn/inchn1stStage))-1 downto 0);
signal reg_out_1stStage : JetArray((selectnum*(inchn/inchn1stStage))-1 downto 0);

attribute S of out_1stStage     : signal is "true";
attribute S of reg_out_1stStage : signal is "true";

signal out_2ndStage         : JetArray(selectnum-1 downto 0);

signal cmp_res_1stStage     : std_logic_vector((selectnum*(inchn/inchn1stStage))-1 downto 0);
signal cmp_res_1stStage_reg : std_logic_vector((selectnum*(inchn/inchn1stStage))-1 downto 0);

attribute S of cmp_res_1stStage     : signal is "true";
attribute S of cmp_res_1stStage_reg : signal is "true";

signal pre_cmp_dummy : std_logic_vector(inchn1stStage-1 downto 0):=(others=>'1');
signal end_cmp_dummy : std_logic_vector(    selectnum-1 downto 0);

begin

sel_jet_size: for i in 0 to inchn-1 generate
    generic_in(i).eta <= JetTOBarr(i).eta & '0';
    generic_in(i).phi <= JetTOBarr(i).phi & '0';   
    size1: if jet_size = 1 generate
        generic_in(i).Et <= '0' & JetTOBarr(i).Et1;
    end generate;
    size2: if jet_size /= 1 generate
        generic_in(i).Et <= JetTOBarr(i).Et2;
    end generate;
end generate;

gen1stStage: for i in 0 to inchn/inchn1stStage-1 generate
selection_1stStage: TOBselect
 generic map(selectnum   => selectnum,
             inchn       => inchn1stStage,
             do_presel   => 1
            )
    port map(threshold   => threshold,
             pre_cmp_res => pre_cmp_dummy,
             TOBarr   => generic_in((i+1)*inchn1stStage-1      downto i*inchn1stStage),
             selTOBarr   => out_1stStage((i+1)*(selectnum)-1     downto i*(selectnum)),
             end_cmp_res => cmp_res_1stStage((i+1)*(selectnum)-1 downto i*(selectnum))
            );
end generate;

cmp_res_reg: generic_register 
generic map(reg_width=>(selectnum*(inchn/inchn1stStage))
           )
   port map(clk     => clk40,
            enable  => '1',
            reg_in  => cmp_res_1stStage,
            reg_out => cmp_res_1stStage_reg
           );


reg_1stStage: TOB_register 
generic map(num_TOBs => (selectnum*(inchn/inchn1stStage))
           )
   Port map(clk     => clk40,
            enable  => '1',
            reg_in  => out_1stStage,
            reg_out => reg_out_1stStage
           );

         
selection_2ndStage: TOBselect
generic map(selectnum   => selectnum,
            inchn       => selectnum*(inchn/inchn1stStage),
            do_presel   => 0
           )
   port map(threshold   => threshold,
            pre_cmp_res => cmp_res_1stStage_reg,
            TOBarr   => reg_out_1stStage,
            selTOBarr   => out_2ndStage,
            end_cmp_res => end_cmp_dummy
           );

selTOBarr <= out_2ndStage;

end Behavioral;