----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2024 18:06:45
-- Design Name: 
-- Module Name: CPU_JKFlipFlop_22336157_TB - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU_JKFlipFlop_22336157_TB is
--  Port ( );
end CPU_JKFlipFlop_22336157_TB;

architecture Simulation of CPU_JKFlipFlop_22336157_TB is
component CPU_JKFlipFlop_22336157 is
    Port (K : in std_logic;
          J : in std_logic;
          Clock : in std_logic;
          Reset : in std_logic;
          Q : out std_logic;
          Q_not : out std_logic );
end component;

signal CLK_TB, K_TB, J_TB, Reset_TB, Q_TB, Q_Not_TB : std_logic := '0';
constant STUDENTID : std_logic_vector (31 downto 0) := x"0164A69E";
constant PERIOD : time := 300 ns;

begin

uut : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => CLK_TB,
                J => J_TB,
                K => K_TB,
                Reset => Reset_TB,
                Q => Q_TB,
                Q_not => Q_not_TB 
            );

CLK_TB <= NOT Clk_TB after PERIOD/2;
stim_proc: process
   begin	
   
      Reset_TB <= '1'; 
      wait for PERIOD;
      
      J_TB <= '1'; 
      Reset_TB <= '0';
      wait for PERIOD;
      
      K_TB <= '1'; 
      wait for PERIOD*2;
      
      J_TB <= '0';  
      wait ;
      

end process;

end Simulation;
