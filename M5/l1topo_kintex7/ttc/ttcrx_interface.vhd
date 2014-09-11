----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:36 07/09/2014 
-- Design Name: 	
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions:  ISE 14.7
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity ttcrx_interface is
port (
	CLK_P, CLK_N : in std_logic; --ttcrx is supplied with the cristal oscillator 40MHz -what about whole system clock reconstruction
	MMCX_OUT : out std_logic;

		--input signals from ttcrx chip
	TTC_EVT_H_STR_IN : in std_logic;
	TTC_L1A_IN : in std_logic;
	TTC_BCNT_STR_IN : in std_logic;
	TTC_EVT_L_STR_IN : in std_logic;
	TTC_BCNT_IN : in std_logic_vector(11 downto 0);
		--output signals
	TTC_RESET_OUT : out std_logic;
	L1A_OUT: out std_logic; --level 1 accepted. Main trigger
	BCID_OUT : out std_logic_vector(11 downto 0); --BCID is other name for BCN (bunch crossing number)
	EVTID_OUT : out std_logic_vector(23 downto 0)
);
end ttcrx_interface;

architecture Behavioral of ttcrx_interface is

signal icon_control0, icon_control1 : std_logic_vector(35 downto 0);
signal ila_trg_u2, ila_trg_u1 : std_logic_vector(254 downto 0);
signal gclk, clk_fb, clk_400_ub : std_logic;

signal bcid : std_logic_vector(11 downto 0) := x"000";
signal evtid : std_logic_vector(23 downto 0) := x"000000";
signal l1a : std_logic_vector(2 downto 0) := "000";
signal l1a_in_qq, l1a_in_q, l1a_in : std_logic := '0';
signal l1a_forward : std_logic := '0';


begin

process(gclk)
begin
	if rising_edge(gclk) then
		l1a(2 downto 0) <= l1a(1 downto 0) & TTC_L1A_IN;
	end if;
end process;

process(gclk)
begin
	if rising_edge(gclk) then
		if (TTC_L1A_IN = '1' and TTC_BCNT_STR_IN = '1') then
			bcid <= TTC_BCNT_IN;
		elsif (l1a(0) = '1' and TTC_EVT_L_STR_IN = '1') then
			evtid(23 downto 12) <= evtid(23 downto 12);
			evtid(11 downto 0) <= TTC_BCNT_IN;
			bcid <= bcid;
		elsif (l1a(1) = '1' and TTC_EVT_H_STR_IN = '1') then
			evtid(11 downto 0) <= evtid(11 downto 0);
			evtid(23 downto 12) <= TTC_BCNT_IN;
			bcid <= bcid;
		else
			bcid <= bcid;
			evtid <= evtid;
		end if;
	end if;
end process;

l1a_delay : process(gclk)
--this process delays the L1A signal by 3 clk cycles
--these clk cycles are needed to have full data from ttcrx
--of course later it can be done better and forward L1a immediately
--and needed vectors can be retriev by delayin write_enable to buffering
--fifo in slinkpckbuilder
begin
if rising_edge(gclk) then
	l1a_in <= TTC_L1A_IN ;
	l1a_in_q <= l1a_in;
	l1a_in_qq <= l1a_in_q;
end if;
end process;

-- GK: changed for already recovered clock by other entities
gclk <= CLK_P;
--clk_buf : IBUFGDS port map (I => CLK_P, IB => CLK_N, O => gclk );


--
--clock_inst : entity work.ddr_clock_src
--port map
--(
--	-- Clock in ports
--	CLK_IN1 => gclk,
--	CLKFB_IN => clk_fb,
--	CLKFB_OUT => clk_fb,
--	-- Clock out ports WITHOUT BUFFERS
--	CLK_40_OUT => open,
--	CLK_80_OUT => open,
--	CLK_400_OUT => clk_400_ub,
--	--CLK_300_OUT => open,
--	-- Status and control signals
--	RESET  => '0',
--	LOCKED => open
--);


l1a_forward <= l1a_in;

--PORT ASSIGMENT

TTC_RESET_OUT <= '1';
MMCX_OUT <= TTC_L1A_IN; --why? what is the mmcx_out port for? rewritten from Gregs ttcrx mini project
L1A_OUT <= l1a_forward;
BCID_OUT <= bcid;
EVTID_OUT <= evtid;

--icon : entity work.cs_icon
--PORT map(
--    CONTROL0 => icon_control0,
--    CONTROL1 => icon_control1
--);
--   
--
--	
--ila0 : entity work.cs_ila
--PORT map(
--    CONTROL => icon_control0,
--    CLK     => clk_400_ub,
--    TRIG0   => ila_trg_u2
--);
--
--ila1 : entity work.cs_ila
--PORT map(
--    CONTROL => icon_control1,
--    CLK     => clk_400_ub,
--    TRIG0   => ila_trg_u1
--);



--TTC_CTRL(21) <= '1';
--TTC_CTRL(24) <= '1';
--TTC_CTRL(25) <= '1';
--TTC_CTRL(26) <= '0';
--TTC_CTRL(27) <= '1';



--ila_trg_u2(20 downto 0)  <= TTC_CTRL(20 downto 0);
--ila_trg_u2(21) <= '0';
--ila_trg_u2(23 downto 22) <= TTC_CTRL(23 downto 22);
--ila_trg_u2(24) <= '0';
--ila_trg_u2(25) <= '0';
--ila_trg_u2(26) <= '0';
--ila_trg_u2(27) <= '0';
--ila_trg_u2(56 downto 28) <= TTC_CTRL(56 downto 28);

--ila_trg_u1(11 downto 0) <= bcid;
--ila_trg_u1(35 downto 12) <= evtid;
--ila_trg_u1(38 downto 36) <= l1a;

end Behavioral;


