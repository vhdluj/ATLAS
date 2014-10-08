----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.07.2014 16:15:08
-- Design Name: 
-- Module Name: ipbus_slave_playback128 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

use work.ipbus.all;

entity ipbus_slave_ipbScope is
    Port ( 
        sysclk40: in std_logic;
        sysclk160: in std_logic;
        ipbus_in: in ipb_wbus;
        ipbus_out: out ipb_rbus;
        
        control: in std_logic_vector(31 downto 0);
        probeData: in std_logic_vector(127 downto 0);
        rewind: in std_logic
        
    );
end ipbus_slave_ipbScope;

architecture Behavioral of ipbus_slave_ipbScope is

    signal sel: natural;

    signal state: std_logic;
    signal ack: std_logic;
    signal addr0_reg, strobe_reg: std_logic;

    


    signal probeData_reg, probeData_reg2: std_logic_vector(127 downto 0);
    
    signal ipbusProbeData: std_logic_vector(31 downto 0);
    signal probeData32bitSlice: std_logic_vector(31 downto 0);
    
    

    signal toggle40, toggle160_reg: std_logic;
    signal addressCounter: std_logic_vector(10 downto 0);
     
    signal resetAddressCounter: std_logic;
    signal bramWriteEnable: std_logic;

begin




    process(sysclk40) begin
        if rising_edge(sysclk40) then
            toggle40 <= not toggle40;
--            probeData_reg <= probeData;
--            probeData_reg2 <= probeData_reg;             
        end if;
    end process;
        

    SRL16E_inst : SRL16E
   generic map (
      INIT => X"0000")
   port map (
      Q => resetAddressCounter,
      A0 => control(0),     -- Select[0] input
      A1 => control(1),     -- Select[1] input
      A2 => control(2),     -- Select[2] input
      A3 => control(3),     -- Select[3] input
      CE => '1',     -- Clock enable input
      CLK => sysclk160,   -- Clock input
      D => rewind        -- SRL data input
   );


    process(sysclk160) begin
        if rising_edge(sysclk160) then
            toggle160_reg <= toggle40;
            
            if resetAddressCounter='1' then 
                addressCounter <= (10 downto 0 => '0');
            else
                if addressCounter(10) = '1' then 
                    addressCounter <= addressCounter;
                else 
                    addressCounter <= std_logic_vector( unsigned(addressCounter) + 1);
                end if;
            
            end if;  
            
        end if;
    end process;

    bramWriteEnable <= '0' when resetAddressCounter='1' or addressCounter(10) = '1' else '1';

    
    probeData32bitSlice <= probeData( 31 downto  0) when addressCounter(1 downto 0)="00"
                      else probeData( 63 downto 32) when addressCounter(1 downto 0)="01"
                      else probeData( 95 downto 64) when addressCounter(1 downto 0)="10"
                      else probeData(127 downto 96);
    
    

    

    bram: entity work.playbackspy_blockram
        generic map(dataWidth => 32)
        Port map(
            CLKA => sysclk160,
            DIA => probeData32bitSlice,
            ADDRA => addressCounter(9 downto 0),
            WEA => bramWriteEnable,
            DOA => open,
            
            CLKB => sysclk40,
            DIB => (31 downto 0 => '0'),
            ADDRB => ipbus_in.ipb_addr(9 downto 0),
            WEB => '0',
            DOB => ipbusProbeData 
        );
    

    ipbus_out.ipb_rdata <= ipbusProbeData;
    


    process(sysclk40) begin
        if rising_edge(sysclk40) then
            strobe_reg <= ipbus_in.ipb_strobe;
            addr0_reg <= ipbus_in.ipb_addr(0);  
            if ipbus_in.ipb_strobe='1' then
                
                if ipbus_in.ipb_addr(0) /= addr0_reg or strobe_reg='0' then 
                    state <= '1';
                else 
                    state <= '0';
                end if;
                
                ack <= state;
                
            else    
                state <= '0';
                ack <= '0';
            end if;            
        end if;        
    end process;


    ipbus_out.ipb_ack <= ack;
    ipbus_out.ipb_err <= '0';


--    debugPlaybackSpy128(31 downto 0) <= ipbus_in.ipb_addr;
--    debugPlaybackSpy128(63 downto 32) <= ipbus_in.ipb_wdata;
--    debugPlaybackSpy128(64) <= ipbus_in.ipb_strobe;
--    debugPlaybackSpy128(65) <= ipbus_in.ipb_write;
--    debugPlaybackSpy128(97 downto 66) <= ipbusSpyData(MGTLow);
--    debugPlaybackSpy128(98) <= ack;

--    debugPlaybackSpy128(226 downto   99) <= spyData128Bit(MGTLow);
--    debugPlaybackSpy128(354 downto 227) <= playbackData128Bit_reg(MGTLow); 
    
--    debugPlaybackSpy128(355) <= enableSpy;
--    debugPlaybackSpy128(356) <= rewindPlaybackSpy;
--    debugPlaybackSpy128(357) <= state;
--    debugPlaybackSpy128(358) <= ipbusPlaybackDataWriteEnable(MGTLow);
--    debugPlaybackSpy128(390 downto 359) <= serialSpyData32Bit(MGTLow);
--    debugPlaybackSpy128(422 downto 391) <= serialPlaybackData32Bit(MGTLow);
--    debugPlaybackSpy128(432 downto 423) <= addressCounter(MGTLow);    
    
    
    ila_ipbScope: entity work.ila_ipbScope
        port map(
            clk => sysclk160,
            probe0 => ipbus_in.ipb_addr,
            probe1 => ipbusProbeData,
            probe2(0) => ack,
            probe3 => probeData,
            probe4 => probeData32bitSlice,
            probe5 => addressCounter,
            probe6(0) => bramWriteEnable,
            probe7(0) => state,
            probe8(0) => rewind,
            probe9(0) => resetAddressCounter,
            probe10(0) => toggle40,
            probe11(0) => toggle160_reg
        ); 
    
end Behavioral;
