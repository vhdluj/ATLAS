--////////////////////////////////////////////////////////////////////////////////
--//   ____  ____ 
--//  /   /\/   / 
--// /___/  \  /    Vendor: Xilinx 
--// \   \   \/     Version : 2.7
--//  \   \         Application : 7 Series FPGAs Transceivers Wizard 
--//  /   /         Filename :gtx_minipond_k7_ctle_agc_comp.vhd
--// /___/   /\     
--// \   \  /  \ 
--//  \___\/\___\ 
--//
--//
--  Description :     This module performs TX reset and initialization.
--                     
--
--
-- Module gtx_minipond_k7_ctle_agc_comp
-- Generated by Xilinx 7 Series FPGAs Transceivers Wizard
-- 
-- 
-- (c) Copyright 2010-2012 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES. 


--*****************************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

library unisim;
use unisim.vcomponents.all;

entity gtx_minipond_k7_ctle_agc_comp is
generic(
  AGC_TIMER: integer range 0 to 4095 := 150
	--DCLK FREQ (in MHZ) * 12.5 / (Line Rate in Gbps)
	--Max DCLK is 150MHz.  Min Line Rate is 0.5Gbps per data sheet
);
port (
	RST                  :  in  STD_LOGIC;          --RST low starts state machine
	DONE                 :  out  STD_LOGIC;        --DONE asserted when complete, deasserted with RST high
	
	--DRP for accessing CTLE3
	DRDY                 :  in  STD_LOGIC;         --Connect to Channel DRP 
	DO                   :  in  STD_LOGIC_VECTOR(15 downto 0);    --Connect to Channel DRP 
	
	DCLK                 :  in  STD_LOGIC;         --Connect to same clk as Channel DRP DCLK
	DADDR                :  out  STD_LOGIC_VECTOR(8 downto 0); --Connect to Channel DRP
	DI                   :  out  STD_LOGIC_VECTOR(15 downto 0);   --Connect to Channel DRP
	DEN                  :  out  STD_LOGIC;         --Connect to Channel DRP
	DWE                  :  out  STD_LOGIC;         --Connect to Channel DRP

	--RXMONITOR to observe AGC
	RXMONITOR            :  in  STD_LOGIC_VECTOR(6 downto 0);			--Connect to RXMONITOR port
	RXMONITORSEL         :  out  STD_LOGIC_VECTOR(1 downto 0);	--Connect to RXMONITORSEL port

	--DEBUG
	curr_state           :  out  STD_LOGIC_VECTOR(3 downto 0);
	agc_railing          :  out  STD_LOGIC
	
);
end gtx_minipond_k7_ctle_agc_comp;

architecture Behavioral of gtx_minipond_k7_ctle_agc_comp is

   constant DLY               : time := 1 ns;
	constant CTLE3_ADDR        : std_logic_vector(8 downto 0) := "010000011";  --integer range 0 to 511 := 131;
	constant CTLE3_UPPER_LIMIT : integer := 7;
	constant CTLE3_LOWER_LIMIT : integer := 0;
	constant AGC_UPPER_LIMIT   : integer := 30;
	constant AGC_LOWER_LIMIT   : integer := 1;

	constant AGC_BW_ADDR       : std_logic_vector(8 downto 0) := "000011101";
	constant AGC_BW_1X         : std_logic_vector(3 downto 0) := "0000";
	constant AGC_BW_4X         : std_logic_vector(3 downto 0) := "0010";
	constant AGC_BW_8X         : std_logic_vector(3 downto 0) := "0011";

	--DCLK_FREQ is actually DCLK_FREQ * 12.5/LineRate in Gbps
	constant UPDATE_TIMER_LIMIT      : integer range 0 to 16380 := AGC_TIMER*4;--At 12.5Gbps, wait 240us in 8x. 12-bits multiply by 4, 14 bits
	constant UPDATE_TIMER_LIMIT_4X   : integer range 0 to 32760 := UPDATE_TIMER_LIMIT*2;--14 bits multiply by 2. 15 bits.

   constant IDLE              : std_logic_vector(3 downto 0) := "0000";
	constant READ              : std_logic_vector(3 downto 0) := "0001";
	constant WAIT_READ         : std_logic_vector(3 downto 0) := "0010";
	constant DECIDE            : std_logic_vector(3 downto 0) := "0011";
	constant INC_S             : std_logic_vector(3 downto 0) := "0100";
	constant DEC_S             : std_logic_vector(3 downto 0) := "0101";
	constant WRITE             : std_logic_vector(3 downto 0) := "0110";
	constant WAIT_UPDATE       : std_logic_vector(3 downto 0) := "0111";
	constant DONE_ST           : std_logic_vector(3 downto 0) := "1000";
	constant READ_AGC_BW       : std_logic_vector(3 downto 0) := "1001"; 	
	constant WAIT_READ_AGC_BW  : std_logic_vector(3 downto 0) := "1010"; 	
	constant MODIFY_AGC_BW     : std_logic_vector(3 downto 0) := "1011"; 	
	constant WRITE_AGC_BW      : std_logic_vector(3 downto 0) := "1100"; 	
	constant WAIT_WRITE_AGC_BW : std_logic_vector(3 downto 0) := "1101"; 	
	constant DOWNSHIFT_4X_S    : std_logic_vector(3 downto 0) := "1110";
	constant WAIT_AGC_4X       : std_logic_vector(3 downto 0) := "1111";
	--parameter KEEP        = 4'b1111;
	
	signal in_progress         : std_logic;
	signal in_progress_b       : std_logic;
	
	signal agc_reg             : std_logic_vector(4 downto 0);
	signal agc_reg0            : std_logic_vector(4 downto 0);

	signal agc_bw              : std_logic_vector(3 downto 0);

	signal ctle3_reg           : std_logic_vector(3 downto 0);
	signal ctle3_ld            : std_logic_vector(3 downto 0);
	
	signal next_state          : std_logic_vector(3 downto 0);
	signal rxmon_sel           : std_logic_vector(1 downto 0);

	signal update_timer        : std_logic_vector(14 downto 0);
	signal clk_div_counter     : std_logic_vector(5 downto 0); 
	--reg [10:0] clk_div_counter; 
	signal den_int             : std_logic;
	signal den_int2            : std_logic;
	signal dwe_int             : std_logic;
	signal do_reg              : std_logic_vector(15 downto 0);
	signal done_drp            : std_logic;
	signal di_int              : std_logic_vector(15 downto 0);
	signal daddr_int           : std_logic_vector(8 downto 0);
	signal inc                 : std_logic;
	signal dec                 : std_logic;
	signal incdec              : std_logic_vector(1 downto 0);
	signal curr_state_reg      : std_logic_vector(3 downto 0);

	signal clk_int_en          : std_logic;
	signal clk_timer_en        : std_logic;
	signal write_state         : std_logic;
	signal done_state          : std_logic;
	signal downshift_4x_state  : std_logic;
	signal read_state          : std_logic;
	signal wait_agc_4x_state   : std_logic;
	signal min_agc             : std_logic;
	signal max_agc             : std_logic;
	signal agc_not_railed      : std_logic;
	signal agc_not_railed_l    : std_logic;
	signal rxmon_ok_l          : std_logic;
	signal rxmon_ok_l_b        : std_logic;
	signal downshift_4x        : std_logic;
	signal downshift_1x        : std_logic;
	signal DEN_reg             : std_logic;
	signal DONE_INT            : std_logic;
	signal agc_railing_int     : std_logic;
	signal agc_interm          : std_logic_vector(3 downto 0);

begin
	--Assign AGC BW to 4x in beginning then 1x after done adjusting CTLE3.
DONE    <= DONE_INT;
DEN     <= DEN_reg;
agc_railing <= agc_railing_int;
curr_state <= curr_state_reg;
agc_interm <= AGC_BW_4X when(downshift_4x='1') else AGC_BW_8X;
agc_bw <= AGC_BW_1X when(downshift_1x='1') else agc_interm; 
	--assign agc_bw = done_pre ? AGC_BW_1X : AGC_BW_4X; 

process(DCLK)
	--always@(posedge clk_int)
begin
  if rising_edge(DCLK) then   
    if(clk_int_en='1') then
      if((curr_state_reg = WRITE) or (curr_state_reg = WRITE_AGC_BW)) then
        write_state          <= '1' after DLY;
      else  
        write_state          <= '0' after DLY;
      end if;
      if(curr_state_reg = DONE_ST) then
		  done_state           <= '1' after DLY;
      else  
		  done_state           <= '0' after DLY;
      end if;
      if(curr_state_reg = DOWNSHIFT_4X_S) then
		  downshift_4x_state   <= '1' after DLY;
      else  
		  downshift_4x_state   <= '0' after DLY;
      end if;
      if(curr_state_reg = WAIT_AGC_4X) then
		  wait_agc_4x_state    <= '1' after DLY;
      else  
		  wait_agc_4x_state    <= '0' after DLY;
      end if;
      if(curr_state_reg = READ) then
        read_state           <= '1' after DLY;
      else  
        read_state           <= '0' after DLY;
      end if;
    end if;
  end if;
end process;

incdec                     <= inc & dec;
DWE                        <= dwe_int;
in_progress_b              <= not(in_progress);
RXMONITORSEL               <= rxmon_sel;
	

	--DRP signals. Hard-code address for GTX CTLE3. AGC read is done thru RX_MONITOR
	--assign DADDR = in_progress_b ? 9'd0 : CTLE3_ADDR;
DADDR                      <= (others=>'0') when(in_progress_b='1') else daddr_int;
DI                         <= (others=>'0') when(in_progress_b='1') else di_int;

	--assign di_int[11:0]  = do_reg[11:0];
	--assign di_int[15:12] = (curr_state_reg == WRITE || curr_state_reg == WAIT_UPDATE) ? ctle3_ld[3:0] : ctle3_reg;

ctle3_reg                  <= do_reg(15 downto 12);

	--Divide clock
--	/*initial --For Sim
--	begin
--		clk_div_counter <= 1'b0;
--	end*/

process(DCLK)
begin
  if rising_edge(DCLK) then
    clk_div_counter        <= clk_div_counter + '1' after DLY;
  end if;
end process;

	--State machine and most logic on divided-16 clock. Only latching of input signals and DEN are on full-rate clock.  Timers are on divided 2048 clock.
clk_int_en                 <= '1' when(clk_div_counter(3 downto 0)="1111") else '0'; --div 16
clk_timer_en               <= '1' when(clk_div_counter(5 downto 0)="111111") else '0';--div 64 For synth
	--assign clk_timer_en = (clk_div_counter == 11'b000_0001_1111);--div 1024 For sim

	--den_int updated by divided down clock. Want DEN to be 1 DCLK cycle wide.
DEN_reg                        <= (den_int and not(den_int2));

process(DCLK)
begin
  if rising_edge(DCLK) then    
		den_int2 <= den_int after DLY;
  end if;
end process;      

process(DCLK)
begin
  if rising_edge(DCLK) then    
	 if(in_progress_b='1') then
		do_reg         <= (others=>'0') after DLY;
		done_drp       <= '0' after DLY;
	 else
      if(DRDY='1') then
			do_reg      <= DO after DLY;
			done_drp    <= '1' after DLY;
      elsif(DEN_reg='1') then
			done_drp <= '0' after DLY;
      end if;
    end if;
  end if;
end process;

process(DCLK)
begin
  if rising_edge(DCLK) then
		agc_reg0 <= RXMONITOR(4 downto 0) after DLY;
		agc_reg  <= agc_reg0 after DLY;
  end if;
end process;

min_agc           <= '1' when(agc_reg(4 downto 0) = "00000") else '0'; 
max_agc           <= '1' when(agc_reg(4 downto 0) = "11111") else '0';
agc_not_railed    <= not(min_agc or max_agc);


--SR latch. CLR is dominant.
DONE_sr_ff : FDRE 
generic map ( INIT => '0'
)
port map (
	 Q    => DONE_INT,
	 R    => RST,
	 D    => '1',
	 CE   => done_state,
	 C    => DCLK
 );

--Determine when to clear latched AGC value
rxmon_ok_sr_ff : FDRE 
generic map ( INIT => '0'
)
port map (
	 Q    => rxmon_ok_l,
	 R    => RST,
	 D    => '1',
	 CE   => read_state,
	 C    => DCLK
 );

agc_sr_ff : FDSE 
generic map ( INIT => '0'
)
port map (
	 Q    => agc_not_railed_l,
	 CE   => rxmon_ok_l_b,
	 D    => '0',
	 S    => agc_not_railed,
	 C    => DCLK
 );

downshift_4x_sr_ff : FDRE 
generic map ( INIT => '0'
)
port map (
	 Q    => downshift_4x,
	 R    => RST,
	 D    => '1',
	 CE   => downshift_4x_state,
	 C    => DCLK
 );

downshift_1x_sr_ff : FDRE 
generic map ( INIT => '0'
)
port map (
	 Q    => downshift_1x,
	 R    => RST,
	 D    => '1',
	 CE   => wait_agc_4x_state,
	 C    => DCLK
 );

rxmon_ok_l_b   <= not(rxmon_ok_l);
agc_railing_int <= not(agc_not_railed_l);
	

process(DCLK,RST)
begin
    if(RST='1') then
	   in_progress <= '0' after DLY;
    elsif(rising_edge(DCLK)) then
      if(DONE_INT='1') then
	   in_progress <= '0' after DLY;
	   else
		in_progress <= '1' after DLY;
    end if;
  end if;
end process;

process(DCLK,write_state)
begin
  if (write_state='1') then       
			update_timer <= (others=>'0') after DLY;
  elsif(rising_edge(DCLK)) then      
    if(clk_timer_en='1' and ((curr_state_reg = WAIT_UPDATE) or (curr_state_reg = WAIT_AGC_4X))) then
	    update_timer <= update_timer + '1' after DLY;
	 end if;
  end if;
end process;  

	--State machine
process(DCLK)
begin
  if rising_edge(DCLK) then    
    if(clk_int_en='1') then
	   curr_state_reg <= next_state after DLY;
	 end if;
  end if;
end process;  

process(curr_state_reg,in_progress_b,done_drp,downshift_1x,downshift_4x,agc_reg,ctle3_reg,agc_railing_int)
begin
		--in_progress_b asserted by RST or DONE_ST state
  if(in_progress_b='1') then
    next_state <= IDLE after DLY;
  else
	 case curr_state_reg is
		when IDLE =>
		  next_state <= READ_AGC_BW after DLY;
					
		when READ_AGC_BW =>
		  next_state <= WAIT_READ_AGC_BW after DLY;
		
      when WAIT_READ_AGC_BW =>
        if(done_drp='1') then
		    next_state <= MODIFY_AGC_BW after DLY;
		  else
		  	 next_state <= WAIT_READ_AGC_BW after DLY;
        end if;  
				
		when MODIFY_AGC_BW =>
		  next_state <= WRITE_AGC_BW after DLY;
				
		when WRITE_AGC_BW =>
		  next_state <= WAIT_WRITE_AGC_BW after DLY;
				
      when WAIT_WRITE_AGC_BW =>
        if(done_drp='1') then
			 if(downshift_1x='1') then
			   next_state <= DONE_ST after DLY; --Done setting 1x AGC so must be done.
			 elsif(downshift_4x='1') then
				next_state <= WAIT_AGC_4X after DLY; --Wait for 4x AGC convergence.
			 else
				next_state <= READ after DLY;  --Done setting 8x AGC. Start CTLE3 compensation.
          end if;
		  else
		  	 next_state <= WAIT_WRITE_AGC_BW after DLY;
        end if;  

	   when READ =>
		  next_state <= WAIT_READ after DLY;
			
		when WAIT_READ => 
        if(done_drp='1') then
		  	 next_state <= DECIDE after DLY;
		  else
			 next_state <= WAIT_READ after DLY;
        end if;
				
		when DECIDE =>
	     --Update CTLE3 based on AGC value. 
	     --Do not update if AGC not railing (e.g. OK if dithering between 0 & 1)
        if((agc_reg < AGC_LOWER_LIMIT) and (ctle3_reg < CTLE3_UPPER_LIMIT) and (agc_railing_int='1')) then
	     	 next_state <= INC_S after DLY;
        elsif((agc_reg > AGC_UPPER_LIMIT) and (ctle3_reg > CTLE3_LOWER_LIMIT) and (agc_railing_int='1')) then
	     	next_state <= DEC_S after DLY;
	     else --Done adjusting. Go back to 4x AGC BW
	     	next_state <= DOWNSHIFT_4X_S after DLY;
		  end if;	

		when INC_S =>
		  next_state <= WRITE after DLY;
		
		when DEC_S =>
		  next_state <= WRITE after DLY;
		
		when WRITE =>
		 next_state <= WAIT_UPDATE after DLY;
		
		when WAIT_UPDATE =>
		  if(update_timer = UPDATE_TIMER_LIMIT) then
		 	 next_state <= READ after DLY;
		  else
			 next_state <= WAIT_UPDATE after DLY;
		  end if;

		when DOWNSHIFT_4X_S =>
		  next_state <= READ_AGC_BW after DLY;
		
      when WAIT_AGC_4X =>
		  if(update_timer = UPDATE_TIMER_LIMIT_4X) then
			 next_state <= READ_AGC_BW after DLY;
		  else
		  	 next_state <= WAIT_AGC_4X after DLY;
		  end if;

		when DONE_ST =>
		  next_state <= DONE_ST after DLY;
					
		when others =>
		  next_state <= IDLE after DLY;
					
 	 end case;
  end if;
end process;


process(curr_state_reg,do_reg,agc_bw,ctle3_ld)
begin
  case curr_state_reg is
	 when IDLE =>
	   inc <= '0' after DLY;
	   dec <= '0' after DLY;
	   den_int <= '0' after DLY;
	   dwe_int <= '0' after DLY;
	   di_int  <= (others=>'0') after DLY;
	   daddr_int  <= (others=>'0') after DLY;
	   rxmon_sel <= (others=>'0') after DLY;
		
	 when READ_AGC_BW =>
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '1' after DLY;
		dwe_int <= '0' after DLY;
		di_int  <= (others=>'0') after DLY;
		daddr_int  <= AGC_BW_ADDR after DLY;
		rxmon_sel <= (others=>'0') after DLY;
		
	 when WAIT_READ_AGC_BW =>
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int  <= do_reg after DLY;
		daddr_int  <= AGC_BW_ADDR after DLY;
		rxmon_sel <= (others=>'0') after DLY;
		
			--Modify to 4x
	 when MODIFY_AGC_BW =>
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= agc_bw & do_reg(11 downto 0) after DLY;
		--di_int <= {do_reg[15:7],agc_bw,do_reg[2:0]};
		daddr_int  <= AGC_BW_ADDR after DLY;
		rxmon_sel <= (others=>'0') after DLY;
		
	 when WRITE_AGC_BW =>
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '1' after DLY;
		dwe_int <= '1' after DLY;
		di_int <= agc_bw & do_reg(11 downto 0) after DLY;
		--di_int <= {do_reg[15:7],agc_bw,do_reg[2:0]} after DLY;
		daddr_int  <= AGC_BW_ADDR after DLY;
		rxmon_sel <= (others=>'0') after DLY;
		
	 when	WAIT_WRITE_AGC_BW =>
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= agc_bw & do_reg(11 downto 0) after DLY;
		--di_int <= {do_reg[15:7],agc_bw,do_reg[2:0]};
		daddr_int  <= AGC_BW_ADDR after DLY;
		rxmon_sel <= (others=>'0') after DLY;
		
	 when READ =>
		--Issue DRP read for addr x083 where ctle3_re is located.
		--1st step in READ-MODIFY-WRITE
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '1' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= do_reg after DLY;
		daddr_int  <= CTLE3_ADDR after DLY;
		rxmon_sel <= "01" after DLY;
			
	 when WAIT_READ =>
		--Wait until see DONE_ST signal from DRP
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= do_reg after DLY;
		daddr_int  <= CTLE3_ADDR after DLY;
		rxmon_sel <= "01" after DLY;
			
	 when	DECIDE =>
		--Update CTLE3 value based on AGC value
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= do_reg after DLY;
		daddr_int  <= CTLE3_ADDR after DLY;
		rxmon_sel <= "01" after DLY;
			
	 when INC_S =>
		inc <= '1' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= do_reg after DLY;
		daddr_int  <= CTLE3_ADDR after DLY;
		rxmon_sel <= "01" after DLY;
		
	 when	DEC_S =>
      inc <= '0' after DLY;
		dec <= '1' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= do_reg after DLY;
		daddr_int  <= CTLE3_ADDR after DLY;
		rxmon_sel <= "01" after DLY;
		 
	 when WRITE =>
		--Write new CTLE3 value
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '1' after DLY;
		dwe_int <= '1' after DLY;
		di_int <= ctle3_ld & do_reg(11 downto 0) after DLY;
		daddr_int  <= CTLE3_ADDR after DLY;
		rxmon_sel <= "01" after DLY;
		
	 when WAIT_UPDATE =>
		--Wait for 1024 cycles to give time for AGC to adapt
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= ctle3_ld & do_reg(11 downto 0) after DLY;
		daddr_int  <= CTLE3_ADDR after DLY;
		rxmon_sel <= "01" after DLY;
			
	 when DOWNSHIFT_4X_S =>
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int  <= (others=>'0') after DLY;
		daddr_int  <= AGC_BW_ADDR after DLY;
		rxmon_sel <= (others=>'0') after DLY;
			
	 when WAIT_AGC_4X =>
		--Wait for AGC to adapt
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int  <= (others=>'0') after DLY;
		daddr_int  <= AGC_BW_ADDR after DLY;
		rxmon_sel <= "01" after DLY;
			
	 when DONE_ST =>
		--DONE_ST
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= (others=>'0') after DLY;
		daddr_int  <= (others=>'0') after DLY;
		rxmon_sel <= (others=>'0') after DLY;
			
	 when	others =>
		inc <= '0' after DLY;
		dec <= '0' after DLY;
		den_int <= '0' after DLY;
		dwe_int <= '0' after DLY;
		di_int <= (others=>'0') after DLY;
		daddr_int  <= (others=>'0') after DLY;
		rxmon_sel <= (others=>'0') after DLY;
				
  end case;
end process;

process(DCLK)
	--always @ (posedge clk_int)
begin
  if rising_edge(DCLK) then
    if(clk_int_en='1') then
      if(in_progress_b='1') then
		  --if(in_progress_b || time_reached)
		  ctle3_ld <= ctle3_reg after DLY;
		else
        case incdec is
			 when	"01" =>
				ctle3_ld <= ctle3_reg - '1' after DLY;
			 when "10" =>
				ctle3_ld <= ctle3_reg + '1' after DLY;
			 when others =>
				ctle3_ld <= ctle3_ld after DLY;
			 end case;
      end if;
	 end if;
  end if;
end process;

end Behavioral;

--For synth: LDCE as SR latch
---module LDCE #(
---	parameter INIT = 1'b0
---)
---(
---	output reg Q,
---	input CLR,
---	input D,
---	input G,
---	input GE
---);
---
---	initial
---	begin
---		Q <= INIT;
---	end
---
---	always @ (CLR or G)
---	begin
---		if(CLR)
---			Q <= 1'b0;
---		else if(G)
---			Q <= 1'b1;
---	end
---
---endmodule 
