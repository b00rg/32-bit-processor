----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2024
-- Design Name: 
-- Module Name: DP_ShifterCFlagMux2_1Bit_22336157_tb - Test Bench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Test bench for DP_ShifterCFlagMux2_1Bit_22336157
-- 
-- Dependencies: DP_ShifterCFlagMux2_1Bit_22336157
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DP_ShifterCFlagMux2_1Bit_22336157_tb is
end DP_ShifterCFlagMux2_1Bit_22336157_tb;

architecture Simulation of DP_ShifterCFlagMux2_1Bit_22336157_tb is

    -- Component Declaration of the Unit Under Test (UUT)
    component DP_ShifterCFlagMux2_1Bit_22336157
        Port ( 
            LSB : in STD_LOGIC;
            MSB : in STD_LOGIC;
            S1  : in STD_LOGIC;
            S2  : in STD_LOGIC;
            C   : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the UUT
    signal LSB, MSB, S1, S2 : STD_LOGIC := '0';
    signal C : STD_LOGIC;
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: DP_ShifterCFlagMux2_1Bit_22336157
        Port map (
            LSB => LSB,
            MSB => MSB,
            S1  => S1,
            S2  => S2,
            C   => C
        );

    -- Test process to apply different input combinations
    stimulus: process
    begin
        -- Test 1: All inputs are 0
        LSB <= '0'; MSB <= '0'; S1 <= '0'; S2 <= '0';
        wait for 10 ns;
        assert (C = '0') report "Test 1 failed" severity error;

        -- Test 2: LSB = 1, MSB = 0, S1 = 1, S2 = 0
        LSB <= '1'; MSB <= '0'; S1 <= '1'; S2 <= '0';
        wait for 10 ns;
        assert (C = '1') report "Test 2 failed" severity error;

        -- Test 3: LSB = 0, MSB = 1, S1 = 0, S2 = 1
        LSB <= '0'; MSB <= '1'; S1 <= '0'; S2 <= '1';
        wait for 10 ns;
        assert (C = '1') report "Test 3 failed" severity error;

        -- Test 4: LSB = 1, MSB = 1, S1 = 1, S2 = 1
        LSB <= '1'; MSB <= '1'; S1 <= '1'; S2 <= '1';
        wait for 10 ns;
        assert (C = '1') report "Test 4 failed" severity error;

        -- Test 5: LSB = 0, MSB = 0, S1 = 1, S2 = 1
        LSB <= '0'; MSB <= '0'; S1 <= '1'; S2 <= '1';
        wait for 10 ns;
        assert (C = '0') report "Test 5 failed" severity error;

        -- Test 6: LSB = 1, MSB = 0, S1 = 1, S2 = 1
        LSB <= '1'; MSB <= '0'; S1 <= '1'; S2 <= '1';
        wait for 10 ns;
        assert (C = '1') report "Test 6 failed" severity error;

        -- Test 7: LSB = 0, MSB = 1, S1 = 1, S2 = 0
        LSB <= '0'; MSB <= '1'; S1 <= '1'; S2 <= '0';
        wait for 10 ns;
        assert (C = '0') report "Test 7 failed" severity error;

        -- End of tests
        wait;
    end process;
end Simulation;
