library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Mux32_1Bit_TB is
end RF_Mux32_1Bit_TB;

architecture Simulation of RF_Mux32_1Bit_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_Mux32_1Bit
    Port ( 
        I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC;     -- Input Signals
        I8, I9, I10, I11, I12, I13, I14, I15: in STD_LOGIC; 
        I16, I17, I18, I19, I20, I21, I22, I23: in STD_LOGIC;
        I24, I25, I26, I27, I28, I29, I30, I31: in STD_LOGIC;    
        S0, S1, S2, S3, S4: in STD_LOGIC;                   -- Selection Signals (2^5 = 32)
        Y : out STD_LOGIC
    ); 
    END COMPONENT;

    -- Signals to connect to UUT inputs and outputs
    signal I0_TB, I1_TB, I2_TB, I3_TB, I4_TB, I5_TB, I6_TB, I7_TB : STD_LOGIC := '0';  -- Inputs for the MUX
    signal I8_TB, I9_TB, I10_TB, I11_TB, I12_TB, I13_TB, I14_TB, I15_TB : STD_LOGIC := '0';
    signal I16_TB, I17_TB, I18_TB, I19_TB, I20_TB, I21_TB, I22_TB, I23_TB : STD_LOGIC := '0';
    signal I24_TB, I25_TB, I26_TB, I27_TB, I28_TB, I29_TB, I30_TB, I31_TB : STD_LOGIC := '0';
    signal S0_TB, S1_TB, S2_TB, S3_TB, S4_TB : STD_LOGIC := '0';  -- Selection lines
    signal Y_TB : STD_LOGIC;  -- Output for the MUX

    constant PERIOD : time := 200 ns;  -- Simulation period

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: RF_Mux32_1Bit PORT MAP (
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
        I16 => I16_TB,
        I17 => I17_TB,
        I18 => I18_TB,
        I19 => I19_TB,
        I20 => I20_TB,
        I21 => I21_TB,
        I22 => I22_TB,
        I23 => I23_TB,
        I24 => I24_TB,
        I25 => I25_TB,
        I26 => I26_TB,
        I27 => I27_TB,
        I28 => I28_TB,
        I29 => I29_TB,
        I30 => I30_TB,
        I31 => I31_TB,
        S0 => S0_TB,
        S1 => S1_TB,
        S2 => S2_TB,
        S3 => S3_TB,
        S4 => S4_TB,
        Y  => Y_TB
    );

    -- Stimulus process to apply test cases
    stim_proc: process
    begin
        -- Test Case 1: Select I0 (S0 = 0, S1 = 0, S2 = 0, S3 = 0, S4 = 0)
        I0_TB <= '1';   I1_TB <= '0';   I2_TB <= '0';   I3_TB <= '0'; 
        I4_TB <= '0';   I5_TB <= '0';   I6_TB <= '0';   I7_TB <= '0';
        I8_TB <= '0';   I9_TB <= '0';   I10_TB <= '0';  I11_TB <= '0';
        I12_TB <= '0';  I13_TB <= '0';  I14_TB <= '0';  I15_TB <= '0';
        I16_TB <= '0';  I17_TB <= '0';  I18_TB <= '0';  I19_TB <= '0'; 
        I20_TB <= '0';  I21_TB <= '0';  I22_TB <= '0';  I23_TB <= '0';
        I24_TB <= '0';  I25_TB <= '0';  I26_TB <= '0';  I27_TB <= '0'; 
        I28_TB <= '0';  I29_TB <= '0';  I30_TB <= '0';  I31_TB <= '0';
        S0_TB <= '0';   S1_TB <= '0';   S2_TB <= '0';   S3_TB <= '0';   S4_TB <= '0';
        wait for PERIOD;
        assert (Y_TB = I0_TB) report "Test Case 1 Failed: I0 was not selected!" severity error;

        -- Test Case 2: Select I1 (S0 = 1, S1 = 0, S2 = 0, S3 = 0, S4 = 0)
        I0_TB <= '0';   I1_TB <= '1';   I2_TB <= '0';   I3_TB <= '0'; 
        I4_TB <= '0';   I5_TB <= '0';   I6_TB <= '0';   I7_TB <= '0';
        I8_TB <= '0';   I9_TB <= '0';   I10_TB <= '0';  I11_TB <= '0';
        I12_TB <= '0';  I13_TB <= '0';  I14_TB <= '0';  I15_TB <= '0';
        I16_TB <= '0';  I17_TB <= '0';  I18_TB <= '0';  I19_TB <= '0'; 
        I20_TB <= '0';  I21_TB <= '0';  I22_TB <= '0';  I23_TB <= '0';
        I24_TB <= '0';  I25_TB <= '0';  I26_TB <= '0';  I27_TB <= '0'; 
        I28_TB <= '0';  I29_TB <= '0';  I30_TB <= '0';  I31_TB <= '0';
        S0_TB <= '1';   S1_TB <= '0';   S2_TB <= '0';   S3_TB <= '0';   S4_TB <= '0';
        wait for PERIOD;
        assert (Y_TB = I1_TB) report "Test Case 2 Failed: I1 was not selected!" severity error;

        -- Test Case 3: Select I2 (S0 = 0, S1 = 1, S2 = 0, S3 = 0, S4 = 0)
        I0_TB <= '0';   I1_TB <= '0';   I2_TB <= '1';   I3_TB <= '0'; 
        I4_TB <= '0';   I5_TB <= '0';   I6_TB <= '0';   I7_TB <= '0';
        I8_TB <= '0';   I9_TB <= '0';   I10_TB <= '0';  I11_TB <= '0';
        I12_TB <= '0';  I13_TB <= '0';  I14_TB <= '0';  I15_TB <= '0';
        I16_TB <= '0';  I17_TB <= '0';  I18_TB <= '0';  I19_TB <= '0'; 
        I20_TB <= '0';  I21_TB <= '0';  I22_TB <= '0';  I23_TB <= '0';
        I24_TB <= '0';  I25_TB <= '0';  I26_TB <= '0';  I27_TB <= '0'; 
        I28_TB <= '0';  I29_TB <= '0';  I30_TB <= '0';  I31_TB <= '0';
        S0_TB <= '0';   S1_TB <= '1';   S2_TB <= '0';   S3_TB <= '0';   S4_TB <= '0';
        wait for PERIOD;
        assert (Y_TB = I2_TB) report "Test Case 3 Failed: I2 was not selected!" severity error;

        -- Test Case 4: Select I3 (S0 = 1, S1 = 1, S2 = 0, S3 = 0, S4 = 0)
        I0_TB <= '0';   I1_TB <= '0';   I2_TB <= '0';   I3_TB <= '1'; 
        I4_TB <= '0';   I5_TB <= '0';   I6_TB <= '0';   I7_TB <= '0';
        I8_TB <= '0';   I9_TB <= '0';   I10_TB <= '0';  I11_TB <= '0';
        I12_TB <= '0';  I13_TB <= '0';  I14_TB <= '0';  I15_TB <= '0';
        I16_TB <= '0';  I17_TB <= '0';  I18_TB <= '0';  I19_TB <= '0'; 
        I20_TB <= '0';  I21_TB <= '0';  I22_TB <= '0';  I23_TB <= '0';
        I24_TB <= '0';  I25_TB <= '0';  I26_TB <= '0';  I27_TB <= '0'; 
        I28_TB <= '0';  I29_TB <= '0';  I30_TB <= '0';  I31_TB <= '0';
        S0_TB <= '1';   S1_TB <= '1';   S2_TB <= '0';   S3_TB <= '0';   S4_TB <= '0';
        wait for PERIOD;
        assert (Y_TB = I3_TB) report "Test Case 4 Failed: I3 was not selected!" severity error;

        -- Test Case 5: Select I4 (S0 = 0, S1 = 0, S2 = 1, S3 = 0, S4 = 0)
        I0_TB <= '0';   I1_TB <= '0';   I2_TB <= '0';   I3_TB <= '0'; 
        I4_TB <= '1';   I5_TB <= '0';   I6_TB <= '0';   I7_TB <= '0';
        I8_TB <= '0';   I9_TB <= '0';   I10_TB <= '0';  I11_TB <= '0';
        I12_TB <= '0';  I13_TB <= '0';  I14_TB <= '0';  I15_TB <= '0';
        I16_TB <= '0';  I17_TB <= '0';  I18_TB <= '0';  I19_TB <= '0'; 
        I20_TB <= '0';  I21_TB <= '0';  I22_TB <= '0';  I23_TB <= '0';
        I24_TB <= '0';  I25_TB <= '0';  I26_TB <= '0';  I27_TB <= '0'; 
        I28_TB <= '0';  I29_TB <= '0';  I30_TB <= '0';  I31_TB <= '0';
        S0_TB <= '0';   S1_TB <= '0';   S2_TB <= '1';   S3_TB <= '0';   S4_TB <= '0';
        wait for PERIOD;
        assert (Y_TB = I4_TB) report "Test Case 5 Failed: I4 was not selected!" severity error;

        -- Continue similar test cases for I5 to I31

        -- Test Case 31: Select I31 (S0 = 1, S1 = 1, S2 = 1, S3 = 1, S4 = 1)
        I0_TB <= '0';   I1_TB <= '0';   I2_TB <= '0';   I3_TB <= '0'; 
        I4_TB <= '0';   I5_TB <= '0';   I6_TB <= '0';   I7_TB <= '0';
        I8_TB <= '0';   I9_TB <= '0';   I10_TB <= '0';  I11_TB <= '0';
        I12_TB <= '0';  I13_TB <= '0';  I14_TB <= '0';  I15_TB <= '0';
        I16_TB <= '0';  I17_TB <= '0';  I18_TB <= '0';  I19_TB <= '0'; 
        I20_TB <= '0';  I21_TB <= '0';  I22_TB <= '0';  I23_TB <= '0';
        I24_TB <= '0';  I25_TB <= '0';  I26_TB <= '0';  I27_TB <= '0'; 
        I28_TB <= '0';  I29_TB <= '0';  I30_TB <= '0';  I31_TB <= '1';
        S0_TB <= '1';   S1_TB <= '1';   S2_TB <= '1';   S3_TB <= '1';   S4_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I31_TB) report "Test Case 31 Failed: I31 was not selected!" severity error;

        -- End of simulation
        wait;  
    end process stim_proc;

end Simulation;
