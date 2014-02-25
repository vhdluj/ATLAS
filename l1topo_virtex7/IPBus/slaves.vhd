-- The ipbus slaves live in this entity - modify according to requirements
--
-- Ports can be added to give ipbus slaves access to the chip top level.
--
-- Dave Newbold, February 2011

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.ipbus.ALL;
use work.rod_l1_topo_types_const.all;

entity slaves is
	port(
		ipb_clk: in std_logic;
		ipb_rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		
		ctrlbus_idelay_value_out: out std_logic_vector(24 downto 0);
		ctrlbus_idelay_load_out: out std_logic_vector(4 downto 0);
		
		ctrlbus_locked_in: in std_logic;
		
		ROD_rewi_reg : out std_logic_vector(4095 downto 0); --ROD read/write register
		triggerReg : out std_logic_vector(31 downto 0); --trigger register
		OUT_DATA_reg              : in std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0);
        DATA_VALID_OUT_reg        : in std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
        SPECIAL_CHARACTER_OUT_reg : in std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
        RESET_reg                 : in std_logic_vector(1 downto 0)
		
	);

end slaves;

architecture rtl of slaves is

	constant NSLV: positive := 10;
	signal ipbw: ipb_wbus_array(NSLV-1 downto 0);
	signal ipbr, ipbr_d: ipb_rbus_array(NSLV-1 downto 0);
	signal ctrl_reg: std_logic_vector(31 downto 0);
	
	
	signal ctrlbus_idelay_value_32bit: std_logic_vector(31 downto 0);
	signal ctrlbus_idelay_load_32bit: std_logic_vector(31 downto 0);
	
	signal testreg                      : std_logic_vector(31 downto 0);
	signal	  OUT_DATA_reg_sgn              : std_logic_vector(OUTPUT_DATA_WIDTH-1 downto 0);
    signal    DATA_VALID_OUT_reg_sgn        : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
    signal    SPECIAL_CHARACTER_OUT_reg_sgn : std_logic_vector(NUMBER_OF_ROS_OUTPUT_BUSES-1 downto 0);
    signal    RESET_reg_sgn                 : std_logic_vector(1 downto 0);

begin

OUT_DATA_reg_sgn <= OUT_DATA_reg;        
DATA_VALID_OUT_reg_sgn <= DATA_VALID_OUT_reg_sgn;       
SPECIAL_CHARACTER_OUT_reg_sgn <= SPECIAL_CHARACTER_OUT_reg;
RESET_reg_sgn <= RESET_reg;                 



  fabric: entity work.ipbus_fabric
    generic map(NSLV => NSLV)
    port map(
      ipb_in => ipb_in,
      ipb_out => ipb_out,
      ipb_to_slaves => ipbw,
      ipb_from_slaves => ipbr
    );


	slave0: entity work.ipbus_slave_reg_readwrite
		generic map(addr_width => 0)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(0),
			ipbus_out => ipbr(0),
			q => testreg
		);
		
		
	slave1: entity work.ipbus_slave_reg_readonly
		generic map(addr_width => 0)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(1),
			ipbus_out => ipbr(1),
			d => testreg
		);


	slave2: entity work.ipbus_slave_reg_readwrite
		generic map(addr_width => 0)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(2),
			ipbus_out => ipbr(2),
			q => ctrlbus_idelay_value_32bit
		);

	ctrlbus_idelay_value_out <= ctrlbus_idelay_value_32bit(24 downto 0);

	
	slave3: entity work.ipbus_slave_reg_pulse
		generic map(addr_width => 0)
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(3),
			ipbus_out => ipbr(3),
			q => ctrlbus_idelay_load_32bit
		);

	ctrlbus_idelay_load_out <= ctrlbus_idelay_load_32bit(4 downto 0);
	
	slave4: entity work.ipbus_slave_reg_counter
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(4),
			ipbus_out => ipbr(4),
			pulse => ipb_in.ipb_strobe
		);
		
	slave5: entity work.ipbus_slave_reg_counter
		port map(
			clk => ipb_clk,
			reset => ipb_rst,
			ipbus_in => ipbw(5),
			ipbus_out => ipbr(5),
			pulse => ctrlbus_locked_in
		);
	
	slave6: entity work.ipbus_ram
			generic map(addr_width => 10)
			port map(
				clk => ipb_clk,
				reset => ipb_rst,
				ipbus_in => ipbw(6),
				ipbus_out => ipbr(6)
			);
	
-- Slave 7: SlaveID="ROD_control", address=0x00003080	readwrite register
         
   	slave7: entity work.ipbus_reg
	       generic map(addr_width => 7)
	       port map(
   			  clk => ipb_clk,
   			  reset => ipb_rst,
   			  ipbus_in => ipbw(7),
   			  ipbus_out => ipbr(7),
  			   q => ROD_rewi_reg
   			);
   			
-- Slave 8: SlaveID="Trigger", address=0x	readwrite register
                        
   	slave8: entity work.ipbus_reg
   	       generic map(addr_width => 0)
       	       port map(
        			  clk => ipb_clk,
          			  reset => ipb_rst,
           			  ipbus_in => ipbw(8),
           			  ipbus_out => ipbr(8),
           			   q => triggerReg
               			);   			

--Slave 9: slave: ROD_status , 

    slave9: entity work.ipbus_slave_reg_readonly
            generic map(addr_width => 3)
            port map(
                    clk => ipb_clk,
                    reset => ipb_rst,
                    ipbus_in => ipbw(9),
                    ipbus_out => ipbr(9),
                    d => (OUT_DATA_reg_sgn & x"000000" & DATA_VALID_OUT_reg_sgn & x"000000" & SPECIAL_CHARACTER_OUT_reg_sgn & x"0000000" & b"00" & RESET_reg_sgn & x"000000000000000000000000")            
            );      ------64 bit data----24 pad b----8 bit---------------24b padding-----8 bits-------------------30 bits padding------2b 
		
end rtl;
