library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity ddr_links_wrapper is
generic (
	DELAY_GROUP_NAME : string := "delay_group";
	AVAILABLE_LVDS_LINES : integer range 0 to 20 := 1;
	EXCLUDE_DCM_IDELAY_CTRL : boolean 
);
port (
	GCLK_40_IN         : in std_logic; -- global buffer input
	DELAY_CLK_IN       : in std_logic; -- global clock for IDELAY components
	EXT_DDR_CLK_IN     : in std_logic; -- external word clock (only if EXCLUDE... is true)
	EXT_DDR_CLK_X8_IN  : in std_logic; -- external word clock (only if EXCLUDE... is true)
	RESET_IN           : in std_logic;
	
	LVDS_IN_P          : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	LVDS_IN_N          : in std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	
	LINKS_SYNCED_OUT   : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
	RESET_TRANS_OUT    : out std_logic;
	
	DATA_OUT           : out std_logic_vector(AVAILABLE_LVDS_LINES * 8 - 1 downto 0);
	DATA_VALID_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0);
        DATA_KCTRL_OUT     : out std_logic_vector(AVAILABLE_LVDS_LINES - 1 downto 0)
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
	
	RESET_TRANS_OUT <= not dcm_locked;

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
		
		DELAY_INC_IN         => local_delay_inc,
		DELAY_CE_IN          => local_delay_ce,
		CTRL_READY_OUT       => local_ctrl_ready,
		DCM_LOCKED_OUT       => dcm_locked
	);

	lvds_gen : for i in 0 to AVAILABLE_LVDS_LINES - 1 generate
	
		int_clk : if EXCLUDE_DCM_IDELAY_CTRL = FALSE generate
			clk_80_i  <= clk_80;
			clk_400_i <= clk_400;
		end generate;
		ext_clk : if EXCLUDE_DCM_IDELAY_CTRL = TRUE generate
			clk_80_i  <= EXT_DDR_CLK_IN;
			clk_400_i <= EXT_DDR_CLK_X8_IN;
		end generate;
	
		dec_inst : entity work.ddr_decoder_module
		port map(
			RESET_IN          => internal_reset,
			DCM_DDR_CLK_IN    => clk_80_i,
			
			ENC_DATA_IN       => local_enc_data((i + 1) * 10 - 1 downto i * 10),
			DATA_OUT          => local_data((i + 1) * 8 - 1 downto i * 8),
			DATA_VALID_OUT    => local_valid(i),
                        DATA_KCTRL_OUT    => local_ktrl(i),
                        LINK_IS_SYNC      => local_synced(i)
                        
		);
		
		in_inst : entity work.ddr_input_module
		port map(
			RESET_IN          => internal_reset,
			DCM_DDR_CLK_IN    => clk_80_i,
			DCM_DDR_CLK_X8_IN => clk_400_i,
			
			DATA_LINE_IN      => local_data_lines(i),
			DELAY_CE_OUT      => local_delay_ce(i),
			DELAY_INC_OUT     => local_delay_inc(i),
			
			CTRL_READY_IN     => local_ctrl_ready,
			
			DATA_OUT          => local_enc_data((i + 1) * 10 - 1 downto i * 10),
			SYNCED_OUT        => local_synced(i)
		);
		
		process(clk_80_i)
		begin
			if rising_edge(clk_80_i) then
				if (local_data((i + 1) * 8 - 1 downto i * 8) /= x"1c" and local_valid(i) = '0') then
					LINKS_SYNCED_OUT(i) <= '0';
				else
					LINKS_SYNCED_OUT(i) <= local_synced(i);
				end if;
			end if;
		end process;
			
		DATA_OUT((i + 1) * 8 - 1 downto i * 8) <= local_data((i + 1) * 8 - 1 downto i * 8);
		DATA_VALID_OUT(i) <= local_valid(i);
	
	end generate lvds_gen;

end Behavioral;

