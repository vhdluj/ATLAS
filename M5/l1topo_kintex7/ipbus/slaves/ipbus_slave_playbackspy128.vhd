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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


use work.ipbus.all;
use work.L1TopoGTConfiguration.all;

entity ipbus_slave_playbackspy128 is
    Port ( 
        sysclk40: in std_logic;
        sysclk160: in std_logic;
        ipbus_in: in ipb_wbus;
        ipbus_out: out ipb_rbus;
        
        spyData128Bit: in arraySLV128(MGTHigh downto MGTLow);
        playbackData128Bit: out arraySLV128(MGTHigh downto MGTLow);
        enableSpy: in std_logic;
        rewindPlaybackSpy: in std_logic
        
    );
end ipbus_slave_playbackspy128;

architecture Behavioral of ipbus_slave_playbackspy128 is

    signal sel: natural;

    signal state: std_logic;
    signal ipbusPlaybackDataWriteEnable: std_logic_vector(MGTHigh downto MGTLow);
    signal ack: std_logic;
    signal addr0_reg, strobe_reg: std_logic;

    


    signal spyData128Bit_reg, spyData128Bit_reg2: arraySLV128(MGTHigh downto MGTLow);
    signal playbackData128Bit_reg, playbackData128Bit_reg2: arraySLV128(MGTHigh downto MGTLow);
    
    signal ipbusSpyData: arraySLV32(MGTHigh downto MGTLow);
    signal serialSpyData32Bit: arraySLV32(MGTHigh downto MGTLow);
    signal serialPlaybackData32Bit: arraySLV32(MGTHigh downto MGTLow);
    signal playbackDataShiftRegister: arraySLV96(MGTHigh downto MGTLow);
    

    signal toggle40, toggle160_reg: std_logic_vector(MGTHigh downto MGTLow);
    signal addressCounter: arraySLV10(MGTHigh downto MGTLow);
    
    

begin


    sel <= to_integer(unsigned(ipbus_in.ipb_addr(16 downto 10)));


PLAYBACKSPY128_GEN: for i in MGTHigh downto MGTLow generate begin

    process(sysclk40) begin
        if rising_edge(sysclk40) then
            toggle40(i) <= not toggle40(i);
            spyData128Bit_reg(i) <= spyData128Bit(i);
            spyData128Bit_reg2(i) <= spyData128Bit_reg(i);
            playbackData128Bit(i) <= playbackData128Bit_reg(i);
            playbackData128Bit_reg(i) <= playbackData128Bit_reg2(i);             
        end if;
    end process;
        

    process(sysclk160) begin
        if rising_edge(sysclk160) then
            toggle160_reg(i) <= toggle40(i);
            
            if rewindPlaybackSpy='1' then 
                addressCounter(i) <= (9 downto 0 => '0');
            
            elsif addressCounter(i) = "1111111111" then 
                addressCounter(i) <= addressCounter(i);
            
            elsif toggle40(i) /= toggle160_reg(i) then 
                addressCounter(i)(1 downto 0) <= "01";
            
            else 
                addressCounter(i) <= std_logic_vector( unsigned(addressCounter(i)) + 1);
            
            end if;  
            
            
            playbackDataShiftRegister(i)(95 downto 64) <= playbackDataShiftRegister(i)(63 downto 32);
            playbackDataShiftRegister(i)(63 downto 32) <= playbackDataShiftRegister(i)(31 downto  0);
            playbackDataShiftRegister(i)(31 downto  0) <= serialPlaybackData32Bit(i)(31 downto 0);
            
        end if;
    end process;

    

    
    serialSpyData32Bit(i) <= spyData128Bit_reg2(i)( 31 downto  0) when addressCounter(i)(1 downto 0)="00"
                        else spyData128Bit_reg2(i)( 63 downto 32) when addressCounter(i)(1 downto 0)="01"
                        else spyData128Bit_reg2(i)( 95 downto 64) when addressCounter(i)(1 downto 0)="10"
                        else spyData128Bit_reg2(i)(127 downto 96);
    
    playbackData128Bit_reg2(i)(127 downto 96) <= playbackDataShiftRegister(i)(95 downto 64);
    playbackData128Bit_reg2(i)( 95 downto 64) <= playbackDataShiftRegister(i)(63 downto 32);
    playbackData128Bit_reg2(i)( 63 downto 32) <= playbackDataShiftRegister(i)(31 downto  0);
    playbackData128Bit_reg2(i)( 31 downto  0) <= serialPlaybackData32Bit(i)(31 downto 0);
    

    ipbusPlaybackDataWriteEnable(i) <= '1' when sel=i and state='1' and ipbus_in.ipb_write='1' else '0';




    PlaybackSpy: entity work.playbackspy_blockram
        generic map(dataWidth => 32)
        Port map(
            CLKA => sysclk160,
            DIA => serialSpyData32Bit(i),
            ADDRA => addressCounter(i),
            WEA => enableSpy,
            DOA => serialPlaybackData32Bit(i),
            
            CLKB => sysclk40,
            DIB => ipbus_in.ipb_wdata,
            ADDRB => ipbus_in.ipb_addr(9 downto 0),
            WEB => ipbusPlaybackDataWriteEnable(i),
            DOB => ipbusSpyData(i)
        );
    

end generate;    

    ipbus_out.ipb_rdata <= ipbusSpyData(sel);


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




end Behavioral;
