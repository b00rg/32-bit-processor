----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2024 19:17:47
-- Design Name: 
-- Module Name: CPU_CAR_22336157_TB - Simulation
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

entity CPU_CAR_22336157_TB is
--  Port ( );
end CPU_CAR_22336157_TB;

architecture Simulation of CPU_CAR_22336157_TB is

component CPU_CAR_22336157 is
    Port (Address : in  std_logic_vector(16 downto 0);
          Clock : in std_logic;
          Reset : in std_logic;
          LoadAdd : in std_logic;
          CMAdd : out std_logic_vector (16 downto 0)
         );
end component;

signal Address_TB, CMAdd_TB : std_logic_vector(16 downto 0);
signal LoadAdd_TB, CLK_TB, Reset_TB : std_logic := '0';
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D"; 
constant PERIOD : time := 300ns;

begin

 -- Instantiate the Unit Under Test (UUT)
  uut: CPU_CAR_22336157 Port Map  
       (
           Address => Address_TB, 
           LoadAdd => LoadAdd_TB, 
           Clock => CLK_TB, 
           Reset => Reset_TB, 
           CMAdd => CMAdd_TB
       );
       
  CLK_TB <= not CLK_TB after PERIOD/2;

  stim_proc: process
   begin	
   
      Reset_TB <= '1'; -- Case A
      LoadAdd_TB <= '0';
      Address_TB <= '0'&x"0000";
      wait for PERIOD;
      
      Reset_TB <= '0'; -- Case B
      wait for PERIOD * 3;
    
      LoadAdd_TB <= '1';
      Address_TB <= '0'&x"0046";
      
      wait;

   end process;
end Simulation;
