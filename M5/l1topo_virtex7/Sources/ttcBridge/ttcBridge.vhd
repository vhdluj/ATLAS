library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;



entity ttcBridge is
    port(
        sysclk40:  in std_logic;
        sysclk80:  in std_logic;
        sysclk200: in std_logic;
        sysclk_pll_locked: in std_logic;
        serialData: in std_logic;
        control: in std_logic_vector(9 downto 0);
        status: out std_logic_vector(12 downto 0);
        ttcL1Accept: out std_logic;
        ttcBroadcast: out std_logic;
        ttcBunchCounterReset: out std_logic
        
        --debugTTCBridge: out std_logic_vector(17 downto 0)
        
    );
end ttcBridge;



architecture Behavioral of ttcBridge is

    attribute shreg_extract: string;
    attribute IODELAY_GROUP : STRING;

    signal reset: std_logic;
    signal idelayValue_reg: std_logic_vector(4 downto 0);
    signal idelayLoad: std_logic;
    signal idelayCurrentValue: std_logic_vector(4 downto 0);

    signal delayedData: std_logic;
    signal iddr_q1, iddr_q2: std_logic;
    signal deserializedData: std_logic_vector(6 downto 0);
    attribute shreg_extract of deserializedData: signal is "no";
    signal synchronizedData: std_logic_vector(3 downto 0);
    
    signal synchroErrorCounter: std_logic_vector(3 downto 0);
    signal synchroPointer: std_logic_vector(1 downto 0);
    
    signal errorCounter: std_logic_vector(7 downto 0);
    
    signal ttcL1Accept_early: std_logic;
    
    attribute IODELAY_GROUP of TTCBRIDGE_IDELAY: label is "bank14_iodelaygroup";


begin



    reset <= not sysclk_pll_locked;



    process(sysclk40) begin
        if rising_edge(sysclk40) then
        
            idelayValue_reg <= control(4 downto 0);
            if idelayValue_reg /= control(4 downto 0) then idelayLoad <= '1';
            else idelayLoad <= '0';
            end if;
             
        end if;
    end process;

   


TTCBRIDGE_IDELAY: IDELAYE2
   generic map (
      CINVCTRL_SEL => "FALSE",          -- Enable dynamic clock inversion (FALSE, TRUE)
      DELAY_SRC => "IDATAIN",           -- Delay input (IDATAIN, DATAIN)
      HIGH_PERFORMANCE_MODE => "FALSE", -- Reduced jitter ("TRUE"), Reduced power ("FALSE")
      IDELAY_TYPE => "VAR_LOAD",           -- FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      IDELAY_VALUE => 0,                -- Input delay tap setting (0-31)
      PIPE_SEL => "FALSE",              -- Select pipelined mode, FALSE, TRUE
      REFCLK_FREQUENCY => 200.0,        -- IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      SIGNAL_PATTERN => "DATA"          -- DATA, CLOCK input signal
   )
   port map (
      C => sysclk40,                     -- 1-bit input: Clock input
      IDATAIN => serialData,         -- 1-bit input: Data input from the I/O
      DATAOUT => delayedData,         -- 1-bit output: Delayed data output
      CNTVALUEIN => control(4 downto 0),   -- 5-bit input: Counter value input
      LD => idelayLoad,                   -- 1-bit input: Load IDELAY_VALUE input
      CNTVALUEOUT => status(4 downto 0), -- 5-bit output: Counter value output
      
      --unused ports
      CE => '0',                   -- 1-bit input: Active high enable increment/decrement input
      INC => '0',                 -- 1-bit input: Increment / Decrement tap delay input
      LDPIPEEN => '0',       -- 1-bit input: Enable PIPELINE register to load data input
      DATAIN => '0',           -- 1-bit input: Internal delay data input
      CINVCTRL => '0',       -- 1-bit input: Dynamic clock inversion input
      REGRST => '0'            -- 1-bit input: Active-high reset tap-delay input
   );





TTCBRIDGE_IDDR: IDDR
    generic map (
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED", -- "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED" 
      INIT_Q1 => '0',   -- Initial value of Q1: '0' or '1'
      INIT_Q2 => '0',   -- Initial value of Q2: '0' or '1'
      SRTYPE => "SYNC") -- Set/Reset type: "SYNC" or "ASYNC" 
   port map (
      C => sysclk80,    -- 1-bit clock input
      D => delayedData, -- 1-bit DDR data input
      Q1 => iddr_q1,    -- 1-bit output for positive edge of clock 
      Q2 => iddr_q2,    -- 1-bit output for negative edge of clock
      
      R => reset,       -- 1-bit reset
      CE => '1',        -- 1-bit clock enable input
      S => '0'          -- 1-bit set
      );




process(sysclk80) begin
    if rising_edge(sysclk80) then
        deserializedData(1) <= iddr_q1;
        deserializedData(0) <= iddr_q2;
        deserializedData(6 downto 2) <= deserializedData(4 downto 0);
    end if;
end process;



process(sysclk40) 
    variable offset: natural;
begin
    if rising_edge(sysclk40) then
        
        if synchronizedData(0) /= '1' then synchroErrorCounter <= std_logic_vector(unsigned(synchroErrorCounter)+1);
        else synchroErrorCounter <= "0000";
        end if;
        
        if synchroErrorCounter="1111" then synchroPointer <= std_logic_vector(unsigned(synchroPointer)+1);
        else synchroPointer <= synchroPointer;
        end if;
        
        offset := to_integer(unsigned(synchroPointer));
        synchronizedData <= deserializedData(offset+3 downto offset);
        
        if control(5)='1' then errorCounter <= x"00"; 
        elsif errorCounter = x"FF" then errorCounter <= errorCounter;
        elsif synchronizedData(0) /= '1' then errorCounter <= std_logic_vector(unsigned(errorCounter)+1);
        else errorCounter <= errorCounter;
        end if;
        
    end if;
end process;

    status(12 downto 5) <= errorCounter;

    ttcL1Accept <= synchronizedData(3);
    ttcBroadcast <=  synchronizedData(2);
    ttcBunchCounterReset <= synchronizedData(1); 



--    debugTTCBridge( 3 downto  0) <= synchronizedData;
--    debugTTCBridge( 7 downto  4) <= synchroErrorCounter;
--    debugTTCBridge( 9 downto  8) <= synchroPointer;
--    debugTTCBridge(17 downto 10) <= errorCounter;


ILA_TTC: entity work.ila_TTCBridge
    port map(
        clk => sysclk40,
        probe0 => synchronizedData,
        probe1 => synchroErrorCounter,
        probe2 => synchroPointer,
        probe3 => errorCounter
    );


end Behavioral;
