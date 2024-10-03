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
-- Description: Testbench for 3-to-1 1-bit Mux
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

entity RF_Mux3_1Bit_TB is
--  we don't need ports in the testbench
end RF_Mux3_1Bit_TB;

architecture Simulation of RF_Mux3_1Bit_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_Mux3_1Bit
        Port ( 
            I0 : in STD_LOGIC;
            I1 : in STD_LOGIC;
            I2 : in STD_LOGIC;
            S0 : in STD_LOGIC;
            S1 : in STD_LOGIC;
            Y  : out STD_LOGIC
        );
    END COMPONENT;

    -- Signals to connect to UUT inputs and outputs
    signal I0_TB, I1_TB, I2_TB : STD_LOGIC := '0';  -- Inputs for the MUX
    signal S0_TB, S1_TB : STD_LOGIC := '0';         -- Select lines for the MUX
    signal Y_TB : STD_LOGIC;                        -- Output for the MUX

    -- Optional Student ID (can be used for debugging or informational purposes)
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
    constant PERIOD : time := 200ns;                -- Simulation period

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RF_Mux3_1Bit PORT MAP (
        I0 => I0_TB,
        I1 => I1_TB,
        I2 => I2_TB,
        S0 => S0_TB,
        S1 => S1_TB,
        Y  => Y_TB
    );

   -- Stimulus process to apply test cases
   stim_proc: process
   begin
        -- Test case 1: S1 = 0, S0 = 0, select I0
        I0_TB <= '1';   -- Set I0 to '1'
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        S1_TB <= '0';   -- S1 -> 0
        S0_TB <= '0';   -- S0 -> 0
        wait for PERIOD; 
        
        -- Check if the output matches the expected value
        assert (Y_TB = I0_TB) report "Test Case 1 Failed: I0 was not selected!" severity error;

        -- Test case 2: S1 = 0, S0 = 1, select I1
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '1';   -- Set I1 to '1'
        I2_TB <= '0';   -- I2 -> don't care
        S1_TB <= '0';   -- S1 -> 0
        S0_TB <= '1';   -- S0 -> 1
        wait for PERIOD;
        
        -- Check if the output matches the expected value
        assert (Y_TB = I1_TB) report "Test Case 2 Failed: I1 was not selected!" severity error;

        -- Test case 3: S1 = 1, S0 = 0, select I2
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '1';   -- Set I2 to '1'
        S1_TB <= '1';   -- S1 -> 1
        S0_TB <= '0';   -- S0 -> 0
        wait for PERIOD;
        
        -- Check if the output matches the expected value
        assert (Y_TB = I2_TB) report "Test Case 3 Failed: I2 was not selected!" severity error;

        -- Check the output for invalid state (you may adjust this depending on the implementation)
        assert (Y_TB = 'U') report "Test Case 4 Failed: Invalid state was not handled correctly!" severity error;

        -- Final wait to keep the simulation running
        wait;
    end process; 
end Simulation;
