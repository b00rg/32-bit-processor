----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michael Manzke
-- 
-- Create Date: 08.10.2023 18:25:21
-- Design Name: 
-- Module Name: RF_DestReg_Decoder_XXXXXXXX_TB - Simulation
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

entity RF_DestReg_Decoder_XXXXXXXX_TB is
--  Port ( );
end RF_DestReg_Decoder_XXXXXXXX_TB;

architecture Simulation of RF_DestReg_Decoder_XXXXXXXX_TB is

   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_DestReg_Decoder_XXXXXXXX
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out STD_LOGIC);
    END COMPONENT;

   --Inputs Signals 
   signal A_TB : std_logic_vector(2 downto 0):= (others => '0');
   --Output Signal   
   signal Q0_TB, Q1_TB, Q2_TB, Q3_TB : STD_LOGIC := '0';
   signal Q4_TB, Q5_TB, Q6_TB, Q7_TB : STD_LOGIC := '0';
   
   -- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"191D9ED";
   constant WaitPeriod : time := 100ns;   
       
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RF_DestReg_Decoder_XXXXXXXX PORT MAP (
          A => A_TB, 
          Q0 => Q0_TB, 
          Q1 => Q1_TB, 
          Q2 => Q2_TB, 
          Q3 => Q3_TB, 
          Q4 => Q4_TB, 
          Q5 => Q5_TB, 
          Q6 => Q6_TB, 
          Q7 => Q7_TB);

stim_proc: process

   begin		
      A_TB <= "000";  -- case A       
      wait for WaitPeriod;	
      A_TB <= "001"; -- case B       
      wait for WaitPeriod;	
      A_TB <= "010"; -- case C       
      wait for WaitPeriod;	
      A_TB <= "011"; -- case D        
      wait for WaitPeriod;	
      A_TB <= "100"; -- case E       
      wait for WaitPeriod;	
      A_TB <= "101"; -- case F       
      wait for WaitPeriod;	
      A_TB <= "110"; -- case G       
      wait for WaitPeriod;	
      A_TB <= "111"; -- case H        
      wait for WaitPeriod;	      
   end process;

end Simulation;
