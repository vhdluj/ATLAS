-------------------------------------------------------------------------------
--author:  Pawel Strzempek
--contact: pawel.strzempek@uj.edu.pl

-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY energ_parserSimulation IS
END energ_parserSimulation;
 
ARCHITECTURE behavior OF energ_parserSimulation IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT energy_parser
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
         BC_OFFSET_IN : in std_logic_vector(5 downto 0);
	     BC_QTY_IN :    in std_logic_vector(5 downto 0);
	     UPDATE_BC_IN : in std_logic
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
   signal BC_OFFSET_IN : std_logic_vector(5 downto 0)  := b"000100";
   signal BC_QTY_IN : std_logic_vector(5 downto 0)  := b"000010";
   signal UPDATE_BC_IN : std_logic  := '0';
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
   uut: energy_parser PORT MAP (
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
          BC_QTY_IN  => BC_QTY_IN,
          BC_OFFSET_IN  => BC_OFFSET_IN,
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		RESET_IN  <=  '0';

	   -- DATA_IN  <=  x"55555"& b"111" & x"44444" & b"111" & x"33333" & b"111" & x"22222" & b"111" & x"11111" & b"1111111111111111"; 
		DATA_IN  <= b"000" & x"00001" &  b"000" & x"00002" &  b"000" & x"00003" &  b"000" & x"00004" &  b"000" & x"00005" & b"1111111111111";
      wait for 10 ns;
		DATA_WE_IN  <= '1';
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';
    
      wait for 150 ns;
		DATA_WE_IN  <= '1';
		DATA_IN  <= b"000" & x"00006" &  b"000" & x"00007" &  b"000" & x"00008" &  b"000" & x"00009" &  b"000" & x"0000A" & b"1111111111111";
	  wait for 25 ns;
	    DATA_WE_IN  <= '0';	
	
	  wait for 150 ns;
		 DATA_WE_IN  <= '1';
		 DATA_IN  <= b"000" & x"0000B" &  b"000" & x"0000C" &  b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" & b"1111111111111";
	  wait for 20 ns;
	     DATA_WE_IN  <= '0';	
	
	  wait for 150 ns;
         DATA_WE_IN  <= '1';
      	 DATA_IN  <= b"000" & x"0000D" &  b"000" & x"0000E" &  b"000" & x"0000F" &  b"000" & x"00010" &  b"000" & x"00000" & b"1111111111111";
      wait for 20 ns;	
		DATA_WE_IN  <= '0';
	
	  wait for 150 ns;
         DATA_WE_IN  <= '1';
      	 DATA_IN  <= b"000" & x"00011" &  b"000" & x"00012" &  b"000" & x"00013" &  b"000" & x"00014" &  b"000" & x"00015" & b"1111111111111";
      wait for 20 ns;	
		DATA_WE_IN  <= '0';
	
	  wait for 150 ns;
         DATA_WE_IN  <= '1';
     	 DATA_IN  <= b"000" & x"00016" &  b"000" & x"00017" &  b"000" & x"00018" &  b"000" & x"00019" &  b"000" & x"0001a" & b"1111111111111";
      wait for 20 ns;	
		DATA_WE_IN  <= '0';
	
	  wait for 150 ns;
         DATA_WE_IN  <= '1';
      	 DATA_IN  <= b"000" & x"0001b" &  b"000" & x"0001c" &  b"000" & x"0001d" &  b"000" & x"0001e" &  b"000" & x"0001f" & b"1111111111111";
      wait for 20 ns;	
		DATA_WE_IN  <= '0';

--	  wait for 150 ns;
--         DATA_WE_IN  <= '1';
--      	 DATA_IN  <= b"000" & x"0001b" &  b"000" & x"0001c" &  b"000" & x"0001d" &  b"000" & x"0001e" &  b"000" & x"0001f" & b"1111111111111";
--      wait for 20 ns;	
--		DATA_WE_IN  <= '0';
	
	  wait for 150 ns;
	     DATA_WE_IN  <= '1';
      	 DATA_IN  <= b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" & b"1111111111111";
      wait for 20 ns;	
		DATA_WE_IN  <= '0';
	
	  wait for 150 ns;
         DATA_WE_IN  <= '1';
      	 DATA_IN  <= b"000" & x"00020" &  b"000" & x"00021" &  b"000" & x"00022" &  b"000" & x"00023" &  b"000" & x"00024" & b"1111111111111";
      wait for 20 ns;	
		DATA_WE_IN  <= '0';
		
--	  wait for 150 ns;
--         DATA_WE_IN  <= '1';
--      	 DATA_IN  <= b"000" & x"00020" &  b"000" & x"00021" &  b"000" & x"00022" &  b"000" & x"00023" &  b"000" & x"00024" & b"1111111111111";
--      wait for 20 ns;	
--		DATA_WE_IN  <= '0';
		
	  wait for 150 ns;
	     DATA_WE_IN  <= '1';
      	 DATA_IN  <= b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" & b"1111111111111";
      wait for 20 ns;	
		DATA_WE_IN  <= '0';
		
	  wait for 150 ns;
	     DATA_WE_IN  <= '1';
      	 DATA_IN  <= b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" &  b"000" & x"00000" & b"1111111111111";
      wait for 20 ns;	
		DATA_WE_IN  <= '0';
		
		
		
	  wait for 100 ns;	
		DATA_IN  <= (others  =>  '0');
	  wait for 90 ns;
	   -- DATA_RE_IN  <= '1';	
	
      -- insert stimulus here 

      wait;
   end process;

--	process 
--	begin
--		if(DATA_RDY_OUT = '1') then
--		  DATA_RE_IN  <= '1'; 
--		else
--		  DATA_RE_IN  <= '0';
--		end if;	
--	  wait for 10 ns;
--	end process;
	
--	process 
--	begin
--		if(DATA_RDY_OUT = '1' ) then
--		  DATA_RE_IN  <= '1';
--		  wait for 
--		  UPDATE_BC_IN <= '0';
--		else
--		  DATA_RE_IN  <= '0';
--
--		end if;	
--	  wait for 10 ns;
--	end process;
	
	
	
	
--	process 
--    begin
--		if (DATA_RDY_OUT = '0' and DATA_RE_IN = '1') then
--			--wait for 10 ns;
--		    UPDATE_BC_IN <= '1';
--		  else	  
--		    UPDATE_BC_IN  <=  '0';
--		end if;
--		wait for 10 ns;
--	end process;
END;
