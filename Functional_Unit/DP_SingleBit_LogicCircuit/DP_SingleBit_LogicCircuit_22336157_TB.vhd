library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DP_SingleBit_LogicCircuit_22336157 is
end DP_SingleBit_LogicCircuit_22336157;

architecture Behavioral of DP_SingleBit_LogicCircuit_22336157 is

    -- Component declaration for the DUT (Device Under Test)
    component DP_SingleBit_LogicCircuit_22336157
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               S0 : in STD_LOGIC;
               S1 : in STD_LOGIC;
               G  : out STD_LOGIC);
    end component;

    -- Signals for inputs and output
    signal A, B, S0, S1 : STD_LOGIC;
    signal G : STD_LOGIC;

begin

    -- Instantiate the DUT
    uut: DP_SingleBit_LogicCircuit_22336157
        Port Map (
            A => A,
            B => B,
            S0 => S0,
            S1 => S1,
            G => G
        );

    -- Test process
    process
    begin
        -- Test Case 1: A=0, B=0, S0=0, S1=0
        A <= '0'; B <= '0'; S0 <= '0'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 2: A=0, B=0, S0=0, S1=1
        A <= '0'; B <= '0'; S0 <= '0'; S1 <= '1';
        wait for 10 ns;

        -- Test Case 3: A=0, B=0, S0=1, S1=0
        A <= '0'; B <= '0'; S0 <= '1'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 4: A=0, B=0, S0=1, S1=1
        A <= '0'; B <= '0'; S0 <= '1'; S1 <= '1';
        wait for 10 ns;

        -- Test Case 5: A=0, B=1, S0=0, S1=0
        A <= '0'; B <= '1'; S0 <= '0'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 6: A=0, B=1, S0=0, S1=1
        A <= '0'; B <= '1'; S0 <= '0'; S1 <= '1';
        wait for 10 ns;

        -- Test Case 7: A=0, B=1, S0=1, S1=0
        A <= '0'; B <= '1'; S0 <= '1'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 8: A=0, B=1, S0=1, S1=1
        A <= '0'; B <= '1'; S0 <= '1'; S1 <= '1';
        wait for 10 ns;

        -- Test Case 9: A=1, B=0, S0=0, S1=0
        A <= '1'; B <= '0'; S0 <= '0'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 10: A=1, B=0, S0=0, S1=1
        A <= '1'; B <= '0'; S0 <= '0'; S1 <= '1';
        wait for 10 ns;

        -- Test Case 11: A=1, B=0, S0=1, S1=0
        A <= '1'; B <= '0'; S0 <= '1'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 12: A=1, B=0, S0=1, S1=1
        A <= '1'; B <= '0'; S0 <= '1'; S1 <= '1';
        wait for 10 ns;

        -- Test Case 13: A=1, B=1, S0=0, S1=0
        A <= '1'; B <= '1'; S0 <= '0'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 14: A=1, B=1, S0=0, S1=1
        A <= '1'; B <= '1'; S0 <= '0'; S1 <= '1';
        wait for 10 ns;

        -- Test Case 15: A=1, B=1, S0=1, S1=0
        A <= '1'; B <= '1'; S0 <= '1'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 16: A=1, B=1, S0=1, S1=1
        A <= '1'; B <= '1'; S0 <= '1'; S1 <= '1';
        wait for 10 ns;

        wait; -- Wait indefinitely after testing
    end process;

end Behavioral;