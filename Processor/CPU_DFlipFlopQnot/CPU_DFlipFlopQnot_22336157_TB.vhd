----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2024 16:55:20
-- Design Name: 
-- Module Name: CPU_DFlipFlop_Qnot_22336157_TB - Simulation
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

entity CPU_DFlipFlop_Qnot_22336157_TB is
   -- Port ( );
end CPU_DFlipFlop_Qnot_22336157_TB;

architecture Simulation of CPU_DFlipFlop_Qnot_22336157_TB is
component CPU_DFlipFlop_Qnot_22336157 is
    Port (Clock : in std_logic;
          D : in std_logic;
          Reset : in std_logic; 
          Q : out std_logic;
          Q_not : out std_logic  );
end component;

signal CLK_TB, D_TB, Reset_TB, Q_TB, Q_Not_TB : std_logic := '0';
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D"; 
constant PERIOD : time := 300 ns;

begin

uut : CPU_DFlipFlop_Qnot_23373470 Port Map
            (   Clock => CLK_TB,
                D => D_TB,
                Reset => Reset_TB,
                Q => Q_TB,
                Q_not => Q_not_TB 
            );

CLK_TB <= NOT Clk_TB after PERIOD/2;
stim_proc: process
   begin	
   
      Reset_TB <= '1'; -- Case A
      wait for PERIOD;
      
      D_TB <= '1'; -- Case B
      Reset_TB <= '0';
      wait for PERIOD;
      
      D_TB <= '0'; -- Case C
      wait for PERIOD/8;
      D_TB <= '1'; 
      wait for PERIOD/8;
      D_TB <= '0';
      wait for PERIOD/8;  
      D_TB <= '1'; 
      wait for PERIOD/8;
      D_TB <= '0';
      wait for PERIOD/8;
      D_TB <= '1'; 
      wait for PERIOD/8;
      D_TB <= '0';
      wait for PERIOD/8;
      D_TB <= '1'; 
      wait for PERIOD/8;
      D_TB <= '0';
      wait for PERIOD/8;
    
      
      wait;

end process;

end Simulation;
