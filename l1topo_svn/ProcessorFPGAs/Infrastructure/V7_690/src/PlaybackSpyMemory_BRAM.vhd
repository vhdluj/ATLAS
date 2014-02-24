----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.08.2013 15:56:15
-- Design Name: 
-- Module Name: PBS_BRAM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library UNISIM;
use UNISIM.VComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.L1TopoDataTypes.all;
use work.L1TopoFunctions.all;

                                     
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity PlaybackSpyMemory_BRAM is
    Port (      BC_CLK_IN               : IN STD_LOGIC;                  
                --PBS ports
                PB_WE_IN               : in std_logic;
                
                PBS_ADDRESS_IN          : in std_logic_vector(7 downto 0);                                                               
                PB_DATA_IN              : in std_logic_vector(127 downto 0);
                SPY_DATA_OUT            : out std_logic_vector(127 downto 0);
                --real time ports
                COUNT_ADDRESS_RESET_IN  : in std_logic;
                DATA_WE_IN              : in std_logic;
                DATA_IN                 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
                DATA_OUT                : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
);
end PlaybackSpyMemory_BRAM;

architecture Behavioral of PlaybackSpyMemory_BRAM is

component PlaybackSpy_BRAM IS
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
  );
END component;

signal user_clk             : std_logic;
signal data_write_enable    : std_logic_vector(0 downto 0);
signal address_counter      : std_logic_vector( 7 downto 0);
signal sipo_data            : std_logic_vector(127 downto 0);
signal bram_data            : std_logic_vector(127 downto 0);

--playback signals
signal pb_data      : std_logic_vector(127 downto 0);
signal pbs_address  : std_logic_vector(7 downto 0);
-- spy signals
signal spy_data     : std_logic_vector(127 downto 0);
signal pbs_write_enable : std_logic_vector(0 downto 0);

--
signal count        : integer range 0 to 255;
signal count_reset  : std_logic;

begin

user_clk                <=  BC_CLK_IN;
--pbs signals
pbs_address             <=  PBS_ADDRESS_IN;
pbs_write_enable(0)     <=  PB_WE_IN;
pb_data                 <=  PB_DATA_IN;
SPY_DATA_OUT            <=  spy_data; 

--real-time data-path
count_reset             <=  COUNT_ADDRESS_RESET_IN;
address_counter         <=  std_logic_vector(to_unsigned(count,8)); 
data_write_enable(0)    <=  DATA_WE_IN;
sipo_data               <=  DATA_IN;   
DATA_OUT                <=  bram_data;




PlaybackSpy_BRAM_i: PlaybackSpy_BRAM 
  PORT map(
    --real-time data-path
    clka   =>   user_clk,
    wea    =>   data_write_enable,
    addra  =>   address_counter,
    dina   =>   sipo_data,
    douta  =>   bram_data,
    --non-real-time data-path
    clkb   =>   user_clk,
    web    =>   pbs_write_enable,
    addrb  =>   pbs_address,
    dinb   =>   pb_data,
    doutb  =>   spy_data
 );



count_proc: 
process (user_clk)

begin 
        if rising_edge(user_clk) then
            if count_reset='1' then
                count<=0;
            else
                if count=255 then
                    count<=0;
                else
                    count<=count+1;
                end if;
            end if;
            
        end if;

end process;


end Behavioral;
