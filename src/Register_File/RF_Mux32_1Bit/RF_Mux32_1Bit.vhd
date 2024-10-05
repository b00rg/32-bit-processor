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
-- Description: 16-to-1 Mux
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
    signal and0, and1, and2, and3, and4, and5, and6, and7 : std_logic;
    signal and8, and9, and10, and11, and12, and13, and14, and15 : std_logic;

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

    -- AND gates for the selection of inputs
    and0  <= I0  and S0_not and S1_not and S2_not and S3_not after AND_gate_delay;
    and1  <= I1  and S0     and S1_not and S2_not and S3_not after AND_gate_delay;
    and2  <= I2  and S0_not and S1     and S2_not and S3_not after AND_gate_delay;
    and3  <= I3  and S0     and S1     and S2_not and S3_not after AND_gate_delay;
    and4  <= I4  and S0_not and S1_not and S2     and S3_not after AND_gate_delay;
    and5  <= I5  and S0     and S1_not and S2     and S3_not after AND_gate_delay;
    and6  <= I6  and S0_not and S1     and S2     and S3_not after AND_gate_delay;
    and7  <= I7  and S0     and S1     and S2     and S3_not after AND_gate_delay;
    and8  <= I8  and S0_not and S1_not and S2_not and S3     after AND_gate_delay;
    and9  <= I9  and S0     and S1_not and S2_not and S3     after AND_gate_delay;
    and10 <= I10 and S0_not and S1     and S2_not and S3     after AND_gate_delay;
    and11 <= I11 and S0     and S1     and S2_not and S3     after AND_gate_delay;
    and12 <= I12 and S0_not and S1_not and S2     and S3     after AND_gate_delay;
    and13 <= I13 and S0     and S1_not and S2     and S3     after AND_gate_delay;
    and14 <= I14 and S0_not and S1     and S2     and S3     after AND_gate_delay;
    and15 <= I15 and S0     and S1     and S2     and S3     after AND_gate_delay;

    -- OR the AND gates to produce the final output
    Y <= and0 or and1 or and2 or and3 or and4 or and5 or and6 or and7 or
         and8 or and9 or and10 or and11 or and12 or and13 or and14 or and15 after OR_gate_delay;

end Behavioral;
