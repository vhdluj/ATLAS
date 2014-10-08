----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Wojtek Fedorko, Andreas D. Reiﬂ (some changes to debug and understand easier, areiss@students.uni-mainz.de)
-- 
-- Create Date:    20 June 2013
-- Design Name: 
-- Module Name:    CRC_CHECK - Behavioral 
-- checks if the CRC of the transmission is 0 
-- the key is implicitly stored in the lut - which must be the same as the TX lut
--
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CRC_CHECK_32b is
   port (
    DATA_in          : in  std_logic_vector(31 downto 0);
    CRC_ERR          : out  std_logic;
	CRC_Just_Done    : out  std_logic:='0';--indicates that CRC_ERR has just been refreshed
    clockBus: in std_logic_vector(3 downto 0);
    rx_subtick_counter: in unsigned(2 downto 0)
	);
end CRC_CHECK_32b;

architecture Behavioral of CRC_CHECK_32b is
	signal b0, b1,d0,d1 : std_logic_vector(7 downto 0);
	signal r0, r1, r2, r3, r4, r5, r6, r4_reg, r5_reg,p0,p1,p2,p3,p4,p5,p3_reg,p4_reg : std_logic_vector(11 downto 0);  
										-- crc register at varoius stages of the computation
	signal rx_subtick_counter_reg : unsigned(2 downto 0);

  --signal or_all_r6 : std_logic;
  
	--  component crc_lut
	--    port (
	--      addr : in  std_logic_vector(7 downto 0);
	--      data : out std_logic_vector(11 downto 0));
	--  end component;
	--

	  --component or_all
	  --  generic (
	  --    numbits : integer);
	  --  port (
	  --    DATA   : in  std_logic_vector(numbits - 1 downto 0);
	  --    or_all : out std_logic);
	  --end component;
  
	COMPONENT crc_distmem
	PORT (
	a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	spo : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
	END COMPONENT;
  
begin
	b1<=DATA_in(31 downto 24);
	b0<=DATA_in(23 downto 16);
	d1<=DATA_in(15 downto 8);
	d0<=DATA_in(7 downto 0);


	r1(11 downto 8)<=r0(3 downto 0);
	r1(7 downto 0)<=b1;

	--  lut_0: crc_lut
	--    port map (
	--        addr => r0(11 downto 4),
	--        data => r2);
	--

	lut_0: crc_distmem
	port map (
	a   => r0(11 downto 4),
		spo => r2
	);

	r3<=r1 xor r2;
	r4(11 downto 8)<=r3(3 downto 0);
	r4(7 downto 0)<=b0;

	--  lut_1: crc_lut
	--    port map (
	--        addr => r3(11 downto 4),
	--        data => r5);
	--

	lut_1: crc_distmem
	port map (
		a   => r3(11 downto 4),
		spo => r5
	);

	r6<= r5 xor r4;

	--or_all_1: or_all
	--  generic map (
	--    numbits => 12)
	--  port map (
	--    DATA   => r6,
	--    or_all => or_all_r6);
  
	lut_2: crc_distmem
	port map (
		a   => r6(11 downto 4),
		spo => p0
	);

	p1(11 downto 8) <=	r6(3 downto 0);
	p1(7 downto 0)	<= d1; 
	p2<= p0 xor p1; 

	lut_3: crc_distmem
	port map (
		a   => p2(11 downto 4),
		spo => p3
	);

	p4(11 downto 8)<=p2(3 downto 0);
	p4(7 downto 0)	<=d0;
	p5<= p3 xor p4; 

	--  process (clockBus(2))
	--  begin  -- process
	--    if rising_edge(clockBus(2)) then  -- rising clock edge

	--      if rx_subtick_counter=to_unsigned(0,3) then
	--        r0<=(others=>'0');
	--      else
	--        r0<=p5;
	--      end if;

	--      if rx_subtick_counter_reg=to_unsigned(0,3) then
	--        if p3_reg=p4_reg then --r6="000000000000" then
	--          CRC_ERR<='0';
	--        else
	--          CRC_ERR<='1';
	--        end if;
	--      end if;
		  
	--      rx_subtick_counter_reg<=rx_subtick_counter;
	--      p3_reg<=p3;
	--      p4_reg<=p4;
		  
	--    end if;
	--  end process;
  
	process (clockBus(2))
	begin
	if rising_edge(clockBus(2)) then
		  if rx_subtick_counter=to_unsigned(0,3) then
				r0<=(others=>'0');
				if p5=x"000" then
					CRC_ERR<='0'; 
				else
					CRC_ERR<='1';
				end if;
				CRC_Just_Done<='1';
		  else
				r0<=p5;
				CRC_Just_Done<='0';
		  end if;      
	end if;
	end process;
end Behavioral;

