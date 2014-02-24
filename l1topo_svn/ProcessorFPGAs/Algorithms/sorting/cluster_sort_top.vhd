library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.L1TopoDataTypes.all;

entity cluster_sort_top is
 generic (leadingnr        : integer:=  4; --number of leading TOBs 
          inchn1stStage    : integer:= 12; --number of input channels for each module of the 1st sorting stage
          inchn            : integer:=120  --number of input channels for sorting 
         );
    Port (clk40            : in std_logic;
          clusterTOBarr    : in  ClusterArray (inchn-1     downto 0);
          leadingTOBarr    : out ClusterArray (leadingnr-1 downto 0) 
         );
end cluster_sort_top;

architecture Behavioral of cluster_sort_top is
--attribute dont_touch : string;
--attribute S : string;

component cluster_sort is
 generic (leadingnr  : integer;
		  inchn      : integer;
		  do_presort : integer);				  
    port (ClusterTOBarr : in  ClusterArray (inchn-1     downto 0);
          leadingTOBarr : out ClusterArray (leadingnr-1 downto 0)
         );
end component cluster_sort;

component clusterTOB_register 
generic(num_TOBs : integer:=5
       );
   Port(clk    : in  std_logic;
        enable : in  std_logic;
        reg_in : in  ClusterArray(num_TOBs-1 downto 0);
        reg_out: out ClusterArray(num_TOBs-1 downto 0)
       );
end component;

signal out_1stStage     : ClusterArray((inchn/inchn1stStage)*leadingnr-1 downto 0);
signal reg_out_1stStage : ClusterArray((inchn/inchn1stStage)*leadingnr-1 downto 0);
signal out_2ndStage     : ClusterArray(leadingnr-1 downto 0);

--attribute dont_touch of out_1stStage : signal is "true"; 
--attribute S of out_1stStage: signal is "true";

begin

gen1stStage: for i in 0 to inchn/inchn1stStage-1 generate
  sort1stStage:	cluster_sort
   generic map (leadingnr  => leadingnr,
  		        inchn      => inchn1stStage,
  		        do_presort => 1
      			)
      port map (
      			ClusterTOBarr => ClusterTOBarr((i+1)*inchn1stStage-1 downto i*inchn1stStage),
                leadingTOBarr => out_1stStage((i+1)*leadingnr-1 downto i*leadingnr)
               );
      
end generate;

reg_1st_stage:clusterTOB_register 
generic map(num_TOBs=>(inchn/inchn1stStage)*leadingnr
           )
   Port map(clk     => clk40,
            enable  => '1',
            reg_in  => out_1stStage,
            reg_out => reg_out_1stStage
           );


sort2ndStage: cluster_sort
 generic map (leadingnr  => leadingnr,
		      inchn      => (inchn/inchn1stStage)*leadingnr,
		      do_presort => 0
              )
    port map (ClusterTOBarr => reg_out_1stStage,
              leadingTOBarr => out_2ndStage
             );

leadingTOBarr <= out_2ndStage;

             
end Behavioral;
