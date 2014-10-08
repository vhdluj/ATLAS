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
        enableAddressIncrement: in std_logic;
        enableAddressWrapAround: in std_logic;
        rewindPlaybackSpy: in std_logic
        
--        debugPlaybackSpy128: out std_logic_vector(432 downto 0)
        
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
     
    signal resetAddressCounter: std_logic_vector(MGTHigh-MGTLow downto 0);
    

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
        

    SRL16E_inst : SRL16E
   generic map (
      INIT => X"0000")
   port map (
      Q => resetAddressCounter(i-MGTLow),       -- SRL data output
      A0 => '0',     -- Select[0] input
      A1 => '1',     -- Select[1] input
      A2 => '0',     -- Select[2] input
      A3 => '0',     -- Select[3] input
      CE => '1',     -- Clock enable input
      CLK => sysclk160,   -- Clock input
      D => rewindPlaybackSpy        -- SRL data input
   );


    process(sysclk160) begin
        if rising_edge(sysclk160) then
            toggle160_reg(i) <= toggle40(i);
            
            if resetAddressCounter(i-MGTLow)='1' then 
                addressCounter(i) <= (9 downto 0 => '0');
                playbackDataShiftRegister(i) <= (95 downto 0 => '0');
            
            else
                if enableAddressIncrement='0' or (enableAddressWrapAround='0' and addressCounter(i) = "1111111111") then 
                    addressCounter(i) <= addressCounter(i);
                elsif toggle40(i) /= toggle160_reg(i) then 
                    addressCounter(i)(1 downto 0) <= "10";
                else 
                    addressCounter(i) <= std_logic_vector( unsigned(addressCounter(i)) + 1);
                end if;
            
                playbackDataShiftRegister(i)(95 downto 64) <= playbackDataShiftRegister(i)(63 downto 32);
                playbackDataShiftRegister(i)(63 downto 32) <= playbackDataShiftRegister(i)(31 downto  0);
                playbackDataShiftRegister(i)(31 downto  0) <= serialPlaybackData32Bit(i)(31 downto 0);
            
            end if;  
            
        end if;
    end process;

    

    
    serialSpyData32Bit(i) <= spyData128Bit_reg2(i)( 31 downto  0) when addressCounter(i)(1 downto 0)="00"
                        else spyData128Bit_reg2(i)( 63 downto 32) when addressCounter(i)(1 downto 0)="01"
                        else spyData128Bit_reg2(i)( 95 downto 64) when addressCounter(i)(1 downto 0)="10"
                        else spyData128Bit_reg2(i)(127 downto 96);
    
    playbackData128Bit_reg2(i)( 31 downto  0) <= playbackDataShiftRegister(i)(95 downto 64);
    playbackData128Bit_reg2(i)( 63 downto 32) <= playbackDataShiftRegister(i)(63 downto 32);
    playbackData128Bit_reg2(i)( 95 downto 64) <= playbackDataShiftRegister(i)(31 downto  0);
    playbackData128Bit_reg2(i)(127 downto 96) <= serialPlaybackData32Bit(i)(31 downto 0);
    

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
    
    
    ILA_PBS128: entity work.ila_playbackSpy128
        port map(
            clk => sysclk160,
            probe0 => ipbus_in.ipb_addr,
            probe1 => ipbus_in.ipb_wdata,
            probe2(0) => ipbus_in.ipb_strobe,
            probe3(0) => ipbus_in.ipb_write,
            probe4 => ipbusSpyData(MGTLow),
            probe5(0) => ack,
            probe6 => spyData128Bit(MGTLow),
            probe7 => playbackData128Bit_reg(MGTLow),
            probe8(0) => enableSpy,
            probe9(0) => rewindPlaybackSpy,
            probe10(0) => state,
            probe11(0) => ipbusPlaybackDataWriteEnable(MGTLow),
            probe12 => serialSpyData32Bit(MGTLow),
            probe13 => serialPlaybackData32Bit(MGTLow),
            probe14 => addressCounter(MGTLow)
        );
    
end Behavioral;
