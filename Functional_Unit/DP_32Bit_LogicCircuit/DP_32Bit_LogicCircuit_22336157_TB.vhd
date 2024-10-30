library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; -- Needed for arithmetic operations
use IEEE.std_logic_signed; -- Needed for vector operations

entity DP_32Bit_LogicCircuit_22336157_TB is
end DP_32Bit_LogicCircuit_22336157_TB;

architecture Simulation of DP_32Bit_LogicCircuit_22336157_TB is
    -- Component Declaration for the Unit Under Test (UUT)
    component DP_32Bit_LogicCircuit_22336157
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
    uut: DP_32Bit_LogicCircuit_22336157 
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

        A <= "00000000000000000000000000000001";  -- Padded Student ID
        B <= "00000000000000000000000000000011"; -- Padded Student ID
        S0 <= '0';
        S1 <= '0';
        wait for 1000 ns;


        -- Test Output: 1's Complement of Student ID
        S0 <= '1';
        S1 <= '0';
        wait for 1000 ns;
        
        S0 <= '0';
        S1 <= '1';
        wait for 1000 ns;


        -- Test Output: All 1's
        S0 <= '1';
        S1 <= '1';
        wait for 1000 ns;


    end process;
end Simulation;
