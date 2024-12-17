----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 14:17:34
-- Design Name: 
-- Module Name: CPU_ZeroFill_222336157 - Behavioral
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

entity CPU_ZeroFill_22336157 is
    Port (
        input : in STD_LOGIC_VECTOR (4 downto 0);
        ZeroOut : out STD_LOGIC_VECTOR(31 downto 0)
    );
end CPU_ZeroFill_22336157;

architecture Behavioral of CPU_ZeroFill_22336157 is

begin

  ZeroOut <= "000000000000000000000000000" & input;

end Behavioral;
