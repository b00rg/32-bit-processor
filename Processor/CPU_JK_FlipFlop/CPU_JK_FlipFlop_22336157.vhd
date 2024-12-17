----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 16:23:49
-- Design Name: 
-- Module Name: CPU_JKFlipFlop_22336157 - Behavioral
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

entity CPU_JKFlipFlop_22336157 is
    Port (K : in std_logic;
          J : in std_logic;
          Clock : in std_logic;
          Reset : in std_logic;
          Q : out std_logic;
          Q_not : out std_logic );
end CPU_JKFlipFlop_22336157;

architecture Behavioral of CPU_JKFlipFlop_22336157 is

component CPU_DFlipFlop_Qnot_22336157 is
    Port (Clock : in std_logic;
          D : in std_logic;
          Reset : in std_logic; 
          Q : out std_logic;
          Q_not : out std_logic  );
end component;
  constant AND_gate_delay : Time := 1ns;      -- least significant digit 1 = 0 + 1
   constant NAND_gate_delay : Time := 8ns;     -- next more significant digit 8 = 7 + 1
   constant OR_gate_delay : Time := 5ns;       -- next more significant digit 5 = 4 + 1
   constant NOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XOR_gate_delay : Time := 8ns;      -- next more significant digit 8 = 7 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 4ns;
signal K_not, K_not_and_Q_in, J_and_Q_not_in, OR1 ,Q_t, Q_not_t: std_logic; 

begin

DFlipFlop : CPU_DFlipFlop_Qnot_22336157 Port Map 
    (
        Clock => Clock,
        D => OR1,
        Reset => Reset,
        Q => Q_t,
        Q_not => Q_not_t
    );

K_not <= NOT K after NOT_GATE_DELAY;
K_not_and_Q_in <= K_not AND Q_t after AND_GATE_DELAY;
J_and_Q_not_in <= J AND Q_not_t after AND_GATE_DELAY;
OR1 <= K_not_and_Q_in OR J_and_Q_not_in  after OR_GATE_DELAY;

Q <= Q_t;
Q_not <= Q_not_t;

end Behavioral;
