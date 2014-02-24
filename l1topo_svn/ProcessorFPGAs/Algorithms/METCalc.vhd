library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.L1TopoFunctions.all;

entity METCalc is
    Port(ClockBus : in  std_logic_vector(2 downto 0);
         SignedEx : in  std_logic_vector(14 downto 0);
         SignedEy : in  std_logic_vector(14 downto 0);
         MET      : out std_logic_vector(15 downto 0)
        );
end METCalc;

architecture Behavioral of METCalc is

--component squareroot 
--  port (s_axis_cartesian_tvalid : in  std_logic;
--        s_axis_cartesian_tdata  : in  std_logic_vector(31 downto 0);
--        m_axis_dout_tvalid      : out std_logic;
--        m_axis_dout_tdata       : out std_logic_vector(15 downto 0)
--       );
--end component;

signal MET_sqr : std_logic_vector(29 downto 0);

begin

process(ClockBus(0))
begin
 if rising_edge(ClockBus(0)) then
  MET_sqr <= std_logic_vector((signed(signedEx)*signed(signedEx))+(signed(signedEy)*signed(signedEy)));
 end if;
end process;

--squareroot_inst: squareroot 
--  port map(s_axis_cartesian_tvalid =>'1',
--           s_axis_cartesian_tdata  =>"00" & MET_sqr,
--           m_axis_dout_tdata       =>MET
--          );

MET <= std_logic_vector(sqrt(unsigned("00" & MET_sqr)));

end Behavioral;