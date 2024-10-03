----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2023 15:22:51
-- Design Name: 
-- Module Name: Mux3_1Bit_TB - Simulation
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

entity Mux3_1Bit_TB is
--  we don't need ports
end Mux3_1Bit_TB;

architecture Simulation of Mux3_1Bit_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Mux3_1Bit
	   Port ( I0 , I1 , I2 :  in STD_LOGIC ; 		-- 1 bit inputs
   		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		   Y : out STD_LOGIC ) ;  			-- 1 bit output
    END COMPONENT;

   signal S0_not, S1_not : std_logic := '0';
    -- Intermediate signals for AND gates
   signal and0, and1, and2 : std_logic := '0';

   -- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   constant PERIOD : time := 200ns;  

begin
-- change from here on out
   -- Instantiate the Unit Under Test (UUT)
   uut: Mux3_1Bit_TB PORT MAP (
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
