----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 18.12.2024 14:19:51
-- Design Name: 
-- Module Name: CPU_Status_Register_22336157 - Simulation
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

entity CPU_Status_Register_22336157 is
--  Port ( );
end CPU_Status_Register_22336157;

architecture Simulation of CPU_Status_Register_22336157 is
component CPU_Status_Register_22336157 is
    Port (
	Clock : in STD_LOGIC;
          Load : in STD_LOGIC;
          Reset_N : in STD_LOGIC;
          N : in STD_LOGIC; 
          Reset_C : in STD_LOGIC;
          C : in STD_LOGIC;
          Reset_V : in STD_LOGIC;
          V : in STD_LOGIC;
          Reset_Z : in STD_LOGIC;
          Z : in STD_LOGIC;
          StatusOut : out STD_LOGIC_vector(3 downto 0)
	);
end component;

Signal CLK, Load, Reset_N, N, Reset_C, C, Reset_V, V, Reset_Z, Z : STD_LOGIC := '0';
Signal StatusOut : STD_LOGIC_vector(3 downto 0);
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
constant PERIOD : time := 500ns;


begin

uut : CPU_Status_Register_22336157  Port Map
         (
	  Clock => CLK,
          Load => Load,
          Reset_N => Reset_N,
          N => N,
          Reset_C => Reset_C,
          C => C,
          Reset_V => Reset_V,
          V => V,
          Reset_Z => Reset_Z, 
          Z => Z,
          StatusOut => StatusOut 
          
	);

 Clk <= not Clk after PERIOD/2;

  stim_proc: process
   begin	
   
      Reset_C <= '1'; 
      Reset_V <= '1';
      Reset_N <= '1';
      Reset_Z <= '1';
      wait for PERIOD;
   
      Load <= '1'; 
      Reset_C <= '0'; 
      Reset_V <= '0';
      Reset_N <= '0';
      Reset_Z <= '0';
      
      C_ <= '1'; 
      wait for PERIOD;

      V <= '1';
      wait for PERIOD;

      N <= '1';
      wait for PERIOD;

      Z <= '1';
      wait for PERIOD;
      
      Reset_C <= '1'; 
      Reset_V <= '1';
      Reset_N <= '1';
      Reset_Z <= '1';
      
      wait;

   end process;

end Simulation;
