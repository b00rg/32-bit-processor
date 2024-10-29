----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Mux3_1Bit_TB - Simulation
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

entity DP_Mux3_1Bit_22336157_TB is
end DP_Mux3_1Bit_22336157_TB;

architecture Simulation of DP_Mux3_1Bit_22336157_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DP_Mux3_1Bit_22336157
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

    constant PERIOD : time := 200ns;                -- Simulation period

    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: DP_Mux3_1Bit_22336157 PORT MAP (
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
        -- Test Case 0: S1 = 0, S0 = 0 -> Select I0
        I0_TB <= '1';   -- Set I0 to '1'
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        S1_TB <= '0';   -- S1 = 0
        S0_TB <= '0';   -- S0 = 0
        wait for PERIOD; 
        assert (Y_TB = I0_TB) report "Test Case 1 Failed: I0 was not selected!" severity error;

        -- Test Case 1: S1 = 0, S0 = 1 -> Select I1
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '1';   -- Set I1 to '1'
        I2_TB <= '0';   -- I2 -> don't care
        S1_TB <= '0';   -- S1 = 0
        S0_TB <= '1';   -- S0 = 1
        wait for PERIOD;
        assert (Y_TB = I1_TB) report "Test Case 2 Failed: I1 was not selected!" severity error;

        -- Test Case 2: S1 = 1, S0 = 0 -> Select I2
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '1';   -- Set I2 to '1'
        S1_TB <= '1';   -- S1 = 1
        S0_TB <= '0';   -- S0 = 0
        wait for PERIOD;
        assert (Y_TB = I2_TB) report "Test Case 3 Failed: I2 was not selected!" severity error;

        -- Test Case 3: S1 = 1, S0 = 1 -> Undefined state or invalid combination (depending on design)
        -- Here, depending on design you may set this case as invalid, or if it's handled, check the expected output.
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        S1_TB <= '1';   -- S1 = 1
        S0_TB <= '1';   -- S0 = 1
        wait for PERIOD;

        -- If this combination selects nothing, ensure it's handled correctly
        -- This is optional depending on your design. Modify the expected output accordingly.
        assert (Y_TB = '0') report "Test Case 4 Failed: Invalid state was not handled correctly!" severity error;

        -- Final wait to keep the simulation running
        wait;
    end process; 
end Simulation; 
