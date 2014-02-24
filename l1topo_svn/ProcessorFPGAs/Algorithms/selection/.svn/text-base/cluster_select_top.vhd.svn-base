library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity cluster_select_top is
 generic(inchn1stStage : integer:= 12; --number of input channels per 1st stage module
         inchn         : integer:= 48; --number of input channels
         selectnum     : integer:= 10  --number of selected TOBs
        );
    Port(clk40         : in  std_logic;
         threshold     : in  std_logic_vector(   9 downto 0);
         clusterTOBarr : in  clusterArray (inchn-1     downto 0);
         selTOBarr     : out clusterArray (selectnum-1 downto 0)
         );
end cluster_select_top;

architecture Behavioral of cluster_select_top is

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

component clusterTOB_register
generic(num_TOBs : integer:=40
       );
   Port(clk    : in  std_logic;
        enable : in  std_logic;
        reg_in : in  clusterArray(num_TOBs-1 downto 0);
        reg_out: out clusterArray(num_TOBs-1 downto 0)
       );
end component;

component cluster_select is
generic(selectnum : integer:=  2; --number of selected TOBs
	    inchn     : integer:= 10; --number of input channels
	    do_presel : integer:=  1  --preselection
	   );                         
   Port(threshold     : in  std_logic_vector(      9 downto 0);
        pre_cmp_res   : in  std_logic_vector(inchn-1 downto 0);
        clusterTOBarr : in  clusterArray (inchn-1     downto 0);
        selTOBarr     : out clusterArray (selectnum-1 downto 0);
        end_cmp_res   : out std_logic_vector(selectnum-1 downto 0)
	 );
end component;

signal out_1stStage     : clusterArray((selectnum*(inchn/inchn1stStage))-1 downto 0);
signal reg_out_1stStage : clusterArray((selectnum*(inchn/inchn1stStage))-1 downto 0);

attribute S of out_1stStage     : signal is "true";
attribute S of reg_out_1stStage : signal is "true";

signal out_2ndStage         : clusterArray(selectnum-1 downto 0);

signal cmp_res_1stStage     : std_logic_vector((selectnum*(inchn/inchn1stStage))-1 downto 0);
signal cmp_res_1stStage_reg : std_logic_vector((selectnum*(inchn/inchn1stStage))-1 downto 0);

attribute S of cmp_res_1stStage     : signal is "true";
attribute S of cmp_res_1stStage_reg : signal is "true";

signal pre_cmp_dummy : std_logic_vector(inchn1stStage-1 downto 0):=(others=>'1');
signal end_cmp_dummy : std_logic_vector(    selectnum-1 downto 0);

begin

gen1stStage: for i in 0 to inchn/inchn1stStage-1 generate
selection_1stStage: cluster_select
 generic map(selectnum   => selectnum,
             inchn       => inchn1stStage,
             do_presel   => 1
            )
    port map(threshold     => threshold,
             pre_cmp_res   => pre_cmp_dummy,
             clusterTOBarr => clusterTOBarr((i+1)*inchn1stStage-1      downto i*inchn1stStage),
             selTOBarr     => out_1stStage((i+1)*(selectnum)-1     downto i*(selectnum)),
             end_cmp_res   => cmp_res_1stStage((i+1)*(selectnum)-1 downto i*(selectnum))
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


reg_1stStage: clusterTOB_register 
generic map(num_TOBs => (selectnum*(inchn/inchn1stStage))
           )
   Port map(clk     => clk40,
            enable  => '1',
            reg_in  => out_1stStage,
            reg_out => reg_out_1stStage
           );

         
selection_2ndStage: cluster_select
generic map(selectnum   => selectnum,
            inchn       => selectnum*(inchn/inchn1stStage),
            do_presel   => 0
           )
   port map(threshold     => threshold,
            pre_cmp_res   => cmp_res_1stStage_reg,
            clusterTOBarr => reg_out_1stStage,
            selTOBarr     => out_2ndStage,
            end_cmp_res   => end_cmp_dummy
           );

selTOBarr <= out_2ndStage;

end Behavioral;
