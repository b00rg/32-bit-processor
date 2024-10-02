library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux3_32Bit is
    Port (
        I0, I1, I2 : in STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit inputs
        S0, S1 : in STD_LOGIC;                          -- Selection signals
        Y : out STD_LOGIC_VECTOR(31 downto 0)          -- 32-bit output
    );
end Mux3_32Bit;

architecture Structural of Mux3_32Bit is
    signal S0_not, S1_not : STD_LOGIC;
    signal and0, and1, and2 : STD_LOGIC_VECTOR(31 downto 0);  -- Declare for 32 bits

begin
    -- Invert the selection signals
    S0_not <= not S0 after 3 ns;
    S1_not <= not S1 after 3 ns;

    -- AND gates to choose the correct input
    and0 <= I0 and (S0_not and S1_not) after 4 ns; 
    and1 <= I1 and (S0 and S1_not) after 4 ns;
    and2 <= I2 and (S0_not and S1) after 4 ns;

    -- OR the AND gates to produce the final output
    Y <= and0 or and1 or and2 after 2 ns;
end Structural;
