----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 18.12.2024 20:57:05
-- Design Name: 
-- Module Name: CPU_IR_22336157 - Behavioral
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

entity CPU_IR_22336157 is
    Port (Clock : in std_logic;
          Instruction : in std_logic_vector(31 downto 0);
          load : in std_logic; 
          DR : out std_logic_vector (4 downto 0);
          OpCode : out std_logic_vector (16 downto 0);
          SA : out std_logic_vector (4 downto 0);
          SB : out std_logic_vector (4 downto 0)
          );
end CPU_IR_22336157;

architecture Behavioral of CPU_IR_22336157 is
component RF_Register_22336157 is
    Port ( D : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (31 downto 0));      
end component;

Signal Q_t : std_logic_vector(31 downto 0);
begin

Regsiter: RF_Register_22336157 port map (
          D => Instruction,
          Load => Load,
          CLK => Clock,
          Reset => '0',
          Q => Q_T
        );
        
Opcode <= Q_T(31 downto 15);   
DR <= Q_T(14 downto 10);
SA <= Q_T(9 downto 5);
SB <= Q_T(4 downto 0);

        
end Behavioral;
