----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 12:34:24
-- Design Name: 
-- Module Name: CPU_PC_22336157_TB - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for CPU_PC_22336157
-- 
-- Dependencies: CPU_PC_22336157
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

entity CPU_PC_23373470_TB is
--  Port ( );
end CPU_PC_23373470_TB;

architecture Behavioral of CPU_PC_23373470_TB is
component CPU_PC_23373470 is
    Port ( Clock : in std_logic;
           PL : in std_logic;
           Reset : in std_logic; 
           Displacement : in std_logic_vector(31 downto 0);
           PI : in std_logic;
           InstADD : out std_logic_vector(31 downto 0));
end component;

signal CLK_TB, Pl_TB, Reset_Tb, PI_TB : std_logic := '0' ;
signal Displacement_TB, InstADD_Tb : std_logic_vector (31 downto 0);
constant STUDENTID : std_logic_vector (31 downto 0) := x"0164A69E";
constant PERIOD : time := 300 ns;
begin

uut: CPU_PC_23373470   
    Port map ( Clock => CLK_TB,
           PL => PL_TB,
           Reset => Reset_TB,
           Displacement => Displacement_TB,
           PI => PI_TB,
           InstADD => InstADD_TB
           );
           
CLK_TB <= not CLK_TB after PERIOD/2;    
           
 stim_proc: process
   begin	
      
      Reset_TB <= '1'; 
      wait for PERIOD;
      
      Reset_TB <= '0';
      PL_TB <= '1';
      Displacement_TB <= x"00000005"; -- 0x7 (7) - 0x2 = 0x5
      wait for PERIOD;
      
      PL_TB <= '0';
      Displacement_TB <= x"00000000";
      wait for PERIOD;            
      
      PI_TB <= '1';
      wait for PERIOD * 5;
      
      PI_TB <= '0';
      PL_TB <= '1';
      Displacement_TB <= x"00000023"; -- 0x25 (37) - 0x2 = 0x23
      wait for PERIOD;
      
      PI_TB <= '0';
      PL_TB <= '0';
      
      wait;

   end process;        

end Behavioral;
