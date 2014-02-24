library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.L1TopoDataTypes.all;

entity TripleDotProduct is
   Port (ClockBus   : in  std_logic_vector(2 downto 0);
         Tob1       : in  GenericTOB;  
         Tob2       : in  GenericTOB;
         Tob3       : in  GenericTOB;
         Parameters : in  ParameterArray;
         Results    : out std_logic_vector (0 downto 0);
         Overflow   : out std_logic
        );
end TripleDotProduct;

architecture Behavioral of TripleDotProduct is

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
        reg_in    : in  std_logic_vector(reg_width-1 downto 0);
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

component Tanh 
Port (inp : in  STD_LOGIC_VECTOR (5 downto 0);  
      oup : out STD_LOGIC_VECTOR (7 downto 0)
     );
end component;

component Sech 
Port (inp : in  STD_LOGIC_VECTOR (5 downto 0);  
      oup : out STD_LOGIC_VECTOR (7 downto 0)
     );
end component;

component Sin 
Port (inp : in  STD_LOGIC_VECTOR (5 downto 0);  
      oup : out STD_LOGIC_VECTOR (8 downto 0)
     );
end component;

signal reg_parameters : ParameterArray;

signal product_threshold  : std_logic_vector(34 downto 0);
signal product_threshold2 : std_logic_vector(34 downto 0);

signal delta_ba : std_logic_vector(5 downto 0);
signal delta_ac : std_logic_vector(5 downto 0);
signal delta_bc : std_logic_vector(5 downto 0);

signal tanh_etac : std_logic_vector(7 downto 0);
signal tanh_etaa : std_logic_vector(7 downto 0);
signal tanh_etab : std_logic_vector(7 downto 0);

signal sech_etaa : std_logic_vector(7 downto 0);
signal sech_etab : std_logic_vector(7 downto 0);
signal sech_etac : std_logic_vector(7 downto 0);

signal sin_phi_ba : std_logic_vector(8 downto 0);
signal sin_phi_ac : std_logic_vector(8 downto 0);
signal sin_phi_bc : std_logic_vector(8 downto 0);

signal result      : std_logic_vector(34 downto 0);
--signal reg_Results : std_logic_vector(NumResultBits-1 downto 0);
signal reg_Results : std_logic_vector(0 downto 0);

signal Tob_arr     : TOBArray(2 downto 0);
signal reg_Tob_arr : TOBArray(2 downto 0);

begin

Tob_arr <= Tob1 & Tob2 & Tob3;

Tob_reg: TobRegister
generic map(InputWidth => 3        
           )
   Port map(clk        => ClockBus(0),
            enable     => '1',
            reg_in     => Tob_arr,
            reg_out    => reg_Tob_arr
           );
           
Parameter_reg: ParameterRegister 
port map(clk     => ClockBus(0),
         enable  => '1',
         reg_in  => Parameters,
         reg_out => reg_parameters
        );

product_threshold <= reg_parameters(0)&'0'&'0'&'0';
    
delta_ba <= std_logic_vector(abs(signed(reg_Tob_arr(1).phi)-signed(reg_Tob_arr(0).phi)));
delta_ac <= std_logic_vector(abs(signed(reg_Tob_arr(0).phi)-signed(reg_Tob_arr(2).phi)));
delta_bc <= std_logic_vector(abs(signed(reg_Tob_arr(1).phi)-signed(reg_Tob_arr(2).phi)));

Tanh_c: Tanh 
Port map(inp => reg_Tob_arr(2).eta,    
         oup => tanh_etac   
        );

Tanh_b: Tanh 
Port map(inp => reg_Tob_arr(1).eta,   
         oup => tanh_etab    
        );
             
Tanh_a: Tanh 
Port map(inp => reg_Tob_arr(0).eta,   
         oup => tanh_etaa    
        );

Sech_a: Sech 
Port map(inp => reg_Tob_arr(0).eta,    
         oup => sech_etaa   
        );

Sech_b: Sech 
Port map(inp => reg_Tob_arr(1).eta,    
         oup => sech_etab    
        );

Sech_c: Sech 
Port map(inp => reg_Tob_arr(2).eta,    
         oup => sech_etac   
        );

Sin_ba: Sin 
Port map(inp => delta_ba,  
         oup => sin_phi_ba
        );

Sin_ac: Sin 
Port map(inp => delta_ac,
         oup => sin_phi_ac
        );

Sin_bc: Sin 
Port map(inp => delta_bc,   
         oup => sin_phi_bc    
        );

result <= std_logic_vector(abs(signed(tanh_etac)*signed(sin_phi_ba)*signed('0' & sech_etaa)*signed('0' & sech_etab)
                          +signed('0' & sech_etac)*(signed(tanh_etab)*signed(sin_phi_ac)*signed('0' & sech_etaa)
                          -signed(tanh_etaa)*signed(sin_phi_bc)*signed('0' & sech_etab))));

reg_Results <= "1" when result > product_threshold else "0";

Oup_reg: GenericRegister 
generic map(reg_width => 1
           )
   port map(clk       => ClockBus(0),
            enable    => '1',
            reg_in    => reg_Results,
            reg_out   => Results
           );
          
end Behavioral;