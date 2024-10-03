----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2024 19:34:00
-- Design Name: 
-- Module Name: Mux3_32Bit_TB - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

entity Mux3_32Bit_TB is
    -- No ports declared for the testbench entity
end Mux3_32Bit_TB;

architecture Simulation of Mux3_32Bit_TB is
    COMPONENT RF_Mux3_32Bit  -- Ensure this component matches your actual mux
        Port ( 
            I0, I1, I2 : in STD_LOGIC_VECTOR(31 downto 0); -- 32-bit inputs
            S0, S1 : in STD_LOGIC;                        -- Selection Signals
            Y : out STD_LOGIC_VECTOR(31 downto 0);       -- 32-bit output
        );
    END COMPONENT;
    
    -- Signals to connect to UUT inputs and outputs
    signal I0_TB, I1_TB, I2_TB : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');  -- Inputs for the MUX
    signal S0_TB, S1_TB : STD_LOGIC := '0';         -- Select lines for the MUX
    signal Y_TB : STD_LOGIC_VECTOR(31 downto 0);      -- Output for the MUX

    constant PERIOD : time := 200 ns;                -- Simulation period
    
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RF_Mux3_32Bit PORT MAP (
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
        -- Test Case 1: S1 = 0, S0 = 0 -> Select I0
        I0_TB <= "00000000000000000000000000000001";   -- Set I0 to '1'
        I1_TB <= (others => '0');   -- I1 -> don't care
        I2_TB <= (others => '0');   -- I2 -> don't care
        S1_TB <= '0';   -- S1 = 0
        S0_TB <= '0';   -- S0 = 0
        wait for PERIOD; 
        assert (Y_TB = I0_TB) report "Test Case 1 Failed: I0 was not selected!" severity error;

        -- Test Case 2: S1 = 0, S0 = 1 -> Select I1
        I0_TB <= (others => '0');  -- I0 -> don't care
        I1_TB <= "00000000000000000000000000000010";   -- Set I1 to '1'
        I2_TB <= (others => '0');   -- I2 -> don't care
        S1_TB <= '0';  -- S1 = 0
        S0_TB <= '1';   -- S0 = 1
        wait for PERIOD;
        assert (Y_TB = I1_TB) report "Test Case 2 Failed: I1 was not selected!" severity error;

        -- Test Case 3: S1 = 1, S0 = 0 -> Select I2
        I0_TB <= (others => '0');  -- I0 -> don't care
        I1_TB <= (others => '0'); -- I1 -> don't care
        I2_TB <= "00000000000000000000000000000011";   -- Set I2 to '1'
        S1_TB <= '1';   -- S1 = 1
        S0_TB <= '0';   -- S0 = 0
        wait for PERIOD;
        assert (Y_TB = I2_TB) report "Test Case 3 Failed: I2 was not selected!" severity error;

        -- Test Case 4: S1 = 1, S0 = 1 -> Undefined state or invalid combination
        I0_TB <= (others => '0');   -- I0 -> don't care
        I1_TB <= (others => '0');  -- I1 -> don't care
        I2_TB <= (others => '0');   -- I2 -> don't care
        S1_TB <= '1';   -- S1 = 1
        S0_TB <= '1';   -- S0 = 1
        wait for PERIOD;

        -- Handle the invalid combination
        -- This is optional depending on your design. Modify the expected output accordingly.
        assert (Y_TB = (others => '0')) report "Test Case 4 Failed: Invalid state was not handled correctly!" severity error;

        -- Final wait to keep the simulation running
        wait for 400 ns;  -- Wait additional time to observe the results before ending simulation
        wait;
    end process; 
end Simulation; 
