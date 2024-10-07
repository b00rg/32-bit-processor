----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 04.10.2024
-- Design Name: 
-- Module Name: Mux32_1Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 32-to-1 Mux
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

entity RF_Mux32_1Bit is
    Port ( 
        I0 : in STD_LOGIC;
        I1 : in STD_LOGIC;
        I2 : in STD_LOGIC;
        I3 : in STD_LOGIC;
        I4 : in STD_LOGIC;
        I5 : in STD_LOGIC;
        I6 : in STD_LOGIC;
        I7 : in STD_LOGIC;
        I8 : in STD_LOGIC;
        I9 : in STD_LOGIC;
        I10 : in STD_LOGIC;
        I11 : in STD_LOGIC;
        I12 : in STD_LOGIC;
        I13 : in STD_LOGIC;
        I14 : in STD_LOGIC;
        I15 : in STD_LOGIC;
        I16 : in STD_LOGIC;
        I17 : in STD_LOGIC;
        I18 : in STD_LOGIC;
        I19 : in STD_LOGIC;
        I20 : in STD_LOGIC;
        I21 : in STD_LOGIC;
        I22 : in STD_LOGIC;
        I23 : in STD_LOGIC;
        I24 : in STD_LOGIC;
        I25 : in STD_LOGIC;
        I26 : in STD_LOGIC;
        I27 : in STD_LOGIC;
        I28 : in STD_LOGIC;
        I29 : in STD_LOGIC;
        I30 : in STD_LOGIC;
        I31 : in STD_LOGIC;
        
        S0 : in STD_LOGIC;
        S1 : in STD_LOGIC;
        S2 : in STD_LOGIC;
        S3 : in STD_LOGIC;
        S4 : in STD_LOGIC;
        
        Y : out STD_LOGIC
    );
end RF_Mux32_1Bit;

architecture Behavioral of RF_Mux32_1Bit is

    -- Intermediate signals for AND gates
    signal and_g0, and_g1, and_g2, and_g3, and_g4, and_g5, and_g6, and_g7 : STD_LOGIC;
    signal and_g8, and_g9, and_g10, and_g11, and_g12, and_g13, and_g14, and_g15 : STD_LOGIC;
    signal and_g16, and_g17, and_g18, and_g19, and_g20, and_g21, and_g22, and_g23 : STD_LOGIC;
    signal and_g24, and_g25, and_g26, and_g27, and_g28, and_g29, and_g30, and_g31 : STD_LOGIC;
    signal S_not0, S_not1, S_not2, S_not3, S_not4 : STD_LOGIC;
    
    -- Propagation Delay
    constant AND_gate_delay : time := 8 ns;
    constant OR_gate_delay : time := 2 ns;
    constant NOT_gate_delay : Time := 3 ns;
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin
    -- Invert the selection signals
    S_not0 <= not S0 after NOT_gate_delay;
    S_not1 <= not S1 after NOT_gate_delay;
    S_not2 <= not S2 after NOT_gate_delay;
    S_not3 <= not S3 after NOT_gate_delay;
    S_not4 <= not S4 after NOT_gate_delay;

    -- AND gates for the selection of inputs
    and_g0 <= I0 and S_not0 and S_not1 and S_not2 and S_not3 and S_not4 after AND_gate_delay; -- I0
    and_g1 <= I1 and S0 and S_not1 and S_not2 and S_not3 and S_not4 after AND_gate_delay;  -- I1
    and_g2 <= I2 and S_not0 and S1 and S_not2 and S_not3 and S_not4 after AND_gate_delay; -- I2
    and_g3 <= I3 and S0 and S1 and S_not2 and S_not3 and S_not4 after AND_gate_delay;  -- I3
    and_g4 <= I4 and S_not0 and S_not1 and S2 and S_not3 and S_not4 after AND_gate_delay; -- I4
    and_g5 <= I5 and S0 and S_not1 and S2 and S_not3 and S_not4 after AND_gate_delay; -- I5
    and_g6 <= I6 and S_not0 and S1 and S2 and S_not3 and S_not4 after AND_gate_delay; -- I6
    and_g7 <= I7 and S0 and S1 and S2 and S_not3 and S_not4 after AND_gate_delay; -- I7

    and_g8 <= I8 and S_not0 and S_not1 and S2 and S3 and S_not4 after AND_gate_delay; -- I8
    and_g9 <= I9 and S0 and S_not1 and S2 and S3 and S_not4 after AND_gate_delay; -- I9
    and_g10 <= I10 and S_not0 and S1 and S2 and S3 and S_not4 after AND_gate_delay; -- I10
    and_g11 <= I11 and S0 and S1 and S2 and S3 and S_not4 after AND_gate_delay; -- I11

    and_g12 <= I12 and S_not0 and S_not1 and S_not2 and S3 and S_not4 after AND_gate_delay; -- I12
    and_g13 <= I13 and S0 and S_not1 and S_not2 and S3 and S_not4 after AND_gate_delay; -- I13
    and_g14 <= I14 and S_not0 and S1 and S_not2 and S3 and S_not4 after AND_gate_delay; -- I14
    and_g15 <= I15 and S0 and S1 and S_not2 and S3 and S_not4 after AND_gate_delay; -- I15

    and_g16 <= I16 and S_not0 and S_not1 and S2 and S3 and S4 after AND_gate_delay; -- I16
    and_g17 <= I17 and S0 and S_not1 and S2 and S3 and S4 after AND_gate_delay; -- I17
    and_g18 <= I18 and S_not0 and S1 and S2 and S3 and S4 after AND_gate_delay; -- I18
    and_g19 <= I19 and S0 and S1 and S2 and S3 and S4 after AND_gate_delay; -- I19

    and_g20 <= I20 and S_not0 and S_not1 and S2 and S3 and S4 after AND_gate_delay; -- I20
    and_g21 <= I21 and S0 and S_not1 and S2 and S3 and S4 after AND_gate_delay; -- I21
    and_g22 <= I22 and S_not0 and S1 and S2 and S3 and S4 after AND_gate_delay; -- I22
    and_g23 <= I23 and S0 and S1 and S2 and S3 and S4 after AND_gate_delay; -- I23

    and_g24 <= I24 and S_not0 and S_not1 and S2 and S3 and S4 after AND_gate_delay; -- I24
    and_g25 <= I25 and S0 and S_not1 and S2 and S3 and S4 after AND_gate_delay; -- I25
    and_g26 <= I26 and S_not0 and S1 and S2 and S3 and S4 after AND_gate_delay; -- I26
    and_g27 <= I27 and S0 and S1 and S2 and S3 and S4 after AND_gate_delay; -- I27

    and_g28 <= I28 and S_not0 and S_not1 and S2 and S3 and S4 after AND_gate_delay; -- I28
    and_g29 <= I29 and S0 and S_not1 and S2 and S3 and S4 after AND_gate_delay; -- I29
    and_g30 <= I30 and S_not0 and S1 and S2 and S3 and S4 after AND_gate_delay; -- I30
    and_g31 <= I31 and S0 and S1 and S2 and S3 and S4 after AND_gate_delay; -- I31

    -- OR gate logic
    Y <= and_g0 or and_g1 or and_g2 or and_g3 or and_g4 or and_g5 or and_g6 or and_g7 or
         and_g8 or and_g9 or and_g10 or and_g11 or and_g12 or and_g13 or and_g14 or and_g15 or
         and_g16 or and_g17 or and_g18 or and_g19 or and_g20 or and_g21 or and_g22 or and_g23 or
         and_g24 or and_g25 or and_g26 or and_g27 or and_g28 or and_g29 or and_g30 or and_g31 after OR_gate_delay;

end Behavioral;
