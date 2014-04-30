library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ddr_stability_checker is
  generic (
    SIMULATION : boolean := FALSE);
	port (
		CLK_IN : in std_logic;
		RESET_IN : in std_logic;
		
		DATA_IN : in std_logic_vector(9 downto 0);
		START_CHECK_IN : in std_logic;
		CHECK_DONE_OUT : out std_logic;
		REGISTERED_DATA_OUT : out std_logic_vector(9 downto 0)
	);
end entity ddr_stability_checker;

architecture RTL of ddr_stability_checker is

type check_states is (IDLE, REGISTER_DATA, COMPARE, CLEANUP);
signal check_current_state, check_next_state : check_states;
signal samples_ctr : integer range 0 to 1023;
signal registered_data : std_logic_vector(9 downto 0);

	
begin

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
		if RESET_IN = '1' then
			check_current_state <= IDLE;
		else
			check_current_state <= check_next_state;
		end if;
	end if;
end process;

process(check_current_state, samples_ctr, START_CHECK_IN)
begin
	case check_current_state is 
		when IDLE =>
			if (START_CHECK_IN = '1') then
				check_next_state <= REGISTER_DATA;
			else
				check_next_state <= IDLE;
			end if;
			
		when REGISTER_DATA =>
			check_next_state <= COMPARE;
			
		when COMPARE =>
			if (SIMULATION = TRUE and samples_ctr = 7) then
				check_next_state <= CLEANUP;
			elsif (SIMULATION = FALSE and samples_ctr = 254) then
				check_next_state <= CLEANUP;
                                
			else
				check_next_state <= REGISTER_DATA;
			end if;
			
		when CLEANUP =>
			check_next_state <= IDLE;
	end case;
end process;

process(CLK_IN)
begin
	if rising_edge(CLK_IN) then
	
		if (check_current_state = CLEANUP) then
			CHECK_DONE_OUT <= '1';
		else
			CHECK_DONE_OUT <= '0';
		end if;
		
		if (check_current_state = IDLE) then
			registered_data <= (others => '1');
		elsif (check_current_state = REGISTER_DATA) then
			registered_data <= registered_data and DATA_IN;
		else
			registered_data <= registered_data;
		end if;
		
		REGISTERED_DATA_OUT <= registered_data;
		
		if (check_current_state = IDLE) then
			samples_ctr <= 0;
		elsif (check_current_state = COMPARE) then
			samples_ctr <= samples_ctr + 1;
		else
			samples_ctr <= samples_ctr;
		end if;
		
	end if;
end process;


end architecture RTL;
