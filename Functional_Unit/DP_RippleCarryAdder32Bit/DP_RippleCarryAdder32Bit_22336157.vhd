----------------------------------------------------------------------------------
-- Company:
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 23:37:03
-- Design Name: 
-- Module Name: RippleCarryAdder32Bit_22336157 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 32-bit Ripple Carry Adder
-- 
-- Dependencies: FullAdder_22336157.vhdl
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCarryAdder32Bit_22336157 is
    Port ( 
        A : in STD_LOGIC_VECTOR (31 downto 0);
        B : in STD_LOGIC_VECTOR (31 downto 0);
        C_IN : in STD_LOGIC; -- single bit initial carry-in
        SUM : out STD_LOGIC_VECTOR (31 downto 0);
        C_OUT : out STD_LOGIC; -- final carry-out bit
        V : out STD_LOGIC -- overflow indicator
    );
end RippleCarryAdder32Bit_22336157;

architecture Behavioral of RippleCarryAdder32Bit_22336157 is

    COMPONENT FullAdder_22336157
        PORT(
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            C_IN : in STD_LOGIC;
            SUM : out STD_LOGIC;
            C_OUT : out STD_LOGIC
        );
    END COMPONENT;

    -- Propagation Delay according to Student ID
    constant AND_gate_delay : Time := 6 ns; 
    constant NAND_gate_delay : Time := 3 ns;
    constant OR_gate_delay : Time := 8 ns;
    constant NOR_gate_delay : Time := 6 ns;
    constant XOR_gate_delay : Time := 4 ns;
    constant XNOR_gate_delay : Time := 4 ns;
    constant NOT_gate_delay : Time := 7 ns;

    -- Internal signals for carries between each full adder
    signal carry : STD_LOGIC_VECTOR(31 downto 1);
    signal internal_C_out : STD_Logic; 
begin


    -- First bit (Bit 0)
    BIT0: FullAdder_22336157 PORT MAP (
            A => A(0),
            B => B(0),
            C_IN => C_IN, -- initial carry-in
            SUM => SUM(0),
            C_OUT => carry(1)
        );

    -- Second bit (Bit 1)
    BIT1: FullAdder_22336157 PORT MAP (
            A => A(1),
            B => B(1),
            C_IN => carry(1),
            SUM => SUM(1),
            C_OUT => carry(2)
        );

    -- Third bit (Bit 2)
    BIT2: FullAdder_22336157 PORT MAP (
            A => A(2),
            B => B(2),
            C_IN => carry(2),
            SUM => SUM(2),
            C_OUT => carry(3)
        );

    -- Fourth bit (Bit 3)
    BIT3: FullAdder_22336157 PORT MAP (
            A => A(3),
            B => B(3),
            C_IN => carry(3),
            SUM => SUM(3),
            C_OUT => carry(4)
        );

    -- Fifth bit (Bit 4)
    BIT4: FullAdder_22336157 PORT MAP (
            A => A(4),
            B => B(4),
            C_IN => carry(4),
            SUM => SUM(4),
            C_OUT => carry(5)
        );

    -- Sixth bit (Bit 5)
    BIT5: FullAdder_22336157 PORT MAP (
            A => A(5),
            B => B(5),
            C_IN => carry(5),
            SUM => SUM(5),
            C_OUT => carry(6)
        );

    -- Seventh bit (Bit 6)
    BIT6: FullAdder_22336157 PORT MAP (
            A => A(6),
            B => B(6),
            C_IN => carry(6),
            SUM => SUM(6),
            C_OUT => carry(7)
        );

    -- Eighth bit (Bit 7)
    BIT7: FullAdder_22336157 PORT MAP (
            A => A(7),
            B => B(7),
            C_IN => carry(7),
            SUM => SUM(7),
            C_OUT => carry(8)
        );

    -- Ninth bit (Bit 8)
    BIT8: FullAdder_22336157 PORT MAP (
            A => A(8),
            B => B(8),
            C_IN => carry(8),
            SUM => SUM(8),
            C_OUT => carry(9)
        );

    -- Tenth bit (Bit 9)
    BIT9: FullAdder_22336157 PORT MAP (
            A => A(9),
            B => B(9),
            C_IN => carry(9),
            SUM => SUM(9),
            C_OUT => carry(10)
        );

    -- Eleventh bit (Bit 10)
    BIT10: FullAdder_22336157 PORT MAP (
            A => A(10),
            B => B(10),
            C_IN => carry(10),
            SUM => SUM(10),
            C_OUT => carry(11)
        );

    -- Twelfth bit (Bit 11)
    BIT11: FullAdder_22336157 PORT MAP (
            A => A(11),
            B => B(11),
            C_IN => carry(11),
            SUM => SUM(11),
            C_OUT => carry(12)
        );

    -- Thirteenth bit (Bit 12)
    BIT12: FullAdder_22336157 PORT MAP (
            A => A(12),
            B => B(12),
            C_IN => carry(12),
            SUM => SUM(12),
            C_OUT => carry(13)
        );

    -- Fourteenth bit (Bit 13)
    BIT13: FullAdder_22336157 PORT MAP (
            A => A(13),
            B => B(13),
            C_IN => carry(13),
            SUM => SUM(13),
            C_OUT => carry(14)
        );

    -- Fifteenth bit (Bit 14)
    BIT14: FullAdder_22336157 PORT MAP (
            A => A(14),
            B => B(14),
            C_IN => carry(14),
            SUM => SUM(14),
            C_OUT => carry(15)
        );

    -- Sixteenth bit (Bit 15)
    BIT15: FullAdder_22336157 PORT MAP (
            A => A(15),
            B => B(15),
            C_IN => carry(15),
            SUM => SUM(15),
            C_OUT => carry(16)
        );

    -- Seventeenth bit (Bit 16)
    BIT16: FullAdder_22336157 PORT MAP (
            A => A(16),
            B => B(16),
            C_IN => carry(16),
            SUM => SUM(16),
            C_OUT => carry(17)
        );

    -- Eighteenth bit (Bit 17)
    BIT17: FullAdder_22336157 PORT MAP (
            A => A(17),
            B => B(17),
            C_IN => carry(17),
            SUM => SUM(17),
            C_OUT => carry(18)
        );

    -- Nineteenth bit (Bit 18)
    BIT18: FullAdder_22336157 PORT MAP (
            A => A(18),
            B => B(18),
            C_IN => carry(18),
            SUM => SUM(18),
            C_OUT => carry(19)
        );

    -- Twentieth bit (Bit 19)
    BIT19: FullAdder_22336157 PORT MAP (
            A => A(19),
            B => B(19),
            C_IN => carry(19),
            SUM => SUM(19),
            C_OUT => carry(20)
        );

    -- Twenty-first bit (Bit 20)
    BIT20: FullAdder_22336157 PORT MAP (
            A => A(20),
            B => B(20),
            C_IN => carry(20),
            SUM => SUM(20),
            C_OUT => carry(21)
        );

    -- Twenty-second bit (Bit 21)
    BIT21: FullAdder_22336157 PORT MAP (
            A => A(21),
            B => B(21),
            C_IN => carry(21),
            SUM => SUM(21),
            C_OUT => carry(22)
        );

    -- Twenty-third bit (Bit 22)
    BIT22: FullAdder_22336157 PORT MAP (
            A => A(22),
            B => B(22),
            C_IN => carry(22),
            SUM => SUM(22),
            C_OUT => carry(23)
        );

    -- Twenty-fourth bit (Bit 23)
    BIT23: FullAdder_22336157 PORT MAP (
            A => A(23),
            B => B(23),
            C_IN => carry(23),
            SUM => SUM(23),
            C_OUT => carry(24)
        );

    -- Twenty-fifth bit (Bit 24)
    BIT24: FullAdder_22336157 PORT MAP (
            A => A(24),
            B => B(24),
            C_IN => carry(24),
            SUM => SUM(24),
            C_OUT => carry(25)
        );

    -- Twenty-sixth bit (Bit 25)
    BIT25: FullAdder_22336157 PORT MAP (
            A => A(25),
            B => B(25),
            C_IN => carry(25),
            SUM => SUM(25),
            C_OUT => carry(26)
        );

    -- Twenty-seventh bit (Bit 26)
    BIT26: FullAdder_22336157 PORT MAP (
            A => A(26),
            B => B(26),
            C_IN => carry(26),
            SUM => SUM(26),
            C_OUT => carry(27)
        );

    -- Twenty-eighth bit (Bit 27)
    BIT27: FullAdder_22336157 PORT MAP (
            A => A(27),
            B => B(27),
            C_IN => carry(27),
            SUM => SUM(27),
            C_OUT => carry(28)
        );

    -- Twenty-ninth bit (Bit 28)
    BIT28: FullAdder_22336157 PORT MAP (
            A => A(28),
            B => B(28),
            C_IN => carry(28),
            SUM => SUM(28),
            C_OUT => carry(29)
        );

    -- Thirtieth bit (Bit 29)
    BIT29: FullAdder_22336157 PORT MAP (
            A => A(29),
            B => B(29),
            C_IN => carry(29),
            SUM => SUM(29),
            C_OUT => carry(30)
        );

    -- Thirty-first bit (Bit 30)
    BIT30: FullAdder_22336157 PORT MAP (
            A => A(30),
            B => B(30),
            C_IN => carry(30),
            SUM => SUM(30),
            C_OUT => carry(31)
        );

    -- Final bit (Bit 31)
    BIT31: FullAdder_22336157 PORT MAP (
            A => A(31),
            B => B(31),
            C_IN => carry(31),
            SUM => SUM(31),
            C_OUT => internal_C_OUT -- connect to internal signal
        );

    C_Out <= internal_C_OUT;
    -- Overflow calculation
    V <= carry(30) XOR internal_C_OUT after XOR_gate_delay;

end Behavioral;
