----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2024 13:09:03
-- Design Name: 
-- Module Name: CPU_IR_22336157_TB - Simulation
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

entity CPU_IR_22336157_TB is
--  Port ( );
end CPU_IR_22336157_TB;

architecture Simulation of CPU_IR_22336157_TB is

component CPU_IR_22336157 is
    Port (Clock : in std_logic;
          Instruction : in std_logic_vector(31 downto 0);
          load : in std_logic; 
          DR : out std_logic_vector (4 downto 0);
          OpCode : out std_logic_vector (16 downto 0);
          SA : out std_logic_vector (4 downto 0);
          SB : out std_logic_vector (4 downto 0)
          );
end component;

Signal CLK_TB, Load_TB : std_logic := '0';
Signal Instruction_TB : std_logic_vector (31 downto 0);
Signal DR_TB,SA_TB,SB_TB : std_logic_vector(4 downto 0);
Signal OpCode_TB :  std_logic_vector (16 downto 0);
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D"; 
constant PERIOD : time := 200ns;



begin

uut : CPU_IR_22336157 Port map
          (Clock => CLK_TB,
          Instruction => Instruction_TB, 
          load => load_TB, 
          DR => DR_TB,
          OpCode => Opcode_TB,
          SA => SA_TB,
          SB => SB_TB
          );

CLK_TB <= not CLK_TB after PERIOD/2;
stim_proc: process
    begin
        wait until CLK_TB'event and CLK_TB='1';
        wait until CLK_TB'event and CLK_TB='1';
        --                   OPCODE -  73       DR - 4    SA - 7   SB - 0
        Instruction_TB <= "00000000000100100" & "00111" & "00101" & "00001" ; 
        Load_TB <= '1' after PERIOD/4;
 
        end process;

end Simulation;
