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
                                                                                                                                                                        
entity RF_Mux3_32Bit_TB is                                                                                                                                              
end RF_Mux3_32Bit_TB;                                                                                                                                                   
                                                                                                                                                                        
architecture simulation of RF_Mux3_32Bit_TB is                                                                                                                          
    -- Component Declaration for the UUT                                                                                                                                
    component RF_Mux3_32Bit                                                                                                                                             
        Port ( I0 : in  STD_LOGIC_VECTOR(31 downto 0);                                                                                                                  
               I1 : in  STD_LOGIC_VECTOR(31 downto 0);                                                                                                                  
               I2 : in  STD_LOGIC_VECTOR(31 downto 0);                                                                                                                  
               S0 : in  STD_LOGIC;                                                                                                                                      
               S1 : in  STD_LOGIC;                                                                                                                                      
               Y  : out STD_LOGIC_VECTOR(31 downto 0)                                                                                                                   
             );                                                                                                                                                         
    end component;                                                                                                                                                      
        -- Signals for inputs and outputs                                                                                                                               
    signal I0_TB, I1_TB, I2_TB : STD_LOGIC_VECTOR(31 downto 0) => (others => '0');                                                                                                         
    signal S0_TB, S1_TB : STD_LOGIC := '0';                                                                                                                             
    signal Y_TB : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');                                                                                                                        
                                                                                                                                                                        
begin                                                                                                                                                                   
    -- Instantiate the Unit Under Test (UUT)                                                                                                                            
    uut: RF_Mux3_32Bit Port map (                                                                                                                                       
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
        S0_TB <= '0';                                                                                                                                                   
        S1_TB <= '0';                                                                                                                                                   
        -- Test case 1: Select I0 (S0 = '0', S1 = '0')                                                                                                                  
        I0_TB <= "00000000000000000000000000000000";  -- 32-bit value                                                                                                   
        I1_TB <= "00000000000000000000000000000000";  -- 32-bit value                                                                                                   
        I2_TB <= "00000000000000000000000000000000";  -- 32-bit value                                                                                                   
                                                                                                                                                                                                                                                                                                                           
        wait for 60 ns;                                                                                                                                                
                                                                                                                                                                        
        -- Test case 2: Select I1 (S0 = '1', S1 = '0')                                                                                                                  
        S0_TB <= '1';                                                                                                                                                   
        S1_TB <= '0';  
        I0_TB <= "00000000000000000000000000000001";  -- 32-bit value                                                                                                   
        I1_TB <= "00000000000000000000000000000000";  -- 32-bit value                                                                                                   
        I2_TB <= "00000000000000000000000000000000";  -- 32-bit value      
        wait for 100 ns;                                                                                                                                                
                                                                                                                                                                        
        -- Test case 3: Select I2 (S0 = '0', S1 = '1')                                                                                                                  
        S0_TB <= '0';                                                                                                                                                   
        S1_TB <= '1';                                                                                                                                                   
        wait for 100 ns;                                                                                                                                                
                                                                                                                                                                        
        -- Test case 4: Invalid Selection (S0 = '1', S1 = '1')                                                                                                          
        S0_TB <= '1';                                                                                                                                                   
        S1_TB <= '1';                                                                                                                                                   
        wait;                                                                                                                                                           
                                                                                                                                                                        
    end process;                                                                                                                                                        
end simulation;                                                                                                                                                         
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
                                                                                                                                                                        
