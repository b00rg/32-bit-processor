library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_Mux2_17Bit_22336157 is
    Port (
        I0, I1 : in STD_LOGIC_VECTOR(16 downto 0);  -- 17-bit inputs
        S      : in STD_LOGIC;                      -- single select bit
        Y      : out STD_LOGIC_VECTOR(16 downto 0)  -- 17-bit output
    );
end CPU_Mux2_17Bit_22336157;

architecture Behavioral of CPU_Mux2_17Bit_22336157 is
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   signal S_not : STD_LOGIC;
   signal and0, and1 : STD_LOGIC_VECTOR(16 downto 0);
begin

    -- Invert the select signal
    S_not <= not S after 3 ns;

    -- AND operations for each bit of I0 with S_not, and I1 with S
    and0(0) <= I0(0) and S_not after AND_gate_delay;
    and1(0) <= I1(0) and S after AND_gate_delay;
    and0(1) <= I0(1) and S_not after AND_gate_delay;
    and1(1) <= I1(1) and S after AND_gate_delay;
    and0(2) <= I0(2) and S_not after AND_gate_delay;
    and1(2) <= I1(2) and S after AND_gate_delay;
    and0(3) <= I0(3) and S_not after AND_gate_delay;
    and1(3) <= I1(3) and S after AND_gate_delay;
    and0(4) <= I0(4) and S_not after AND_gate_delay;
    and1(4) <= I1(4) and S after AND_gate_delay;
    and0(5) <= I0(5) and S_not after AND_gate_delay;
    and1(5) <= I1(5) and S after AND_gate_delay;
    and0(6) <= I0(6) and S_not after AND_gate_delay;
    and1(6) <= I1(6) and S after AND_gate_delay;
    and0(7) <= I0(7) and S_not after AND_gate_delay;
    and1(7) <= I1(7) and S after AND_gate_delay;
    and0(8) <= I0(8) and S_not after AND_gate_delay;
    and1(8) <= I1(8) and S after AND_gate_delay;
    and0(9) <= I0(9) and S_not after AND_gate_delay;
    and1(9) <= I1(9) and S after AND_gate_delay;
    and0(10) <= I0(10) and S_not after AND_gate_delay;
    and1(10) <= I1(10) and S after AND_gate_delay;
    and0(11) <= I0(11) and S_not after AND_gate_delay;
    and1(11) <= I1(11) and S after AND_gate_delay;
    and0(12) <= I0(12) and S_not after AND_gate_delay;
    and1(12) <= I1(12) and S after AND_gate_delay;
    and0(13) <= I0(13) and S_not after AND_gate_delay;
    and1(13) <= I1(13) and S after AND_gate_delay;
    and0(14) <= I0(14) and S_not after AND_gate_delay;
    and1(14) <= I1(14) and S after AND_gate_delay;
    and0(15) <= I0(15) and S_not after AND_gate_delay;
    and1(15) <= I1(15) and S after AND_gate_delay;
    and0(16) <= I0(16) and S_not after AND_gate_delay;
    and1(16) <= I1(16) and S after AND_gate_delay;

    -- OR operations to generate each bit of the output Y
    Y(0) <= and0(0) or and1(0) after OR_gate_delay;
    Y(1) <= and0(1) or and1(1) after OR_gate_delay;
    Y(2) <= and0(2) or and1(2) after OR_gate_delay;
    Y(3) <= and0(3) or and1(3) after OR_gate_delay;
    Y(4) <= and0(4) or and1(4) after OR_gate_delay;
    Y(5) <= and0(5) or and1(5) after OR_gate_delay;
    Y(6) <= and0(6) or and1(6) after OR_gate_delay;
    Y(7) <= and0(7) or and1(7) after OR_gate_delay;
    Y(8) <= and0(8) or and1(8) after OR_gate_delay;
    Y(9) <= and0(9) or and1(9) after OR_gate_delay;
    Y(10) <= and0(10) or and1(10) after OR_gate_delay;
    Y(11) <= and0(11) or and1(11) after OR_gate_delay;
    Y(12) <= and0(12) or and1(12) after OR_gate_delay;
    Y(13) <= and0(13) or and1(13) after OR_gate_delay;
    Y(14) <= and0(14) or and1(14) after OR_gate_delay;
    Y(15) <= and0(15) or and1(15) after OR_gate_delay;
    Y(16) <= and0(16) or and1(16) after OR_gate_delay;

end Behavioral;
