--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:14:36 02/14/2014
-- Design Name:   
-- Module Name:   C:/Users/Paulek/Desktop/XIL/Atlas_parsers/jet_parserSimulation.vhd
-- Project Name:  Atlas_parsers
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: jet_parser
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY jet_parserSimulation IS
END jet_parserSimulation;
 
ARCHITECTURE behavior OF jet_parserSimulation IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT jet_parser
    PORT(
         CLK_WR_IN : IN  std_logic;
         CLK_RD_IN : IN  std_logic;
         RESET_IN : IN  std_logic;
         DATA_IN : IN  std_logic_vector(127 downto 0);
         DATA_WE_IN : IN  std_logic;
         DATA_OUT : OUT  std_logic_vector(31 downto 0);
         DATA_RE_IN : IN  std_logic;
         DATA_RDY_OUT : OUT  std_logic;
         TOB_COUNTER_OUT : OUT  std_logic_vector(2 downto 0);
         CRC_ERR_OUT : OUT  std_logic;
         FIFO_OVERFLOW_OUT : OUT  std_logic;
         BC_OFFSET_IN : IN  std_logic_vector(5 downto 0);
         BC_QTY_IN : IN  std_logic_vector(5 downto 0);
         UPDATE_BC_IN : IN  std_logic
        );
    END COMPONENT;
 
    COMPONENT  block_builder 
    generic (
	   FIBERS_QTY : integer range 0 to 80 := 1;
	   DECODING   : std_logic_vector(3 downto 0) := b"0001"	
	);
	port (
		CLK_IN        : in std_logic;
		RESET_IN      : in std_logic;
		
		BC_OFFSET_IN  : in std_logic_vector(5 downto 0);
		BC_QTY_IN     : in std_logic_vector(5 downto 0);
		
		DATA_IN       : in std_logic_vector(FIBERS_QTY * 32 - 1 downto 0);
		DATA_RDY_IN   : in std_logic_vector(FIBERS_QTY - 1 downto 0);
		DATA_SIZES_IN : in std_logic_vector(FIBERS_QTY * 3 - 1 downto 0);
		DATA_RE_OUT   : out std_logic_vector(FIBERS_QTY - 1 downto 0);
		UPDATE_BC_OUT : out std_logic_vector(FIBERS_QTY - 1 downto 0);
		
		DATA_OUT      : out std_logic_vector(31 downto 0);
		DATA_RE_IN    : in std_logic		
	);
	END COMPONENT;
    

   --Inputs
   signal CLK_WR_IN : std_logic := '0';
   signal CLK_RD_IN : std_logic := '0';
   signal RESET_IN : std_logic := '0';
   signal DATA_IN : std_logic_vector(127 downto 0) := (others => '0');
   signal DATA_WE_IN : std_logic := '0';
   signal DATA_RE_IN : std_logic := '0';
 --  signal BC_OFFSET_IN : std_logic_vector(5 downto 0) := (others => '0');
 --  signal BC_QTY_IN : std_logic_vector(5 downto 0) := ;
   signal BC_OFFSET_IN : std_logic_vector(5 downto 0)  := b"000100";
   signal BC_QTY_IN : std_logic_vector(5 downto 0)  := b"000001"; 
   signal UPDATE_BC_IN : std_logic := '0';

 	--Outputs
   signal DATA_OUT : std_logic_vector(31 downto 0);
   signal DATA_RDY_OUT : std_logic;
   signal TOB_COUNTER_OUT : std_logic_vector(2 downto 0);
   signal CRC_ERR_OUT : std_logic;
   signal FIFO_OVERFLOW_OUT : std_logic;

   -- Clock period definitions
   constant CLK_WR_IN_period : time := 25 ns;
   constant CLK_RD_IN_period : time := 10 ns;

   --helper signals
   signal data_re_in_q : std_logic  := '0';
   signal tob_counter : std_logic_vector(2 downto 0)  := (others => '0');
   signal BB_re : std_logic  :=  '0';
   
   --BB signals
   signal DATA_RDY_IN_BB : std_logic_vector(0 downto 0)  :=  (others => '0');
   signal DATA_RE_OUT_BB : std_logic_vector(0 downto 0)  :=  (others => '0'); 
   signal UPDATE_BC_OUT : std_logic_vector(0 downto 0)  :=  (others => '0');
 
BEGIN
 DATA_RDY_IN_BB(0)  <=  DATA_RDY_OUT;
 DATA_RE_IN  <=  DATA_RE_OUT_BB(0) ;
 UPDATE_BC_IN  <= UPDATE_BC_OUT(0); 
	-- Instantiate the Unit Under Test (UUT)
   uut: jet_parser PORT MAP (
          CLK_WR_IN => CLK_WR_IN,
          CLK_RD_IN => CLK_RD_IN,
          RESET_IN => RESET_IN,
          DATA_IN => DATA_IN,
          DATA_WE_IN => DATA_WE_IN,
          DATA_OUT => DATA_OUT,
          DATA_RE_IN => DATA_RE_IN,
          DATA_RDY_OUT => DATA_RDY_OUT,
          TOB_COUNTER_OUT => TOB_COUNTER_OUT,
          CRC_ERR_OUT => CRC_ERR_OUT,
          FIFO_OVERFLOW_OUT => FIFO_OVERFLOW_OUT,
          BC_OFFSET_IN => BC_OFFSET_IN,
          BC_QTY_IN => BC_QTY_IN,
          UPDATE_BC_IN => UPDATE_BC_IN
        );

    BB: block_builder
    	port map(CLK_IN        => CLK_RD_IN,
    		     RESET_IN      => RESET_IN,
    		     BC_OFFSET_IN  => BC_OFFSET_IN,
    		     BC_QTY_IN     => BC_QTY_IN,
    		     DATA_IN       => DATA_OUT,
    		     
    		     DATA_RDY_IN   => DATA_RDY_IN_BB,
    		     DATA_SIZES_IN => TOB_COUNTER_OUT,
    		     DATA_RE_OUT   => DATA_RE_OUT_BB,
    		     UPDATE_BC_OUT => UPDATE_BC_OUT,
    		     DATA_OUT      => open,
    		     DATA_RE_IN    => BB_re
    		     );     


   -- Clock process definitions
   CLK_WR_IN_process :process
   begin
		CLK_WR_IN <= '0';
		wait for CLK_WR_IN_period/2;
		CLK_WR_IN <= '1';
		wait for CLK_WR_IN_period/2;
   end process;
 
   CLK_RD_IN_process :process
   begin
		CLK_RD_IN <= '0';
		wait for CLK_RD_IN_period/2;
		CLK_RD_IN <= '1';
		wait for CLK_RD_IN_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
        RESET_IN  <= '1';		
      wait for 100 ns;	
		RESET_IN  <=  '0';
		
		DATA_IN  <=  x"0000001"  & x"0000002" &  x"0000003"  & x"0000004"  & b"1111111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';

		DATA_IN  <=  x"0000005"  & x"0000006" &  x"0000007"  & x"0000008"  & b"1111111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';

		DATA_IN  <=  x"0000009"  & x"000000a" &  x"000000b"  & x"000000c"  & b"1111111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';
	    
	    DATA_IN  <=  x"000000d"  & x"0000000" &  x"0000000"  & x"0000000"  & b"1111111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';

	    DATA_IN  <=  x"000000e"  & x"000000f" &  x"0000000"  & x"0000000"  & b"1111111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';

	    DATA_IN  <=  x"0000000"  & x"0000000" &  x"0000000"  & x"0000000"  & b"1111111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';
	    
	    DATA_IN  <=  x"0000010"  & x"0000011" &  x"0000012"  & x"0000013"  & b"1111111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';
	    
	    DATA_IN  <=  x"0000014"  & x"0000015" &  x"0000016"  & x"0000017" &   b"1111111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
