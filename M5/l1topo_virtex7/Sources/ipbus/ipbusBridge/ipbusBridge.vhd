----------------------------------------------------------------------------------
-- Company: Johannes Gutenberg-Universitaet Mainz
-- Engineer: Christian Kahra
-- 
-- Create Date:    20:42:46 08/28/2014 
-- Design Name: 
-- Module Name:    ipbusBridge - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 	based on the old ctrlbus module
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

use work.ipbus.all;



entity ipbusBridge is 
	port(
		sysclk:            in  std_logic;
		parallelclk:	    in  std_logic;
		serialclk:         in  std_logic;
		
		pll_locked: in  std_logic;
		
		
		ipb_read: in ipb_rbus;
		ipbBridgeBusOut: out std_logic_vector(2 downto 0);
		
		ipbBridgeBusIn:  in  std_logic_vector(4 downto 0);
		ipb_write: out  ipb_wbus;
		
		control:  in  std_logic_vector(29 downto 0);
		status:   out  std_logic_vector(24 downto 0);
		errorCounter_out: out std_logic_vector(29 downto 0);
		
		
		debugIPBusBridge: out std_logic_vector(239 downto 0)
		
		
	);
end ipbusBridge;


architecture Behavioral of ipbusBridge is

	constant inWidth: natural := 5;
	constant outWidth: natural := 3;

	constant K28_5: std_logic_vector(7 downto 0) := X"BC";
	constant K28_1: std_logic_vector(7 downto 0) := X"3C";

	type array4 is array(natural range <>) of std_logic_vector(3 downto 0);

	

	signal dataOut: std_logic_vector(outWidth*2*8-1	downto 0);
	signal dataToSerialize: std_logic_vector(outWidth*8-1 downto 0);
	signal charIsKOut: std_logic_vector(outWidth-1 downto 0);
	
	type   dataOutStateType is (dataOutState_IDLE, dataOutState_BOF, dataOutState_DATA0, dataOutState_DATA1);
	signal dataOutState: dataOutStateType;
	
	
	signal deserializedData: std_logic_vector(inWidth*8-1 downto 0);
	signal dataIn: std_logic_vector(inWidth*2*8-1 downto 0);
	signal charIsKIn: std_logic_vector(inWidth-1 downto 0);
	
	signal codeErr: std_logic_vector(inWidth-1 downto 0);
	signal errorCounter: std_logic_vector(29 downto 0);
	
	signal bitslipErrorCounter: array4(inWidth-1 downto 0);
	signal bitslip: std_logic_vector(inWidth-1 downto 0);
	
	
	signal charIsKInAnded: std_logic_vector(inWidth downto 0);
	signal charIsKInOred:  std_logic_vector(inWidth downto 0);
	signal codeErrOred:    std_logic_vector(inWidth downto 0);
	signal charIsBofOred:  std_logic_vector(inWidth downto 0);
	signal charIsBofAnded: std_logic_vector(inWidth downto 0);
	
	signal dataIsValid:  std_logic;
	
	type   dataInStateType is (dataInState_IDLE, dataInState_DATA0, dataInState_DATA1);
	signal dataInState: dataInStateType;
	
	
	
	
	
	
	
	
begin





--	dataOut( 0) <= '0';
--	dataOut(32 downto  1) <= ipb_write.ipb_addr;
--	dataOut(39 downto 33) <= ipb_write.ipb_wdata( 6 downto 0);
--	dataOut(40) <= '1';
--	dataOut(65 downto 41) <= ipb_write.ipb_wdata(31 downto 7);
--	dataOut(66) <= ipb_write.ipb_strobe;
--	dataOut(67) <= ipb_write.ipb_write;
--	dataOut(79 downto 68) <= (others => '0');
	
	
	dataOut( 0) <= '0';
	dataOut(23 downto  1) <= ipb_read.ipb_rdata(22 downto  0);
	dataOut(24) <= '1';
	dataOut(33 downto 25) <= ipb_read.ipb_rdata(31 downto 23);
	dataOut(34) <= ipb_read.ipb_ack;
	dataOut(35) <= ipb_read.ipb_err;
	dataOut(47 downto 36) <= (others => '0');
	
	
	
	process(parallelclk) begin
		if rising_edge(parallelclk) then
			
			if pll_locked='0' then dataOutState <= dataOutState_IDLE;
			else 
				case dataOutState is
				
				when dataOutState_IDLE =>
					if dataIn(66)='1' and dataIsValid='1' then 
					     dataOutState <= dataOutState_BOF;
					else dataOutState <= dataOutState_IDLE;
					end if;
				
				when dataOutState_BOF =>
					dataOutState <= dataOutState_DATA0;
				
				when dataOutState_DATA0 =>
					if dataIn(66)='1' and dataIsValid='1' then 
					     dataOutState <= dataOutState_DATA1;
					else dataOutState <= dataOutState_IDLE;
					end if;
				
				when dataOutState_DATA1 =>
					dataOutState <= dataOutState_DATA0;
					
				end case;
			end if;
			
		end if;
	end process;




	dataToSerialize <= K28_5 & K28_5 & K28_5 when (dataOutState=dataOutState_IDLE or dataIn(66)='0' or dataIsValid='0')
					  else K28_1 & K28_1 & K28_1 when  dataOutState=dataOutState_BOF
					  else dataOut(outWidth*8-1 downto  0) when  dataOutState=dataOutState_DATA0 
					  else dataOut(outWidth*2*8-1 downto outWidth*8);






SERIALIZER_GEN: for i in outWidth-1 downto 0 generate begin


	charIsKOut(i) <= '1' when dataOutState=dataOutState_IDLE or dataIn(66)='0' or dataIsValid='0' or dataOutState=dataOutState_BOF else '0';


	serializer: entity work.ipbusBridge_serializer
		port map(
			parallelclk  => parallelclk,
			serialclk    => serialclk,
			pll_locked  => pll_locked,
			parallelData => dataToSerialize(i*8+7 downto i*8),
			charIsK      => charIsKOut(i),
			serialData   => ipbBridgeBusOut(i)
		);
		
end generate;






	charIsKInAnded(inWidth)   <= '1';
	charIsKInOred(inWidth)    <= '0';
	codeErrOred(inWidth)      <= '0';
	charIsBofAnded(inWidth)   <= '1';
	charIsBofOred(inWidth)    <= '0';




DESERIALIZER_GEN: for i in inWidth-1 downto 0 generate begin



	deserializer: entity work.ipbusBridge_deserializer
		port map(
			sysclk         => sysclk,
			parallelclk    => parallelclk,
			serialclk      => serialclk,
			pll_locked    => pll_locked,
			serialData     => ipbBridgeBusIn(i),
			idelayValueIn  => control(i*5+4 downto i*5),
			idelayLoad     => control(inWidth*5+i),
			idelayValueOut => status(i*5+4 downto i*5),
			bitslip        => bitslip(i),
			decodedData    => deserializedData(i*8+7 downto i*8),
			charIsK        => charIsKIn(i),
			codeErr        => codeErr(i)
		);

	



	charIsKInAnded(i) <= charIsKInAnded(i+1) and charIsKIn(i);
	charIsKInOred(i)  <= charIsKInOred(i+1)  or  charIsKIn(i);
	codeErrOred(i)    <= codeErrOred(i+1)    or  codeErr(i);
	charIsBofAnded(i) <= '1' when charIsBofAnded(i+1)='1' and deserializedData(i*8+7 downto i*8)=K28_1 else '0';
	charIsBofOred(i)  <= '1' when charIsBofOred(i+1) ='1' or  deserializedData(i*8+7 downto i*8)=K28_1 else '0';
		
		
		
		
		
	process(parallelclk) begin
		if rising_edge(parallelclk) then
			
			if codeErr(i)='1' then 
				bitslipErrorCounter(i) <= std_logic_vector( unsigned(bitslipErrorCounter(i)) + 1);
				
				if   errorCounter(i*6+5 downto i*6) /= "111111" then 
					  errorCounter(i*6+5 downto i*6) <= std_logic_vector( unsigned(errorCounter(i*6+5 downto i*6)) + 1);
				else errorCounter(i*6+5 downto i*6) <= errorCounter(i*6+5 downto i*6);
				end if;
			
			else 
				bitslipErrorCounter(i) <= "0000";
				errorCounter(i*6+5 downto i*6) <= errorCounter(i*6+5 downto i*6);
			end if;
			
		end if;
	end process;
	
	bitslip(i) <= '1' when bitslipErrorCounter(i)="1111" else '0';
	
		
end generate;



	dataIsValid <= '1' when ( codeErrOred(0)='0' and charIsKInOred(0)='0' )  else '0';


	


process(parallelclk) begin
		if rising_edge(parallelclk) then
			
			if pll_locked='0' then dataInState <= dataInState_IDLE;
			else 
				case dataInState is
				
				when dataInState_IDLE =>
					if charIsBofAnded(0) = '1' then dataInState <= dataInState_Data0;
					else dataInState <= dataInState_IDLE;
					end if;
				when dataInState_Data0 =>
					if dataIsValid='1' then
						dataInState <= dataInState_Data1;
						dataIn(inWidth*8-1 downto 0) <= deserializedData;
					else 
						dataInState <= dataInState_IDLE;
						dataIn <= (inWidth*2*8-1 downto 0 => '0');
					end if;
				when dataInState_Data1 =>
					dataIn(inWidth*2*8-1 downto inWidth*8) <= deserializedData;
					if dataIsValid='1' then dataInState <= dataInState_Data0;
					else dataInState <= dataInState_IDLE;
					end if;
				end case;
			end if;
			
		end if;
end process;


	
	ipb_write.ipb_addr <= dataIn(32 downto 1);
	ipb_write.ipb_wdata( 6 downto 0) <= dataIn(39 downto 33);
	ipb_write.ipb_wdata(31 downto 7) <= dataIn(65 downto 41);
	ipb_write.ipb_strobe <= '1' when dataIn(66)='1' and dataIsValid='1' else '0';
	ipb_write.ipb_write  <= '1' when dataIn(67)='1' and dataIsValid='1' else '0';




	--debugIPBusBridge( 47 downto   0) <= dataOut;
	debugIPBusBridge(31 downto 0) <= dataOut(33 downto 25) & dataOut(23 downto 1); 
	debugIPBusBridge(32) <= dataOut(34);
	debugIPBusBridge(33) <= dataOut(35);
	debugIPBusBridge(47 downto 34) <= dataOut(47 downto 36) & dataOut(24) & dataOut(0);
	debugIPBusBridge( 71 downto  48) <= dataToSerialize;
	debugIPBusBridge( 74 downto  72) <= charIsKOut;
	debugIPBusBridge(75) <= '0' when dataOutState=dataOutState_IDLE  or dataOutState=dataOutState_DATA0 else '1';
	debugIPBusBridge(76) <= '1' when dataOutState=dataOutState_DATA1 or dataOutState=dataOutState_DATA0 else '0';
	debugIPBusBridge(116 downto  77) <= deserializedData;
	--debugIPBusBridge(196 downto 117) <= dataIn;
	debugIPBusBridge(148 downto 117) <= dataIn(32 downto 1);
	debugIPBusBridge(180 downto 149) <= dataIn(65 downto 41) & dataIn(39 downto 33);
	debugIPBusBridge(181) <= dataIn(66);
	debugIPBusBridge(182) <= dataIn(67);
	debugIPBusBridge(196 downto 183) <= dataIn(79 downto 68) & dataIn(40) & dataIn(0);
	debugIPBusBridge(201 downto 197) <= charIsKIn;
	debugIPBusBridge(206 downto 202) <= codeErr;
	debugIPBusBridge(226 downto 207) <= bitslipErrorCounter(4) & bitslipErrorCounter(3) & bitslipErrorCounter(2) & bitslipErrorCounter(1) & bitslipErrorCounter(0);
	debugIPBusBridge(231 downto 227) <= bitslip;
	debugIPBusBridge(232) <= charIsKInAnded(0);
	debugIPBusBridge(233) <= charIsKInOred(0);
	debugIPBusBridge(234) <= codeErrOred(0);
	debugIPBusBridge(235) <= charIsBofOred(0);
	debugIPBusBridge(236) <= charIsBofAnded(0);
	debugIPBusBridge(237) <= dataIsValid;
	debugIPBusBridge(238) <= '0' when dataInState=dataInState_IDLE  or dataOutState=dataOutState_DATA0 else '1';
	debugIPBusBridge(239) <= '1' when dataInState=dataInState_DATA1 or dataInState=dataInState_DATA0 else '0';


--ToDo: ErrorCounter fuer Protokoll-Fehler: z.B. charIsKOred(0) /= charIsKAnded(0)


end Behavioral;

