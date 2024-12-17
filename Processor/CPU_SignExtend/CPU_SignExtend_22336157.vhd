----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 14:36:17
-- Design Name: 
-- Module Name: CPU_SignExtend_22336157 - Behavioral
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

entity CPU_SignExtend_22336157 is
     Port (
        input : in std_logic_vector (9 downto 0);
        output : out std_logic_vector(31 downto 0)
    );
end CPU_SignExtend_22336157;

architecture Behavioral of CPU_SignExtend_22336157 is
        
begin

    output(9 downto 0) <= input(9 downto 0);
    output(10) <= input(9);
    output(11) <= input(9);
    output(12) <= input(9);
    output(13) <= input(9);
    output(14) <= input(9);
    output(15) <= input(9);
    output(16) <= input(9);
    output(17) <= input(9);
    output(18) <= input(9);
    output(19) <= input(9);
    output(20) <= input(9);
    output(21) <= input(9);
    output(22) <= input(9);
    output(23) <= input(9);
    output(24) <= input(9);
    output(25) <= input(9);
    output(26) <= input(9);
    output(27) <= input(9);
    output(28) <= input(9);
    output(29) <= input(9);
    output(30) <= input(9);
    output(31) <= input(9);
end Behavioral;
