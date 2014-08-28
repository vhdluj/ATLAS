library ieee;
use ieee.std_logic_1164.all;
use work.decode_8b10b_pkg.all;
--use work.encode_8b10b_pkg.all;

package s7_transmission_components is

component ddr_stability_checker is
        generic(
           SIMULATION : integer := 0
        );
	port (
		CLK_IN : in std_logic;
		RESET_IN : in std_logic;
		
		DATA_IN : in std_logic_vector(9 downto 0);
		START_CHECK_IN : in std_logic;
		CHECK_DONE_OUT : out std_logic;
		REGISTERED_DATA_OUT : out std_logic_vector(9 downto 0)
	);
	end component;

component aurora2_test_exdes is
   generic(
           USE_CHIPSCOPE          : integer :=   0;
           SIM_GTRESET_SPEEDUP    : string  :=  "TRUE"     
         );
    port (

    -- User I/O

            RESET             : in std_logic;
            HARD_ERR          : out std_logic;
            SOFT_ERR          : out std_logic;
            FRAME_ERR         : out std_logic;
            ERR_COUNT         : out std_logic_vector(0 to 7);


            LANE_UP           : out std_logic;
            CHANNEL_UP        : out std_logic;

           INIT_CLK_P         : in std_logic;
           INIT_CLK_N         : in std_logic;
           GT_RESET_IN        : in  std_logic;

    -- Clocks

           GTXQ2_P    : in  std_logic;
           GTXQ2_N    : in  std_logic;

		   TX_D            : in  std_logic_vector(0 to 15);
		   TX_REM          : in  std_logic;    
		   TX_SOF_N        : in  std_logic;
		   TX_EOF_N        : in  std_logic;
		   TX_SRC_RDY_N    : in  std_logic;
		   TX_DST_RDY_N    : out   std_logic; 
clk_out : out std_logic;
   -- GT I/O

            RXP               : in std_logic;
            RXN               : in std_logic;
            TXP               : out std_logic;
            TXN               : out std_logic

         );
end component;

component ReceiversWrapper is
   GENERIC(
   	LINKS_NUMBER : integer := 8;
        SIMULATION : integer := 0;
   	IOSTANDARD_CONF : string
        
   );
   PORT(
	CLK_BIT_IN      : in std_logic;
	CLK_WORD_IN     : in std_logic;
	CLK_DELAY_IN    : in std_logic;
	RESET        : in std_logic;
	
	DATA_OUT        : out std_logic_vector(LINKS_NUMBER*8-1 downto 0);
	DATA_VALID_OUT  : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	DATA_KCTRL_OUT  : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	LINK_SYNCED_OUT : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	CRC_VALID_OUT   : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	
	DATA_PIN_P_IN   : in std_logic_vector(LINKS_NUMBER -1 downto 0);
	DATA_PIN_N_IN   : in std_logic_vector(LINKS_NUMBER -1 downto 0)
   );
end component;

component TransmittersWrapper is
   GENERIC(
   	LINKS_NUMBER : integer := 8
   );
   PORT(
    RESET : in std_logic;
    CLK_BIT_IN     : in std_logic;
	CLK_WORD_IN    : in std_logic;--10 times lower frequnecy than CLK_BIT_IN
	
	DATA_IN        : in std_logic_vector(8*LINKS_NUMBER-1 downto 0);
	DATA_VALID_IN  : in std_logic_vector(LINKS_NUMBER-1 downto 0);
	DATA_KCTRL_IN  : in std_logic_vector(LINKS_NUMBER-1 downto 0);
	
	DATA_PIN_P_OUT : out std_logic_vector(LINKS_NUMBER-1 downto 0);
	DATA_PIN_N_OUT : out std_logic_vector(LINKS_NUMBER-1 downto 0)
   );
end component;

component slink_header_builder is
	port (
		CLK_IN         : in std_logic;
		RESET_IN       : in std_logic;
		
		L1_ACCEPTED_IN       : in std_logic;
		HEADERS_WAITING_OUT  : out std_logic;
		
		MAJOR_FORMAT_VERSION_IN : in std_logic_vector(15 downto 0);
		MINOR_FORMAT_VERSION_IN : in std_logic_vector(15 downto 0);
		SUB_DETECTOR_ID_IN      : in std_logic_vector(7 downto 0);
		MODULE_ID_IN            : in std_logic_vector(15 downto 0);
		ECRID_IN                : in std_logic_vector(7 downto 0);
		ROD_L1ID_IN             : in std_logic_vector(23 downto 0);
		ROD_BCN_IN              : in std_logic_vector(11 downto 0);
		ORBIT_CTR_IN            : in std_logic_vector(15 downto 0);
		SEQUENCE_NR_IN          : in std_logic_vector(11 downto 0);
		TRIGGER_TYPE_IN         : in std_logic_vector(3 downto 0);
		STATUS_WORD1_IN         : in std_logic_vector(31 downto 0);
		STATUS_WORD2_IN         : in std_logic_vector(31 downto 0);
		
		SLINK_CLK_IN      : in std_logic;
		SLINK_DATA_OUT    : out std_logic_vector(15 downto 0);
		SLINK_DATA_DV_OUT : out std_logic
	);
end component;

component ddr_aurora_buffer is
	port (
		CLK_DDR_IN    : in std_logic;
		CLK_AURORA_IN : in std_logic;
		RESET_IN      : in std_logic;
		SYNCED_IN     : in std_logic;
		
		DDR_DATA_IN   : in std_logic_vector(7 downto 0);
		DDR_DV_IN     : in std_logic;
		
		AURORA_DATA_OUT      : out std_logic_vector(0 to 15);
		AURORA_SOF_N_OUT     : out std_logic;
		AURORA_EOF_N_OUT     : out std_logic;
		AURORA_SRC_RDY_N_OUT : out std_logic;
		AURORA_DST_RDY_N_IN  : in std_logic 
	);
end component;

component fifo_8kx9x18 IS
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
end component;

component signal_sync is
  generic(
    WIDTH : integer := 1;     --
    DEPTH : integer := 3
    );
  port(
    RESET    : in  std_logic; --Reset is neceessary to avoid optimization to shift register
    CLK0     : in  std_logic;                          --clock for first FF
    CLK1     : in  std_logic;                          --Clock for other FF
    D_IN     : in  std_logic_vector(WIDTH-1 downto 0); --Data input
    D_OUT    : out std_logic_vector(WIDTH-1 downto 0)  --Data output
    );
end component;

component ddr_enc_transmitter is
port (
	CLK_BIT_IN     : in std_logic;
	CLK_WORD_IN    : in std_logic;
	RESET_IN       : in std_logic;
	
	DATA_IN        : in std_logic_vector(7 downto 0);
	DATA_VALID_IN  : in std_logic;
	DATA_KCTRL_IN  : in std_logic;
	
	DATA_PIN_P_OUT : out std_logic;
	DATA_PIN_N_OUT : out std_logic
);
end component;

component ddr_enc_receiver is
generic (
        SIMULATION           : integer := 0;
	IOSTANDARD_CONF      : character := '0'
);
port (
	CLK_BIT_IN      : in std_logic;
	CLK_WORD_IN     : in std_logic;
	CLK_DELAY_IN    : in std_logic;
	DELAY_READY_IN  : in std_logic;
	RESET_IN        : in std_logic;
	
	DATA_OUT        : out std_logic_vector(7 downto 0);
	DATA_VALID_OUT  : out std_logic;
	DATA_KCTRL_OUT  : out std_logic;
	LINK_SYNCED_OUT : out std_logic;
	CRC_VALID_OUT   : out std_logic;
	
	DATA_PIN_P_IN   : in std_logic;
	DATA_PIN_N_IN   : in std_logic
);
end component;

	component crcDecoder is 
   port ( data_in : in std_logic_vector (7 downto 0);
     crc_en , rst, clk : in std_logic;
     data_out : out std_logic_vector (7 downto 0);
     crcOK : out std_logic
     );
end component;

component crc is 
   port ( data_in : in std_logic_vector (7 downto 0);
     crc_en , rst, clk : in std_logic;
     data_out : out std_logic_vector (7 downto 0);
     enable_out: out std_logic);
end component;

component decode_8b10b_lut_base IS
  GENERIC (
    C_HAS_CODE_ERR   : INTEGER := 0;
    C_HAS_DISP_ERR   : INTEGER := 0;
    C_HAS_DISP_IN    : INTEGER := 0;
    C_HAS_ND         : INTEGER := 0;
    C_HAS_SYM_DISP   : INTEGER := 0;
    C_HAS_RUN_DISP   : INTEGER := 0;
    C_SINIT_DOUT     : STRING  := "00000000";
    C_SINIT_KOUT     : INTEGER := 0;
    C_SINIT_RUN_DISP : INTEGER := 0
    );
  PORT (
    CLK              : IN  STD_LOGIC                     := '0';
    DIN              : IN  STD_LOGIC_VECTOR(9 DOWNTO 0)  := (OTHERS => '0');
    DOUT             : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)  ;
    KOUT             : OUT STD_LOGIC                     ;

    CE               : IN  STD_LOGIC                     := '0';
    DISP_IN          : IN  STD_LOGIC                     := '0';
    SINIT            : IN  STD_LOGIC                     := '0';
    CODE_ERR         : OUT STD_LOGIC                     := '0';
    DISP_ERR         : OUT STD_LOGIC                     := '0';
    ND               : OUT STD_LOGIC                     := '0';
    RUN_DISP         : OUT STD_LOGIC                     ;
    SYM_DISP         : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END component;

component encode_8b10b_lut_base IS
  GENERIC (
    C_HAS_DISP_IN     :     INTEGER :=0 ;
    C_HAS_FORCE_CODE  :     INTEGER :=0 ;
    C_FORCE_CODE_VAL  :     STRING  :="1010101010" ;
    C_FORCE_CODE_DISP :     INTEGER :=0 ;
    C_HAS_ND          :     INTEGER :=0 ;
    C_HAS_KERR        :     INTEGER :=0
    );
  PORT (
    DIN               : IN  STD_LOGIC_VECTOR(7 DOWNTO 0) :=(OTHERS => '0');
    KIN               : IN  STD_LOGIC                    :='0' ;
    CLK               : IN  STD_LOGIC                    :='0' ;
    DOUT              : OUT STD_LOGIC_VECTOR(9 DOWNTO 0) :=
                        str_to_slv(C_FORCE_CODE_VAL, 10) ;
    CE                : IN  STD_LOGIC                    :='0' ;
    FORCE_CODE        : IN  STD_LOGIC                    :='0' ;
    FORCE_DISP        : IN  STD_LOGIC                    :='0' ;
    DISP_IN           : IN  STD_LOGIC                    :='0' ;
    DISP_OUT          : OUT STD_LOGIC                    :=
                        bint_2_sl(C_FORCE_CODE_DISP);
    KERR              : OUT STD_LOGIC                    :='0' ;
    ND                : OUT STD_LOGIC                    :='0'
    );
END component;

component input_module is
generic (
  SIMULATION : integer := 0;
  IOSTANDARD_CONF : character := '0'
);
port (
	CLK_IN         : in std_logic;
	CLK_DLY_IN     : in std_logic;
	DELAY_READY_IN : in std_logic;
	CLKX8_IN       : in std_logic;
	RESET_IN       : in std_logic;
	DATA_PIN_P_IN  : in std_logic;
	DATA_PIN_N_IN  : in std_logic;
	DATA_OUT       : out std_logic_vector(9 downto 0);
	REC_CLK_OUT    : out std_logic;
	SYNCED_OUT     : out std_logic
);
end component;

component output_module is
port (
	CLK_IN         : in std_logic;
	CLKX8_IN       : in std_logic;
	RESET_IN       : in std_logic;
	DATA_PIN_P_OUT : out std_logic;
	DATA_PIN_N_OUT : out std_logic;
	DATA_IN        : in std_logic_vector(9 downto 0);
	REC_CLK_OUT    : out std_logic;
	SYNCED_OUT     : out std_logic
);
end component;
		
end package s7_transmission_components;
