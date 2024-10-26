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
-- Description: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RippleCarryAdder32Bit_22336157 is

    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
         B : in STD_LOGIC_VECTOR (31 downto 0);
         C_IN : in STD_LOGIC_VECTOR(30 downto 0);
         SUM : out STD_LOGIC_VECTOR (31 downto 0);
         C_OUT : out STD_LOGIC_VECTOR (31 downto 0);
         V : out STD_LOGIC);

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

    --  Propagation Delay according to StdentID e.g. 26 33 57 25(DEC)
    constant AND_gate_delay : Time := 6ns; -- 6 =5+1
    constant NAND_gate_delay : Time := 3ns;-- 3=2+1
    constant OR_gate_delay : Time := 8ns;  -- 8=7+1
    constant NOR_gate_delay : Time := 6ns; -- 6=5+1
    constant XOR_gate_delay : Time := 4ns; -- 4=3+1
    constant XNOR_gate_delay : Time := 4ns;-- 4=3+1
    constant NOT_gate_delay : Time := 7ns; -- 7=6+1

begin

    -- Instantiate Full Adder Bit 0
    BIT0: FullAdder_22336157 PORT MAP (
            A => A(0),
            B => B(0),
            C_IN => C_IN(0),
            SUM => SUM(0),
            C_OUT => C_OUT(0)
        );

    -- Instantiate Full Adder Bit 1
    BIT1: FullAdder_22336157 PORT MAP (
            A => A(1),
            B => B(1),
            C_IN => C_IN(0),
            SUM => SUM(1),
            C_OUT => C_OUT(1)
        );

    -- Instantiate Full Adder Bit 2
    BIT2: FullAdder_22336157 PORT MAP (
            A => A(2),
            B => B(2),
            C_IN => C_IN(1),
            SUM => SUM(2),
            C_OUT => C_OUT(2)
        );

    -- Instantiate Full Adder Bit 3
    BIT3: FullAdder_22336157 PORT MAP (
            A => A(3),
            B => B(3),
            C_IN => C_IN(3),
            SUM => SUM(3),
            C_OUT => C_OUT(3)
        );

    -- Instantiate Full Adder Bit 4
    BIT4: FullAdder_22336157 PORT MAP (
            A => A(4),
            B => B(4),
            C_IN => C_IN(4),
            SUM => SUM(4),
            C_OUT => C_OUT(4)
        );

    -- Instantiate Full Adder Bit 5
    BIT5: FullAdder_22336157 PORT MAP (
            A => A(5),
            B => B(5),
            C_IN => C_IN(4),
            SUM => SUM(5),
            C_OUT => C_OUT(5)
        );

    -- Instantiate Full Adder Bit 6
    BIT6: FullAdder_22336157 PORT MAP (
            A => A(6),
            B => B(6),
            C_IN => C_IN(5),
            SUM => SUM(6),
            C_OUT => C_OUT(6)
        );

    -- Instantiate Full Adder Bit 7
    BIT7: FullAdder_22336157 PORT MAP (
            A => A(7),
            B => B(7),
            C_IN => C_IN(6),
            SUM => SUM(7),
            C_OUT => C_OUT(7)
        );

    -- Instantiate Full Adder Bit 8
    BIT8: FullAdder_22336157 PORT MAP (
            A => A(8),
            B => B(8),
            C_IN => C_IN(7),
            SUM => SUM(8),
            C_OUT => C_OUT(8)
        );

    -- Instantiate Full Adder Bit 9
    BIT9: FullAdder_22336157 PORT MAP (
            A => A(9),
            B => B(9),
            C_IN => C_IN(8),
            SUM => SUM(9),
            C_OUT => C_OUT(9)
        );

    -- Instantiate Full Adder Bit 10
    BIT10: FullAdder_22336157 PORT MAP (
            A => A(10),
            B => B(10),
            C_IN => C_IN(9),
            SUM => SUM(10),
            C_OUT => C_OUT(10)
        );

    -- Instantiate Full Adder Bit 11
    BIT11: FullAdder_22336157 PORT MAP (
            A => A(11),
            B => B(11),
            C_IN => C_IN(10),
            SUM => SUM(11),
            C_OUT => C_OUT(11)
        );

    -- Instantiate Full Adder Bit 12
    BIT12: FullAdder_22336157 PORT MAP (
            A => A(12),
            B => B(12),
            C_IN => C_IN(11),
            SUM => SUM(12),
            C_OUT => C_OUT(12)
        );

    -- Instantiate Full Adder Bit 13
    BIT13: FullAdder_22336157 PORT MAP (
            A => A(13),
            B => B(13),
            C_IN => C_IN(12),
            SUM => SUM(13),
            C_OUT => C_OUT(13)
        );

    -- Instantiate Full Adder Bit 14
    BIT14: FullAdder_22336157 PORT MAP (
            A => A(14),
            B => B(14),
            C_IN => C_IN(13),
            SUM => SUM(14),
            C_OUT => C_OUT(14)
        );

    -- Instantiate Full Adder Bit 15
    BIT15: FullAdder_22336157 PORT MAP (
            A => A(15),
            B => B(15),
            C_IN => C_IN(14),
            SUM => SUM(15),
            C_OUT => C_OUT(15)
        );

    -- Instantiate Full Adder Bit 16
    BIT16: FullAdder_22336157 PORT MAP (
            A => A(16),
            B => B(16),
            C_IN => C_IN(15),
            SUM => SUM(16),
            C_OUT => C_OUT(16)
        );

    -- Instantiate Full Adder Bit 17
    BIT17: FullAdder_22336157 PORT MAP (
            A => A(17),
            B => B(17),
            C_IN => C_IN(16),
            SUM => SUM(17),
            C_OUT => C_OUT(17)
        );

    -- Instantiate Full Adder Bit 18
    BIT18: FullAdder_22336157 PORT MAP (
            A => A(18),
            B => B(18),
            C_IN => C_IN(17),
            SUM => SUM(18),
            C_OUT => C_OUT(18)
        );

    -- Instantiate Full Adder Bit 19
    BIT19: FullAdder_22336157 PORT MAP (
            A => A(19),
            B => B(19),
            C_IN => C_IN(18),
            SUM => SUM(19),
            C_OUT => C_OUT(19)
        );

    -- Instantiate Full Adder Bit 20
    BIT20: FullAdder_22336157 PORT MAP (
            A => A(20),
            B => B(20),
            C_IN => C_IN(19),
            SUM => SUM(20),
            C_OUT => C_OUT(20)
        );

    -- Instantiate Full Adder Bit 21
    BIT21: FullAdder_22336157 PORT MAP (
            A => A(21),
            B => B(21),
            C_IN => C_IN(20),
            SUM => SUM(21),
            C_OUT => C_OUT(21)
        );

    -- Instantiate Full Adder Bit 22
    BIT22: FullAdder_22336157 PORT MAP (
            A => A(22),
            B => B(22),
            C_IN => C_IN(21),
            SUM => SUM(22),
            C_OUT => C_OUT(22)
        );

    -- Instantiate Full Adder Bit 23
    BIT23: FullAdder_22336157 PORT MAP (
            A => A(23),
            B => B(23),
            C_IN => C_IN(22),
            SUM => SUM(23),
            C_OUT => C_OUT(23)
        );

    -- Instantiate Full Adder Bit 24
    BIT24: FullAdder_22336157 PORT MAP (
            A => A(24),
            B => B(24),
            C_IN => C_IN(23),
            SUM => SUM(24),
            C_OUT => C_OUT(24)
        );

    -- Instantiate Full Adder Bit 25
    BIT25: FullAdder_22336157 PORT MAP (
            A => A(25),
            B => B(25),
            C_IN => C_IN(24),
            SUM => SUM(25),
            C_OUT => C_OUT(25)
        );

    -- Instantiate Full Adder Bit 26
    BIT26: FullAdder_22336157 PORT MAP (
            A => A(26),
            B => B(26),
            C_IN => C_IN(25),
            SUM => SUM(26),
            C_OUT => C_OUT(26)
        );

    -- Instantiate Full Adder Bit 27
    BIT27: FullAdder_22336157 PORT MAP (
            A => A(27),
            B => B(27),
            C_IN => C_IN(26),
            SUM => SUM(27),
            C_OUT => C_OUT(27)
        );

    -- Instantiate Full Adder Bit 28
    BIT28: FullAdder_22336157 PORT MAP (
            A => A(28),
            B => B(28),
            C_IN => C_IN(27),
            SUM => SUM(28),
            C_OUT => C_OUT(28)
        );

    -- Instantiate Full Adder Bit 29
    BIT29: FullAdder_22336157 PORT MAP (
            A => A(29),
            B => B(29),
            C_IN => C_IN(28),
            SUM => SUM(29),
            C_OUT => C_OUT(29)
        );

    -- Instantiate Full Adder Bit 30
    BIT30: FullAdder_22336157 PORT MAP (
            A => A(30),
            B => B(30),
            C_IN => C_IN(29),
            SUM => SUM(30),
            C_OUT => C_OUT(30)
        );

    -- Instantiate Full Adder Bit 31
    BIT31: FullAdder_22336157 PORT MAP (
            A => A(31),
            B => B(31),
            C_IN => C_IN(30),
            SUM => SUM(31),
            C_OUT => C_OUT(31)
        );


    V <= C(30) XOR C_OUT(31) after XOR_gate_delay;

end Behavioral;
