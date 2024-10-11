----------------------------------------------------------------------------------                                                                                      
-- Company:                                                                                                                                                             
-- Engineer:                                                                                                                                                            
--                                                                                                                                                                      
-- Create Date: 20.09.2023 14:53:59                                                                                                                                     
-- Design Name:                                                                                                                                                         
-- Module Name: Mux3_32Bit - Behavioral                                                                                                                                 
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

entity RF_Mux3_32Bit_22336157_TB is
end RF_Mux3_32Bit_22336157_TB;

architecture simulation of RF_Mux3_32Bit_22336157_TB is
    -- Component Declaration for the UUT
    component RF_Mux3_32Bit_22336157_TB
        Port ( I0 : in  STD_LOGIC_VECTOR(31 downto 0);
               I1 : in  STD_LOGIC_VECTOR(31 downto 0);
               I2 : in  STD_LOGIC_VECTOR(31 downto 0);
               S0 : in  STD_LOGIC;
               S1 : in  STD_LOGIC;
               Y  : out STD_LOGIC_VECTOR(31 downto 0)
             );
    end component;

    -- Signals for inputs and outputs
    signal I0_TB, I1_TB, I2_TB : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');  -- Initialize inputs
    signal S0_TB, S1_TB : STD_LOGIC := '0';  -- Initialize selection signals
    signal Y_TB : STD_LOGIC_VECTOR(31 downto 0);  -- Output
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: RF_Mux3_32Bit_22336157 Port map (
            I0 => I0_TB,
            I1 => I1_TB,
            I2 => I2_TB,
            S0 => S0_TB,
            S1 => S1_TB,
            Y  => Y_TB
        );

    -- Test process
    stim_proc: process
    begin
        -- Test case 1: Select I0 (S0 = '0', S1 = '0')
        I0_TB <= "00000001010101001101001010011101";  -- 32-bit value for I0
        I1_TB <= "00000001010101001101001010011110";  -- 32-bit value for I1
        I2_TB <= "00000001010101001101001010011111";  -- 32-bit value for I2
        S0_TB <= '0';
        S1_TB <= '0';
        wait for 200 ns;
        assert (Y_TB = I0_TB) report "Error: Output Y_TB should be I0_TB" severity error;

        -- Test case 2: Select I1 (S0 = '1', S1 = '0')
        S0_TB <= '1';
        S1_TB <= '0';
        wait for 200 ns;
        assert (Y_TB = I1_TB) report "Error: Output Y_TB should be I1_TB" severity error;

        -- Test case 3: Select I2 (S0 = '0', S1 = '1')
        S0_TB <= '0';
        S1_TB <= '1';
        wait for 200 ns;
        assert (Y_TB = I2_TB) report "Error: Output Y_TB should be I2_TB" severity error;


        -- Finish simulation
        wait;
    end process;
end simulation;
