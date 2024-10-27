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

entity DP_ShifterCFlagMux2_1Bit_22336157_TB is
end DP_ShifterCFlagMux2_1Bit_22336157_TB;

architecture Simulation of DP_ShifterCFlagMux2_1Bit_22336157_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT DP_ShifterCFlagMux2_1Bit_22336157_TB
        Port ( 
            I0 : in STD_LOGIC;
            I1 : in STD_LOGIC;
            S : in STD_LOGIC;
            Y  : out STD_LOGIC
        );
    END COMPONENT;

    -- Signals to connect to UUT inputs and outputs
    signal I0_TB, I1_TB : STD_LOGIC := '0';  -- Inputs for the MUX
    signal S_TB: STD_LOGIC := '0';         -- Select lines for the MUX
    signal Y_TB : STD_LOGIC;                        -- Output for the MUX

    constant PERIOD : time := 200ns;                -- Simulation period

    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: DP_ShifterCFlagMux2_1Bit_22336157_TB PORT MAP (
        I0 => I0_TB,
        I1 => I1_TB,
        S => S_TB,
        Y  => Y_TB
    );

   -- Stimulus process to apply test cases
   stim_proc: process
   begin
        -- Test Case 1: S1 = 0, S0 = 0 -> Select I0
        I0_TB <= '1';   -- Set I0 to '1'
        I1_TB <= '0';   -- I1 -> don't care
        S_TB <= '0';   -- S1 = 0
        wait for PERIOD; 
        assert (Y_TB = I0_TB) report "Test Case 1 Failed: I0 was not selected!" severity error;

        -- Test Case 2: S1 = 0, S0 = 1 -> Select I1
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '1';   -- Set I1 to '1'
        S_TB <= '1';   -- S0 = 1
        wait for PERIOD;
        assert (Y_TB = I1_TB) report "Test Case 2 Failed: I1 was not selected!" severity error;

        -- Final wait to keep the simulation running
        wait;
    end process; 
end Simulation; 
