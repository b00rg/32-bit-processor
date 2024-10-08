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
-- Description: 16-to-1 Mux using two-input gates
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
    
    -- Intermediate signals for AND gates
    signal and0_1, and0_2, and1_1, and1_2, and2_1, and2_2, and3_1, and3_2 : std_logic;
    signal and4_1, and4_2, and5_1, and5_2, and6_1, and6_2, and7_1, and7_2 : std_logic;
    signal and8_1, and8_2, and9_1, and9_2, and10_1, and10_2, and11_1, and11_2 : std_logic;
    signal and12_1, and12_2, and13_1, and13_2, and14_1, and14_2, and15_1, and15_2 : std_logic;
    
    -- Intermediate signals for OR gates
    signal or0, or1, or2, or3, or4, or5, or6 : std_logic;
    signal or7, or8, or9, or10, or11, or12, or13 : std_logic;
    signal or_final : std_logic;
    
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

    -- Breaking down the AND gates into two-input gates
    -- AND gates for the selection of inputs
    and0_1 <= I0 and S0_not after AND_gate_delay;
    and0_2 <= and0_1 and S1_not and S2_not and S3_not after AND_gate_delay;

    and1_1 <= I1 and S0 after AND_gate_delay;
    and1_2 <= and1_1 and S1_not and S2_not and S3_not after AND_gate_delay;

    and2_1 <= I2 and S0_not after AND_gate_delay;
    and2_2 <= and2_1 and S1 and S2_not and S3_not after AND_gate_delay;

    and3_1 <= I3 and S0 after AND_gate_delay;
    and3_2 <= and3_1 and S1 and S2_not and S3_not after AND_gate_delay;

    and4_1 <= I4 and S0_not after AND_gate_delay;
    and4_2 <= and4_1 and S1_not and S2 and S3_not after AND_gate_delay;

    and5_1 <= I5 and S0 after AND_gate_delay;
    and5_2 <= and5_1 and S1_not and S2 and S3_not after AND_gate_delay;

    and6_1 <= I6 and S0_not after AND_gate_delay;
    and6_2 <= and6_1 and S1 and S2 and S3_not after AND_gate_delay;

    and7_1 <= I7 and S0 after AND_gate_delay;
    and7_2 <= and7_1 and S1 and S2 and S3_not after AND_gate_delay;

    and8_1 <= I8 and S0_not after AND_gate_delay;
    and8_2 <= and8_1 and S1_not and S2_not and S3 after AND_gate_delay;

    and9_1 <= I9 and S0 after AND_gate_delay;
    and9_2 <= and9_1 and S1_not and S2_not and S3 after AND_gate_delay;

    and10_1 <= I10 and S0_not after AND_gate_delay;
    and10_2 <= and10_1 and S1 and S2_not and S3 after AND_gate_delay;

    and11_1 <= I11 and S0 after AND_gate_delay;
    and11_2 <= and11_1 and S1 and S2_not and S3 after AND_gate_delay;

    and12_1 <= I12 and S0_not after AND_gate_delay;
    and12_2 <= and12_1 and S1_not and S2 and S3 after AND_gate_delay;

    and13_1 <= I13 and S0 after AND_gate_delay;
    and13_2 <= and13_1 and S1_not and S2 and S3 after AND_gate_delay;

    and14_1 <= I14 and S0_not after AND_gate_delay;
    and14_2 <= and14_1 and S1 and S2 and S3 after AND_gate_delay;

    and15_1 <= I15 and S0 after AND_gate_delay;
    and15_2 <= and15_1 and S1 and S2 and S3 after AND_gate_delay;

    -- OR the AND gates using two-input OR gates
    or0 <= and0_2 or and1_2 after OR_gate_delay;
    or1 <= and2_2 or and3_2 after OR_gate_delay;
    or2 <= and4_2 or and5_2 after OR_gate_delay;
    or3 <= and6_2 or and7_2 after OR_gate_delay;
    or4 <= and8_2 or and9_2 after OR_gate_delay;
    or5 <= and10_2 or and11_2 after OR_gate_delay;
    or6 <= and12_2 or and13_2 after OR_gate_delay;
    or7 <= and14_2 or and15_2 after OR_gate_delay;

    or8 <= or0 or or1 after OR_gate_delay;
    or9 <= or2 or or3 after OR_gate_delay;
    or10 <= or4 or or5 after OR_gate_delay;
    or11 <= or6 or or7 after OR_gate_delay;

    or12 <= or8 or or9 after OR_gate_delay;
    or13 <= or10 or or11 after OR_gate_delay;

    or_final <= or12 or or13 after OR_gate_delay;

    -- Final output
    Y <= or_final after OR_gate_delay;

end Behavioral;
