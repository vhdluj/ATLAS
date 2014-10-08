----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.07.2014 06:02:23
-- Design Name: 
-- Module Name: ipbus_slave_playbackspy - Behavioral
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
--use work.L1TopoDataTypes.all;
use work.L1TopoGTConfiguration.all;
use work.ipbus.all;


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ipbus_slave_playbackspy32_4 is
    Port ( 
        sysclk40: in std_logic;
        sysclk160: in std_logic;
        ipbus_in: in ipb_wbus;
        ipbus_out: out ipb_rbus;
        
        ipbusPlaybackCharIsK: in std_logic_vector(31 downto 0);
        ipbusSpyCharIsK: out std_logic_vector(31 downto 0);
        
        spyData36Bit: in arraySLV36(MGTHigh downto MGTLow);
        playbackData36Bit: out arraySLV36(MGTHigh downto MGTLow);
        enableSpy: in std_logic;
        rewindPlaybackSpy: in std_logic;
        
        
        master_strobe: in std_logic;
        ipbr_master: in ipb_rbus;
        ipbr3: in ipb_rbus;
        ipbr5: in ipb_rbus
        
    );
    
end ipbus_slave_playbackspy32_4;

architecture Behavioral of ipbus_slave_playbackspy32_4 is

    signal state: std_logic;
    signal ack: std_logic;
    signal addr0_reg, strobe_reg: std_logic;

    type array10bit is array(MGTHigh downto MGTLow) of std_logic_vector(9 downto 0);
    signal addressCounter: array10bit;
    signal ipbusPlaybackData36Bit: std_logic_vector(35 downto 0);
    signal writeEnable: std_logic_vector(MGTHigh downto MGTLow);
    signal ipbusSpyData36Bit: arraySLV36(MGTHigh downto MGTLow);
    signal sel: natural range MGTHigh downto MGTLow;

    signal spyData36Bit_reg, spyData36Bit_reg2: arraySLV36(MGTHigh downto MGTLow);
    signal playbackData36Bit_reg, playbackData36Bit_reg2: arraySLV36(MGTHigh downto MGTLow);
    
    signal ipbusSpyCharIsK_reg: std_logic_vector(31 downto 0);

begin

    process(sysclk160) begin
        if rising_edge(sysclk160) then
            spyData36Bit_reg <= spyData36Bit;
            spyData36Bit_reg2 <= spyData36Bit_reg;
            playbackData36Bit <= playbackData36Bit_reg;
            playbackData36Bit_reg <= playbackData36Bit_reg2;
        end if;
    end process;


    sel <= to_integer( unsigned(ipbus_in.ipb_addr(16 downto 10) ) );

    
    
    ipbusPlaybackData36Bit <= ipbusPlaybackCharIsK(3 downto 0) & ipbus_in.ipb_wdata;
    


PlaybackSpy_GEN: for i in MGTHigh downto MGTLow generate begin

    process(sysclk160) begin
        if rising_edge(sysclk160) then
            if rewindPlaybackSpy='1' then addressCounter(i) <= (9 downto 0 => '0');
            else addressCounter(i) <= std_logic_vector( unsigned(addressCounter(i)) + 1);
            end if;
        end if;
    end process;


    writeEnable(i) <= '1' when i=sel and state='1' and ipbus_in.ipb_write='1' else '0';


    PlaybackSpy: entity work.playbackspy_blockram
        generic map(dataWidth => 36)
        Port map(
            CLKA => sysclk160,
            DIA => spyData36Bit_reg2(i),
            ADDRA => addressCounter(i),
            WEA => enableSpy,
            DOA => playbackData36Bit_reg2(i),
            
            CLKB => sysclk40,
            DIB => ipbusPlaybackData36Bit,
            ADDRB => ipbus_in.ipb_addr(9 downto 0),
            WEB => writeEnable(i),
            DOB => ipbusSpyData36Bit(i)
        );
    
    
end generate;
    
    
    
    

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
            
            if state='1' then ipbusSpyCharIsK_reg <= (31 downto 4 => '0') & ipbusSpyData36Bit(sel)(35 downto 32);
            else ipbusSpyCharIsK_reg <= ipbusSpyCharIsK_reg;
            end if;
            
            ipbus_out.ipb_rdata <= ipbusSpyData36Bit(sel)(31 downto 0);
            
        end if;        
    end process;


    ipbusSpyCharIsK <= ipbusSpyCharIsK_reg;
    

    ipbus_out.ipb_ack <= ack;
    ipbus_out.ipb_err <= '0';






--ila: entity work.ila_pbs
--    port map(
--        sysclk40 => sysclk40,
--        probe0(0) => master_strobe,
--        probe1 => ipbus_in.ipb_addr,
--        probe2(0) => ipbus_in.ipb_write,
--        probe3 => ipbr3.ipb_rdata,
--        probe4(0) => ipbr3.ipb_ack,
--        probe5 => ipbr5.ipb_rdata,
--        probe6(0) => ipbr5.ipb_ack,
--        probe7 => playbackspy_control(1 downto 0),
--        probe8 => datasource,
--        probe9 => results,
--        probe10 => playback_charIsK(3 downto 0),
--        probe11 => playbackspy.playbackspyAddress(9 downto 0),
--        probe12(0) => playbackspy.playbackspyWriteEnable,
--        probe13 => playbackspy.dataToPlayback,
--        probe14 => spied_data,                                   
--        probe15 => spiedData_reg,
--        probe16(0) => state,
--        probe17(0) => ack
--    );
        


end Behavioral;
