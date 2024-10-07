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
                                                                                                                                                                                          
entity RF_Mux3_32Bit_tb is                                                                                                                                                                
end RF_Mux3_32Bit_tb;                                                                                                                                                                     
                                                                                                                                                                                          
architecture simulation of RF_Mux3_32Bit_tb is                                                                                                                                            
    -- Signals for inputs and outputs                                                                                                                                                     
    signal I0, I1, I2 : STD_LOGIC_VECTOR(31 downto 0);                                                                                                                                    
    signal S0, S1 : STD_LOGIC;                                                                                                                                                            
    signal Y : STD_LOGIC_VECTOR(31 downto 0);                                                                                                                                             
                                                                                                                                                                                          
begin                                                                                                                                                                                     
    -- Instantiate the Unit Under Test (UUT)                                                                                                                                              
    uut: RF_Mux3_32Bit                                                                                                                                                                    
        Port map (                                                                                                                                                                        
            I0 => I0,                                                                                                                                                                     
            I1 => I1,                                                                                                                                                                     
            I2 => I2,                                                                                                                                                                     
            S0 => S0,                                                                                                                                                                     
            S1 => S1,                                                                                                                                                                     
            Y => Y                                                                                                                                                                        
        );                                                                                                                                                                                
                                                                                                                                                                                          
    -- Test process                                                                                                                                                                       
    stim_proc: process                                                                                                                                                                    
    begin                                                                                                                                                                                 
        -- Test case 1: Select I0 (S0 = '0', S1 = '0')                                                                                                                                    
        I0 <= "00000001";  -- Example value                                                                                                                                               
        I1 <= "00000001";  -- Example value                                                                                                                                               
        I2 <= "00000001";  -- Example value                                                                                                                                               
        S0 <= '0';                                                                                                                                                                        
        S1 <= '0';                                                                                                                                                                        
        wait for 100 ns;                                                                                                                                                                  
                                                                                                                                                                                          
        -- Test case 2: Select I1 (S0 = '1', S1 = '0')                                                                                                                                    
        S0 <= '1';                                                                                                                                                                        
        S1 <= '0';                                                                                                                                                                        
        wait for 100 ns;                                                                                                                                                                  
                                                                                                                                                                                          
        -- Test case 3: Select I2 (S0 = '0', S1 = '1')                                                                                                                                    
        S0 <= '0';                                                                                                                                                                        
        S1 <= '1';                                                                                                                                                                        
        wait for 100 ns;                                                                                                                                                                  
                                                                                                                                                                                          
        -- Test case 4: Invalid Selection (S0 = '1', S1 = '1'), usually ignored or undefined                                                                                              
        S0 <= '1';                                                                                                                                                                        
        S1 <= '1';                                                                                                                                                                        
        wait for 100 ns;                                                                                                                                                                  
                                                                                                                                                                                          
        -- End the test                                                                                                                                                                   
        wait;                                                                                                                                                                             
    end process;                                                                                                                                                                          
                                                                                                                                                                                          
end Simulation;                                                                                                                                                                           
