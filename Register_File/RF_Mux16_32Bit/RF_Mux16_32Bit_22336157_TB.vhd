----------------------------------------------------------------------------------                                                                                      
-- Company:                                                                                                                                                             
-- Engineer: Emma Burgess                                                                                                                                                        
--                                                                                                                                                                      
-- Create Date: 20.09.2023 14:53:59                                                                                                                                     
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

entity RF_Mux16_32Bit_22336157_TB is
end RF_Mux16_32Bit_22336157_TB;

architecture simulation of RF_Mux16_32Bit_22336157_TB is
    -- Component Declaration for the UUT
    component RF_Mux16_32Bit_22336157_TB
        Port ( I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15  : in  STD_LOGIC_VECTOR(31 downto 0);
               S0 : in  STD_LOGIC;
               S1 : in  STD_LOGIC;
               S2 : in STD_LOGIC;
               S3 : in STD_LOGIC;
               Y  : out STD_LOGIC_VECTOR(31 downto 0)
             );
    end component;

    -- Signals for inputs and outputs
    signal I0_TB, I1_TB, I2_TB, I3_TB, I4_TB, I5_TB, I6_TB, I7_TB, I8_TB, I9_TB, I10_TB, I11_TB, I12_TB, I13_TB, I14_TB, I15_TB : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');  -- Initialize inputs
    signal S0_TB, S1_TB, S2_TB, S3_TB : STD_LOGIC := '0';  -- Initialize selection signals
    signal Y_TB : STD_LOGIC_VECTOR(31 downto 0);  -- Output
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: RF_Mux16_32Bit Port map (
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

    -- Test process
    stim_proc: process
    begin
        -- Test case 1: Select I0 (S0 = '0', S1 = '0')
        I0_TB <= "00000001010101001101001010011101";  -- 32-bit value for I0
        I1_TB <= "00000001010101001101001010011110";  -- 32-bit value for I1
        I2_TB <= "00000001010101001101001010011111";  -- 32-bit value for I2
        I3_TB <= "00000001010101001101001010100000";
        I4_TB <= "00000001010101001101001010100001";
        I5_TB <= "00000001010101001101001010100010";
        I6_TB <= "00000001010101001101001010100011";
        I7_TB <= "00000001010101001101001010100100";
        I8_TB <= "00000001010101001101001010100101";
        I9_TB <= "00000001010101001101001010100110";
        I10_TB <="00000001010101001101001010100111";
        I11_TB <= "00000001010101001101001010101000";
        I12_TB <= "00000001010101001101001010101001";
        I13_TB <= "00000001010101001101001010101010";
        I14_TB <= "00000001010101001101001010101011";
        I15_TB <= "00000001010101001101001010101100";

    
    -- Test case 1: Select I0 (S0 = '0', S1 = '0', S2 = '0', S3 = '0')
    S0_TB <= '0';
    S1_TB <= '0';
    S2_TB <= '0';
    S3_TB <= '0';
    wait for 200 ns;
    assert (Y_TB = I0_TB) report "Error: Output Y_TB should be I0_TB" severity error;
    
    -- Test case 2: Select I1 (S0 = '1', S1 = '0', S2 = '0', S3 = '0')
    S0_TB <= '1';
    S1_TB <= '0';
    S2_TB <= '0';
    S3_TB <= '0';
    wait for 200 ns;
    assert (Y_TB = I1_TB) report "Error: Output Y_TB should be I1_TB" severity error;
    
    -- Test case 3: Select I2 (S0 = '0', S1 = '1', S2 = '0', S3 = '0')
    S0_TB <= '0';
    S1_TB <= '1';
    S2_TB <= '0';
    S3_TB <= '0';
    wait for 200 ns;
    assert (Y_TB = I2_TB) report "Error: Output Y_TB should be I2_TB" severity error;
    
    -- Test case 4: Select I3 (S0 = '1', S1 = '1', S2 = '0', S3 = '0')
    S0_TB <= '1';
    S1_TB <= '1';
    S2_TB <= '0';
    S3_TB <= '0';
    wait for 200 ns;
    assert (Y_TB = I3_TB) report "Error: Output Y_TB should be I3_TB" severity error;
    
    -- Test case 5: Select I4 (S0 = '0', S1 = '0', S2 = '1', S3 = '0')
    S0_TB <= '0';
    S1_TB <= '0';
    S2_TB <= '1';
    S3_TB <= '0';
    wait for 200 ns;
    assert (Y_TB = I4_TB) report "Error: Output Y_TB should be I4_TB" severity error;
    
    -- Test case 6: Select I5 (S0 = '1', S1 = '0', S2 = '1', S3 = '0')
    S0_TB <= '1';
    S1_TB <= '0';
    S2_TB <= '1';
    S3_TB <= '0';
    wait for 200 ns;
    assert (Y_TB = I5_TB) report "Error: Output Y_TB should be I5_TB" severity error;
    
    -- Test case 7: Select I6 (S0 = '0', S1 = '1', S2 = '1', S3 = '0')
    S0_TB <= '0';
    S1_TB <= '1';
    S2_TB <= '1';
    S3_TB <= '0';
    wait for 200 ns;
    assert (Y_TB = I6_TB) report "Error: Output Y_TB should be I6_TB" severity error;
    
    -- Test case 8: Select I7 (S0 = '1', S1 = '1', S2 = '1', S3 = '0')
    S0_TB <= '1';
    S1_TB <= '1';
    S2_TB <= '1';
    S3_TB <= '0';
    wait for 200 ns;
    assert (Y_TB = I7_TB) report "Error: Output Y_TB should be I7_TB" severity error;
    
    -- Test case 9: Select I8 (S0 = '0', S1 = '0', S2 = '0', S3 = '1')
    S0_TB <= '0';
    S1_TB <= '0';
    S2_TB <= '0';
    S3_TB <= '1';
    wait for 200 ns;
    assert (Y_TB = I8_TB) report "Error: Output Y_TB should be I8_TB" severity error;
    
    -- Test case 10: Select I9 (S0 = '1', S1 = '0', S2 = '0', S3 = '1')
    S0_TB <= '1';
    S1_TB <= '0';
    S2_TB <= '0';
    S3_TB <= '1';
    wait for 200 ns;
    assert (Y_TB = I9_TB) report "Error: Output Y_TB should be I9_TB" severity error;
    
    -- Test case 11: Select I10 (S0 = '0', S1 = '1', S2 = '0', S3 = '1')
    S0_TB <= '0';
    S1_TB <= '1';
    S2_TB <= '0';
    S3_TB <= '1';
    wait for 200 ns;
    assert (Y_TB = I10_TB) report "Error: Output Y_TB should be I10_TB" severity error;
    
    -- Test case 12: Select I11 (S0 = '1', S1 = '1', S2 = '0', S3 = '1')
    S0_TB <= '1';
    S1_TB <= '1';
    S2_TB <= '0';
    S3_TB <= '1';
    wait for 200 ns;
    assert (Y_TB = I11_TB) report "Error: Output Y_TB should be I11_TB" severity error;
    
    -- Test case 13: Select I12 (S0 = '0', S1 = '0', S2 = '1', S3 = '1')
    S0_TB <= '0';
    S1_TB <= '0';
    S2_TB <= '1';
    S3_TB <= '1';
    wait for 200 ns;
    assert (Y_TB = I12_TB) report "Error: Output Y_TB should be I12_TB" severity error;
    
    -- Test case 14: Select I13 (S0 = '1', S1 = '0', S2 = '1', S3 = '1')
    S0_TB <= '1';
    S1_TB <= '0';
    S2_TB <= '1';
    S3_TB <= '1';
    wait for 200 ns;
    assert (Y_TB = I13_TB) report "Error: Output Y_TB should be I13_TB" severity error;
    
    -- Test case 15: Select I14 (S0 = '0', S1 = '1', S2 = '1', S3 = '1')
    S0_TB <= '0';
    S1_TB <= '1';
    S2_TB <= '1';
    S3_TB <= '1';
    wait for 200 ns;
    assert (Y_TB = I14_TB) report "Error: Output Y_TB should be I14_TB" severity error;
    
    -- Test case 16: Select I15 (S0 = '1', S1 = '1', S2 = '1', S3 = '1')
    S0_TB <= '1';
    S1_TB <= '1';
    S2_TB <= '1';
    S3_TB <= '1';
    wait for 200 ns;
    assert (Y_TB = I15_TB) report "Error: Output Y_TB should be I15_TB" severity error;
    
    wait;

    end process;
end simulation;
