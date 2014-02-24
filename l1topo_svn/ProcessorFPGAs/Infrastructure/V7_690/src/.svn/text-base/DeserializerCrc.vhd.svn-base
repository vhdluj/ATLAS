----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.07.2013 12:15:31
-- Design Name: 
-- Module Name: EM_cmx_SIPO - Behavioral
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

entity DeserializerCrc is
    Port (  DataIn          : in    std_logic_vector(31 downto 0);
            DataOut         : out   std_logic_vector(127 downto 0);
            
            ChariskIn      : in std_logic_vector(3 downto 0);
            ChariskOut     : out std_logic_vector(15 downto 0);
            
            ShiftRegDelayIn       : in    std_logic_vector(4 downto 0);
			
			CrcErrorOut		: out std_logic;
			
			CrcEnable    : in    std_logic;
                                  
            ClkIn40      : in    std_logic;		
            ClkIn160     : in    STD_LOGIC;
			ClkIn320	 : in    STD_LOGIC
			
          );--USER_CLK
end DeserializerCrc;

architecture Behavioral of DeserializerCrc is

--attribute DONT_TOUCH : string;
--attribute DONT_TOUCH of Behavioral : architecture is "TRUE";

component CRC_CHECK_32b is
   port (
    DATA_in          : in  std_logic_vector(31 downto 0);
    CRC_ERR          : out  std_logic;
    clk              : in std_logic;
    rx_subtick_counter  : in unsigned(2 downto 0));
end component;

signal reset            : std_logic:='0';

signal parallel_data    : std_logic_vector(127 downto 0);
signal parallel_data_sr    : std_logic_vector(127 downto 0);
signal charisk          : std_logic_vector(15 downto 0);
signal data_in          : std_logic_vector(31 downto 0);
signal charisk_in       : std_logic_vector(3 downto 0);
signal shif_reg_delay   : std_logic_vector(4 downto 0);           
signal clk_160         : std_logic;
signal clk_320         : std_logic;
signal clk_40         : std_logic;
signal lhc_clk          : std_logic;

signal delayed_data     	: std_logic_vector(31 downto 0);
signal delayed_data_crc     : std_logic_vector(31 downto 0);
signal delayed_charisk  : std_logic_vector(3 downto 0);
signal crc_data			: std_logic_vector(15 downto 0);
signal crc_data_sr			: std_logic_vector(15 downto 0);

signal reg_clk			: std_logic:='0';
signal error			: std_logic:='0';

signal shift_register	: std_logic_vector(3 downto 0):=(others=>'0');
signal mask				: std_logic_vector(3 downto 0):="0111";

signal shift_register2	: std_logic_vector(1 downto 0):=(others=>'0');
signal mask2			: std_logic_vector(1 downto 0):="01";
signal mask3			: std_logic_vector(1 downto 0):="10";

signal counter			: integer range 0 to 15 :=0;
signal subtick			: integer range 0 to 7	:=0;

signal toggle			: std_logic:='0';

signal enable           : std_logic;

begin
data_in             <=  DataIn;
charisk_in          <= ChariskIn;

enable              <= CrcEnable;

clk_40             <= ClkIn40;
clk_160            <= ClkIn160;
clk_320            <= ClkIn320;

shif_reg_delay      <= ShiftRegDelayIn;
 
SHIFT_REG_GEN:
for I in 0 to 31 generate
   
SRLC32E_inst: SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => delayed_data(I),        -- SRL data output
      Q31 => open,    -- SRL cascade output pin
      A => shif_reg_delay ,        -- 5-bit shift depth select input
      CE => '1',      -- Clock enable input
      CLK => clk_160,    -- Clock input
      D => data_in(I)         -- SRL data input
);

end generate SHIFT_REG_GEN;

--SHIFT_REG_crc_GEN:
--for I in 0 to 31 generate
   
--SRLC32E_inst_crc: SRLC32E
--   generic map (
--      INIT => X"00000000")
--   port map (
--      Q => delayed_data_crc(I),        -- SRL data output
--      Q31 => open,    -- SRL cascade output pin
--      A => shif_reg_delay ,        -- 5-bit shift depth select input
--      CE => '1',      -- Clock enable input
--      CLK => clk_160,    -- Clock input
--      D => data_in(I)         -- SRL data input
--);

--end generate SHIFT_REG_crc_GEN;



SHIFT_REG_GEN2:
for I in 0 to 3 generate
   
SRLC32E_inst: SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q => delayed_charisk(I),        -- SRL data output
      Q31 => open,    -- SRL cascade output pin
      A => shif_reg_delay ,        -- 5-bit shift depth select input
      CE => '1',      -- Clock enable input
      CLK => clk_160,    -- Clock input
      D => charisk_in(I)         -- SRL data input
);

end generate SHIFT_REG_GEN2;

--CrcCheck: CRC_CHECK_DESERIALIZER 
--   port map(
--    DATA_in        		=> crc_data,
--    CRC_ERR        		=> error,
--    clk            		=> clk_320,
--    rx_subtick_counter  => to_unsigned(subtick,3)
--);





CrcCheck: CRC_CHECK_32b 
   port map(
    DATA_in               	=> delayed_data,
    CRC_ERR               	=> error,
    clk                   	=> clk_160,
    rx_subtick_counter    	=> to_unsigned(subtick,3)	
);


--CrcErrorOut<=error when enable='1' else '0';


OutProc_crc: process(clk_160)

begin
    if rising_edge(clk_160) then
        if enable='1' then
            CrcErrorOut<=error;
        else
            CrcErrorOut<='0';       
        end if;
    
    end if;

end process;


ClkToDataProc: process(clk_40)
begin
	if rising_edge(clk_40) then
		reg_clk<= not reg_clk;	
	end if;
	
end process;



ShiftProcess: process(clk_160)

begin
	if rising_edge(clk_160) then
		shift_register(0)<= reg_clk;
		shift_register(1)<= shift_register(0);
		shift_register(2)<= shift_register(1);
		shift_register(3)<= shift_register(2);
	end if;

end process;

CounterProc: process(clk_160)
begin
		if rising_edge(clk_160) then
			if shift_register=mask then
				counter<=0;
			else
				counter<=counter+1;
			end if;
		
		end if;

end process;

DeserProc: process(clk_160)

begin
	if rising_edge(clk_160) then
		case counter is
			when 0 =>	parallel_data(127 downto 96)<= delayed_data;
						charisk(15 downto 12)		<=delayed_charisk;
						subtick<=2;
						
			when 1 =>	parallel_data(95 downto 64)<= delayed_data;
						charisk(11 downto 8)		<=delayed_charisk;
						subtick<=1;	
						
			when 2 =>	parallel_data(63 downto 32)	<= delayed_data;
						charisk(7 downto 4)		<=delayed_charisk;
						subtick<=0;
						
			when 3 =>	parallel_data(31 downto 0)	<= delayed_data;
						charisk(3 downto 0)		<=delayed_charisk;
						subtick<=3;
						
			when 4 =>	parallel_data(127 downto 96)<= delayed_data;
						charisk(15 downto 12)		<=delayed_charisk;
						subtick<=2;
						
			when 5 =>	parallel_data(95 downto 64)<= delayed_data;
						charisk(11 downto 8)		<=delayed_charisk;
						subtick<=1;
						
			when 6 =>	parallel_data(63 downto 32)	<= delayed_data;
						charisk(7 downto 4)		<=delayed_charisk;
						subtick<=0;
						
						
			when 7 =>	parallel_data(31 downto 0)	<= delayed_data;
						charisk(3 downto 0)		<=delayed_charisk;
						subtick<=3;
		
												
			
			when others =>	parallel_data			<= (others=>'0');
							charisk					<= (others=>'0');
							subtick<=5;
		end case;
	end if;
end process;





DelayProc: process(clk_160)

begin
	if rising_edge(clk_160) then
	   if counter=3 or counter=7 then
		parallel_data_sr(127 downto 32) 	<= parallel_data(127 downto 32);-- when counter=3 or counter=7;
		parallel_data_sr(31  downto  0)  <= delayed_data;-- when counter=3 or counter=7;
		
		crc_data_sr(15 downto 4)	 <= charisk(15 downto 4);-- when counter=3 or counter=7 ;
		crc_data_sr(3 downto 0)       <= delayed_charisk;-- when counter=3 or counter=7;
		end if;
	end if;

end process;

OutputProc: process(clk_160)

begin
	if rising_edge(clk_160) then	  
		DataOut 	<= parallel_data_sr;-- when counter=3 or counter=7;
			
		ChariskOut	<= crc_data_sr;-- when counter=3 or counter=7 ;
		
	end if;

end process;


end Behavioral;
