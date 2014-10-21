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
	generic (
		DELAY_GROUP_NAME : string := "delay_group"
		);
	port(
		sysclk:            in  std_logic;
		parallelclk:	    in  std_logic;
		serialclk:         in  std_logic;
		idelayctrl_refclk: in  std_logic;
		
		mmcm_locked: in  std_logic;
		
		
		ipb_write: in ipb_wbus;
		ipbBridgeBus_out: out std_logic_vector(4 downto 0);
		
		ipbBridgeBus_in:  in  std_logic_vector(2 downto 0);
		ipb_read: out  ipb_rbus;
		
		control:  in  std_logic_vector(15 downto 0);
		status:   out  std_logic_vector(14 downto 0);
		errorCounter_out: out std_logic_vector(17 downto 0);
		
		
		debugIPBusBridge: out std_logic_vector(227 downto 0)
		
		
	);
end ipbusBridge;


architecture Behavioral of ipbusBridge is

	constant inWidth: natural := 3;
	constant outWidth: natural := 5;

	constant K28_5: std_logic_vector(7 downto 0) := X"BC";
	constant K28_1: std_logic_vector(7 downto 0) := X"3C";

	type array4 is array(natural range <>) of std_logic_vector(3 downto 0);

	signal idelayctrlReset: std_logic;
	signal idelayctrlResetCounter: std_logic_vector(1 downto 0);

	signal dataOut: std_logic_vector(outWidth*2*8-1	downto 0);
	signal dataToSerialize: std_logic_vector(outWidth*8-1 downto 0);
	signal charIsKOut: std_logic_vector(outWidth-1 downto 0);
	
	type   dataOutStateType is (dataOutState_IDLE, dataOutState_BOF, dataOutState_DATA0, dataOutState_DATA1);
	signal dataOutState: dataOutStateType;
	
	
	signal deserializedData: std_logic_vector(inWidth*8-1 downto 0);
	signal dataIn: std_logic_vector(inWidth*2*8-1 downto 0);
	signal charIsKIn: std_logic_vector(inWidth-1 downto 0);
	
	signal codeErr: std_logic_vector(inWidth-1 downto 0);
	signal errorCounter: std_logic_vector(17 downto 0);
	
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
	
	
	
	
	attribute IODELAY_GROUP : string;
	attribute IODELAY_GROUP of ipbusBridge_idelayctrl : label is DELAY_GROUP_NAME;
	
	
	
	
begin



process(sysclk) begin
		if rising_edge(sysclk) then
			if mmcm_locked='0' then
				idelayctrlReset <= '1';
				idelayctrlResetCounter <= (others => '0');
			else
				if idelayctrlResetCounter = "11" then
					idelayctrlReset <= '0';
					idelayctrlResetCounter <= idelayctrlResetCounter;
				else
					idelayctrlReset <= '1';
					idelayctrlResetCounter <= std_logic_vector( unsigned(idelayctrlResetCounter) + 1);
				end if;
			end if;
		end if;
	end process;





ipbusBridge_idelayctrl : IDELAYCTRL
	 port map (
		  REFCLK => idelayctrl_refclk,
		  RST    => idelayctrlReset,
		  RDY    => open
	  );



	dataOut( 0) <= '0';
	dataOut(32 downto  1) <= ipb_write.ipb_addr;
	dataOut(39 downto 33) <= ipb_write.ipb_wdata( 6 downto 0);
	dataOut(40) <= '1';
	dataOut(65 downto 41) <= ipb_write.ipb_wdata(31 downto 7);
	dataOut(66) <= ipb_write.ipb_strobe;
	dataOut(67) <= ipb_write.ipb_write;
	dataOut(79 downto 68) <= (others => '0');
	
	

	
	
	
	process(parallelclk) begin
		if rising_edge(parallelclk) then
			
			if mmcm_locked='0' then dataOutState <= dataOutState_IDLE;
			else 
				case dataOutState is
				
				when dataOutState_IDLE =>
					if ipb_write.ipb_strobe='1' then 
					     dataOutState <= dataOutState_BOF;
					else dataOutState <= dataOutState_IDLE;
					end if;
				
				when dataOutState_BOF =>
					dataOutState <= dataOutState_DATA0;
				
				when dataOutState_DATA0 =>
					if ipb_write.ipb_strobe='1' then 
					     dataOutState <= dataOutState_DATA1;
					else dataOutState <= dataOutState_IDLE;
					end if;
				
				when dataOutState_DATA1 =>
					dataOutState <= dataOutState_DATA0;
					
				end case;
			end if;
			
		end if;
	end process;




	dataToSerialize <= K28_5 & K28_5 & K28_5 & K28_5 & K28_5 when (dataOutState=dataOutState_IDLE or ipb_write.ipb_strobe='0')
					  else K28_1 & K28_1 & K28_1 & K28_1 & K28_1 when  dataOutState=dataOutState_BOF
					  else dataOut(outWidth*8-1 downto  0) when  dataOutState=dataOutState_DATA0 
					  else dataOut(outWidth*2*8-1 downto outWidth*8);






SERIALIZER_GEN: for i in outWidth-1 downto 0 generate begin


	charIsKOut(i) <= '1' when dataOutState=dataOutState_IDLE or ipb_write.ipb_strobe='0' or dataOutState=dataOutState_BOF else '0';


	serializer: entity work.ipbusBridge_serializer
		port map(
			parallelclk  => parallelclk,
			serialclk    => serialclk,
			mmcm_locked  => mmcm_locked,
			parallelData => dataToSerialize(i*8+7 downto i*8),
			charIsK      => charIsKOut(i),
			serialData   => ipbBridgeBus_out(i)
		);
		
end generate;






	charIsKInAnded(inWidth)   <= '1';
	charIsKInOred(inWidth)    <= '0';
	codeErrOred(inWidth)      <= '0';
	charIsBofAnded(inWidth)   <= '1';
	charIsBofOred(inWidth)    <= '0';




DESERIALIZER_GEN: for i in inWidth-1 downto 0 generate begin



	deserializer: entity work.ipbusBridge_deserializer
	generic map(
		DELAY_GROUP_NAME => DELAY_GROUP_NAME
		)
		port map(
			sysclk         => sysclk,
			parallelclk    => parallelclk,
			serialclk      => serialclk,
			mmcm_locked    => mmcm_locked,
			serialData     => ipbBridgeBus_in(i),
			idelayValueIn  => control(i*5+4 downto i*5),
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
			
			if codeErr(i)='1' then bitslipErrorCounter(i) <= std_logic_vector( unsigned(bitslipErrorCounter(i)) + 1);
			else bitslipErrorCounter(i) <= "0000";
			end if;
			
			if control(15)='1' then errorCounter(i*6+5 downto i*6) <= (5 downto 0 => '0');
			elsif codeErr(i)='1' then 
				if   errorCounter(i*6+5 downto i*6) /= "111111" then errorCounter(i*6+5 downto i*6) <= std_logic_vector( unsigned(errorCounter(i*6+5 downto i*6)) + 1);
				else errorCounter(i*6+5 downto i*6) <= errorCounter(i*6+5 downto i*6);
				end if;
			else errorCounter(i*6+5 downto i*6) <= errorCounter(i*6+5 downto i*6);
			end if;
			
		end if;
	end process;
	
	bitslip(i) <= '1' when bitslipErrorCounter(i)="1111" else '0';
	
		
end generate;



	dataIsValid <= '1' when ( codeErrOred(0)='0' and charIsKInOred(0)='0') else '0';

	errorCounter_out <= errorCounter;
	


process(parallelclk) begin
		if rising_edge(parallelclk) then
			
			if mmcm_locked='0' then dataInState <= dataInState_IDLE;
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


	
	ipb_read.ipb_rdata(22 downto  0) <= dataIn(23 downto  1) when dataInState=dataInState_DATA1 else (others => '0');
	ipb_read.ipb_rdata(31 downto 23) <= dataIn(33 downto 25) when dataInState=dataInState_DATA1 else (others => '0');
	ipb_read.ipb_ack <= '1' when dataIn(34)='1' and dataIsValid='1' and dataInState=dataInState_DATA1 and ipb_write.ipb_strobe='1' else '0';
	ipb_read.ipb_err <= '1' when dataIn(35)='1' and dataInState=dataInState_DATA1 and ipb_write.ipb_strobe='1' else '0';

	

	debugIPBusBridge( 47 downto   0) <= dataIn;
	debugIPBusBridge( 71 downto  48) <= deserializedData;
	debugIPBusBridge( 74 downto  72) <= charIsKIn;
	debugIPBusBridge(75) <= '0' when dataInState=dataInState_IDLE  or dataInState=dataInState_DATA0 else '1';
	debugIPBusBridge(76) <= '1' when dataInState=dataInState_DATA1 or dataInState=dataInState_DATA0 else '0';
	debugIPBusBridge(116 downto  77) <= dataToSerialize;
	debugIPBusBridge(196 downto 117) <= dataOut;
	debugIPBusBridge(201 downto 197) <= charIsKOut;
	debugIPBusBridge(204 downto 202) <= codeErr;
	debugIPBusBridge(216 downto 205) <= bitslipErrorCounter(2) & bitslipErrorCounter(1) & bitslipErrorCounter(0);
	debugIPBusBridge(219 downto 217) <= bitslip;
	debugIPBusBridge(220) <= charIsKInAnded(0);
	debugIPBusBridge(221) <= charIsKInOred(0);
	debugIPBusBridge(222) <= codeErrOred(0);
	debugIPBusBridge(223) <= charIsBofOred(0);
	debugIPBusBridge(224) <= charIsBofAnded(0);
	debugIPBusBridge(225) <= dataIsValid;
	debugIPBusBridge(226) <= '0' when dataOutState=dataOutState_IDLE  or dataOutState=dataOutState_DATA0 else '1';
	debugIPBusBridge(227) <= '1' when dataOutState=dataOutState_DATA1 or dataOutState=dataOutState_DATA0 else '0';




end Behavioral;

