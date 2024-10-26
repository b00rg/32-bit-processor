library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; -- Needed for arithmetic operations
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Needed for vector operations

entity DP_32Bit_B_Logic_22336157_TB is
end DP_32Bit_B_Logic_22336157_TB;

architecture Simulation of DP_32Bit_B_Logic_22336157_TB is
    -- Component Declaration for the Unit Under Test (UUT)
    component DP_32Bit_B_Logic_22336157
        Port ( 
            A : in STD_LOGIC_VECTOR(31 downto 0);   -- Input A (Student ID)
            B : in STD_LOGIC_VECTOR(31 downto 0);   -- Input B (Unused in this example)
            S0, S1 : in STD_LOGIC;                    -- Selection Signals
            G : out STD_LOGIC_VECTOR(31 downto 0)    -- Output G
        );
    end component;

    -- Signals to connect to the UUT
    signal A : STD_LOGIC_VECTOR(31 downto 0);
    signal B : STD_LOGIC_VECTOR(31 downto 0);
    signal S0, S1 : STD_LOGIC;
    signal G : STD_LOGIC_VECTOR(31 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: DP_32Bit_B_Logic_22336157 
        Port Map (
            A => A,
            B => B,
            S0 => S0,
            S1 => S1,
            G => G
        );

    -- Test Process
    process
    begin
        -- Initialize Inputs
        A <= (others => '0');                      -- All 0's
        B <= (others => '0');                      -- Unused
        S0 <= '0';
        S1 <= '0';
        wait for 10 ns;                            -- Wait for 10 ns
        assert (G = "00000000000000000000000000000000") report "Test failed for all 0's" severity ERROR;

        -- Test Output: Student ID
        A <= "0000000000000000000000101010100110100100111001"; -- Padded Student ID
        A <= "0000000000000000000000000000000000000000000001"; -- Padded Student ID
        S0 <= '0';
        S1 <= '1';
        wait for 10 ns;
        assert (G = A) report "Test failed for Student ID output" severity ERROR;

        -- Test Output: 1's Complement of Student ID
        S0 <= '1';
        S1 <= '0';
        wait for 10 ns;
        assert (G = not A) report "Test failed for 1's complement output" severity ERROR;

        -- Test Output: All 1's
        S0 <= '1';
        S1 <= '1';
        wait for 10 ns;
        assert (G = (others => '1')) report "Test failed for all 1's output" severity ERROR;

        -- End of Simulation
        wait;
    end process;
end Simulation;

