library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2_to_1_32bit is
    Port (
        I0, I1 : in STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit inputs
        S      : in STD_LOGIC;                      -- single select bit
        Y      : out STD_LOGIC_VECTOR(31 downto 0)  -- 32-bit output
    );
end Mux_2_to_1_32bit;

architecture Behavioral of Mux_2_to_1_32bit is
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
    signal S_not : STD_LOGIC;
    signal and0, and1 : STD_LOGIC_VECTOR(31 downto 0);
begin

    -- Invert the select signal
    S_not <= not S after 3 ns;

    -- AND operations for each bit of I0 with S_not, and I1 with S
    and0(0) <= I0(0) and S_not after AND_GATE_DELAY;
    and1(0) <= I1(0) and S after AND_GATE_DELAY;
    and0(1) <= I0(1) and S_not after AND_GATE_DELAY;
    and1(1) <= I1(1) and S after AND_GATE_DELAY;
    and0(2) <= I0(2) and S_not after AND_GATE_DELAY;
    and1(2) <= I1(2) and S after AND_GATE_DELAY;
    and0(3) <= I0(3) and S_not after AND_GATE_DELAY;
    and1(3) <= I1(3) and S after AND_GATE_DELAY;
    and0(4) <= I0(4) and S_not after AND_GATE_DELAY;
    and1(4) <= I1(4) and S after AND_GATE_DELAY;
    and0(5) <= I0(5) and S_not after AND_GATE_DELAY;
    and1(5) <= I1(5) and S after AND_GATE_DELAY;
    and0(6) <= I0(6) and S_not after AND_GATE_DELAY;
    and1(6) <= I1(6) and S after AND_GATE_DELAY;
    and0(7) <= I0(7) and S_not after AND_GATE_DELAY;
    and1(7) <= I1(7) and S after AND_GATE_DELAY;
    and0(8) <= I0(8) and S_not after AND_GATE_DELAY;
    and1(8) <= I1(8) and S after AND_GATE_DELAY;
    and0(9) <= I0(9) and S_not after AND_GATE_DELAY;
    and1(9) <= I1(9) and S after AND_GATE_DELAY;
    and0(10) <= I0(10) and S_not after AND_GATE_DELAY;
    and1(10) <= I1(10) and S after AND_GATE_DELAY;
    and0(11) <= I0(11) and S_not after AND_GATE_DELAY;
    and1(11) <= I1(11) and S after AND_GATE_DELAY;
    and0(12) <= I0(12) and S_not after AND_GATE_DELAY;
    and1(12) <= I1(12) and S after AND_GATE_DELAY;
    and0(13) <= I0(13) and S_not after AND_GATE_DELAY;
    and1(13) <= I1(13) and S after AND_GATE_DELAY;
    and0(14) <= I0(14) and S_not after AND_GATE_DELAY;
    and1(14) <= I1(14) and S after AND_GATE_DELAY;
    and0(15) <= I0(15) and S_not after AND_GATE_DELAY;
    and1(15) <= I1(15) and S after AND_GATE_DELAY;
    and0(16) <= I0(16) and S_not after AND_GATE_DELAY;
    and1(16) <= I1(16) and S after AND_GATE_DELAY;
    and0(17) <= I0(17) and S_not after AND_GATE_DELAY;
    and1(17) <= I1(17) and S after AND_GATE_DELAY;
    and0(18) <= I0(18) and S_not after AND_GATE_DELAY;
    and1(18) <= I1(18) and S after AND_GATE_DELAY;
    and0(19) <= I0(19) and S_not after AND_GATE_DELAY;
    and1(19) <= I1(19) and S after AND_GATE_DELAY;
    and0(20) <= I0(20) and S_not after AND_GATE_DELAY;
    and1(20) <= I1(20) and S after AND_GATE_DELAY;
    and0(21) <= I0(21) and S_not after AND_GATE_DELAY;
    and1(21) <= I1(21) and S after AND_GATE_DELAY;
    and0(22) <= I0(22) and S_not after AND_GATE_DELAY;
    and1(22) <= I1(22) and S after AND_GATE_DELAY;
    and0(23) <= I0(23) and S_not after AND_GATE_DELAY;
    and1(23) <= I1(23) and S after AND_GATE_DELAY;
    and0(24) <= I0(24) and S_not after AND_GATE_DELAY;
    and1(24) <= I1(24) and S after AND_GATE_DELAY;
    and0(25) <= I0(25) and S_not after AND_GATE_DELAY;
    and1(25) <= I1(25) and S after AND_GATE_DELAY;
    and0(26) <= I0(26) and S_not after AND_GATE_DELAY;
    and1(26) <= I1(26) and S after AND_GATE_DELAY;
    and0(27) <= I0(27) and S_not after AND_GATE_DELAY;
    and1(27) <= I1(27) and S after AND_GATE_DELAY;
    and0(28) <= I0(28) and S_not after AND_GATE_DELAY;
    and1(28) <= I1(28) and S after AND_GATE_DELAY;
    and0(29) <= I0(29) and S_not after AND_GATE_DELAY;
    and1(29) <= I1(29) and S after AND_GATE_DELAY;
    and0(30) <= I0(30) and S_not after AND_GATE_DELAY;
    and1(30) <= I1(30) and S after AND_GATE_DELAY;
    and0(31) <= I0(31) and S_not after AND_GATE_DELAY;
    and1(31) <= I1(31) and S after AND_GATE_DELAY;

    -- OR operations to generate each bit of the output Y
    Y(0) <= and0(0) or and1(0) after OR_GATE_DELAY;
    Y(1) <= and0(1) or and1(1) after OR_GATE_DELAY;
    Y(2) <= and0(2) or and1(2) after OR_GATE_DELAY;
    Y(3) <= and0(3) or and1(3) after OR_GATE_DELAY;
    Y(4) <= and0(4) or and1(4) after OR_GATE_DELAY;
    Y(5) <= and0(5) or and1(5) after OR_GATE_DELAY;
    Y(6) <= and0(6) or and1(6) after OR_GATE_DELAY;
    Y(7) <= and0(7) or and1(7) after OR_GATE_DELAY;
    Y(8) <= and0(8) or and1(8) after OR_GATE_DELAY;
    Y(9) <= and0(9) or and1(9) after OR_GATE_DELAY;
    Y(10) <= and0(10) or and1(10) after OR_GATE_DELAY;
    Y(11) <= and0(11) or and1(11) after OR_GATE_DELAY;
    Y(12) <= and0(12) or and1(12) after OR_GATE_DELAY;
    Y(13) <= and0(13) or and1(13) after OR_GATE_DELAY;
    Y(14) <= and0(14) or and1(14) after OR_GATE_DELAY;
    Y(15) <= and0(15) or and1(15) after OR_GATE_DELAY;
    Y(16) <= and0(16) or and1(16) after OR_GATE_DELAY;
    Y(17) <= and0(17) or and1(17) after OR_GATE_DELAY;
    Y(18) <= and0(18) or and1(18) after OR_GATE_DELAY;
    Y(19) <= and0(19) or and1(19) after OR_GATE_DELAY;
    Y(20) <= and0(20) or and1(20) after OR_GATE_DELAY;
    Y(21) <= and0(21) or and1(21) after OR_GATE_DELAY;
    Y(22) <= and0(22) or and1(22) after OR_GATE_DELAY;
    Y(23) <= and0(23) or and1(23) after OR_GATE_DELAY;
    Y(24) <= and0(24) or and1(24) after OR_GATE_DELAY;
    Y(25) <= and0(25) or and1(25) after OR_GATE_DELAY;
    Y(26) <= and0(26) or and1(26) after OR_GATE_DELAY;
    Y(27) <= and0(27) or and1(27) after OR_GATE_DELAY;
    Y(28) <= and0(28) or and1(28) after OR_GATE_DELAY;
    Y(29) <= and0(29) or and1(29) after OR_GATE_DELAY;
    Y(30) <= and0(30) or and1(30) after OR_GATE_DELAY;
    Y(31) <= and0(31) or and1(31) after OR_GATE_DELAY;

end Behavioral;
