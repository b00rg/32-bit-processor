-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2023
-- Module Name: RF_Mux3_1Bit_TB - Testbench for 3-to-1 1-bit Mux
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Mux_16_1Bit_TB is
end RF_Mux_16_1Bit_TB;

architecture Simulation of RF_Mux_16_1Bit_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_Mux_16_1Bit
	Port ( I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC;     -- Input Signals
    I8, I9, I10, I11, I12, I13, I14, I15:  in STD_LOGIC ; 		
		S0, S1, S2, S3, S4 : in STD_LOGIC; 		            	      -- Selection Signals (2^4 = 16) 
		Y : out STD_LOGIC ) ; 
    END COMPONENT;

    -- Signals to connect to UUT inputs and outputs
    signal  I0_TB , I1_TB, I2_TB, I3_TB, I4_TB, I5_TB, I6_TB, I7_TB : STD_LOGIC := '0';  -- Inputs for the MUX
    signal  I8_TB , I9_TB, I10_TB, I11_TB, I12_TB, I13_TB, I14_TB, I15_TB : STD_LOGIC := '0';
	signal S0_TB , S1_TB, S2_TB, S3_TB, S4_TB: std_logic := '0';
    signal Y_TB : STD_LOGIC := '0';                        -- Output for the MUX

    constant PERIOD : time := 200 ns;                -- Simulation period

begin

uut: RF_Mux_16_1Bit PORT MAP (
    I0 => I0_TB,
    I1 => I1_TB,
    I2 => I2_TB,
    I3 => I3_TB,
    I4 => I4_TB,
    I5 => I5_TB,
    I6 => I6_TB,
    I7 => I7_TB,
    I8 => I8_TB,
    I9 => I9_TB,
    I10 => I10_TB,
    I11 => I11_TB,
    I12 => I12_TB,
    I13 => I13_TB,
    I14 => I14_TB,
    I15 => I15_TB,
    S => (S3_TB, S2_TB, S1_TB, S0_TB),  -- Correct number of selection signals (4)
    Y  => Y_TB
);

   -- Stimulus process to apply test cases
   stim_proc: process
begin
    -- Test Case 1: S = 0000 -> Select I0
    I0_TB <= '1';   -- Set I0 to '1'
    S3_TB <= '0'; S2_TB <= '0'; S1_TB <= '0'; S0_TB <= '0'; -- S = 0000
    wait for PERIOD; 
    assert (Y_TB = I0_TB) report "Test Case 1 Failed: I0 was not selected!" severity error;

    -- Test Case 2: S = 0001 -> Select I1
    I0_TB <= '0';   -- I0 -> don't care
    I1_TB <= '1';   -- Set I1 to '1'
    S3_TB <= '0'; S2_TB <= '0'; S1_TB <= '0'; S0_TB <= '1'; -- S = 0001
    wait for PERIOD;
    assert (Y_TB = I1_TB) report "Test Case 2 Failed: I1 was not selected!" severity error;

    -- Test Case 3: S = 0010 -> Select I2
    I1_TB <= '0';   -- I1 -> don't care
    I2_TB <= '1';   -- Set I2 to '1'
    S3_TB <= '0'; S2_TB <= '0'; S1_TB <= '1'; S0_TB <= '0'; -- S = 0010
    wait for PERIOD;
    assert (Y_TB = I2_TB) report "Test Case 3 Failed: I2 was not selected!" severity error;

    -- Add more test cases as needed for inputs I3 to I15.

    -- Final wait to keep the simulation running
    wait;
end process;
end Simulation; 
