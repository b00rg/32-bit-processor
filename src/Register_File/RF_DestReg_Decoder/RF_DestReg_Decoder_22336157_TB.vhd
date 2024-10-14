library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_DestReg_Decoder_22336157_TB is
--  Port ( );
end RF_DestReg_Decoder_22336157_TB;

architecture Simulation of RF_DestReg_Decoder_22336157_TB is

   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_DestReg_Decoder_22336157
    Port ( A : in STD_LOGIC_VECTOR (4 downto 0); -- 5-bit input for 5 to 32 decoder
           Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, 
           Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
           Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23,
           Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31 : out STD_LOGIC);
    END COMPONENT;

   -- Inputs Signals 
   signal A_TB : std_logic_vector(4 downto 0) := (others => '0'); -- 5-bit input
   -- Output Signals   
   signal Q0_TB, Q1_TB, Q2_TB, Q3_TB : STD_LOGIC;
   signal Q4_TB, Q5_TB, Q6_TB, Q7_TB : STD_LOGIC;
   signal Q8_TB, Q9_TB, Q10_TB, Q11_TB : STD_LOGIC;
   signal Q12_TB, Q13_TB, Q14_TB, Q15_TB : STD_LOGIC;
   signal Q16_TB, Q17_TB, Q18_TB, Q19_TB : STD_LOGIC;
   signal Q20_TB, Q21_TB, Q22_TB, Q23_TB : STD_LOGIC;
   signal Q24_TB, Q25_TB, Q26_TB, Q27_TB : STD_LOGIC;
   signal Q28_TB, Q29_TB, Q30_TB, Q31_TB : STD_LOGIC;

   -- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   constant WaitPeriod : time := 100ns;   
       
begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RF_DestReg_Decoder_22336157 PORT MAP (
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
          Q15 => Q15_TB,
          Q16 => Q16_TB,
          Q17 => Q17_TB,
          Q18 => Q18_TB,
          Q19 => Q19_TB,
          Q20 => Q20_TB,
          Q21 => Q21_TB,
          Q22 => Q22_TB,
          Q23 => Q23_TB,
          Q24 => Q24_TB,
          Q25 => Q25_TB,
          Q26 => Q26_TB,
          Q27 => Q27_TB,
          Q28 => Q28_TB,
          Q29 => Q29_TB,
          Q30 => Q30_TB,
          Q31 => Q31_TB);

stim_proc: process
   begin		
      A_TB <= "00000";  -- case 0       
      wait for WaitPeriod;	
      A_TB <= "00001"; -- case 1       
      wait for WaitPeriod;	
      A_TB <= "00010"; -- case 2       
      wait for WaitPeriod;	
      A_TB <= "00011"; -- case 3        
      wait for WaitPeriod;	
      A_TB <= "00100"; -- case 4       
      wait for WaitPeriod;	
      A_TB <= "00101"; -- case 5       
      wait for WaitPeriod;	
      A_TB <= "00110"; -- case 6       
      wait for WaitPeriod;	
      A_TB <= "00111"; -- case 7        
      wait for WaitPeriod;	
      A_TB <= "01000"; -- case 8       
      wait for WaitPeriod;	
      A_TB <= "01001"; -- case 9       
      wait for WaitPeriod;	
      A_TB <= "01010"; -- case 10       
      wait for WaitPeriod;	
      A_TB <= "01011"; -- case 11        
      wait for WaitPeriod;	
      A_TB <= "01100"; -- case 12       
      wait for WaitPeriod;	
      A_TB <= "01101"; -- case 13       
      wait for WaitPeriod;	
      A_TB <= "01110"; -- case 14       
      wait for WaitPeriod;	
      A_TB <= "01111"; -- case 15        
      wait for WaitPeriod;	
      A_TB <= "10000"; -- case 16       
      wait for WaitPeriod;	
      A_TB <= "10001"; -- case 17       
      wait for WaitPeriod;	
      A_TB <= "10010"; -- case 18       
      wait for WaitPeriod;	
      A_TB <= "10011"; -- case 19        
      wait for WaitPeriod;	
      A_TB <= "10100"; -- case 20       
      wait for WaitPeriod;	
      A_TB <= "10101"; -- case 21       
      wait for WaitPeriod;	
      A_TB <= "10110"; -- case 22       
      wait for WaitPeriod;	
      A_TB <= "10111"; -- case 23        
      wait for WaitPeriod;	
      A_TB <= "11000"; -- case 24       
      wait for WaitPeriod;	
      A_TB <= "11001"; -- case 25       
      wait for WaitPeriod;	
      A_TB <= "11010"; -- case 26       
      wait for WaitPeriod;	
      A_TB <= "11011"; -- case 27        
      wait for WaitPeriod;	
      A_TB <= "11100"; -- case 28       
      wait for WaitPeriod;	
      A_TB <= "11101"; -- case 29       
      wait for WaitPeriod;	
      A_TB <= "11110"; -- case 30       
      wait for WaitPeriod;	
      A_TB <= "11111"; -- case 31        
      wait for WaitPeriod;	      
      wait; -- Stop the simulation
   end process;

end Simulation;
