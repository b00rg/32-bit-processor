----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 22:19:50
-- Design Name: 
-- Module Name: DP_Shifter_22336157 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- This module performs a bypass, logical right shift, or logical left shift on 
-- input B, based on the selection signals S1 and S2.
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

entity DP_Shifter_22336157 is
    Port ( 
        B : in STD_LOGIC_VECTOR(31 downto 0);
        S1, S2 : in STD_LOGIC;
        G : out STD_LOGIC_VECTOR(31 downto 0);
        C : out STD_LOGIC
    );
end DP_Shifter_22336157;

architecture Behavioral of DP_Shifter_22336157 is
    component DP_Mux3_1Bit
        Port ( 
            I0, I1, I2 : in STD_LOGIC;     -- 1 bit inputs
            S0, S1 : in STD_LOGIC;         -- Selection Signals
            Y : out STD_LOGIC              -- 1 bit output
        );
    end component; 

    -- Propagation Delay according to Student ID
    constant AND_gate_delay : Time := 6 ns; 
    constant NAND_gate_delay : Time := 3 ns;
    constant OR_gate_delay : Time := 8 ns;
    constant NOR_gate_delay : Time := 6 ns;
    constant XOR_gate_delay : Time := 4 ns;
    constant XNOR_gate_delay : Time := 4 ns;
    constant NOT_gate_delay : Time := 7 ns;

begin
    -- Implement the logic for G based on S1 and S2
    BIT0: DP_Mux3_1Bit PORT MAP (I0 => B(0), I1 => B(1), I2 => '0', S0 => S1, S1 => S2, Y => G(0));
    BIT1: DP_Mux3_1Bit PORT MAP (I0 => B(1), I1 => B(2), I2 => B(0), S0 => S1, S1 => S2, Y => G(1));
    BIT2: DP_Mux3_1Bit PORT MAP (I0 => B(2), I1 => B(3), I2 => B(1), S0 => S1, S1 => S2, Y => G(2));
    BIT3: DP_Mux3_1Bit PORT MAP (I0 => B(3), I1 => B(4), I2 => B(2), S0 => S1, S1 => S2, Y => G(3));
    BIT4: DP_Mux3_1Bit PORT MAP (I0 => B(4), I1 => B(5), I2 => B(3), S0 => S1, S1 => S2, Y => G(4));
    BIT5: DP_Mux3_1Bit PORT MAP (I0 => B(5), I1 => B(6), I2 => B(4), S0 => S1, S1 => S2, Y => G(5));
    BIT6: DP_Mux3_1Bit PORT MAP (I0 => B(6), I1 => B(7), I2 => B(5), S0 => S1, S1 => S2, Y => G(6));
    BIT7: DP_Mux3_1Bit PORT MAP (I0 => B(7), I1 => B(8), I2 => B(6), S0 => S1, S1 => S2, Y => G(7));
    BIT8: DP_Mux3_1Bit PORT MAP (I0 => B(8), I1 => B(9), I2 => B(7), S0 => S1, S1 => S2, Y => G(8));
    BIT9: DP_Mux3_1Bit PORT MAP (I0 => B(9), I1 => B(10), I2 => B(8), S0 => S1, S1 => S2, Y => G(9));
    BIT10: DP_Mux3_1Bit PORT MAP (I0 => B(10), I1 => B(11), I2 => B(9), S0 => S1, S1 => S2, Y => G(10));
    BIT11: DP_Mux3_1Bit PORT MAP (I0 => B(11), I1 => B(12), I2 => B(10), S0 => S1, S1 => S2, Y => G(11));
    BIT12: DP_Mux3_1Bit PORT MAP (I0 => B(12), I1 => B(13), I2 => B(11), S0 => S1, S1 => S2, Y => G(12));
    BIT13: DP_Mux3_1Bit PORT MAP (I0 => B(13), I1 => B(14), I2 => B(12), S0 => S1, S1 => S2, Y => G(13));
    BIT14: DP_Mux3_1Bit PORT MAP (I0 => B(14), I1 => B(15), I2 => B(13), S0 => S1, S1 => S2, Y => G(14));
    BIT15: DP_Mux3_1Bit PORT MAP (I0 => B(15), I1 => B(16), I2 => B(14), S0 => S1, S1 => S2, Y => G(15));
    BIT16: DP_Mux3_1Bit PORT MAP (I0 => B(16), I1 => B(17), I2 => B(15), S0 => S1, S1 => S2, Y => G(16));
    BIT17: DP_Mux3_1Bit PORT MAP (I0 => B(17), I1 => B(18), I2 => B(16), S0 => S1, S1 => S2, Y => G(17));
    BIT18: DP_Mux3_1Bit PORT MAP (I0 => B(18), I1 => B(19), I2 => B(17), S0 => S1, S1 => S2, Y => G(18));
    BIT19: DP_Mux3_1Bit PORT MAP (I0 => B(19), I1 => B(20), I2 => B(18), S0 => S1, S1 => S2, Y => G(19));
    BIT20: DP_Mux3_1Bit PORT MAP (I0 => B(20), I1 => B(21), I2 => B(19), S0 => S1, S1 => S2, Y => G(20));
    BIT21: DP_Mux3_1Bit PORT MAP (I0 => B(21), I1 => B(22), I2 => B(20), S0 => S1, S1 => S2, Y => G(21));
    BIT22: DP_Mux3_1Bit PORT MAP (I0 => B(22), I1 => B(23), I2 => B(21), S0 => S1, S1 => S2, Y => G(22));
    BIT23: DP_Mux3_1Bit PORT MAP (I0 => B(23), I1 => B(24), I2 => B(22), S0 => S1, S1 => S2, Y => G(23));
    BIT24: DP_Mux3_1Bit PORT MAP (I0 => B(24), I1 => B(25), I2 => B(23), S0 => S1, S1 => S2, Y => G(24));
    BIT25: DP_Mux3_1Bit PORT MAP (I0 => B(25), I1 => B(26), I2 => B(24), S0 => S1, S1 => S2, Y => G(25));
    BIT26: DP_Mux3_1Bit PORT MAP (I0 => B(26), I1 => B(27), I2 => B(25), S0 => S1, S1 => S2, Y => G(26));
    BIT27: DP_Mux3_1Bit PORT MAP (I0 => B(27), I1 => B(28), I2 => B(26), S0 => S1, S1 => S2, Y => G(27));
    BIT28: DP_Mux3_1Bit PORT MAP (I0 => B(28), I1 => B(29), I2 => B(27), S0 => S1, S1 => S2, Y => G(28));
    BIT29: DP_Mux3_1Bit PORT MAP (I0 => B(29), I1 => B(30), I2 => B(28), S0 => S1, S1 => S2, Y => G(29));
    BIT30: DP_Mux3_1Bit PORT MAP (I0 => B(30), I1 => B(31), I2 => B(29), S0 => S1, S1 => S2, Y => G(30));
    BIT31: DP_Mux3_1Bit PORT MAP (I0 => B(31), I1 => '0', I2 => B(30), S0 => S1, S1 => S2, Y => G(31));

    -- Define the carry output based on shifts
    C <= (S1 and not S2) ? B(0) : -- Right shift, carry is LSB
         (not S1 and S2) ? B(31) : -- Left shift, carry is MSB
         '0';                         -- No shift, carry is zero

end Behavioral;
