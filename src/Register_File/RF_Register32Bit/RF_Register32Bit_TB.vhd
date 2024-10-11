----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michael Manzke
-- 
-- Create Date: 10.10.2024 17:12:37
-- Design Name: 
-- Module Name: RF_Register8Bit_XXXXXXXX_TB - Simulation
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

entity RF_Register8Bit_XXXXXXXX_TB is
--  Port ( ); We don't need ports
end RF_Register8Bit_XXXXXXXX_TB;

architecture Simulation of RF_Register8Bit_XXXXXXXX_TB is

-- Component Declaration for the Unit Under Test (UUT)
component RF_Register8Bit_XXXXXXXX
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           Load : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));      
end component;

--Inputs
    signal D_TB : std_logic_vector(7 downto 0):= (others => '0');
    signal CLK_TB : std_logic:= '0';
    signal Load_TB : std_logic:= '0';
    signal Reset_TB : std_logic:= '0';
     
--Outputs
    signal Q_TB : std_logic_vector(7 downto 0):= (others => '0');
   
-- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"191D9ED";  
    constant PERIOD : time := 100ns;
   
begin

	-- Instantiate the Unit Under Test (UUT)
	
   uut: RF_Register8Bit_XXXXXXXX port map (
          D => D_TB,
          Load => Load_TB,
          CLK => CLK_TB,
          Reset => Reset_TB,
          Q => Q_TB
        );
        
   CLK_TB <= not CLK_TB after PERIOD/2;
   
   stim_proc: process

   begin

      wait until CLK_TB'event and CLK_TB='1';
      Reset_TB <= '1' after PERIOD/4; 

      wait until CLK_TB'event and CLK_TB='1';
      Reset_TB <= '0' after PERIOD/4; 

      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00000000" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
   
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00000001" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00000010" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00000011" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  

-- 

      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00000100" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
   
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00000101" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00000110" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00000111" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
--

      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00001000" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
   
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00001001" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00001010" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00001011" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  

      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00001100" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
   
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00001101" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00001110" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "00001111" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  

--

      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '0' after PERIOD/4;  
      D_TB <= "11111111" after PERIOD/4;  
      
      wait until CLK_TB'event and CLK_TB='1';
      Load_TB <= '1' after PERIOD/4;  

    end process;
    
end Simulation;
