library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.L1TopoDataTypes.all;

entity ClusterSelect is
generic(InputWidth         : integer:= 120; --number of input channels
        InputWidth1stStage : integer:= 15; --number of input channels per 1st stage module
        OutputWidth        : integer:= 9  --number of selected TOBs
       );
   Port(ClockBus        : in  std_logic_vector(2 downto 0);
        Parameters      : in  ParameterArray;
        ClusterTobArray : in  clusterArray (InputWidth-1 downto 0);
        TobArrayOut     : out TOBArray (OutputWidth-1 downto 0)
        );
end ClusterSelect;

architecture Behavioral of ClusterSelect is

attribute S : string;

component GenericRegister 
generic(reg_width : integer:=5
       );
  port(clk    : in std_logic;
       enable : in std_logic;
       reg_in : in  std_logic_vector(reg_width-1 downto 0);
       reg_out: out std_logic_vector(reg_width-1 downto 0)
      );
end component;

component ParameterRegister 
port(clk     : in  std_logic;
     enable  : in  std_logic;
     reg_in  : in  ParameterArray;
     reg_out : out ParameterArray
    );
end component;

component TobRegister
generic(InputWidth : integer:=40
       );
   Port(clk    : in  std_logic;
        enable : in  std_logic;
        reg_in : in  TOBArray(InputWidth-1 downto 0);
        reg_out: out TOBArray(InputWidth-1 downto 0)
       );
end component;

component TobSelect 
generic(OutputWidth : integer:= 15; --number of selected TOBs
	    InputWidth  : integer:= 15   --number of input channels
	   );                         
   Port(threshold   : in  std_logic_vector(9 downto 0);
        Tobs        : in  TOBArray (InputWidth-1 downto 0);
        selTobs     : out TOBArray (OutputWidth-1 downto 0);
        end_cmp_res : out std_logic_vector(OutputWidth-1 downto 0)
	 );
end component;

component SelectMerge 
generic(InputWidthBlocks   : integer:=8;
        InputWidthPerBlock : integer:=11
       );
    Port (clk40         : in  std_logic;
          clkFast       : in  std_logic;
          threshold_res : in  std_logic_vector(InputWidthPerBlock*(InputWidthBlocks+1)-1 downto 0);
          inp           : in  TOBArray(InputWidthPerBlock*(InputWidthBlocks+1)-1 downto 0);
          oup           : out TOBArray(InputWidthPerBlock-1 downto 0) 
         );
end component;

signal out_1stStage     : TOBArray((OutputWidth*(InputWidth/InputWidth1stStage))-1 downto 0);
signal reg_out_1stStage : TOBArray((OutputWidth*(InputWidth/InputWidth1stStage))-1 downto 0);

attribute S of out_1stStage     : signal is "true";
attribute S of reg_out_1stStage : signal is "true";

signal cmp_res_1stStage     : std_logic_vector((OutputWidth*(InputWidth/InputWidth1stStage))-1 downto 0);
signal cmp_res_1stStage_reg : std_logic_vector((OutputWidth*(InputWidth/InputWidth1stStage))-1 downto 0);

attribute S of cmp_res_1stStage     : signal is "true";
attribute S of cmp_res_1stStage_reg : signal is "true";

signal pre_cmp_dummy : std_logic_vector(InputWidth1stStage-1 downto 0):=(others=>'1');
signal end_cmp_dummy : std_logic_vector(    OutputWidth-1 downto 0);

signal threshold : std_logic_vector(9 downto 0);
signal IsoMask   : std_logic_vector(4 downto 0);
signal eta_range : std_logic_vector(5 downto 0);

signal reg_parameters : ParameterArray;

signal empty_tob : GenericTOB;

signal generic_in : TOBArray(InputWidth-1 downto 0);

--signal reg_threshold : std_logic_vector(9 downto 0);

signal cmp_res_1stStage_reg_dmy : std_logic_vector((OutputWidth*(InputWidth/InputWidth1stStage))-1+OutputWidth downto 0);
signal reg_out_1stStage_dmy : TOBArray((OutputWidth*(InputWidth/InputWidth1stStage))-1+OutputWidth downto 0);

--signal reg_IsoMask : std_logic_vector(4 downto 0);

begin

--threshold_register: GenericRegister 
--generic map(reg_width =>10
--           )
--   port map(clk       =>ClockBus(0),
--            enable    =>'1',
--            reg_in    =>threshold,
--            reg_out   =>reg_threshold
--           );

--Isomask_register: GenericRegister 
--generic map(reg_width =>5
--           )
--   port map(clk       =>ClockBus(0),
--            enable    =>'1',
--            reg_in    =>IsoMask,
--            reg_out   =>reg_IsoMask
--           );

parameter_reg: ParameterRegister 
port map(clk     => ClockBus(0),
         enable  => '1',
         reg_in  => Parameters,
         reg_out => reg_parameters
        );
        
threshold <= reg_parameters(0)(9 downto 0);
IsoMask   <= reg_parameters(1)(4 downto 0);
eta_range <= reg_parameters(2)(5 downto 0);

empty_tob.Et  <= (others => '0');
empty_tob.eta <= (others => '0');
empty_tob.phi <= (others => '0');
      
--sel_iso: process (IsoMask, ClusterTobArray, empty_tob) 
--    begin
--        for i in 0 to InputWidth-1 loop
--            if (IsoMask = "00000" or ((ClusterTobArray(i).isol and IsoMask) /= "00000")) then
--                generic_in(i).Et <= "00" & ClusterTobarray(i).Et;
--                generic_in(i).eta <= ClusterTobArray(i).eta;
--                generic_in(i).phi <= ClusterTobArray(i).phi;
--            else
--                generic_in(i) <= empty_tob;
--            end if;    
--        end loop;
--    end process;

--sel_eta_range: process (eta_range, ClusterTobArray, empty_tob) 
--    begin
--        for i in 0 to InputWidth-1 loop
--            if abs(ClusterTobArray(i).eta)>= eta_range  then
--                generic_in(i).Et <= "00" & ClusterTobarray(i).Et;
--                generic_in(i).eta <= ClusterTobArray(i).eta;
--                generic_in(i).phi <= ClusterTobArray(i).phi;
--            else
--                generic_in(i) <= empty_tob;
--            end if;    
--        end loop;
--    end process;
    
sel_eta_iso: process (IsoMask, eta_range, ClusterTobArray, empty_tob) 
    begin
        for i in 0 to InputWidth-1 loop
            if ((abs(signed(ClusterTobArray(i).eta)) >= signed(eta_range)) and (IsoMask = "00000" or ((ClusterTobArray(i).isol and IsoMask) /= "00000")))  then
                generic_in(i).Et <= "00" & ClusterTobarray(i).Et;
                generic_in(i).eta <= ClusterTobArray(i).eta;
                generic_in(i).phi <= ClusterTobArray(i).phi;
            else
                generic_in(i) <= empty_tob;
            end if;    
        end loop;
    end process;    
    
gen1stStage: for i in 0 to InputWidth/InputWidth1stStage-1 generate
selection_1stStage: TOBselect
 generic map(OutputWidth => OutputWidth,
             InputWidth  => InputWidth1stStage
            )
    port map(threshold   => threshold,
             Tobs        => generic_in((i+1)*InputWidth1stStage-1 downto i*InputWidth1stStage),
             selTobs     => out_1stStage((i+1)*(OutputWidth)-1 downto i*(OutputWidth)),
             end_cmp_res => cmp_res_1stStage((i+1)*(OutputWidth)-1 downto i*(OutputWidth))
            );
end generate;
 
cmp_res_reg: GenericRegister 
generic map(reg_width=>(OutputWidth*(InputWidth/InputWidth1stStage))
           )
   port map(clk     => ClockBus(0),
            enable  => '1',
            reg_in  => cmp_res_1stStage,
            reg_out => cmp_res_1stStage_reg
           );


reg_1stStage: TobRegister 
generic map(InputWidth => (OutputWidth*(InputWidth/InputWidth1stStage))
           )
   Port map(clk     => ClockBus(0),
            enable  => '1',
            reg_in  => out_1stStage,
            reg_out => reg_out_1stStage
           );

cmp_res_1stStage_reg_dmy<="00000000000" & cmp_res_1stStage_reg(((OutputWidth)*(InputWidth/InputWidth1stStage))-1 downto 0);

reg_out_1stStage_dmy<= empty_tob & empty_tob & empty_tob &  empty_tob & empty_tob & empty_tob & empty_tob & empty_tob & empty_tob & empty_tob & empty_tob & reg_out_1stStage(((OutputWidth)*(InputWidth/InputWidth1stStage))-1 downto 0);

merge_ins: SelectMerge 
generic map(InputWidthBlocks   => InputWidth/InputWidth1stStage,
            InputWidthPerBlock => OutputWidth
           )
  Port map(clk40               => ClockBus(0),
           clkFast             => ClockBus(2),
           threshold_res       => cmp_res_1stStage_reg_dmy,
           inp                 => reg_out_1stStage_dmy,
           oup                 => TobArrayOut
          );
                       
end Behavioral;
