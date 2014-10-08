----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andreas D. Reiß (areiss@students.uni-mainz.de)
-- 
-- Create Date: 26.05.2014 13:00:00
-- Design Name: 
-- Module Name: GT_Topo_Universal_RefClk - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.L1TopoGTConfiguration.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity GT_Topo_Universal_RefClk is
	Generic (
		Use2IBUFDS_GTE2PerQuad : std_logic:='1'--if '1' then two IBUFDS_GTE2 are created per quad to allow for properly contsraining the input GT reference clock, if '0' only one IBUFDS_GTE2 is used--> this can lead to wrong constraints may harm the device (never tried out)
	);
    Port (
		MgtRefClk0P,MgtRefClk0N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz                      
		MgtRefClk1P,MgtRefClk1N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz         
		MGTRefClk: out std_logic_vector(QuadHigh downto QuadLow)--usually 160.32 MHz 		
	);
end GT_Topo_Universal_RefClk;

architecture Behavioral of GT_Topo_Universal_RefClk is
	signal SelectedMGTRefClkN,SelectedMGTRefClkP: std_logic_vector(QuadMax downto QuadLow);
	signal GTREFCLK_OUT: std_logic_vector(QuadMax downto QuadLow);
	signal GTREFCLK0_OUT,GTREFCLK1_OUT: std_logic_vector(QuadMax downto QuadLow);
begin
	Production_Gen: if ProductionYes_PrototypeNo='1' generate	
		ConnectMGTRefClks : for I in QuadLow to QuadHigh generate
			MGTRefClk(I)<=GTREFCLK_OUT(I);--direct connection
		end generate ConnectMGTRefClks;
	end generate Production_Gen;

	Prototype_Gen: if ProductionYes_PrototypeNo='0' generate
		Quad0: if QuadLow<=0 and QuadHigh>=0 generate MGTRefClk(0)<=GTREFCLK_OUT(0); end generate Quad0;--MGT 110
		Quad1: if QuadLow<=1 and QuadHigh>=1 generate MGTRefClk(1)<=GTREFCLK_OUT(0); end generate Quad1;--MGT 111
		Quad2: if QuadLow<=2 and QuadHigh>=2 generate MGTRefClk(2)<=GTREFCLK_OUT(3); end generate Quad2;--MGT 112

		Quad3: if QuadLow<=3 and QuadHigh>=3 generate MGTRefClk(3)<=GTREFCLK_OUT(3); end generate Quad3;--MGT 113
		Quad4: if QuadLow<=4 and QuadHigh>=4 generate MGTRefClk(4)<=GTREFCLK_OUT(3); end generate Quad4;--MGT 114
		Quad5: if QuadLow<=5 and QuadHigh>=5 generate MGTRefClk(5)<=GTREFCLK_OUT(6); end generate Quad5;--MGT 115

		Quad6: if QuadLow<=6 and QuadHigh>=6 generate MGTRefClk(6)<=GTREFCLK_OUT(6); end generate Quad6;--MGT 116
		Quad7: if QuadLow<=7 and QuadHigh>=7 generate MGTRefClk(7)<=GTREFCLK_OUT(6); end generate Quad7;--MGT 117
		Quad8: if QuadLow<=8 and QuadHigh>=8 generate MGTRefClk(8)<=GTREFCLK_OUT(8); end generate Quad8;--MGT 118

		Quad9: if QuadLow<=9 and QuadHigh>=9 generate MGTRefClk(9)<=GTREFCLK_OUT(8); end generate Quad9;--MGT 119

		Quad10: if QuadLow<=10 and QuadHigh>=10 generate MGTRefClk(10)<=GTREFCLK_OUT(10); end generate Quad10;--MGT 210
		Quad11: if QuadLow<=11 and QuadHigh>=11 generate MGTRefClk(11)<=GTREFCLK_OUT(10); end generate Quad11;--MGT 211
		Quad12: if QuadLow<=12 and QuadHigh>=12 generate MGTRefClk(12)<=GTREFCLK_OUT(13); end generate Quad12;--MGT 212

		Quad13: if QuadLow<=13 and QuadHigh>=13 generate MGTRefClk(13)<=GTREFCLK_OUT(13); end generate Quad13;--MGT 213
		Quad14: if QuadLow<=14 and QuadHigh>=14 generate MGTRefClk(14)<=GTREFCLK_OUT(13); end generate Quad14;--MGT 214
		Quad15: if QuadLow<=15 and QuadHigh>=15 generate MGTRefClk(15)<=GTREFCLK_OUT(16); end generate Quad15;--MGT 215

		Quad16: if QuadLow<=16 and QuadHigh>=16 generate MGTRefClk(16)<=GTREFCLK_OUT(16); end generate Quad16;--MGT 216
		Quad17: if QuadLow<=17 and QuadHigh>=17 generate MGTRefClk(17)<=GTREFCLK_OUT(16); end generate Quad17;--MGT 217
		Quad18: if QuadLow<=18 and QuadHigh>=18 generate MGTRefClk(18)<=GTREFCLK_OUT(18); end generate Quad18;--MGT 218

		Quad19: if QuadLow<=19 and QuadHigh>=19 generate MGTRefClk(19)<=GTREFCLK_OUT(18); end generate Quad19;--MGT 219
	end generate Prototype_Gen;

	Use2IBUFDS_GTE2PerQuad_gen1: if Use2IBUFDS_GTE2PerQuad='1' generate
		IterateMGTRefClks : for I in QuadLow to QuadMax generate
			TTCRefClk_Gen: if TTCMGTRefClkYes_CrystalMGTRefClkNo='1' or I=3 or I=4 or I=5  generate--Quad 113 to 115 need the TTC Reference Clock all the time since they also transmit
				GTREFCLK_OUT(I)<=GTREFCLK0_OUT(I);
			end generate TTCRefClk_Gen;
			
			CrystalRefClk_Gen: if TTCMGTRefClkYes_CrystalMGTRefClkNo='0' and I/=3 and I/=4 and I/=5 generate--Quad 113 to 115 need the TTC Reference Clock all the time since they also transmit	
				GTREFCLK_OUT(I)<=GTREFCLK1_OUT(I);
			end generate CrystalRefClk_Gen;
		
			gt_usrclk_source0_I : entity work.gtwizard_0_GT_USRCLK_SOURCE
			port map
			(
				Q0_CLK1_GTREFCLK_PAD_N_IN => MgtRefClk0N(I),
				Q0_CLK1_GTREFCLK_PAD_P_IN => MgtRefClk0P(I),
				Q0_CLK1_GTREFCLK_OUT => GTREFCLK0_OUT(I)
			);
			
			gt_usrclk_source1_I : entity work.gtwizard_0_GT_USRCLK_SOURCE
			port map
			(
				Q0_CLK1_GTREFCLK_PAD_N_IN => MgtRefClk1N(I),
				Q0_CLK1_GTREFCLK_PAD_P_IN => MgtRefClk1P(I),
				Q0_CLK1_GTREFCLK_OUT => GTREFCLK1_OUT(I)
			);	
		end generate IterateMGTRefClks;	
	end generate Use2IBUFDS_GTE2PerQuad_gen1;
	
	Use2IBUFDS_GTE2PerQuad_gen0: if Use2IBUFDS_GTE2PerQuad='0' generate
		IterateMGTRefClks : for I in QuadLow to QuadMax generate
			TTCRefClk_Gen: if TTCMGTRefClkYes_CrystalMGTRefClkNo='1' or I=3 or I=4 or I=5  generate--Quad 113 to 115 need the TTC Reference Clock all the time since they also transmit
				SelectedMGTRefClkN(I)<=MgtRefClk0N(I);
				SelectedMGTRefClkP(I)<=MgtRefClk0P(I);
			end generate TTCRefClk_Gen;
			
			CrystalRefClk_Gen: if TTCMGTRefClkYes_CrystalMGTRefClkNo='0' and I/=3 and I/=4 and I/=5 generate--Quad 113 to 115 need the TTC Reference Clock all the time since they also transmit	
				SelectedMGTRefClkN(I)<=MgtRefClk1N(I);
				SelectedMGTRefClkP(I)<=MgtRefClk1P(I);
			end generate CrystalRefClk_Gen;
			
			gt_usrclk_source_J : entity work.gtwizard_0_GT_USRCLK_SOURCE
			port map
			(
				Q0_CLK1_GTREFCLK_PAD_N_IN => SelectedMGTRefClkN(I),
				Q0_CLK1_GTREFCLK_PAD_P_IN => SelectedMGTRefClkP(I),
				Q0_CLK1_GTREFCLK_OUT => GTREFCLK_OUT(I)
			);
		end generate IterateMGTRefClks;
	end generate Use2IBUFDS_GTE2PerQuad_gen0;
end Behavioral;
