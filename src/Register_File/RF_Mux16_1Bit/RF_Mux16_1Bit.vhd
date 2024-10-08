----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 04.10.2024
-- Design Name: 
-- Module Name: Mux16_1Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 16-to-1 Mux using only 2-input AND and OR gates
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

entity RF_Mux16_1Bit is
    Port ( 
        I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : in STD_LOGIC;   -- 1 bit inputs
        S0, S1, S2, S3 : in STD_LOGIC;        -- 4 Selection Signals (for 16 inputs)
        Y : out STD_LOGIC                    -- 1 bit output
    );
end RF_Mux16_1Bit;

architecture Behavioral of RF_Mux16_1Bit is
    -- Internal signals to handle the inverted select lines
    signal S0_not, S1_not, S2_not, S3_not : std_logic;
    
    -- Intermediate signals for AND gates (broken down into 2-input AND gates)
    signal and0, and1, and2, and3, and4, and5, and6, and7 : std_logic;
    signal and8, and9, and10, and11, and12, and13, and14, and15 : std_logic;
    
    -- Intermediate signals for OR gates
    signal or0, or1, or2, or3, or4, or5, or6, or7 : std_logic;
    signal or8, or9, or10 : std_logic;

     signal or_final1, or_final2: std_logic;

    -- Propagation Delay (as per your original specification)
    constant AND_gate_delay : Time := 8ns;
    constant OR_gate_delay : Time := 2ns;
    constant NOT_gate_delay : Time := 3ns;
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin
    -- Invert the selection signals
    S0_not <= not S0 after NOT_gate_delay;
    S1_not <= not S1 after NOT_gate_delay;
    S2_not <= not S2 after NOT_gate_delay;
    S3_not <= not S3 after NOT_gate_delay;

    -- AND gates using only 2-input AND gates
    and0 <= I0 and S0_not and S1_not and S2_not and S3_not after AND_gate_delay;
    and1 <= I1 and S0 and S1_not and S2_not and S3_not after AND_gate_delay;
    and2 <= I2 and S0_not and S1 and S2_not and S3_not after AND_gate_delay;
    and3 <= I3 and S0 and S1 and S2_not and S3_not after AND_gate_delay;
    and4 <= I4 and S0_not and S1_not and S2 and S3_not after AND_gate_delay;
    and5 <= I5 and S0 and S1_not and S2 and S3_not after AND_gate_delay;
    and6 <= I6 and S0_not and S1 and S2 and S3_not after AND_gate_delay;
    and7 <= I7 and S0 and S1 and S2 and S3_not after AND_gate_delay;
    and8 <= I8 and S0_not and S1_not and S2_not and S3 after AND_gate_delay;
    and9 <= I9 and S0 and S1_not and S2_not and S3 after AND_gate_delay;
    and10 <= I10 and S0_not and S1 and S2_not and S3 after AND_gate_delay;
    and11 <= I11 and S0 and S1 and S2_not and S3 after AND_gate_delay;
    and12 <= I12 and S0_not and S1_not and S2 and S3 after AND_gate_delay;
    and13 <= I13 and S0 and S1_not and S2 and S3 after AND_gate_delay;
    and14 <= I14 and S0_not and S1 and S2 and S3 after AND_gate_delay;
    and15 <= I15 and S0 and S1 and S2 and S3 after AND_gate_delay;

    -- Breaking the AND gates into 2-input AND gates
    signal temp0_1, temp0_2: std_logic;
    signal temp1_1, temp1_2: std_logic;
    signal temp2_1, temp2_2: std_logic;
    signal temp3_1, temp3_2: std_logic;
    signal temp4_1, temp4_2: std_logic;
    signal temp5_1, temp5_2: std_logic;
    signal temp6_1, temp6_2: std_logic;
    signal temp7_1, temp7_2: std_logic;
    signal temp8_1, temp8_2: std_logic;
    signal temp9_1, temp9_2: std_logic;
    signal temp10_1, temp10_2: std_logic;
    signal temp11_1, temp11_2: std_logic;
    signal temp12_1, temp12_2: std_logic;
    signal temp13_1, temp13_2: std_logic;
    signal temp14_1, temp14_2: std_logic;
    signal temp15_1, temp15_2: std_logic;

    -- Final output signal
    or_final1 <= or8 or or9 after OR_gate_delay;
    or_final2 <= or_final1 or final_or after OR_gate_delay;

begin
    -- Use 2-input AND gates to create AND conditions
    temp0_1 <= I0 and S0_not after AND_gate_delay;
    temp0_2 <= temp0_1 and S1_not after AND_gate_delay;
    and0 <= temp0_2 and S2_not after AND_gate_delay;
    and0 <= and0 and S3_not after AND_gate_delay;

    temp1_1 <= I1 and S0 after AND_gate_delay;
    temp1_2 <= temp1_1 and S1_not after AND_gate_delay;
    and1 <= temp1_2 and S2_not after AND_gate_delay;
    and1 <= and1 and S3_not after AND_gate_delay;

    temp2_1 <= I2 and S0_not after AND_gate_delay;
    temp2_2 <= temp2_1 and S1 after AND_gate_delay;
    and2 <= temp2_2 and S2_not after AND_gate_delay;
    and2 <= and2 and S3_not after AND_gate_delay;

    temp3_1 <= I3 and S0 after AND_gate_delay;
    temp3_2 <= temp3_1 and S1 after AND_gate_delay;
    and3 <= temp3_2 and S2_not after AND_gate_delay;
    and3 <= and3 and S3_not after AND_gate_delay;

    temp4_1 <= I4 and S0_not after AND_gate_delay;
    temp4_2 <= temp4_1 and S1_not after AND_gate_delay;
    and4 <= temp4_2 and S2 after AND_gate_delay;
    and4 <= and4 and S3_not after AND_gate_delay;

    temp5_1 <= I5 and S0 after AND_gate_delay;
    temp5_2 <= temp5_1 and S1_not after AND_gate_delay;
    and5 <= temp5_2 and S2 after AND_gate_delay;
    and5 <= and5 and S3_not after AND_gate_delay;

    temp6_1 <= I6 and S0_not after AND_gate_delay;
    temp6_2 <= temp6_1 and S1 after AND_gate_delay;
    and6 <= temp6_2 and S2 after AND_gate_delay;
    and6 <= and6 and S3_not after AND_gate_delay;

    temp7_1 <= I7 and S0 after AND_gate_delay;
    temp7_2 <= temp7_1 and S1 after AND_gate_delay;
    and7 <= temp7_2 and S2 after AND_gate_delay;
    and7 <= and7 and S3_not after AND_gate_delay;

    temp8_1 <= I8 and S0_not after AND_gate_delay;
    temp8_2 <= temp8_1 and S1_not after AND_gate_delay;
    and8 <= temp8_2 and S2_not after AND_gate_delay;
    and8 <= and8 and S3 after AND_gate_delay;

    temp9_1 <= I9 and S0 after AND_gate_delay;
    temp9_2 <= temp9_1 and S1_not after AND_gate_delay;
    and9 <= temp9_2 and S2_not after AND_gate_delay;
    and9 <= and9 and S3 after AND_gate_delay;

    temp10_1 <= I10 and S0_not after AND_gate_delay;
    temp10_2 <= temp10_1 and S1 after AND_gate_delay;
    and10 <= temp10_2 and S2_not after AND_gate_delay;
    and10 <= and10 and S3 after AND_gate_delay;

    temp11_1 <= I11 and S0 after AND_gate_delay;
    temp11_2 <= temp11_1 and S1 after AND_gate_delay;
    and11 <= temp11_2 and S2_not after AND_gate_delay;
    and11 <= and11 and S3 after AND_gate_delay;

    temp12_1 <= I12 and S0_not after AND_gate_delay;
    temp12_2 <= temp12_1 and S1_not after AND_gate_delay;
    and12 <= temp12_2 and S2 after AND_gate_delay;
    and12 <= and12 and S3 after AND_gate_delay;

    temp13_1 <= I13 and S0 after AND_gate_delay;
    temp13_2 <= temp13_1 and S1_not after AND_gate_delay;
    and13 <= temp13_2 and S2 after AND_gate_delay;
    and13 <= and13 and S3 after AND_gate_delay;

    temp14_1 <= I14 and S0_not after AND_gate_delay;
    temp14_2 <= temp14_1 and S1 after AND_gate_delay;
    and14 <= temp14_2 and S2 after AND_gate_delay;
    and14 <= and14 and S3 after AND_gate_delay;

    temp15_1 <= I15 and S0 after AND_gate_delay;
    temp15_2 <= temp15_1 and S1 after AND_gate_delay;
    and15 <= temp15_2 and S2 after AND_gate_delay;
    and15 <= and15 and S3 after AND_gate_delay;

    -- OR the AND gates to produce the final output using only 2-input OR gates
    or0 <= and0 or and1 after OR_gate_delay;
    or1 <= and2 or and3 after OR_gate_delay;
    or2 <= and4 or and5 after OR_gate_delay;
    or3 <= and6 or and7 after OR_gate_delay;
    or4 <= and8 or and9 after OR_gate_delay;
    or5 <= and10 or and11 after OR_gate_delay;
    or6 <= and12 or and13 after OR_gate_delay;
    or7 <= and14 or and15 after OR_gate_delay;

    -- Combine the OR gates to get the final output
    or8 <= or0 or or1 after OR_gate_delay;
    or9 <= or2 or or3 after OR_gate_delay;
    or10 <= or4 or or5 after OR_gate_delay;

    -- Final output
    or_final1 <= or8 or or9 after OR_gate_delay;
    or_final2 <= or_final1 or final_or after OR_gate_delay;

    Y <= or_final2 after OR_gate_delay;

end Behavioral;
