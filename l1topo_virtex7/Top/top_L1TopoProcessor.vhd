library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.ipbus.ALL;
library UNISIM;
use UNISIM.VComponents.all;

--use ieee.std_logic_textio.all;
--use work.L1TopoDataTypes.all;
--use work.L1TopoFunctions.all;
use work.rod_l1_topo_types_const.all;

entity top_TopoVirtex is 
GENERIC(
	LINES_NUMBER : integer  := NUMBER_OF_ROS_OUTPUT_BUSES;
        SIMULATION : boolean :=false
);
port(
		GCK2_IN_P, GCK2_IN_N: in std_logic;
		CTRLIPBUS_P_IN, CTRLIPBUS_N_IN: in std_logic_vector(4 downto 0);
		CTRLIPBUS_P_OUT, CTRLIPBUS_N_OUT: out std_logic_vector(2 downto 0);
		LED_OUT: out std_logic;
        
        CTRLBUS_P : out std_logic_vector(LINES_NUMBER-1 downto 0);	--DATA_LINES
        CTRLBUS_N : out std_logic_vector(LINES_NUMBER-1 downto 0);  --DATA_LINES
        CTRLBUS_P_IN : in std_logic;	--LINES TO ISSUE DDR RESET
        CTRLBUS_N_IN : in std_logic;     --LINES TO ISSUE DDR RESET
        
        ROD_CONTROL_P_IN : in std_logic;
        ROD_CONTROL_N_IN : in std_logic
        
       -- MMCX_U30_PIN : in std_logic --trigger source (pulser)
	);
end top_TopoVirtex;



architecture top_TopoVirtex of top_TopoVirtex is

component l1topo_to_ddr
  generic (
    MAKE_SYNCH_INPUT : integer);
  port (
    RESET                 : in  std_logic;
    DATA_IN_CLK           : in  std_logic;
    DATA_OUT_CLK          : in  std_logic;
    NUMBER_OF_SLICES      : in  slice_parameters_array_u;
    SLICE_CHANGES_APROVED : in  std_logic;
    LVL0_ACCEPTED         : in  std_logic;
    LVL0_VALID            : in  std_logic;
    LVL0_FULL_THR         : in  std_logic_vector(7 downto 0);
    LVL0_OFFSET           : in  slice_parameters_array_u;
    ROS_ROI_IN_DATA       : in  in_data_array;
    DATA_VALID_IN         : in  std_logic_vector(0 downto 0);
    OUT_DATA              : out std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0);
    DATA_VALID_OUT        : out std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
    L0_BUSY               : out std_logic;
    SPECIAL_CHARACTER_OUT : out std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0));
  end component;

    --IPBus signals:
	signal gck2_clk40: std_logic;
	signal gck2_clk80: std_logic;
	signal idelayctrl_refclk300: std_logic;
	signal gck2_mmcm_locked: std_logic;
	
	signal ctrlbus_locked: std_logic;
	
	signal ipb_master_read: ipb_rbus;
	signal ipb_master_write: ipb_wbus;
	signal ctrlbus_idelay_value: std_logic_vector(24 downto 0); --5pins * 5bit/pin
	signal ctrlbus_idelay_load: std_logic_vector(4 downto 0);
	
	signal rst_ipb: std_logic;
	signal trigger: std_logic;
	
	--Transmission signals:
	signal reset : std_logic  := '0';
    signal reset_line : std_logic  := '0';
    signal ddr_reset : std_logic := '0';
    signal rod_reset : std_logic := '0';
    
    signal dataValidIn : std_logic_vector(LINES_NUMBER-1 downto 0)  := (others  => '0');
    signal dataKctrlIn : std_logic := '0';
    signal counter : std_logic_vector(23 downto 0)  := (others => '0');
  --  signal cntW84SyncFlag : std_logic  := '0';
    
    signal dataIn : std_logic_vector(8*(LINES_NUMBER)-1 downto 0)  := (others => '0');
    signal clockLock : std_logic  := '0';
      --CLOCK SIGNALS-------------------------------
--    signal clk80MHz : std_logic  := '0';
    signal clk400, clk80: std_logic  := '0';
--    signal clk80 : std_logic := '0';
--    signal clk40 : std_logic := '0';
      --signal clk200MHz  : std_logic  := '0';
    attribute keep : string;
    attribute keep of dataValidIn,dataIn,dataKctrlIn : signal is "true";
    --ROD signals:
    signal ROD_rewi_reg : std_logic_vector(4095 downto 0) := (others=>'0');
    signal triggerReg :  std_logic_vector(31 downto 0) := (others=>'0');
    --litopo ROD signals
    signal number_of_slices      : slice_parameters_array_u;
    signal slice_changes_aproved : std_logic := '0';
    signal l1A_pulse : std_logic := '0';
    signal lvl0_valid : std_logic := '0';
    signal lvl0_offset           : slice_parameters_array_u;
    signal cntr_for_ros_roi_bus : in_data_array := (others => (others => '0'));
    signal data_valid_in         : std_logic_vector(0 downto 0):=(others => '0');
    signal out_data              : std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0):=(others=>'0');
    signal data_valid_out        : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0) := (others => '0');    
    signal l0_busy               : std_logic:='0';
    signal special_character_out : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0) := (others => '0');
    signal global_reset_cnt      : unsigned(15 downto 0):=(others => '0');
    signal local_reset,local_reset_sync : std_logic := '0';
    signal kintex_ready, kintex_ready_synch_a, kintex_ready_synch_b, kintex_ready_pulse : std_logic:='0';    
    signal mmcx_u30_synch_a, mmcx_u30_synch_b  : std_logic;
    signal MMCX_U30 : std_logic := '0'; --it used to be external pulse for trigger creation. Now we put here ipbus register.
    signal kintex_reset_pulse : std_logic := '0';
    --Virtex ROD registers nie potrzebne
--    signal OUT_DATA_reg              : std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0) := (others => '0');
--    signal DATA_VALID_OUT_reg        : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0) := (others => '0');
--    signal SPECIAL_CHARACTER_OUT_reg : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0) := (others => '0');
--    signal RESET_reg                 : std_logic_vector(1 downto 0):= (others=>'0');

signal greg_ddr_rst : std_logic;
    
	 
signal control0, control1 : std_logic_vector(35 downto 0);
signal trg : std_logic_vector(255 downto 0);

signal test_ctr : std_logic_vector(7 downto 0);
signal test_data : std_logic_vector(63 downto 0);

signal icon_control0, icon_control1 : std_logic_vector(35 downto 0);
signal ila_trg : std_logic_vector(255 downto 0);
	 
begin

	clocks: entity work.clocks_TopoVirtex
		port map(
			GCK2_IN_P => GCK2_IN_P,
			GCK2_IN_N => GCK2_IN_N,
			gck2_mmcm_locked_out => gck2_mmcm_locked,
			gck2_clk40_out => gck2_clk40,
			gck2_clk80_out => gck2_clk80,
			idelayctrl_refclk300_out => idelayctrl_refclk300
		);
		
    	ctrlbus: entity work.ctrlbus
		port map(
			gck2_clk40_in => gck2_clk40,
			gck2_clk80_in => gck2_clk80,
			idelayctrl_refclk300_in => idelayctrl_refclk300,
			CTRLBUS_OUT_P => CTRLIPBUS_P_OUT,
			CTRLBUS_OUT_N => CTRLIPBUS_N_OUT,
			CTRLBUS_IN_P => CTRLIPBUS_P_IN,
			CTRLBUS_IN_N => CTRLIPBUS_N_IN,
			ipb_read_in => ipb_master_read,
			ipb_write_out => ipb_master_write,
			idelay_value_in => ctrlbus_idelay_value,
			idelay_load_in => ctrlbus_idelay_load,
			ctrlbus_locked_out => ctrlbus_locked,
	      	
			clk400=>clk400,
			clk80=>clk80
		);
		
		slaves: entity work.slaves
		port map(
			ipb_clk => gck2_clk40, --ipb_clk
			ipb_rst => rst_ipb,
			ipb_in => ipb_master_write,
			ipb_out => ipb_master_read,

			ctrlbus_idelay_value_out => ctrlbus_idelay_value,
			ctrlbus_idelay_load_out => ctrlbus_idelay_load,

			ctrlbus_locked_in => ctrlbus_locked,
			
			--register signal sction:
			ROD_rewi_reg => ROD_rewi_reg,
			triggerReg   =>triggerReg,

	        OUT_DATA_reg              => out_data, --data going from rod to ddr component
	        DATA_VALID_OUT_reg        => data_valid_out, --data valid coming out from l1_topo rod component
	        SPECIAL_CHARACTER_OUT_reg => special_character_out,
	        RESET_reg                 => (reset & KINTEX_READY) --reset line status
		);
		

greg_ddr_rst <= not ctrlbus_locked or ddr_reset;

process(clk80)
begin
	if rising_edge(clk80) then
		test_ctr <= test_ctr + x"1";
	end if;
end process;
		
test_data <= test_ctr & test_ctr & test_ctr & test_ctr & test_ctr & test_ctr & test_ctr & test_ctr;
data_valid_out <= (others => '1') when KINTEX_READY = '1' else (others => '0');

	--Wrapper initialization______________________________________
    TransmittersWrapperInst :  entity work.TransmittersWrapper
    	generic map(
    			LINKS_NUMBER  => LINES_NUMBER
    	)
    	port map(RESET         => reset, --greg_ddr_rst,
    		     CLK_BIT_IN     => clk400,
    		     CLK_WORD_IN    => clk80, --gck2_clk80,--clk80
    		     DATA_IN        => test_data, --out_data,--dataIn,             --out_data vector comming out form 'l1topo_to_ddr'
    		     DATA_VALID_IN  => data_valid_out,--dataValidIn,  --data_valid_out sgn comming out from 'l1topo_to_ddr'
    		     DATA_KCTRL_IN  => special_character_out,--dataKctrlIn,
    		     DATA_PIN_P_OUT => CTRLBUS_P,
    		     DATA_PIN_N_OUT => CTRLBUS_N);

  --SETTING UP RESET LINES - this components take differential input lines and make signal out of them      
      IBUFDS_inst_0 : IBUFDS --
        generic map (
          DIFF_TERM    => true,            -- Differential Termination 
          IBUF_LOW_PWR => false,  -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
          IOSTANDARD   => "DEFAULT")
        port map (
          O  => KINTEX_READY,               -- Buffer output
          I  => ROD_CONTROL_P_IN,  -- Diff_p buffer input (connect directly to top-level port)
          IB => ROD_CONTROL_N_IN  -- Diff_n buffer input (connect directly to top-level port)
          );
      IBUFDS_inst_1 : IBUFDS --this component takes differential input lines and make signal out of them
        generic map (
          DIFF_TERM    => true,      -- Differential Termination 
          IBUF_LOW_PWR => false,     -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
          IOSTANDARD   => "DEFAULT")
        port map (
          O  => ddr_reset,          -- Buffer output
          I  => CTRLBUS_P_IN,  -- Diff_p buffer input (connect directly to top-level port)
          IB => CTRLBUS_N_IN  -- Diff_n buffer input (connect directly to top-level port)
          );
          
    ----------------------------------------------------------------------------------------------
    --Signal assigments
    ---------------------------------------------------------------------------------------------\
    --local_reset <= rst_ipb;
    reset <= (not gck2_mmcm_locked) or (not KINTEX_READY);--clockLock;
    --reset_ctr : IBUFDS port map (I => CTRLBUS_P_IN ,IB => CTRLBUS_N_IN, O => reset_line );
    rod_reset <= not KINTEX_READY;    
    LED_OUT <= ctrlbus_locked;
    rst_ipb <= not gck2_mmcm_locked;
    MMCX_U30 <= triggerReg(0);-- or MMCX_U30_PIN;
    
    
    
    
    
    
icon : entity work.cs_icon
PORT map(
    CONTROL0 => icon_control0,
    CONTROL1 => icon_control1
);

ila0 : entity work.cs_ila
PORT map(
    CONTROL => icon_control0,
    CLK     => idelayctrl_refclk300,
    TRIG0   => ila_trg
);

ila1 : entity work.cs_ila
PORT map(
    CONTROL => icon_control1,
    CLK     => idelayctrl_refclk300,
    TRIG0   => (others => '0')
);


ila_trg(63 downto 0)  <= test_data;
ila_trg(71 downto 64) <= data_valid_out;
ila_trg(72) <= reset;
ila_trg(73) <= KINTEX_READY;
ila_trg(74) <= gck2_mmcm_locked;
ila_trg(75) <= ctrlbus_locked;

ila_trg(255 downto 76) <= (others => '0');

end top_TopoVirtex;

