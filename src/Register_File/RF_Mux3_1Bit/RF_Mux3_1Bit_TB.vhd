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

entity RF_Mux3_1Bit_TB is
--  we don't need ports
end RF_Mux3_1Bit_TB;

architecture Simulation of RF_Mux3_1Bit_TB is
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_Mux3_1Bit
	Port ( 
		I0 : in STD_LOGIC;
		I1 : in STD_LOGIC;
		I2 : in STD_LOGIC;
		S0 : in STD_LOGIC;
		S1 : in STD_LOGIC;
		Y  : out STD_LOGIC
	);
 END COMPONENT;

   signal I0_TB, I1_TB, I2_TB : STD_LOGIC := '0'; -- inputs for the MUX
   signal S0_TB, S1_TB : STD_LOGIC := '0'; -- select lines for the MUX
   signal Y_TB : STD_LOGIC; -- output for the MUX

   -- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   constant PERIOD : time := 200ns;  

begin
-- change from here on out
   -- Instantiate the Unit Under Test (UUT)
   uut: RF_Mux3_1Bit_TB PORT MAP (
	I0 => I0_TB,
	I1 => I1_TB,
	I2 => I2_TB,
   	S0 => S0_TB,
	S1 => S1_TB,
	Y => Y_TB );
        
   stim_proc: process
 begin
        -- Test case 1: S1 = 0, S0 = 0, select I0
        I0_TB <= '1';  -- Set I0 to '1'
        I1_TB <= '0';  -- I1 -> don't care
        I2_TB <= '0';  -- I2 -> don't care
        S1_TB <= '0';
        S0_TB <= '0';
        wait for PERIOD;  
        
        -- Test output
        assert (Y_TB = I0_TB) report "Test Case 1 Failed!" severity error;

        -- Test case 2: S1 = 0, S0 = 1, select I1
        I0_TB <= '0';
        I1_TB <= '1';  -- Set I1 to '1'
        I2_TB <= '0';  -- I2 -> don't care
        S1_TB <= '0';
        S0_TB <= '1';
        wait for PERIOD;
        
        -- Test output
        assert (Y_TB = I1_TB) report "Test Case 2 Failed!" severity error;

        -- Test case 3: S1 = 1, S0 = 0, select I2
        I0_TB <= '0';
        I1_TB <= '0';
        I2_TB <= '1';  -- Set I2 to '1'
        S1_TB <= '1';
        S0_TB <= '0';
        wait for PERIOD;
        
        -- Test output
        assert (Y_TB = I2_TB) report "Test Case 3 Failed!" severity error;

        -- Test case 4: Invalid state (e.g., S1 = 1, S0 = 1)
        S1_TB <= '1';
        S0_TB <= '1';
        wait for PERIOD;

        -- Test output
        assert (Y_TB = 'U') report "Test Case 4 Invalid state not handled correctly!" severity error;
        
        -- Final wait to keep the simulation running
        wait;
    end process; 
end Simulation;
