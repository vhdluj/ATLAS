----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2014 12:00:19
-- Design Name: 
-- Module Name: playbackspy_blockram - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;
Library UNIMACRO;
use UNIMACRO.vcomponents.all;

entity playbackspy_blockram is 
    generic (
        dataWidth: natural := 36
    );
    port ( 
        DOA: out std_logic_vector(dataWidth-1 downto 0);
        DOB: out std_logic_vector(dataWidth-1 downto 0);
        ADDRA: in std_logic_vector(9 downto 0);
        ADDRB: in std_logic_vector(9 downto 0);
        CLKA: in std_logic;
        CLKB: in std_logic;
        DIA: in std_logic_vector(dataWidth-1 downto 0);
        DIB: in std_logic_vector(dataWidth-1 downto 0);
        WEA: in std_logic;
        WEB: in std_logic
    );
end playbackspy_blockram;

architecture Behavioral of playbackspy_blockram is

    signal weaBytes: std_logic_vector(3 downto 0);
    signal webBytes: std_logic_vector(3 downto 0);
    

begin



gen_WE_BYTES: for i in 3 downto 0 generate begin
    weaBytes(i) <= WEA;
    webBytes(i) <= WEB;
end generate;
    

BRAM_TDP_MACRO_inst : BRAM_TDP_MACRO
   generic map (
      BRAM_SIZE => "36Kb", -- Target BRAM, "18Kb" or "36Kb" 
      DEVICE => "7SERIES", -- Target Device: "VIRTEX5", "VIRTEX6", "7SERIES", "SPARTAN6" 
      DOA_REG => 0, -- Optional port A output register (0 or 1)
      DOB_REG => 0, -- Optional port B output register (0 or 1)
      INIT_A => X"000000000", -- Initial values on A output port
      INIT_B => X"000000000", -- Initial values on B output port
      INIT_FILE => "NONE",
      READ_WIDTH_A => dataWidth,   -- Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
      READ_WIDTH_B => dataWidth,   -- Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
      SIM_COLLISION_CHECK => "ALL", -- Collision check enable "ALL", "WARNING_ONLY", 
                                    -- "GENERATE_X_ONLY" or "NONE" 
      SRVAL_A => X"000000000",   -- Set/Reset value for A port output
      SRVAL_B => X"000000000",   -- Set/Reset value for B port output
      WRITE_MODE_A => "WRITE_FIRST", -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE" 
      WRITE_MODE_B => "WRITE_FIRST", -- "WRITE_FIRST", "READ_FIRST" or "NO_CHANGE" 
      WRITE_WIDTH_A => dataWidth, -- Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
      WRITE_WIDTH_B => dataWidth -- Valid values are 1-36 (19-36 only valid when BRAM_SIZE="36Kb")
      )
   port map (
      DOA => DOA,       -- Output port-A data, width defined by READ_WIDTH_A parameter
      DOB => DOB,       -- Output port-B data, width defined by READ_WIDTH_B parameter
      ADDRA => ADDRA,   -- Input port-A address, width defined by Port A depth
      ADDRB => ADDRB,   -- Input port-B address, width defined by Port B depth
      CLKA => CLKA,     -- 1-bit input port-A clock
      CLKB => CLKB,     -- 1-bit input port-B clock
      DIA => DIA,       -- Input port-A data, width defined by WRITE_WIDTH_A parameter
      DIB => DIB,       -- Input port-B data, width defined by WRITE_WIDTH_B parameter
      ENA => '1',       -- 1-bit input port-A enable
      ENB => '1',       -- 1-bit input port-B enable
      REGCEA => '1', -- 1-bit input port-A output register enable
      REGCEB => '1', -- 1-bit input port-B output register enable
      RSTA => '0',     -- 1-bit input port-A reset
      RSTB => '0',     -- 1-bit input port-B reset
      WEA => weaBytes,       -- Input port-A write enable, width defined by Port A depth
      WEB => webBytes        -- Input port-B write enable, width defined by Port B depth
   );


end Behavioral;
