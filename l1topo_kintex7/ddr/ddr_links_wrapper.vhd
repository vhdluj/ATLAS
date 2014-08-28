
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ddr_links_wrapper is
generic (
	DELAY_GROUP_NAME : string := "delay_group";
	AVAILABLE_LVDS_LINES : integer range 0 to 20 := 1;
	EXCLUDE_DCM_IDELAY_CTRL : boolean;
	MANUAL_SYNC : boolean;
   SIMULATION : boolean := FALSE
);
port (
	GCLK_40_IN         : in std_logic; -- global buffer input
	DELAY_CLK_IN       : in std_logic; -- global clock for IDELAY components
	EXT_DDR_CLK_IN     : in std_logic; -- external word clock (only if EXCLUDE... is true)
	EXT_DDR_CLK_X8_IN  : in std_logic; -- external word clock (only if EXCLUDE... is true)
	INT_DDR_CLK_OUT    : out std_logic;  -- internally generated word clock output
	RESET_IN           : in std_logic;
	
	LVDS_IN_P          : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	LVDS_IN_N          : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	
	LINKS_SYNCED_OUT   : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	RESET_TRANS_OUT    : out std_logic;
	
	DELAY_VALS_IN      : in std_logic_vector(AVAILABLE_LVDS_LINES * 5 - 1 downto 0);
	DELAY_VALS_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES * 5 - 1 downto 0);
	DELAY_LOAD_IN      : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	
	DATA_OUT           : out std_logic_vector(AVAILABLE_LVDS_LINES * 8 - 1 downto 0);
	DATA_VALID_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
   DATA_KCTRL_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
    
        	-- debug ports:
	DBG_STATE_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES * 4 - 1 downto 0);
	DBG_REG_DATA_OUT  : out std_logic_vector(AVAILABLE_LVDS_LINES * 10 - 1 downto 0);
	DBG_BITSLIP_OUT   : out std_logic_vector(AVAILABLE_LVDS_LINES * 4 - 1 downto 0);
	DBG_INC_OUT       : out std_logic_vector(AVAILABLE_LVDS_LINES * 8 - 1 downto 0);
	DBG_PAUSE_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES * 8 - 1 downto 0);
	DBG_STEP_OUT      : out std_logic_vector(AVAILABLE_LVDS_LINES * 8 - 1 downto 0);
	DBG_RETRY_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES * 8 - 1 downto 0)

);
end ddr_links_wrapper;

architecture Behavioral of ddr_links_wrapper is

signal clk_80, clk_400 : std_logic;
signal clk_80_i, clk_400_i : std_logic;
signal local_data_lines : std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
signal local_delay_inc, local_delay_ce : std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
signal local_enc_data : std_logic_vector(AVAILABLE_LVDS_LINES * 10 - 1 downto 0);
signal local_ctrl_ready, internal_reset, dcm_locked : std_logic;
signal local_data : std_logic_vector(AVAILABLE_LVDS_LINES * 8 - 1 downto 0);
signal local_valid : std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
signal local_ktrl : std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
signal local_synced : std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);

begin

	internal_reset <= '1' when RESET_IN = '1' or dcm_locked = '0' else '0';
	
	RESET_TRANS_OUT <= not dcm_locked and local_ctrl_ready;

	bridge_inst : entity work.ddr_bank_bridge
	generic map( 
		DELAY_GROUP_NAME        => DELAY_GROUP_NAME,
		AVAILABLE_LVDS_LINES    => AVAILABLE_LVDS_LINES,
		EXCLUDE_DCM_IDELAY_CTRL => EXCLUDE_DCM_IDELAY_CTRL
	)
	port map(
		GCLK_40_IN           => GCLK_40_IN, 
		DELAY_CLK_IN         => DELAY_CLK_IN,
		EXT_DDR_CLK_IN       => EXT_DDR_CLK_IN,
		DCM_DDR_CLK_OUT      => clk_80,
		DCM_DDR_CLK_X8_OUT   => clk_400,
		RESET_IN             => internal_reset,
		
		LVDS_IN_P            => LVDS_IN_P,
		LVDS_IN_N            => LVDS_IN_N,
		DATA_LINES_OUT       => local_data_lines,
		
		DELAY_VALS_IN      	 => DELAY_VALS_IN,
		DELAY_VALS_OUT       => DELAY_VALS_OUT,
		DELAY_LOAD_IN      	 => DELAY_LOAD_IN,
		
		DELAY_INC_IN         => local_delay_inc,
		DELAY_CE_IN          => local_delay_ce,
		CTRL_READY_OUT       => local_ctrl_ready,
		DCM_LOCKED_OUT       => dcm_locked
	);

	lvds_gen : for i in 0 to AVAILABLE_LVDS_LINES - 1 generate
	
		int_clk : if EXCLUDE_DCM_IDELAY_CTRL = FALSE generate
			clk_80_i        <= clk_80;
			clk_400_i       <= clk_400;
			INT_DDR_CLK_OUT <= clk_80;
		end generate;
		ext_clk : if EXCLUDE_DCM_IDELAY_CTRL = TRUE generate
			clk_80_i        <= EXT_DDR_CLK_IN;
			clk_400_i       <= EXT_DDR_CLK_X8_IN;
			INT_DDR_CLK_OUT <= '0';
		end generate;
                	
		in_inst : entity work.ddr_input_module
      generic map (
			MANUAL_SYNC => MANUAL_SYNC,
			SIMULATION => SIMULATION)
		port map(
			RESET_IN          => internal_reset,
			DCM_DDR_CLK_IN    => clk_80_i,
			DCM_DDR_CLK_X8_IN => clk_400_i,
			
			DATA_LINE_IN      => local_data_lines(i),
			DELAY_CE_OUT      => local_delay_ce(i),
			DELAY_INC_OUT     => local_delay_inc(i),
			
			CTRL_READY_IN     => local_ctrl_ready,
			
			DELAY_LOAD_IN     => DELAY_LOAD_IN(i),
			
			DATA_OUT          => local_enc_data((i + 1) * 8 - 1 downto i * 8),
			DATA_KCTRL_OUT    => local_ktrl(i),
			DATA_VALID_OUT    => local_valid(i),
			SYNCED_OUT        => local_synced(i),
                        
         	DBG_STATE_OUT     => DBG_STATE_OUT((i + 1) * 4 - 1 downto i * 4),
			DBG_REG_DATA_OUT  => DBG_REG_DATA_OUT((i + 1) * 10 - 1 downto i * 10),
			DBG_BITSLIP_OUT   => DBG_BITSLIP_OUT((i + 1) * 4 - 1 downto i * 4),
			DBG_INC_OUT       => DBG_INC_OUT((i + 1) * 8 - 1 downto i * 8),
			DBG_PAUSE_OUT     => DBG_PAUSE_OUT((i + 1) * 8 - 1 downto i * 8),
			DBG_STEP_OUT      => DBG_STEP_OUT((i + 1) * 8 - 1 downto i * 8),
			DBG_RETRY_OUT     => DBG_RETRY_OUT((i + 1) * 8 - 1 downto i * 8)
		);

		LINKS_SYNCED_OUT(i) <= local_synced(i);
                
		DATA_OUT((i + 1) * 8 - 1 downto i * 8) <= local_enc_data((i + 1) * 8 - 1 downto i * 8);
		DATA_VALID_OUT(i) <= local_valid(i);
        DATA_KCTRL_OUT(i) <= local_ktrl(i);
                
	end generate lvds_gen;

end Behavioral;
