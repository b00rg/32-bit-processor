----------------------------------------------------------------------------------
-- Testbench for CPU_SMux_22336157
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_SMux_22336157_tb is
-- Testbench entity has no ports
end CPU_SMux_22336157_tb;

architecture Behavioral of CPU_SMux_22336157_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component CPU_SMux_22336157
        Port (
            Zero : in STD_LOGIC;
            Z_Flag : in STD_LOGIC;
            V_Flag : in STD_LOGIC;
            One : in STD_LOGIC;
            C_Flag : in STD_LOGIC;
            N_Flag : in STD_LOGIC;
            C_Flag_Not : in STD_LOGIC;
            Z_Flag_Not : in STD_LOGIC;
            MS : in STD_LOGIC_vector(2 downto 0);
            CAR : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal Zero, Z_Flag, V_Flag, One, C_Flag, N_Flag, C_Flag_Not, Z_Flag_Not : STD_LOGIC := '0';
    signal MS : STD_LOGIC_vector(2 downto 0) := (others => '0');
    signal CAR : STD_LOGIC;

    -- Clock period definitions (not required here as it’s combinational logic)

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: CPU_SMux_22336157
        Port map (
            Zero => Zero,
            Z_Flag => Z_Flag,
            V_Flag => V_Flag,
            One => One,
            C_Flag => C_Flag,
            N_Flag => N_Flag,
            C_Flag_Not => C_Flag_Not,
            Z_Flag_Not => Z_Flag_Not,
            MS => MS,
            CAR => CAR
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test Case 1: Check default CAR output with all inputs set to '0'
        Zero <= '0';
        Z_Flag <= '0';
        V_Flag <= '0';
        One <= '0';
        C_Flag <= '0';
        N_Flag <= '0';
        C_Flag_Not <= '0';
        Z_Flag_Not <= '0';
        MS <= "000";
        wait for 10 ns;

        -- Test Case 2: Activate Zero input
        Zero <= '1';
        MS <= "001";
        wait for 10 ns;

        -- Test Case 3: Activate Z_Flag input
        Zero <= '0';
        Z_Flag <= '1';
        MS <= "010";
        wait for 10 ns;

        -- Test Case 4: Combination of inputs
        V_Flag <= '1';
        One <= '1';
        C_Flag <= '1';
        N_Flag <= '0';
        MS <= "111";
        wait for 10 ns;

        -- Test Case 5: Check inverted flags
        C_Flag_Not <= '1';
        Z_Flag_Not <= '1';
        MS <= "100";
        wait for 10 ns;

        -- Test Case 6: Random values for thorough testing
        Zero <= '1';
        Z_Flag <= '0';
        V_Flag <= '0';
        One <= '1';
        C_Flag <= '0';
        N_Flag <= '1';
        C_Flag_Not <= '0';
        Z_Flag_Not <= '1';
        MS <= "011";
        wait for 10 ns;

        -- End of simulation
        wait;
    end process;

end Behavioral;
