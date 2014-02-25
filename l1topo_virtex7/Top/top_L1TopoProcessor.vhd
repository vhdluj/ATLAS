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
	LINES_NUMBER : integer  := LINKS_NUMBER;
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
    signal clk400: std_logic  := '0';
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

        SIMULATION_ON: if SIMULATION generate
          CLK400_PROC: process
          begin  -- process 400MHz_CLK
            clk400 <= '0';
            wait for 1.25 ns;
            clk400 <= '1';
            wait for 1.25 ns;
          end process CLK400_PROC;
        end generate SIMULATION_ON;
    --SWITCH_OFF_IPBUS_FOR_SIM: if not(SIMULATION)  generate
	--ctrlbus: entity work.ctrlbus
	--	port map(
	--		gck2_clk40_in => gck2_clk40,
	--		gck2_clk80_in => gck2_clk80,
	--		idelayctrl_refclk300_in => idelayctrl_refclk300,
	--		CTRLBUS_OUT_P => CTRLIPBUS_P_OUT,
	--		CTRLBUS_OUT_N => CTRLIPBUS_N_OUT,
	--		CTRLBUS_IN_P => CTRLIPBUS_P_IN,
	--		CTRLBUS_IN_N => CTRLIPBUS_N_IN,
	--		ipb_read_in => ipb_master_read,
	--		ipb_write_out => ipb_master_write,
	--		idelay_value_in => ctrlbus_idelay_value,
	--		idelay_load_in => ctrlbus_idelay_load,
	--		ctrlbus_locked_out => ctrlbus_locked,
			
	--		clk400=>clk400
	--	);

	--slaves: entity work.slaves port map(
	--	ipb_clk => gck2_clk40, --ipb_clk
	--	ipb_rst => rst_ipb,
	--	ipb_in => ipb_master_write,
	--	ipb_out => ipb_master_read,
	
	--	ctrlbus_idelay_value_out => ctrlbus_idelay_value,
	--	ctrlbus_idelay_load_out => ctrlbus_idelay_load,


		ctrlbus_locked_in => ctrlbus_locked,
		--register signal sction:
		ROD_rewi_reg => ROD_rewi_reg,
		triggerReg =>triggerReg,
				
        OUT_DATA_reg              => out_data, --data going from rod to ddr component
        DATA_VALID_OUT_reg        => data_valid_out, --data valid coming out from l1_topo rod component
        SPECIAL_CHARACTER_OUT_reg => special_character_out,
        RESET_reg                 => (reset & KINTEX_READY) --reset line status
	);
        end generate SWITCH_OFF_IPBUS_FOR_SIM;

	--Wrapper initialization______________________________________
    TransmittersWrapperInst :  entity work.TransmittersWrapper
    	generic map(
    			LINKS_NUMBER  => LINES_NUMBER
    	)
    	port map(RESET          => ddr_reset,--,local_reset_sync,--rst_ipb,--reset
    		     CLK_BIT_IN     => clk400,
    		     CLK_WORD_IN    => gck2_clk80,--clk80
    		     DATA_IN        => out_data,--dataIn,             --out_data vector comming out form 'l1topo_to_ddr'
    		     DATA_VALID_IN  => data_valid_out,--dataValidIn,  --data_valid_out sgn comming out from 'l1topo_to_ddr'
    		     DATA_KCTRL_IN  => special_character_out,--dataKctrlIn,
    		     DATA_PIN_P_OUT => CTRLBUS_P,
    		     DATA_PIN_N_OUT => CTRLBUS_N);
	

 
 	ASSIGN_NUMBER_OF_SLICES : for i in 0 to NUMBER_OF_SLICES'length-1 generate
      NUMBER_OF_SLICES(i) <= to_unsigned(5, NUMBER_OF_SLICES(0)'length);--to_unsigned(((i mod 16)+1), NUMBER_OF_SLICES(0)'length);
      LVL0_OFFSET(i)      <= to_unsigned(i mod 2, LVL0_OFFSET(0)'length); --to_unsigned(i mod 8, LVL0_OFFSET(0)'length);
    end generate ASSIGN_NUMBER_OF_SLICES;   
    
	l1topo_to_ddr_1: l1topo_to_ddr
      generic map (
        MAKE_SYNCH_INPUT => 0)
      port map (
        RESET                 => reset,--local_reset,--rst_ipb,
        DATA_IN_CLK           => gck2_clk40,
        DATA_OUT_CLK          => gck2_clk80,
        NUMBER_OF_SLICES      => NUMBER_OF_SLICES,
        SLICE_CHANGES_APROVED => slice_changes_aproved,
        LVL0_ACCEPTED         => l1A_pulse,
        LVL0_VALID            => lvl0_valid,
        LVL0_FULL_THR         => x"d0",
        LVL0_OFFSET           => lvl0_offset,
        ROS_ROI_IN_DATA       => cntr_for_ros_roi_bus,-- ros_roi_in_data,
        DATA_VALID_IN         => data_valid_in,
        OUT_DATA              => out_data,
        DATA_VALID_OUT        => data_valid_out,
        L0_BUSY               => l0_busy,
        SPECIAL_CHARACTER_OUT => special_character_out
        );

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

	
	----------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------
	--Processes:
	----------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------
   --l1topo ROD processes:    
   DETECT_RISING_EDGE : process (gck2_clk40)
   begin
     if rising_edge(gck2_clk40) then
       if kintex_ready_synch_a = '1' and kintex_ready_synch_b = '0'  then
         kintex_ready_pulse <= '1';
         kintex_ready_synch_a <= KINTEX_READY;
         kintex_ready_synch_b <= kintex_ready_synch_a; 
       else
         kintex_ready_pulse <= '0';
         kintex_ready_synch_a <= KINTEX_READY;
         kintex_ready_synch_b <= kintex_ready_synch_a; 
       end if;
     end if;
   end process DETECT_RISING_EDGE;
  
  DETECT_FALLING_EDGE : process (gck2_clk40)
  begin 
    if rising_edge(gck2_clk40) then
      if kintex_ready_synch_a = '0' and kintex_ready_synch_b = '1' then
        kintex_reset_pulse <= '1';
      else 
        kintex_reset_pulse <= '0';
      end if;
    end if;
  end process DETECT_FALLING_EDGE;

  GLOBAL_RESET: process(gck2_clk40)
   begin
     if rising_edge(gck2_clk40) then
       if kintex_reset_pulse = '1' then
         global_reset_cnt <= (others => '0');
         local_reset <= '1';
         local_reset_sync <= '1';
         slice_changes_aproved <= '0';
       elsif global_reset_cnt < x"000e" then
         global_reset_cnt <= global_reset_cnt + 1;
         local_reset <= '1';-- or kintex_ready_pulse;
         local_reset_sync <= '1';
         slice_changes_aproved <= '0';
       elsif global_reset_cnt = x"000e" and kintex_ready_synch_b = '1' then
         local_reset <= '0';
         local_reset_sync <= local_reset;
         global_reset_cnt <= x"000e";
         slice_changes_aproved <= '1';
       else
         local_reset <= local_reset;-- or kintex_ready_pulse;
         local_reset_sync <= '0';
         global_reset_cnt <= global_reset_cnt;
         slice_changes_aproved <= slice_changes_aproved;
       end if;
     end if;
   end process GLOBAL_RESET;

  MAKE_L1A : process (gck2_clk40)
  begin
    if rising_edge(gck2_clk40) then
      if mmcx_u30_synch_a = '1' and mmcx_u30_synch_b = '0' then
        l1A_pulse <= '1';
        mmcx_u30_synch_a <= MMCX_U30;
        mmcx_u30_synch_b <= mmcx_u30_synch_a;
      else
        l1A_pulse <= '0';
        mmcx_u30_synch_a <= MMCX_U30;
        mmcx_u30_synch_b <= mmcx_u30_synch_a;
      end if;
    end if;
  end process MAKE_L1A;

  SET_VALID_AFTER_FIRST_PULSE : process (gck2_clk40 )
  begin
    if rising_edge(gck2_clk40) then
      if local_reset = '1' then
        lvl0_valid <= '0';
        data_valid_in <= "0";
      elsif l1A_pulse = '1' then
        lvl0_valid <= '1';
        data_valid_in <= "1";
      else
        lvl0_valid <= lvl0_valid;
        data_valid_in <= data_valid_in;
      end if;
    end if;
  end process SET_VALID_AFTER_FIRST_PULSE;

  GENERATE_CNTRS_FOR_ROS_ROI_DATA: for i in 0 to NUMBER_OF_ROS_ROI_INPUT_BUSES-1 generate
    CNTR_FOR_ROS_ROI_BUS_PROC : process (gck2_clk40)
    begin
      if rising_edge(gck2_clk40) then
        --For time being  we put as data some constant values. Counter will be used later 
        --cntr_for_ros_roi_bus(i) <= std_logic_vector(unsigned(cntr_for_ros_roi_bus(i)) + 1);
        cntr_for_ros_roi_bus(i) <= std_logic_vector(to_unsigned(i+1, cntr_for_ros_roi_bus(i)'length));
      end if;
    end process CNTR_FOR_ROS_ROI_BUS_PROC;
  end generate GENERATE_CNTRS_FOR_ROS_ROI_DATA;
   --end l1topo ROD processes
   
   
   
   
   
   
    
--	CounterProc : process (gck2_clk80,RESET) is
--	begin
--		if rising_edge(gck2_clk80) then
--			if (RESET = '1' or reset_line = '1') then
--				counter  <= (others => '0');
--				cntW84SyncFlag  <= '0';
--			else
--				if(cntW84SyncFlag='1') then
--					if (counter < X"000A2F" and ROD_rewi_reg(0) = '0') then
--					counter  <= counter +1;	
--					else
--					counter  <= (others => '0');
--					end if;
--				elsif(cntW84SyncFlag='0') then
--					counter <= counter +1;
--					if(counter = X"FFFFFF") then
--						cntW84SyncFlag  <= '1';
--					end if;
--				end if;
--				--counter <= counter+1;
--			end if;
--		end if;
--	end process CounterProc;

--	genDataIn : for i in 0 to 7 generate--we generate the dataIn depending on thbe number of links.
--		DataProduce : process (gck2_clk80) is
--		begin
--			if rising_edge(gck2_clk80) then
--				if (RESET = '1' or reset_line = '1') then
--					dataIn(i*8+7 downto i*8) <= (others => '0');
--				else
--					dataIn(i*8+7 downto i*8)  <= counter (7 downto 0);-- & counter (7 downto 0) & counter (7 downto 0) & counter (7 downto 0) & counter (7 downto 0) & counter (7 downto 0) & counter (7 downto 0) & counter (7 downto 0) & counter (7 downto 0) & counter (7 downto 0) & counter (7 downto 0);
--				end if;
--			end if;
--		end process DataProduce;
--	end generate genDataIn;
	
	
--	--Process which set dataValidIn on 1 every time the counter is zeroed
--	DataValid_proc : process (gck2_clk80) is
--	begin
--		if rising_edge(gck2_clk80) then
--			if (RESET = '1' or reset_line = '1') then
--				dataValidIn  <=  (others => '0');
--			else
--				if(counter > X"000000" and counter <  X"00000F" and cntW84SyncFlag = '1') then--0000FF 000A1F
--					dataValidIn  <=  (others => '1');
--				else
--					dataValidIn  <=  (others => '0');
--				end if;
--			end if;
--		end if;
--	end process DataValid_proc;
	




end top_TopoVirtex;

