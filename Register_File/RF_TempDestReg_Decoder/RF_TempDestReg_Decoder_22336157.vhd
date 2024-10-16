----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 08.10.2023 18:06:29
-- Design Name: 
-- Module Name: RF_DestReg_Decoder_22336157 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 4 to 16 line decoder
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Temp_DestReg_Decoder_22336157 is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0); -- Input: 4-bit binary
        Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out STD_LOGIC; 
        Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15 : out STD_LOGIC -- Output: 16 lines
    );
end RF_Temp_DestReg_Decoder_22336157;

architecture Behavioral of RF_Temp_DestReg_Decoder_22336157 is

    signal A0_not, A1_not, A2_not, A3_not : std_logic; -- Inverted inputs
    signal and00, and01, and02, and03 : std_logic;
    signal and10, and11, and12, and13 : std_logic;
    signal and20, and21, and22, and23 : std_logic;
    signal and30, and31, and32, and33 : std_logic;
    signal and40, and41, and42, and43 : std_logic;
    signal and50, and51, and52, and53 : std_logic;
    signal and60, and61, and62, and63 : std_logic;
    signal and70, and71, and72, and73 : std_logic;
    signal and80, and81, and82, and83 : std_logic;
    signal and90, and91, and92, and93 : std_logic;
    signal and100, and101, and102, and103 : std_logic;
    signal and110, and111, and112, and113 : std_logic;
    signal and120, and121, and122, and123 : std_logic;
    signal and130, and131, and132, and133 : std_logic;
    signal and140, and141, and142, and143 : std_logic;
    signal and150, and151, and152, and153 : std_logic;
    
   --  Propagation Delay according to StdentID e.g. 26 33 57 25(DEC)
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1

begin

    -- NOT operations to generate inverted signals 
    A0_not <= not A(0) after NOT_gate_delay;
    A1_not <= not A(1) after NOT_gate_delay;
    A2_not <= not A(2) after NOT_gate_delay;
    A3_not <= not A(3) after NOT_gate_delay;

    -- S0: Breakdown of AND operations 0000
    and01 <=  A3_not and A2_not after AND_gate_delay;
    and02 <= and01 and A1_not after AND_gate_delay;
    and03 <= and02 and A0_not after AND_gate_delay;
    Q0 <= and03 after AND_gate_delay;

    -- S1: Breakdown of AND operations 0001
    and10 <= A3_not after AND_gate_delay; 
    and11 <= and10 and A2_not after AND_gate_delay;
    and12 <= and11 and A1_not after AND_gate_delay;
    and13 <= and12 and A(0) after AND_gate_delay;
    Q1 <= and13 after AND_gate_delay;

    -- S2: Breakdown of AND operations 0010
    and20 <= A3_not after AND_gate_delay;
    and21 <= and20 and A2_not after AND_gate_delay;
    and22 <= and21 and A(1) after AND_gate_delay;
    and23 <= and22 and A0_not after AND_gate_delay;
    Q2 <= and23 after AND_gate_delay;

    -- S3: Breakdown of AND operations
    and30 <= A3_not after AND_gate_delay;
    and31 <= and30 and A2_not after AND_gate_delay;
    and32 <= and31 and A(1) after AND_gate_delay;
    and33 <= and32 and A(0) after AND_gate_delay;
    Q3 <= and33 after AND_gate_delay;

    -- S4: Breakdown of AND operations
    and40 <=  A3_not after AND_gate_delay;
    and41 <= and40 and  A(2) after AND_gate_delay;
    and42 <= and41 and  A1_not after AND_gate_delay;
    and43 <= and42 and  A0_not after AND_gate_delay;
    Q4 <= and43 after AND_gate_delay;

    -- S5: Breakdown of AND operations
    and50 <= A3_not after AND_gate_delay;
    and51 <= and50 and A(2) after AND_gate_delay;
    and52 <= and51 and A1_not after AND_gate_delay;
    and53 <= and52 and A(0) after AND_gate_delay;
    Q5 <= and53 after AND_gate_delay;

    -- S6: Breakdown of AND operations
    and60 <= A3_not after AND_gate_delay;
    and61 <= and60 and A(2) after AND_gate_delay;
    and62 <= and61 and A(1) after AND_gate_delay;
    and63 <= and62 and A0_not after AND_gate_delay;
    Q6 <= and63 after AND_gate_delay;

    -- S7: Breakdown of AND operations
    and70 <= A3_not after AND_gate_delay;
    and71 <= and70 and A(2) after AND_gate_delay;
    and72 <= and71 and A(1) after AND_gate_delay;
    and73 <= and72 and A(0) after AND_gate_delay;
    Q7 <= and73 after AND_gate_delay;

    -- S8: Breakdown of AND operations
    and80 <= A(3) after AND_gate_delay;
    and81 <= and80 and A2_not after AND_gate_delay;
    and82 <= and81 and A1_not after AND_gate_delay;
    and83 <= and82 and A0_not after AND_gate_delay;
    Q8 <= and83 after AND_gate_delay;

    -- S9: Breakdown of AND operations
    and90 <= A(3) after AND_gate_delay;
    and91 <= and90 and A2_not after AND_gate_delay;
    and92 <= and91 and A1_not after AND_gate_delay;
    and93 <= and92 and A(0) after AND_gate_delay;
    Q9 <= and93 after AND_gate_delay;

    -- S10: Breakdown of AND operations
    and100 <= A(3) after AND_gate_delay;
    and101 <= and100 and A2_not after AND_gate_delay;
    and102 <= and101 and A(1) after AND_gate_delay;
    and103 <= and102 and A0_not after AND_gate_delay;
    Q10 <= and103 after AND_gate_delay;

    -- S11: Breakdown of AND operations
    and110 <= A(3) after AND_gate_delay;
    and111 <= and110 and A2_not after AND_gate_delay;
    and112 <= and111 and A(1) after AND_gate_delay;
    and113 <= and112 and A(0) after AND_gate_delay;
    Q11 <= and113 after AND_gate_delay;

    -- S12: Breakdown of AND operations
    and120 <= A(3) after AND_gate_delay;
    and121 <= and120 and A(2) after AND_gate_delay;
    and122 <= and121 and A1_not after AND_gate_delay;
    and123 <= and122 and A0_not after AND_gate_delay;
    Q12 <= and123 after AND_gate_delay;

    -- S13: Breakdown of AND operations
    and130 <= A(3) after AND_gate_delay;
    and131 <= and130 and A(2) after AND_gate_delay;
    and132 <= and131 and A1_not after AND_gate_delay;
    and133 <= and132 and A(0) after AND_gate_delay;
    Q13 <= and133 after AND_gate_delay;

    -- S14: Breakdown of AND operations
    and140 <= A(3) after AND_gate_delay;
    and141 <= and140 and A(2) after AND_gate_delay;
    and142 <= and141 and A(1) after AND_gate_delay;
    and143 <= and142 and A0_not after AND_gate_delay;
    Q14 <= and143 after AND_gate_delay;

    -- S15: Breakdown of AND operations
    and150 <= A(3) after AND_gate_delay;
    and151 <= and150 and A(2) after AND_gate_delay;
    and152 <= and151 and A(1) after AND_gate_delay;
    and153 <= and152 and A(0) after AND_gate_delay;
    Q15 <= and153 after AND_gate_delay;

end Behavioral;
