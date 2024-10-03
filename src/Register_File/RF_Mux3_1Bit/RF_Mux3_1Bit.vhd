----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2023 15:22:51
-- Design Name: 
-- Module Name: Mux3_1Bit_TB - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for 3-to-1 MUX
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux3_1Bit_TB is
end Mux3_1Bit_TB;

architecture Simulation of Mux3_1Bit_TB is
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Mux3_1Bit
        Port ( 
            I0 : in STD_LOGIC;
            I1 : in STD_LOGIC;
            I2 : in STD_LOGIC;
            S0 : in STD_LOGIC;
            S1 : in STD_LOGIC;
            Y  : out STD_LOGIC
        );
    END COMPONENT;

    -- Signals for testbench
    signal I0_TB, I1_TB, I2_TB : STD_LOGIC := '0'; -- inputs for the MUX
    signal S0_TB, S1_TB : STD_LOGIC := '0';       -- select lines for the MUX
    signal Y_TB : STD_LOGIC;                      -- output for the MUX

    constant PERIOD : time := 200 ns;             -- time period for each test case

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Mux3_1Bit
        PORT MAP (
            I0 => I0_TB,
            I1 => I1_TB,
            I2 => I2_TB,
            S0 => S0_TB,
            S1 => S1_TB,
            Y  => Y_TB
        );
        
    -- Stimulus process to apply different input combinations
    stim_proc: process
    begin
        -- Test case 1: S1 = 0, S0 = 0, select I0
        I0_TB <= '1';  -- Set I0 to '1'
        I1_TB <= '0';  -- I1 -> don't care
        I2_TB <= '0';  -- I2 -> don't care
        S1_TB <= '0';
        S0_TB <= '0';
        wait for PERIOD;  -- Wait for the signal propagation based on delays
        
        -- Test case 2: S1 = 0, S0 = 1, select I1
        I0_TB <= '0';
        I1_TB <= '1';  -- Set I1 to '1'
        I2_TB <= '0';  -- I2 -> don't care
        S1_TB <= '0';
        S0_TB <= '1';
        wait for PERIOD;  -- Wait for signal propagation

        -- Test case 3: S1 = 1, S0 = 0, select I2
        I0_TB <= '0';
        I1_TB <= '0';
        I2_TB <= '1';  -- Set I2 to '1'
        S1_TB <= '1';
        S0_TB <= '0';
        wait for PERIOD;  -- Wait for signal propagation

        -- Test case 4: Invalid state (S1 = 1, S0 = 1), no valid input
        S1_TB <= '1';
        S0_TB <= '1';
        wait for PERIOD;  -- Wait for signal propagation

        -- Final wait to keep the simulation running
        wait;
    end process; 
end Simulation;
