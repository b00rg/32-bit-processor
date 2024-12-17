----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 14:32:38
-- Design Name: 
-- Module Name: CPU_ZeroFill_22336157_TB - Behavioral
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

entity CPU_ZeroFill_22336157_TB is
--  Port ( );
end CPU_ZeroFill_22336157_TB;

architecture Simulation of CPU_ZeroFill_22336157_TB is

component CPU_ZeroFill_22336157 is
    Port (
        input : in std_logic_vector (4 downto 0);
        ZeroOut : out std_logic_vector(31 downto 0)
    );
end component;
    signal input_TB : std_logic_vector (4 downto 0);
    signal ZeroOut_TB : std_logic_vector (31 downto 0);
begin


  -- Instantiate the Unit Under Test (UUT)
  uut: CPU_ZeroFill_22336157 PORT MAP (
          input => input_TB, ZeroOut => ZeroOut_TB
       );

  stim_proc: process
   begin	
      
      input_TB <= "01110";      
      
      wait;

   end process;

end Simulation;
