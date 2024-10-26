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

    -- Repeat similar structure for bits 4 to 29

    -- Thirtieth bit (Bit 30)
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
            C_OUT => C_OUT
        );

    C_Out <= internal_C_OUT;
    -- Overflow calculation
    V <= carry(30) XOR internal_C_OUT after XOR_gate_delay;

end Behavioral;
