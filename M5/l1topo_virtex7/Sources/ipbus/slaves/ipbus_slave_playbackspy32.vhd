----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.07.2014 22:19:45
-- Design Name: 
-- Module Name: ipbus_slave_playbackspy32 - Behavioral
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



entity ipbus_slave_playbackspy32 is
    Port ( 
        sysclk40: in std_logic;
        ipbus_in: in ipb_wbus;
        ipbus_out: out ipb_rbus;
        
        spyData32Bit: in std_logic_vector(31 downto 0);
        playbackData32Bit: out std_logic_vector(31 downto 0);
        enableSpy: in std_logic;
        rewindPlaybackSpy: in std_logic
        
--        debugPlaybackSpy32: out std_logic_vector(176 downto 0)
    
    );
end ipbus_slave_playbackspy32;



architecture Behavioral of ipbus_slave_playbackspy32 is

    signal state: std_logic;
    signal ack: std_logic;
    signal addr0_reg, strobe_reg: std_logic;

    signal addressCounter: std_logic_vector(9 downto 0);
    signal writeEnable: std_logic;

    signal spyData32Bit_reg, spyData32Bit_reg2: std_logic_vector(31 downto 0);

    signal ipbusSpiedData: std_logic_vector(31 downto 0);
    signal playbackData32bit_internal: std_logic_vector(31 downto 0); 
begin



    process(sysclk40) begin
        if rising_edge(sysclk40) then
            if rewindPlaybackSpy='1' then addressCounter <= (9 downto 0 => '0');
            else addressCounter <= std_logic_vector( unsigned(addressCounter) + 1);
            
            spyData32Bit_reg <= spyData32Bit;
            spyData32Bit_reg2 <= spyData32Bit_reg;
            
            end if;
        end if;
    end process;




    writeEnable <= '1' when state='1' and ipbus_in.ipb_write='1' else '0';


    PlaybackSpy: entity work.playbackspy_blockram
        generic map(dataWidth => 32)
        Port map(
            CLKA => sysclk40,
            DIA => spyData32Bit_reg2,
            ADDRA => addressCounter,
            WEA => enableSpy,
            DOA => playbackData32Bit_internal,
            
            CLKB => sysclk40,
            DIB => ipbus_in.ipb_wdata,
            ADDRB => ipbus_in.ipb_addr(9 downto 0),
            WEB => writeEnable,
            DOB => ipbusSpiedData
        );
    
    
    playbackData32Bit <= playbackData32Bit_internal;
    
    
    

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

    
    ipbus_out.ipb_rdata <= ipbusSpiedData;
    ipbus_out.ipb_ack <= ack;
    ipbus_out.ipb_err <= '0';



--    debugPlaybackSpy32(31 downto 0) <= ipbus_in.ipb_addr;
--    debugPlaybackSpy32(63 downto 32) <= ipbus_in.ipb_wdata;
--    debugPlaybackSpy32(64) <= ipbus_in.ipb_strobe;
--    debugPlaybackSpy32(65) <= ipbus_in.ipb_write;
--    debugPlaybackSpy32(97 downto 66) <= ipbusSpiedData;
--    debugPlaybackSpy32(98) <= ack;

--    debugPlaybackSpy32(130 downto 99) <= spyData32Bit;
--    debugPlaybackSpy32(162 downto 131) <= playbackData32Bit_internal;
--    debugPlaybackSpy32(163) <= enableSpy;
--    debugPlaybackSpy32(164) <= rewindPlaybackSpy;
--    debugPlaybackSpy32(165) <= state;
--    debugPlaybackSpy32(166) <= writeEnable;
--    debugPlaybackSpy32(176 downto 167) <= addressCounter;



ILA_PBS32: entity work.ila_playbackSpy32
    port map(
        clk => sysclk40,
        probe0 => ipbus_in.ipb_addr,
        probe1 => ipbus_in.ipb_wdata,
        probe2(0) => ipbus_in.ipb_strobe,
        probe3(0) => ipbus_in.ipb_write,
        probe4 => ipbusSpiedData,
        probe5(0) => ack,
        probe6 => spyData32Bit,
        probe7 => playbackData32Bit_internal,
        probe8(0) => enableSpy,
        probe9(0) => rewindPlaybackSpy,
        probe10(0) => state,
        probe11(0) => writeEnable,
        probe12 => addressCounter
    );


end Behavioral;
