-------------------------------------------------------------------------------
--
--  Module      : encode_8b10b_wrapper.vhd
--
--  Version     : 1.1
--
--  Last Update : 2008-10-31
--
--  Project     : 8b/10b Encoder Reference Design
--
--  Description : Top-level core wrapper file
--
--  Company     : Xilinx, Inc.
--
--  DISCLAIMER OF LIABILITY
--
--                This file contains proprietary and confidential information of
--                Xilinx, Inc. ("Xilinx"), that is distributed under a license
--                from Xilinx, and may be used, copied and/or disclosed only
--                pursuant to the terms of a valid license agreement with Xilinx.
--
--                XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION
--                ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
--                EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT
--                LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,
--                MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx
--                does not warrant that functions included in the Materials will
--                meet the requirements of Licensee, or that the operation of the
--                Materials will be uninterrupted or error-free, or that defects
--                in the Materials will be corrected.  Furthermore, Xilinx does
--                not warrant or make any representations regarding use, or the
--                results of the use, of the Materials in terms of correctness,
--                accuracy, reliability or otherwise.
--
--                Xilinx products are not designed or intended to be fail-safe,
--                or for use in any application requiring fail-safe performance,
--                such as life-support or safety devices or systems, Class III
--                medical devices, nuclear facilities, applications related to
--                the deployment of airbags, or any other applications that could
--                lead to death, personal injury or severe property or
--                environmental damage (individually and collectively, "critical
--                applications").  Customer assumes the sole risk and liability
--                of any use of Xilinx products in critical applications,
--                subject only to applicable laws and regulations governing
--                limitations on product liability.
--
--                Copyright 2008 Xilinx, Inc.  All rights reserved.
--
--                This disclaimer and copyright notice must be retained as part
--                of this file at all times.
--
-------------------------------------------------------------------------------
--
--  History
--
--  Date        Version   Description
--
--  10/31/2008  1.1       Initial release
--
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


--LIBRARY encode_8b10b;

-------------------------------------------------------------------------------
-- Entity Declaration
-------------------------------------------------------------------------------
ENTITY encode_8b10b_wrapper IS
  PORT (
    
    CLK          : IN  STD_LOGIC                    := '0';
    DIN          : IN  STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    KIN          : IN  STD_LOGIC                    := '0';                   
    DOUT         : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)       



    );
-------------------------------------------------------------------------------
-- Port Definitions 
-------------------------------------------------------------------------------
-- MANDATORY PORTS
--
--   CLK            : Clock input
--   DIN            : Data Input to be encoded
--   KIN            : Command Input, it determines if DIN is encoded as data
--                    (KIN=0) or as a special character (KIN=1)
--   DOUT           : Encoded 10-bit symbol
-------------------------------------------------------------------------------
-- OPTIONAL PORTS
--
--   CLK_B          : Clock input (B port)
--   DIN_B          : Data Input to be encoded (B port)
--   KIN_B          : Command Input, it determines if DIN_B is encoded as data
--                    (KIN_B=0) or as a special character (KIN_B=1) (B port)
--   DOUT_B         : Encoded 10-bit symbol (B port)
--  
--   CE[_B]         : Clock Enable
--   FORCE_CODE[_B] : Drives the Encoder data output and disparity to a 
--                    predefined initialization value
--   FORCE_DISP[_B] : When active, overrides the current running disparity with
--                    the external DISP_IN[_B] input
--   DISP_IN[_B]    : Sets the running disparity for the current input if
--                    FORCE_DISP[_B] is active, otherwise has no effect
--   DISP_OUT[_B]   : Current Encoder running disparity
--   ND[_B]         : New Data, Registered version of CE[_B]
--   KERR[_B]       : For debugging purposes, KERR[_B] is asserted if KIN is 
--                    active and DIN[_B] doesn't map to a defined special 
--                    character
-------------------------------------------------------------------------------
END encode_8b10b_wrapper;

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF encode_8b10b_wrapper IS

  CONSTANT LOW    : STD_LOGIC := '0';
  CONSTANT HIGH   : STD_LOGIC := '1';
  CONSTANT LOWSLV : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    
-------------------------------------------------------------------------------
-- BEGIN ARCHITECTURE
-------------------------------------------------------------------------------
BEGIN

enc: ENTITY work.encode_8b10b_top
  GENERIC MAP(
   C_ENCODE_TYPE       => 0, 
   C_FORCE_CODE_DISP   => 0, 
   C_FORCE_CODE_DISP_B => 0, 
   C_FORCE_CODE_VAL    => "1010101010",
   C_FORCE_CODE_VAL_B  => "1010101010",
   C_HAS_BPORTS        => 0, 
   C_HAS_CE            => 0,
   C_HAS_DISP_OUT      => 0,
   C_HAS_DISP_IN       => 0,
   C_HAS_FORCE_CODE    => 0,
   C_HAS_KERR          => 0,
   C_HAS_ND            => 0
    )
  PORT MAP (
    CLK           =>  CLK,
    DIN           =>  DIN,
    KIN           =>  KIN,
    DOUT          =>  DOUT,

    CE            =>  HIGH,
    FORCE_CODE    =>  LOW, 
    FORCE_DISP    =>  LOW, 
    DISP_IN       =>  LOW, 
    DISP_OUT      =>  open, 
    ND            =>  open, 
    KERR          =>  open, 
 
    CLK_B         =>  LOW,
    DIN_B         =>  LOWSLV,
    KIN_B         =>  LOW,
    DOUT_B        =>  open,

    CE_B          =>  HIGH,
    FORCE_CODE_B  =>  LOW, 
    FORCE_DISP_B  =>  LOW, 
    DISP_IN_B     =>  LOW, 
    DISP_OUT_B    =>  open, 
    ND_B          =>  open, 
    KERR_B        =>  open 
    );

-------------------------------------------------------------------------
-- Generic Definitions
-------------------------------------------------------------------------
--    C_ENCODE_TYPE            -- 0 slice, 1 blockRAM
--    C_FORCE_CODE_DISP        -- Force code disparity: 0 neg, 1 pos
--    C_FORCE_CODE_DISP_B      -- Force code disparity port B: 0 neg, 1 pos
--    C_FORCE_CODE_VAL         -- Force code value (10 bits)
--    C_FORCE_CODE_VAL_B       -- Force code value B (10 bits)
--    C_HAS_BPORTS             -- 1 if second encoder
--    C_HAS_CE                 -- 1 if CE(_B) port present
--    C_HAS_DISP_OUT           -- 1 if DISP_OUT(_B) port present
--    C_HAS_DISP_IN            -- 1 if FORCE_DISP(_B) port present
--    C_HAS_FORCE_CODE         -- 1 if FORCE_CODE(_B) port present
--    C_HAS_KERR               -- 1 if KERR(_B) port present
--    C_HAS_ND                 -- 1 if ND(_B) port present
-------------------------------------------------------------------------



-------------------------------------------------------------------------
--  How to set the C_FORCE_CODE_VAL(_B) and C_FORCE_CODE_DISP(_B) generics
-------------------------------------------------------------------------
--  initial value |   C_FORCE_CODE_VAL(_B)  |  C_FORCE_CODE_DISP(_B)
-------------------------------------------------------------------------
--  D.10.2 (pos)  |        1010101010       |           1
--  D.10.2 (neg)  |        1010101010       |           0
--  D.21.5 (pos)  |        0101010101       |           1
--  D.21.5 (neg)  |        0101010101       |           0
--  K.28.5 (neg)  |        0101111100       |           0
-------------------------------------------------------------------------


END xilinx;



