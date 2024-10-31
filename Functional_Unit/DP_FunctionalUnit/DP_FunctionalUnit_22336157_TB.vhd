library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DP_FunctionalUnit_22336157_tb is
end DP_FunctionalUnit_22336157_tb;

architecture Behavioral of DP_FunctionalUnit_22336157_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component DP_FunctionalUnit_22336157
        Port ( 
            B : in STD_LOGIC_VECTOR(31 downto 0);
            A : in STD_LOGIC_VECTOR(31 downto 0);
            FS : in STD_LOGIC_VECTOR(4 downto 0);
            C : out STD_LOGIC; 
            N : out STD_LOGIC; 
            Z : out STD_LOGIC; 
            V : out STD_LOGIC; 
            F : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    -- Test signals
    signal B, A : STD_LOGIC_VECTOR(31 downto 0);
    signal FS : STD_LOGIC_VECTOR(4 downto 0);
    signal C, N, Z, V : STD_LOGIC;
    signal F : STD_LOGIC_VECTOR(31 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: DP_FunctionalUnit_22336157 Port Map (
        B => B,
        A => A,
        FS => FS,
        C => C,
        N => N,
        Z => Z,
        V => V,
        F => F
    );

    -- Test Process
    stim_proc: process
    begin
        -- Test 1st Group
        A <= X"00000002";
        B <= X"00000003";
        FS <= "00000"; -- F = A
        wait for 10 ns;
        
        FS <= "00001"; -- F = A + B
        wait for 10 ns;
        
        FS <= "00010"; -- F = A + B + 1
        wait for 10 ns;
        
        FS <= "00011"; -- F = A + 1's complement B
        wait for 10 ns;
        
        FS <= "00100"; -- F = A + 1's complement B + 1
        wait for 10 ns;

        -- Additional instructions follow for each configuration in sequence
        -- Test 2nd Group
        FS <= "01000"; -- F = shift left B
        wait for 10 ns;
        
        FS <= "01001"; -- F = A OR B
        wait for 10 ns;
        
        FS <= "01010"; -- F = A XOR B
        wait for 10 ns;

        -- (Continue to add the remaining operations as described in your prompt)

        -- Test 3rd Group
        -- Repeat similar settings for FS as per the prompt descriptions
        -- Make sure to change A and B values as necessary between groups

        -- Test 4th Group
        -- Continue similar structure of setting FS and observing outputs

        -- Test 5th Group
        -- Again, set FS to apply different operations and observe F

        -- Test 6th Group and so on through each operation sequence.

        -- Repeat until all operation groups are tested.

        -- End simulation
        wait;
    end process;
end Behavioral;

