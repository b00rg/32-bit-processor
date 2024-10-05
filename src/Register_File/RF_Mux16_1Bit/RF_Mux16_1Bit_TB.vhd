----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Mux16_1Bit_TB is
end RF_Mux16_1Bit_TB;

architecture Simulation of RF_Mux16_1Bit_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_Mux16_1Bit
	Port ( I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC;     -- Input Signals
    I8, I9, I10, I11, I12, I13, I14, I15:  in STD_LOGIC ; 		
		S0, S1, S2, S3 : in STD_LOGIC; 		            	      -- Selection Signals (2^4 = 16) 
		Y : out STD_LOGIC ) ; 
    END COMPONENT;

    -- Signals to connect to UUT inputs and outputs
    signal  I0_TB , I1_TB, I2_TB, I3_TB, I4_TB, I5_TB, I6_TB, I7_TB : STD_LOGIC := '0';  -- Inputs for the MUX
    signal  I8_TB , I9_TB, I10_TB, I11_TB, I12_TB, I13_TB, I14_TB, I15_TB : STD_LOGIC := '0';
	signal S0_TB , S1_TB, S2_TB, S3_TB: std_logic := '0';
    signal Y_TB : STD_LOGIC;                        -- Output for the MUX

    constant PERIOD : time := 200ns;                -- Simulation period

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RF_Mux16_1Bit PORT MAP (
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
        S0 => S0_TB,
        S1 => S1_TB,
        S2 => S2_TB,
        S3 => S3_TB,
        Y  => Y_TB
    );

   -- Stimulus process to apply test cases
   stim_proc: process
   begin
        -- Test Case 1: S1 = 0, S0 = 0 -> Select I0
        I0_TB <= '1';   -- Set I0 to '1'
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';   -- I2 -> don't care
        I4_TB <= '0';   -- I2 -> don't care
        I5_TB <= '0';   -- I2 -> don't care
        I6_TB <= '0';   -- I2 -> don't care
        I7_TB <= '0';   -- I2 -> don't care
        I8_TB <= '0';   -- I2 -> don't care
        I9_TB <= '0';   -- I2 -> don't care
        I10_TB <= '0';   -- I2 -> don't care
        I11_TB <= '0';   -- I2 -> don't care
        I12_TB <= '0';   -- I2 -> don't care
        I13_TB <= '0';   -- I2 -> don't care
        I14_TB <= '0';   -- I2 -> don't care
        I15_TB <= '0';   -- I2 -> don't care
        S1_TB <= '0';   -- S1 = 0
        S0_TB <= '0';   -- S0 = 0
        S2_TB <= '0';
        S3_TB <= '0'; 
        wait for PERIOD; 
        assert (Y_TB = I0_TB) report "Test Case 1 Failed: I0 was not selected!" severity error;

        -- Test Case 2: S1 = 0, S0 = 1 -> Select I1
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '1';   -- Set I1 to '1'
        I2_TB <= '0';   -- I2 -> don't care
        S1_TB <= '0';   -- S1 = 0
        S0_TB <= '1';   -- S0 = 1
        wait for PERIOD;
        assert (Y_TB = I1_TB) report "Test Case 2 Failed: I1 was not selected!" severity error;

        -- Test Case 3: S1 = 1, S0 = 0 -> Select I2
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '1';   -- Set I2 to '1'
        S1_TB <= '1';   -- S1 = 0
        S0_TB <= '0';   -- S0 = 1
        wait for PERIOD;
        assert (Y_TB = I2_TB) report "Test Case 3 Failed: I2 was not selected!" severity error;

        -- Test Case 4: S1 = 1, S0 = 1 -> Select I3
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '1';
        S1_TB <= '1';   
        S0_TB <= '1';  
        wait for PERIOD;
        assert (Y_TB = I3_TB) report "Test Case 4 Failed: I3 was not selected!" severity error;


        -- Test Case 5: S1 = 0, S0 = 0, S2 = 1 -> Select I4
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '1';
        S1_TB <= '0';  
        S0_TB <= '0';  
        S2_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I4_TB) report "Test Case 5 Failed: I4 was not selected!" severity error;
        
          -- Test Case 6: Select I5
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '1'; 
        S1_TB <= '0';   
        S0_TB <= '1';   
        S2_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I5_TB) report "Test Case 6 Failed: I5 was not selected!" severity error;
        
        -- Test Case 7: Select I6
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '1'; 
        S1_TB <= '1';   
        S0_TB <= '0'; 
        S2_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I6_TB) report "Test Case 7 Failed: I6 was not selected!" severity error;
        
        -- Test Case 8: Select I7
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '1'; 
        S1_TB <= '1';  
        S0_TB <= '1';  
        S2_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I7_TB) report "Test Case 8 Failed: I7 was not selected!" severity error;
        
        -- Test Case 9: Select I8
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '0';
        I8_TB <= '1'; 
        S0_TB <= '0';  
        S1_TB <= '0';  
        S2_TB <= '0';
        S3_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I8_TB) report "Test Case 9 Failed: I8 was not selected!" severity error;

        -- Test Case 10: Select I9 
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '0';
        I8_TB <= '0';   
        I9_TB <= '1';   
        S1_TB <= '0';  
        S0_TB <= '1';   
        wait for PERIOD;
        assert (Y_TB = I9_TB) report "Test Case 10 Failed: I9 was not selected!" severity error;

        -- Test Case 11: Select I10
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '0';
        I8_TB <= '0';   
        I9_TB <= '0';   -- I0 -> don't care
        I10_TB <= '1';   -- I1 -> don't care
        S1_TB <= '1';   -- S1 = 0
        S0_TB <= '0';   -- S0 = 1
        wait for PERIOD;
        assert (Y_TB = I10_TB) report "Test Case 11 Failed: I10 was not selected!" severity error;

        -- Test Case 12: Select I11
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '0';
        I8_TB <= '0';   
        I9_TB <= '0';
        I10_TB <= '0';  
        I11_TB <= '1';  
        I3_TB <= '1';
        S1_TB <= '1';   
        S0_TB <= '1';  
        wait for PERIOD;
        assert (Y_TB = I11_TB) report "Test Case 12 Failed: I11 was not selected!" severity error;


        -- Test Case 13: S1 = 0, S0 = 0, S2 = 1 -> Select I13
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '0';
        I8_TB <= '0';   
        I9_TB <= '0';
        I10_TB <= '0';  
        I11_TB <= '0';
        I12_TB <= '1';
        S1_TB <= '0';  
        S0_TB <= '0';  
        S2_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I12_TB) report "Test Case 13 Failed: I12 was not selected!" severity error;
        
          -- Test Case 14: Select I5
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '0';
        I8_TB <= '0';   
        I9_TB <= '0';
        I10_TB <= '0';  
        I11_TB <= '0';
        I12_TB <= '0';
        I13_TB <= '1'; 
        S1_TB <= '0';   
        S0_TB <= '1';   
        S2_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I13_TB) report "Test Case 14 Failed: I13 was not selected!" severity error;
        
        -- Test Case 15: Select I6
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '0';
        I8_TB <= '0';   
        I9_TB <= '0';
        I10_TB <= '0';  
        I11_TB <= '0';
        I12_TB <= '0';
        I13_TB <= '0';
        I14_TB <= '1'; 
        S1_TB <= '1';   
        S0_TB <= '0'; 
        S2_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I14_TB) report "Test Case 15 Failed: I14 was not selected!" severity error;
        
        -- Test Case 16: Select I7
        I0_TB <= '0';   -- I0 -> don't care
        I1_TB <= '0';   -- I1 -> don't care
        I2_TB <= '0';   -- I2 -> don't care
        I3_TB <= '0';
        I4_TB <= '0';
        I5_TB <= '0';
        I6_TB <= '0';
        I7_TB <= '0';
        I8_TB <= '0';   
        I9_TB <= '0';
        I10_TB <= '0';  
        I11_TB <= '0';
        I12_TB <= '0';
        I13_TB <= '0';
        I14_TB <= '0';
        I15_TB <= '1'; 
        S1_TB <= '1';  
        S0_TB <= '1';  
        S2_TB <= '1';
        wait for PERIOD;
        assert (Y_TB = I7_TB) report "Test Case 16 Failed: I15 was not selected!" severity error;

        -- Final wait to keep the simulation running
        wait for 5000 ns;
    end process; 
end Simulation; 
