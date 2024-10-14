----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2024 17:12:37
-- Design Name: 
-- Module Name: RF_Register8Bit_22336157_TB - Simulation
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

entity RF_Register32Bit_22336157_TB is
--  Port ( ); We don't need ports
end RF_Register32Bit_22336157_TB;

architecture Simulation of RF_Register32Bit_22336157_TB is

-- Component Declaration for the Unit Under Test (UUT)
component RF_Register32Bit_22336157_TB
    Port ( D : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (31 downto 0));      
end component;

--Inputs
    signal D_TB : std_logic_vector(31 downto 0):= (others => '0');
    signal CLK_TB : std_logic:= '0';
    signal Load_TB : std_logic:= '0';
    signal Reset_TB : std_logic:= '0';
     
--Outputs
    signal Q_TB : std_logic_vector(31 downto 0):= (others => '0');
   
-- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"191D9ED";  
    constant PERIOD : time := 100ns;
   
begin

	-- Instantiate the Unit Under Test (UUT)
	
   uut: RF_Register32Bit_22336157_TB port map (
          D => D_TB,
          Load => Load_TB,
          CLK => CLK_TB,
          Reset => Reset_TB,
          Q => Q_TB
        );
        
   CLK_TB <= not CLK_TB after PERIOD/2;
   
   stim_proc: process

   begin

	-- Initial reset
	Reset_TB <= '1';
	wait for PERIOD;
	Reset_TB <= '0';
	
	-- Load the 32-bit StudentID (x"0191D9ED") into the register
	D_TB <= StudentID;
	Load_TB <= '1';
	wait for PERIOD;
	Load_TB <= '0';
	
	-- Wait to observe the result
	wait for 10 * PERIOD;
	
	-- End simulation
	wait;
end process;
    
end Simulation;
