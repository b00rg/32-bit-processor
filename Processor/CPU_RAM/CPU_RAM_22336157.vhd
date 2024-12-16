
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 16.12.2024 15:24:05
-- Design Name: 
-- Module Name: CPU_RAM_22336157 - Behavioural
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
use IEEE . STD_LOGIC_1164 .ALL;
use IEEE . NUMERIC_STD . ALL ;
entity CPU_RAM_22336157 is
    Port ( 
        Clock : in STD_LOGIC ;
        Address : in STD_LOGIC_VECTOR (31 downto 0) ;
        DataIn : in STD_LOGIC_VECTOR (31 downto 0) ;
        WriteEnable : in STD_LOGIC ;
        DataOut : out STD_LOGIC_VECTOR (31 downto 0)
     ) ;
end CPU_RAM_22336157;

architecture Behavioural of CPU_RAM_22336157 is

-- we use the least significant 7 bit of the address
type RAM_array is array (0 to 127) of STD_LOGIC_VECTOR (31 downto 0);

signal RAM : RAM_array; 

begin

process (Clock)

begin

if Clock'event and Clock = '1' then
    if WriteEnable = '1' then
       RAM(to_integer(unsigned(Address(6 downto 0)))) <=
 DataIn after 2 ns;
    end if;
end if;

end process;
    DataOut <= RAM(to_integer(unsigned(Address(6 downto 0))))
 after 2 ns;
end Behavioural;
