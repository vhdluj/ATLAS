----------------------------------------------------------------------------------
-- Company: Johannes Gutenberg-Universität Mainz
-- Engineer: Christian Kahra
-- 
-- Create Date: 14.07.2014 16:06:32
-- Design Name: L1TopoProcessor
-- Module Name: top_L1TopoProcessor - Behavioral
-- Project Name: Atlas Level-1 Topological Processor
-- Target Devices: 
-- Tool Versions: Vivado 14.2
-- Description: top module
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
--use work.L1TopoDataTypes.all;
use work.L1TopoGTConfiguration.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top_L1TopoProcessor is
    Port ( 
        GCK1_P, GCK1_N: in std_logic;
        GCK2_P, GCK2_N: in std_logic;
        
        
        RxP : in std_logic_vector(MGTHigh downto MGTLow);
        RxN : in std_logic_vector(MGTHigh downto MGTLow);
        TxP : out std_logic_vector(TxMGTHigh downto TxMGTLow);
        TxN : out std_logic_vector(TxMGTHigh downto TxMGTLow);
        MgtRefClk0P,MgtRefClk0N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz                      
        MgtRefClk1P,MgtRefClk1N: in std_logic_vector(QuadMax downto QuadLow);--usually 160.32 MHz
                
        
        CTRLBUS_P_01, CTRLBUS_N_01: in std_logic;
        
        CTRLBUS_P_03, CTRLBUS_N_03: in std_logic;
        CTRLBUS_P_04, CTRLBUS_N_04: in std_logic;
        CTRLBUS_P_06, CTRLBUS_N_06: in std_logic;
        CTRLBUS_P_08, CTRLBUS_N_08: in std_logic;
        CTRLBUS_P_19, CTRLBUS_N_19: in std_logic;
        
        CTRLBUS_P_10, CTRLBUS_N_10: out std_logic;
        CTRLBUS_P_11, CTRLBUS_N_11: out std_logic;
        CTRLBUS_P_12, CTRLBUS_N_12: out std_logic;
        CTRLBUS_P_13, CTRLBUS_N_13: in std_logic;
        CTRLBUS_P_14, CTRLBUS_N_14: in std_logic;
        CTRLBUS_P_15, CTRLBUS_N_15: in std_logic;
        CTRLBUS_P_16, CTRLBUS_N_16: in std_logic;
        CTRLBUS_P_17, CTRLBUS_N_17: in std_logic
        
--        EXT_V7_P_02, EXT_V7_N_02: out std_logic;
--        EXT_V7_P_03, EXT_V7_N_03: out std_logic;
--        EXT_V7_P_04, EXT_V7_N_04: out std_logic;
--        EXT_V7_P_05, EXT_V7_N_05: out std_logic;
--        EXT_V7_P_06, EXT_V7_N_06: out std_logic;
--        EXT_V7_P_07, EXT_V7_N_07: out std_logic;
--        EXT_V7_P_08, EXT_V7_N_08: out std_logic;
--        EXT_V7_P_09, EXT_V7_N_09: out std_logic;
--        EXT_V7_P_10, EXT_V7_N_10: out std_logic;
--        EXT_V7_P_11, EXT_V7_N_11: out std_logic;
--        EXT_V7_P_12, EXT_V7_N_12: out std_logic;
--        EXT_V7_P_13, EXT_V7_N_13: out std_logic;
--        EXT_V7_P_14, EXT_V7_N_14: out std_logic;
--        EXT_V7_P_15, EXT_V7_N_15: out std_logic;
--        EXT_V7_P_16, EXT_V7_N_16: out std_logic;
--        EXT_V7_P_17, EXT_V7_N_17: out std_logic
        
    );
end top_L1TopoProcessor;

architecture Behavioral of top_L1TopoProcessor is

    signal gck1: std_logic;
    signal gck2: std_logic;
    signal sysclk40: std_logic;
    signal sysclk80: std_logic;
    signal sysclk160: std_logic;
    signal sysclk200: std_logic;
    signal sysclk320: std_logic;
    
    signal gck_mmcm_locked: std_logic;

    signal ctrlbus_in, ctrlbus_in_p, ctrlbus_in_n: std_logic_vector(4 downto 0);
    signal ctrlbus_out, ctrlbus_out_p, ctrlbus_out_n: std_logic_vector(2 downto 0);
    
--    signal ttc, ttc_p, ttc_n: std_logic;
--    signal L1Accept, ttc_bunchcounter_reset, ttc_broadcast_01xxxx: std_logic; 

--    signal results: std_logic_vector(31 downto 0);
--    signal ctp, ctp_p, ctp_n: std_logic_vector(15 downto 0);

    signal idelay_inc, idelay_inc_p, idelay_inc_n: std_logic_vector(4 downto 0);
    
    
--    signal datasource: std_logic_vector(35 downto 0);
--    signal pbs_results: std_logic_vector(31 downto 0);

    signal dataToSpy: arraySLV36(MGTHigh downto MGTLow);
    signal dataToPlayback: arraySLV36(MGTHigh downto MGTLow);
    signal enablePlayback: std_logic;

begin


--input mapping

--    ttc_p <= CTRLBUS_P_01;
--    ttc_n <= CTRLBUS_N_01;

    idelay_inc_p(0) <= CTRLBUS_P_03;
    idelay_inc_n(0) <= CTRLBUS_N_03;
    idelay_inc_p(1) <= CTRLBUS_P_04;
    idelay_inc_n(1) <= CTRLBUS_N_04;
    idelay_inc_p(2) <= CTRLBUS_P_06;
    idelay_inc_n(2) <= CTRLBUS_N_06;
    idelay_inc_p(3) <= CTRLBUS_P_08;
    idelay_inc_n(3) <= CTRLBUS_N_08;
    idelay_inc_p(4) <= CTRLBUS_P_19;
    idelay_inc_n(4) <= CTRLBUS_N_19;

    ctrlbus_in_p(0)  <= CTRLBUS_P_13;
	ctrlbus_in_n(0)  <= CTRLBUS_N_13;
	ctrlbus_in_p(1)  <= CTRLBUS_P_14;
	ctrlbus_in_n(1)  <= CTRLBUS_N_14;
	ctrlbus_in_p(2)  <= CTRLBUS_P_15;
	ctrlbus_in_n(2)  <= CTRLBUS_N_15;
	ctrlbus_in_p(3)  <= CTRLBUS_P_16;
    ctrlbus_in_n(3)  <= CTRLBUS_N_16;
    ctrlbus_in_p(4)  <= CTRLBUS_P_17;
    ctrlbus_in_n(4)  <= CTRLBUS_N_17;




--input buffer

GCK1_IBUFGDS: IBUFGDS
	port map(
		I  => GCK1_P,
		IB => GCK1_N,
		O  => gck1
);


GCK2_IBUFGDS: IBUFGDS
	port map(
		I  => GCK2_P,
		IB => GCK2_N,
		O  => gck2
);


CTRLBUS_IN_IBUFDS_GEN: for i in 4 downto 0 generate
	CTRLBUS_IN_IBUFDS: IBUFDS
		port map(
			I  => ctrlbus_in_p(i),
			IB => ctrlbus_in_n(i),
			O  => ctrlbus_in(i)
		);
	end generate;


--TTC_IBUFDS: IBUFDS
--    port map(
--        I => ttc_p,
--        IB => ttc_n,
--        O => ttc
--    );

IDELAY_INC_IBUFDS_GEN: for i in 4 downto 0 generate
    IDELAY_INC_IBUFDS: IBUFDS
        port map(
            I => idelay_inc_p(i),
            IB => idelay_inc_n(i),
            O => idelay_inc(i)
        );
end generate;





--sub modules

clk: entity work.clocks
	port map(
		gck1			=> gck1,
		gck2			=> gck2,
		sysclk40_out	=> sysclk40,
		sysclk80_out	=> sysclk80,
		sysclk160_out	=> sysclk160,
		sysclk200_out	=> sysclk200,
		sysclk320_out	=> sysclk320,
		
		gck_mmcm_locked_out => gck_mmcm_locked
	); 


ipb: entity work.extended_ipbus
    port map(
        sysclk40 => sysclk40,
        sysclk80 => sysclk80,
        sysclk160 => sysclk160,
        sysclk200 => sysclk200,
        
        gck_mmcm_locked => gck_mmcm_locked,
        
        ctrlbus_in => ctrlbus_in,
        ctrlbus_out => ctrlbus_out,
                
        idelay_inc => idelay_inc,
        
        dataToSpy => dataToSpy,
        dataToPlayback => dataToPlayback,
        enablePlayback => enablePlayback 
        
--        datasource => datasource,
--        results => pbs_results
    );



andreas: entity work.Topo485T_690T
    port map(
        RxP => RxP,
        RxN => RxN,
        TxP => TxP,
        TxN => TxN,
        MgtRefClk0P => MgtRefClk0P,
        MgtRefClk0N => MgtRefClk0N,
        MgtRefClk1P => MgtRefClk1P,
        MgtRefClk1N => MgtRefClk1N,
        SysClk40 => sysclk40,
        SysClk80 => sysclk80,
        SysClk160 => sysclk160,
        SysClk320 => sysclk320,
--        ChannelControl => ChannelControl,
--        QuadControl => QuadControl,--
--        ChannelStatus => ChannelStatus,--
--        DataShift40MHz => DataShift40MHz,--
--        CRCError_Amount    =>CRCError_Amount,
        dataToSpy => dataToSpy,
        dataToPlayback => dataToPlayback,
        enablePlayback => enablePlayback       
    );





--infrastructure: entity work.infrastructure
--    port map(
--        sysclk40 => sysclk40,
--        sysclk160 => sysclk160,
        
--        playbackspy_control => playbackspy_control,
--        playbackspyOnInput => playbackspyOnInput,  
--        spiedDataOfInput => spiedDataOfInput,
        
--        dataToSpy => dataToSpy,
--        dataToPlayback => dataToPlayback,
--        enablePlayback => enablePlayback        
--    );




--output buffer

CTRLBUS_OUT_OBUFDS_GEN: for i in 2 downto 0 generate
	CTRLBUS_OUT_OBUFDS: OBUFDS
		port map(
			I  => ctrlbus_out(i),
			O  => ctrlbus_out_p(i),
			OB => ctrlbus_out_n(i)
		);
	end generate;


--RESULTS_ODDR_OBUFDS_GEN: for i in 15 downto 0 generate begin

--    results(i) <= '0';
--    results(16+i) <= '0';

--  RESULTS_ODDR: ODDR
--    generic map(
--      DDR_CLK_EDGE => "OPPOSITE_EDGE", -- "OPPOSITE_EDGE" or "SAME_EDGE" 
--      INIT => '0',   -- Initial value for Q port ('1' or '0')
--      SRTYPE => "SYNC") -- Reset Type ("ASYNC" or "SYNC")
--    port map (
--      Q => ctp(i),   -- 1-bit DDR output
--      C => sysclk40,    -- 1-bit clock input
--      CE => '1',  -- 1-bit clock enable input   
--      D1 => results(i),  -- 1-bit data input (positive edge)
--      D2 => results(16+i),  -- 1-bit data input (negative edge)
--      R => '0',    -- 1-bit reset input
--      S => '0'     -- 1-bit set input
--    );
    
    
--  RESULTS_OBUFDS: OBUFDS
--    port map(
--        I => ctp(i),
--        O => ctp_p(i),
--        OB => ctp_n(i)
--    );
    
--end generate;



--output mapping

    CTRLBUS_P_10 <= ctrlbus_out_p(0);
	CTRLBUS_N_10 <= ctrlbus_out_n(0);
	CTRLBUS_P_11 <= ctrlbus_out_p(1);
	CTRLBUS_N_11 <= ctrlbus_out_n(1);
	CTRLBUS_P_12 <= ctrlbus_out_p(2);
	CTRLBUS_N_12 <= ctrlbus_out_n(2);

--    EXT_V7_P_02 <= ctp_p(0);
--    EXT_V7_N_02 <= ctp_n(0);
--    EXT_V7_P_03 <= ctp_p(1);
--    EXT_V7_N_03 <= ctp_n(1);
--    EXT_V7_P_04 <= ctp_p(2);
--    EXT_V7_N_04 <= ctp_n(2);
--    EXT_V7_P_05 <= ctp_p(3);
--    EXT_V7_N_05 <= ctp_n(3);
--    EXT_V7_P_06 <= ctp_p(4);
--    EXT_V7_N_06 <= ctp_n(4);
--    EXT_V7_P_07 <= ctp_p(5);
--    EXT_V7_N_07 <= ctp_n(5);
--    EXT_V7_P_08 <= ctp_p(6);
--    EXT_V7_N_08 <= ctp_n(6);
--    EXT_V7_P_09 <= ctp_p(7);
--    EXT_V7_N_09 <= ctp_n(7);
--    EXT_V7_P_10 <= ctp_p(8);
--    EXT_V7_N_10 <= ctp_n(8);
--    EXT_V7_P_11 <= ctp_p(9);
--    EXT_V7_N_11 <= ctp_n(9);
--    EXT_V7_P_12 <= ctp_p(10);
--    EXT_V7_N_12 <= ctp_n(10);
--    EXT_V7_P_13 <= ctp_p(11);
--    EXT_V7_N_13 <= ctp_n(11);
--    EXT_V7_P_14 <= ctp_p(12);
--    EXT_V7_N_14 <= ctp_n(12);
--    EXT_V7_P_15 <= ctp_p(13);
--    EXT_V7_N_15 <= ctp_n(13);
--    EXT_V7_P_16 <= ctp_p(14);
--    EXT_V7_N_16 <= ctp_n(14);
--    EXT_V7_P_17 <= ctp_p(15);
--    EXT_V7_N_17 <= ctp_n(15);
        
        

--    EXT_V7_N_21 <= '0';

end Behavioral;
