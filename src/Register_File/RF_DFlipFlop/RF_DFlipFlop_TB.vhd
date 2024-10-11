----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2023 15:22:51
-- Design Name: 
-- Module Name: D_Flip_Flop_PEdge_TB - Simulation
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
--  we don't need ports
end RF_DFlipFlop_22336157_TB;

architecture Simulation of RF_DFlipFlop_22336157_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_DFlipFlop_22336157
    Port ( CLK, D : in STD_LOGIC;
           Q, Q_not : out STD_LOGIC);
    END COMPONENT;
   --Inputs Signals 
   signal CLK_TB, D_TB : STD_LOGIC := '0';
   --Output Signal   
   signal Q_TB, Q_not_TB : STD_LOGIC := '0';
   -- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   constant PERIOD : time := 200ns;  

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK_TB,
          D => D_TB,
          Q => Q_TB, 
          Q_not => Q_not_TB
        );
        
   Clk_TB <= not CLK_TB after PERIOD/2;
   
   stim_proc: process
   begin
      wait until CLK_TB'event and CLK_TB='1';
      D_TB <= '0' after PERIOD/4;                 -- Case A
   
      wait until CLK_TB'event and CLK_TB='1';
      D_TB <= '0' after PERIOD/4;                 -- Case B
      
      wait until CLK_TB'event and CLK_TB='1';
      D_TB <= '1' after PERIOD/4;                 -- Case C
      
      wait until CLK_TB'event and CLK_TB='1';
      D_TB <= '0' after PERIOD/4;                 -- Case D
      
      wait until CLK_TB'event and CLK_TB='1';
      D_TB <= '1' after PERIOD/4;                 -- Case E
      
      wait until CLK_TB'event and CLK_TB='1';
   end process;          
end Simulation;
