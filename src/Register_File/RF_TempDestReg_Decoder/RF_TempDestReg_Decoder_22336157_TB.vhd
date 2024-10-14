library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Temp_DestReg_Decoder_22336157_TB is
--  Port ( );
end RF_Temp_DestReg_Decoder_22336157_TB;

architecture Simulation of RF_Temp_DestReg_Decoder_22336157_TB is

   -- Component Declaration for the Unit Under Test (UUT)
   COMPONENT RF_Temp_DestReg_Decoder_22336157
   Port ( A : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit input for 4 to 16 decoder
          Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out STD_LOGIC; 
          Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15 : out STD_LOGIC);
   END COMPONENT;

   -- Input Signals 
   signal A_TB : std_logic_vector(3 downto 0) := (others => '0'); -- 4-bit input
   -- Output Signals   
   signal Q0_TB, Q1_TB, Q2_TB, Q3_TB : STD_LOGIC;
   signal Q4_TB, Q5_TB, Q6_TB, Q7_TB : STD_LOGIC;
   signal Q8_TB, Q9_TB, Q10_TB, Q11_TB : STD_LOGIC;
   signal Q12_TB, Q13_TB, Q14_TB, Q15_TB : STD_LOGIC;

   constant WaitPeriod : time := 60ns;   
       
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RF_Temp_DestReg_Decoder_22336157 PORT MAP (
          A => A_TB, 
          Q0 => Q0_TB, 
          Q1 => Q1_TB, 
          Q2 => Q2_TB, 
          Q3 => Q3_TB, 
          Q4 => Q4_TB, 
          Q5 => Q5_TB, 
          Q6 => Q6_TB, 
          Q7 => Q7_TB,
          Q8 => Q8_TB,
          Q9 => Q9_TB,
          Q10 => Q10_TB,
          Q11 => Q11_TB,
          Q12 => Q12_TB,
          Q13 => Q13_TB,
          Q14 => Q14_TB,
          Q15 => Q15_TB);

stim_proc: process
   begin		
      A_TB <= "0000";  -- case 0       
      wait for WaitPeriod;	
      A_TB <= "0001"; -- case 1       
      wait for WaitPeriod;	
      A_TB <= "0010"; -- case 2       
      wait for WaitPeriod;	
      A_TB <= "0011"; -- case 3        
      wait for WaitPeriod;	
      A_TB <= "0100"; -- case 4       
      wait for WaitPeriod;	
      A_TB <= "0101"; -- case 5       
      wait for WaitPeriod;	
      A_TB <= "0110"; -- case 6       
      wait for WaitPeriod;	
      A_TB <= "0111"; -- case 7        
      wait for WaitPeriod;	
      A_TB <= "1000"; -- case 8       
      wait for WaitPeriod;	
      A_TB <= "1001"; -- case 9       
      wait for WaitPeriod;	
      A_TB <= "1010"; -- case 10       
      wait for WaitPeriod;	
      A_TB <= "1011"; -- case 11        
      wait for WaitPeriod;	
      A_TB <= "1100"; -- case 12       
      wait for WaitPeriod;	
      A_TB <= "1101"; -- case 13       
      wait for WaitPeriod;	
      A_TB <= "1110"; -- case 14       
      wait for WaitPeriod;	
      A_TB <= "1111"; -- case 15        
      wait for WaitPeriod;	      
      wait; -- Stop the simulation
   end process;

end Simulation;
