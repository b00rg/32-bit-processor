----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Michael Manzke
-- 
-- Create Date: 06.10.2022 23:51:26
-- Design Name: 
-- Module Name: RippleCarryAdder3Bit_XXXXXXXX_TB - Behavioral
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

entity RippleCarryAdder3Bit_XXXXXXXX_TB is
--  Port ( ); We don't need ports 
end RippleCarryAdder3Bit_XXXXXXXX_TB;

architecture Sim of RippleCarryAdder3Bit_XXXXXXXX_TB is

-- Component Declaration for the Unit Under Test (UUT)

component RippleCarryAdder3Bit_XXXXXXXX

Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       C_IN : in STD_LOGIC;
       SUM : out STD_LOGIC_VECTOR (2 downto 0);
       C_OUT : out STD_LOGIC;
       V : out STD_LOGIC);
end component;

--Inputs

    signal A_TB : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal B_TB : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal C_IN_TB : STD_LOGIC := '0';
  
--Outputs

    signal SUM_TB : STD_LOGIC_VECTOR (2 downto 0)  := (others => '0');
    signal C_OUT_TB : STD_LOGIC := '0';
    signal V_TB : STD_LOGIC := '0';
    
-- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"191D9ED";  
   constant WaitPERIOD : time := 100ns;
   
begin

	-- Instantiate the Unit Under Test (UUT)
   uut: RippleCarryAdder3Bit_XXXXXXXX PORT MAP (
       A => A_TB,
       B => B_TB,
       C_IN => C_IN_TB,
       SUM => SUM_TB,
       C_OUT => C_OUT_TB,
       V => V_TB
       );

 stim_proc: process
   begin
   
   -- carry unset 
   		
      A_TB <= "000";
      B_TB <= "000";
      C_IN_TB <= '0';
      
      wait for WaitPERIOD;	

      A_TB <= "000";
      B_TB <= "001";
      C_IN_TB <= '0';     

      wait for WaitPERIOD;
      	
      A_TB <= "001";
      B_TB <= "001";
      C_IN_TB <= '0'; 
      
      wait for WaitPERIOD;	

      A_TB <= "010";
      B_TB <= "001";
      C_IN_TB <= '0';

      wait for WaitPERIOD;	

      A_TB <= "011";
      B_TB <= "001";
      C_IN_TB <= '0';
      
      --
   
      wait for WaitPERIOD;	

      A_TB <= "100";
      B_TB <= "001";
      C_IN_TB <= '0';     

      wait for WaitPERIOD;
      	
      A_TB <= "101";
      B_TB <= "001";
      C_IN_TB <= '0'; 
      
      wait for WaitPERIOD;	

      A_TB <= "110";
      B_TB <= "001";
      C_IN_TB <= '0';

      wait for WaitPERIOD;	

      A_TB <= "111";
      B_TB <= "001";
      C_IN_TB <= '0';
        
  -- carry set 
   		
      A_TB <= "000";
      B_TB <= "000";
      C_IN_TB <= '1';
      
      wait for WaitPERIOD;	

      A_TB <= "000";
      B_TB <= "001";
      C_IN_TB <= '1';     

      wait for WaitPERIOD;
      	
      A_TB <= "001";
      B_TB <= "001";
      C_IN_TB <= '1'; 
      
      wait for WaitPERIOD;	

      A_TB <= "010";
      B_TB <= "001";
      C_IN_TB <= '1';

      wait for WaitPERIOD;	

      A_TB <= "011";
      B_TB <= "001";
      C_IN_TB <= '1';
      
      --
   
      wait for WaitPERIOD;	

      A_TB <= "100";
      B_TB <= "001";
      C_IN_TB <= '1';     

      wait for WaitPERIOD;
      	
      A_TB <= "101";
      B_TB <= "001";
      C_IN_TB <= '1'; 
      
      wait for WaitPERIOD;	

      A_TB <= "110";
      B_TB <= "001";
      C_IN_TB <= '1';

      wait for WaitPERIOD;	

      A_TB <= "111";
      B_TB <= "001";
      C_IN_TB <= '1';
 
   end process;
end Sim;
