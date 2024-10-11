----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 10.10.2024 15:56:03
-- Design Name: 
-- Module Name: RF_DFlipFlop_22336157_TB - Simulation
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

entity RF_DFlipFlop_22336157_TB is
--  Port ( );
end RF_DFlipFlop_22336157_TB;

architecture Simulation of RF_DFlipFlop_22336157_TB is

component RF_DFlipFlop_22336157
    Port ( CLK, D, Reset : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

--Inputs

    signal D_TB : std_logic:= '0';
    signal Reset_TB : std_logic:= '0';
    signal CLK_TB : std_logic:= '0';
    
--Outputs

    signal Q_TB : std_logic := '0';

   -- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D"; 
   constant PERIOD : time := 50ns;

begin

-- Instantiate the Unit Under Test (UUT)
	
   uut: RF_DFlipFlop_22336157 port map (
          CLK => CLK_TB,
          D => D_TB,
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
      D_TB <= '1' after PERIOD/4;
      
      wait until CLK_TB'event and CLK_TB='1';
      D_TB <= '0' after PERIOD/4;
      
      wait until CLK_TB'event and CLK_TB='1';
      D_TB <= '1' after PERIOD/4;
      
      wait until CLK_TB'event and CLK_TB='1';
      D_TB <= '0' after PERIOD/4;

   end process;

end Simulation;
