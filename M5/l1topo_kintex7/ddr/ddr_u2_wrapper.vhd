library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

use work.rod_l1_topo_types_const.all;

entity ddr_u2_wrapper is
generic (
	SIMULATION		: boolean := false;
	VIVADO			: boolean := false;
	LINES_ON_BANK16 : integer range 0 to 16 := 5;
	LINES_ON_BANK18	: integer range 0 to 16 := 8
);
port(
	GCK40_IN : in std_logic;
	DELAY_CTRL_CLK_IN : in std_logic;
	DDR_RST_IN : in std_logic;
	
	
	DATA_BANK18_IN_P, DATA_BANK18_IN_N : in std_logic_vector(LINES_ON_BANK18 - 1 downto 0);
	DATA_BANK16_IN_P, DATA_BANK16_IN_N : in std_logic_vector(LINES_ON_BANK16 - 1 downto 0);
	
	DATA_OUT		: out std_logic_vector(8 * 8 - 1 downto 0);
	DATA_DV_OUT		: out std_logic_vector(7 downto 0); 
	DATA_KCTRL_OUT	: out std_logic_vector(7 downto 0);
	
	DDR_SYNCED_OUT : out std_logic;
	
	DEBUG_OUT : out std_logic_vector(63 downto 0)	
);
end ddr_u2_wrapper;

architecture rtl of ddr_u2_wrapper is
	
	signal ones : std_logic_vector(7 downto 0);
	
	signal ddr_receivers_synced_bank18 : std_logic_vector(LINES_ON_BANK18 - 1 downto 0);
	signal ddr_receivers_synced_bank16 : std_logic_vector(LINES_ON_BANK16 - 1 downto 0);
	
	signal ddr_data_from_bank16 : std_logic_vector(LINES_ON_BANK16 * 8 - 1 downto 0);
	signal ddr_data_from_bank18 : std_logic_vector(LINES_ON_BANK18 * 8 - 1 downto 0);
	signal ddr_dv_from_bank16 : std_logic_vector(LINES_ON_BANK16 - 1 downto 0);
	signal ddr_dv_from_bank18 : std_logic_vector(LINES_ON_BANK18 - 1 downto 0);
	signal ddr_kctrl_from_bank16 : std_logic_vector(LINES_ON_BANK16 - 1 downto 0);
	signal ddr_kctrl_from_bank18 : std_logic_vector(LINES_ON_BANK18 - 1 downto 0);
	
	signal links_synced_u2 : std_logic_vector(7 downto 0);

begin
	
DEBUG_OUT <= (others => '0');

ones <= (others => '1');

ddr_bank18 : entity work.ddr_links_wrapper
generic map(
                DELAY_GROUP_NAME		=> "bank18_delay_group",
                AVAILABLE_LVDS_LINES	=> LINES_ON_BANK18,
                EXCLUDE_DCM_IDELAY_CTRL	=> FALSE,
                MANUAL_SYNC				=> TRUE,
                SIMULATION				=> SIMULATION,
                VIVADO					=> VIVADO
)
port map(
                GCLK_40_IN         => GCK40_IN,
                DELAY_CLK_IN       => DELAY_CTRL_CLK_IN,
                EXT_DDR_CLK_IN     => '0',
                EXT_DDR_CLK_X8_IN  => '0',
                INT_DDR_CLK_OUT    => open,
                RESET_IN           => DDR_RST_IN,
                
                LVDS_IN_P          => DATA_BANK18_IN_P,
                LVDS_IN_N          => DATA_BANK18_IN_N,
               
                LINKS_SYNCED_OUT   => ddr_receivers_synced_bank18,
                RESET_TRANS_OUT    => open,
                
                DELAY_VALS_IN      => (others => '0'),
                DELAY_LOAD_IN      => (others => '0'),
                DELAY_VALS_OUT     => open,
                               
                DATA_OUT           => ddr_data_from_bank18,
                DATA_VALID_OUT     => ddr_dv_from_bank18,
                DATA_KCTRL_OUT     => ddr_kctrl_from_bank18,
                
                DBG_STATE_OUT    => open,
                DBG_REG_DATA_OUT => open,
                DBG_BITSLIP_OUT  => open,
                DBG_INC_OUT      => open,
                DBG_PAUSE_OUT    => open,
                DBG_STEP_OUT     => open,
                DBG_RETRY_OUT    => open
);
 
ddr_bank16 : entity work.ddr_links_wrapper
generic map(
                DELAY_GROUP_NAME		=> "bank16_delay_group",
                AVAILABLE_LVDS_LINES	=> LINES_ON_BANK16,
                EXCLUDE_DCM_IDELAY_CTRL	=> FALSE,
                MANUAL_SYNC				=> TRUE,
                SIMULATION				=> SIMULATION,
                VIVADO					=> VIVADO
)
port map(
                GCLK_40_IN         => GCK40_IN,
                DELAY_CLK_IN       => DELAY_CTRL_CLK_IN,
                EXT_DDR_CLK_IN     => '0',
                EXT_DDR_CLK_X8_IN  => '0',
                INT_DDR_CLK_OUT    => open,
                RESET_IN           => DDR_RST_IN,
               
                LVDS_IN_P          => DATA_BANK16_IN_P,
                LVDS_IN_N          => DATA_BANK16_IN_N,
               
                LINKS_SYNCED_OUT   => ddr_receivers_synced_bank16,
                RESET_TRANS_OUT    => open,           
                
                DELAY_VALS_IN      => (others => '0'),
                DELAY_LOAD_IN      => (others => '0'),
                DELAY_VALS_OUT     => open,                    
                
                DATA_OUT           => ddr_data_from_bank16,
                DATA_VALID_OUT     => ddr_dv_from_bank16,
                DATA_KCTRL_OUT     => ddr_kctrl_from_bank16,
                
                DBG_STATE_OUT    => open,
                DBG_REG_DATA_OUT => open,
                DBG_BITSLIP_OUT  => open,
                DBG_INC_OUT      => open,
                DBG_PAUSE_OUT    => open,
                DBG_STEP_OUT     => open,
                DBG_RETRY_OUT    => open
);

DDR_SYNCED_OUT <= '1' when (links_synced_u2 = ones) else '0';

--################### UGLY LINKS MAPPING

DATA_OUT(1 * 8 - 1 downto 0 * 8) <= ddr_data_from_bank16(1 * 8 - 1 downto 0 * 8);
DATA_OUT(2 * 8 - 1 downto 1 * 8) <= ddr_data_from_bank16(2 * 8 - 1 downto 1 * 8);
DATA_OUT(3 * 8 - 1 downto 2 * 8) <= ddr_data_from_bank18(5 * 8 - 1 downto 4 * 8);
DATA_OUT(4 * 8 - 1 downto 3 * 8) <= ddr_data_from_bank16(3 * 8 - 1 downto 2 * 8);
DATA_OUT(5 * 8 - 1 downto 4 * 8) <= ddr_data_from_bank16(4 * 8 - 1 downto 3 * 8);
DATA_OUT(6 * 8 - 1 downto 5 * 8) <= ddr_data_from_bank18(6 * 8 - 1 downto 5 * 8);
DATA_OUT(7 * 8 - 1 downto 6 * 8) <= ddr_data_from_bank18(7 * 8 - 1 downto 6 * 8);
DATA_OUT(8 * 8 - 1 downto 7 * 8) <= ddr_data_from_bank18(8 * 8 - 1 downto 7 * 8);
 
DATA_DV_OUT(0) <= ddr_dv_from_bank16(0);
DATA_DV_OUT(1) <= ddr_dv_from_bank16(1);
DATA_DV_OUT(2) <= ddr_dv_from_bank18(4);
DATA_DV_OUT(3) <= ddr_dv_from_bank16(2);
DATA_DV_OUT(4) <= ddr_dv_from_bank16(3);
DATA_DV_OUT(5) <= ddr_dv_from_bank18(5);
DATA_DV_OUT(6) <= ddr_dv_from_bank18(6);
DATA_DV_OUT(7) <= ddr_dv_from_bank18(7);

DATA_KCTRL_OUT(0) <= ddr_kctrl_from_bank16(0);
DATA_KCTRL_OUT(1) <= ddr_kctrl_from_bank16(1);
DATA_KCTRL_OUT(2) <= ddr_kctrl_from_bank18(4);
DATA_KCTRL_OUT(3) <= ddr_kctrl_from_bank16(2);
DATA_KCTRL_OUT(4) <= ddr_kctrl_from_bank16(3);
DATA_KCTRL_OUT(5) <= ddr_kctrl_from_bank18(5);
DATA_KCTRL_OUT(6) <= ddr_kctrl_from_bank18(6);
DATA_KCTRL_OUT(7) <= ddr_kctrl_from_bank18(7);

links_synced_u2(0) <= ddr_receivers_synced_bank16(0);
links_synced_u2(1) <= ddr_receivers_synced_bank16(1);
links_synced_u2(2) <= ddr_receivers_synced_bank18(4);
links_synced_u2(3) <= ddr_receivers_synced_bank16(2);
links_synced_u2(4) <= ddr_receivers_synced_bank16(3);
links_synced_u2(5) <= ddr_receivers_synced_bank18(5);
links_synced_u2(6) <= ddr_receivers_synced_bank18(6);
links_synced_u2(7) <= ddr_receivers_synced_bank18(7);

--dbg_ddr_state_u2(3 downto 0)   <= dbg_ddr_state_from16(3 downto 0);
--dbg_ddr_state_u2(7 downto 4)   <= dbg_ddr_state_from16(7 downto 4);
--dbg_ddr_state_u2(11 downto 8)  <= dbg_ddr_state_from18(19 downto 16);
--dbg_ddr_state_u2(15 downto 12) <= dbg_ddr_state_from16(11 downto 8);
--dbg_ddr_state_u2(19 downto 16) <= dbg_ddr_state_from16(15 downto 12);
--dbg_ddr_state_u2(23 downto 20) <= dbg_ddr_state_from18(23 downto 20);
--dbg_ddr_state_u2(27 downto 24) <= dbg_ddr_state_from18(27 downto 24);
--dbg_ddr_state_u2(31 downto 28) <= dbg_ddr_state_from18(31 downto 28);
--
--dbg_ddr_reg_u2(9 downto 0)   <= dbg_ddr_reg_from16(9 downto 0);
--dbg_ddr_reg_u2(19 downto 10) <= dbg_ddr_reg_from16(19 downto 10);
--dbg_ddr_reg_u2(29 downto 20) <= dbg_ddr_reg_from18(49 downto 40);
--dbg_ddr_reg_u2(39 downto 30) <= dbg_ddr_reg_from16(29 downto 20);
--dbg_ddr_reg_u2(49 downto 40) <= dbg_ddr_reg_from16(39 downto 30);
--dbg_ddr_reg_u2(59 downto 50) <= dbg_ddr_reg_from18(59 downto 50);
--dbg_ddr_reg_u2(69 downto 60) <= dbg_ddr_reg_from18(69 downto 60);
--dbg_ddr_reg_u2(79 downto 70) <= dbg_ddr_reg_from18(79 downto 70);
--
--dbg_ddr_bitslip_u2(3 downto 0)   <= dbg_ddr_bitslip_from16(3 downto 0);  
--dbg_ddr_bitslip_u2(7 downto 4)   <= dbg_ddr_bitslip_from16(7 downto 4);  
--dbg_ddr_bitslip_u2(11 downto 8)  <= dbg_ddr_bitslip_from18(19 downto 16);
--dbg_ddr_bitslip_u2(15 downto 12) <= dbg_ddr_bitslip_from16(11 downto 8); 
--dbg_ddr_bitslip_u2(19 downto 16) <= dbg_ddr_bitslip_from16(15 downto 12);
--dbg_ddr_bitslip_u2(23 downto 20) <= dbg_ddr_bitslip_from18(23 downto 20);
--dbg_ddr_bitslip_u2(27 downto 24) <= dbg_ddr_bitslip_from18(27 downto 24);
--dbg_ddr_bitslip_u2(31 downto 28) <= dbg_ddr_bitslip_from18(31 downto 28);
--
--dbg_ddr_inc_u2(7 downto 0)   <= dbg_ddr_inc_from16(7 downto 0);
--dbg_ddr_inc_u2(15 downto 8)  <= dbg_ddr_inc_from16(15 downto 8);
--dbg_ddr_inc_u2(23 downto 16) <= dbg_ddr_inc_from18(39 downto 32);
--dbg_ddr_inc_u2(31 downto 24) <= dbg_ddr_inc_from16(23 downto 16);
--dbg_ddr_inc_u2(39 downto 32) <= dbg_ddr_inc_from16(31 downto 24);
--dbg_ddr_inc_u2(47 downto 40) <= dbg_ddr_inc_from18(47 downto 40);
--dbg_ddr_inc_u2(55 downto 48) <= dbg_ddr_inc_from18(55 downto 48);
--dbg_ddr_inc_u2(63 downto 56) <= dbg_ddr_inc_from18(63 downto 56);
--
--dbg_ddr_pause_u2(7 downto 0)   <= dbg_ddr_pause_from16(7 downto 0);  
--dbg_ddr_pause_u2(15 downto 8)  <= dbg_ddr_pause_from16(15 downto 8); 
--dbg_ddr_pause_u2(23 downto 16) <= dbg_ddr_pause_from18(39 downto 32);
--dbg_ddr_pause_u2(31 downto 24) <= dbg_ddr_pause_from16(23 downto 16);
--dbg_ddr_pause_u2(39 downto 32) <= dbg_ddr_pause_from16(31 downto 24);
--dbg_ddr_pause_u2(47 downto 40) <= dbg_ddr_pause_from18(47 downto 40);
--dbg_ddr_pause_u2(55 downto 48) <= dbg_ddr_pause_from18(55 downto 48);
--dbg_ddr_pause_u2(63 downto 56) <= dbg_ddr_pause_from18(63 downto 56);
--
--dbg_ddr_step_u2(7 downto 0)   <= dbg_ddr_step_from16(7 downto 0);  
--dbg_ddr_step_u2(15 downto 8)  <= dbg_ddr_step_from16(15 downto 8); 
--dbg_ddr_step_u2(23 downto 16) <= dbg_ddr_step_from18(39 downto 32);
--dbg_ddr_step_u2(31 downto 24) <= dbg_ddr_step_from16(23 downto 16);
--dbg_ddr_step_u2(39 downto 32) <= dbg_ddr_step_from16(31 downto 24);
--dbg_ddr_step_u2(47 downto 40) <= dbg_ddr_step_from18(47 downto 40);
--dbg_ddr_step_u2(55 downto 48) <= dbg_ddr_step_from18(55 downto 48);
--dbg_ddr_step_u2(63 downto 56) <= dbg_ddr_step_from18(63 downto 56);
--
--dbg_ddr_retry_u2(7 downto 0)   <= dbg_ddr_retry_from16(7 downto 0);  
--dbg_ddr_retry_u2(15 downto 8)  <= dbg_ddr_retry_from16(15 downto 8); 
--dbg_ddr_retry_u2(23 downto 16) <= dbg_ddr_retry_from18(39 downto 32);
--dbg_ddr_retry_u2(31 downto 24) <= dbg_ddr_retry_from16(23 downto 16);
--dbg_ddr_retry_u2(39 downto 32) <= dbg_ddr_retry_from16(31 downto 24);
--dbg_ddr_retry_u2(47 downto 40) <= dbg_ddr_retry_from18(47 downto 40);
--dbg_ddr_retry_u2(55 downto 48) <= dbg_ddr_retry_from18(55 downto 48);
--dbg_ddr_retry_u2(63 downto 56) <= dbg_ddr_retry_from18(63 downto 56);
--
--ddr_val_bank16(4 downto 0)   <= ddr_val(4 downto 0);
--ddr_val_bank16(9 downto 5)   <= ddr_val(9 downto 5);
--ddr_val_bank18(24 downto 20) <= ddr_val(14 downto 10);
--ddr_val_bank16(14 downto 10) <= ddr_val(19 downto 15);
--ddr_val_bank16(19 downto 15) <= ddr_val(24 downto 20);
--ddr_val_bank18(29 downto 25) <= ddr_val(29 downto 25);
--ddr_val_bank18(34 downto 30) <= ddr_val(34 downto 30);
--ddr_val_bank18(39 downto 35) <= ddr_val(39 downto 35);
--
--ddr_val_load_bank16(0)  <= ddr_val_load(0);
--ddr_val_load_bank16(1)  <= ddr_val_load(1);
--ddr_val_load_bank18(4)  <= ddr_val_load(2);
--ddr_val_load_bank16(2)  <= ddr_val_load(3);
--ddr_val_load_bank16(3)  <= ddr_val_load(4);
--ddr_val_load_bank18(5)  <= ddr_val_load(5);
--ddr_val_load_bank18(6)  <= ddr_val_load(6);
--ddr_val_load_bank18(7)  <= ddr_val_load(7);

end rtl;