library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DP_ArithmeticLogicUnit_22336157_TB is
end DP_ArithmeticLogicUnit_22336157_TB;

architecture Simulation of DP_ArithmeticLogicUnit_22336157_TB is

    -- Test signals
    signal A, B, G : STD_LOGIC_VECTOR(31 downto 0);
    signal S0, S1, S2, C_IN : STD_LOGIC;
    signal C, V : STD_LOGIC;

    -- Instantiate the DP_ArithmeticLogicUnit_22336157 unit under test (UUT)
    component DP_ArithmeticLogicUnit_22336157
        Port ( 
            A, B : in STD_LOGIC_VECTOR(31 downto 0);
            S0, S1, S2, C_IN : in STD_LOGIC;
            G : out STD_LOGIC_VECTOR(31 downto 0);
            C, V : out STD_LOGIC
        );
    end component;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: DP_ArithmeticLogicUnit_22336157 Port map (
        A => A,
        B => B,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        C_IN => C_IN,
        G => G,
        C => C,
        V => V
    );

    -- Test process
    stim_proc: process
    begin
        -- Initialize Inputs
        A <= X"22336157";    -- Student ID in hexadecimal
        B <= X"FFFFFFFF";     -- Example B value (all bits set to 1 for simplicity)
        C_IN <= '0';

        -- Test AND operation
        S0 <= '0'; S1 <= '0'; S2 <= '1'; -- Select AND operation
        wait for 10 ns;
        
        -- Test OR operation
        S0 <= '0'; S1 <= '1'; S2 <= '1'; -- Select OR operation
        wait for 10 ns;

        -- Test XOR operation
        S0 <= '1'; S1 <= '0'; S2 <= '1'; -- Select XOR operation
        wait for 10 ns;

        -- Test NOT operation
        S0 <= '1'; S1 <= '1'; S2 <= '1'; -- Select NOT operation
        wait for 10 ns;

        -- Test Addition
        S0 <= '0'; S1 <= '0'; S2 <= '0'; -- Select Adder operation
        wait for 10 ns;

        -- Finish simulation
        wait;
    end process;

end simulation;
