----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: D_Flip_Flop_PEdge - Behavioral
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

entity RF_DFlipFlop_22336157 is
    Port ( CLK, D : in STD_LOGIC;
           Q, Q_not : out STD_LOGIC);
end RF_DFlipFlop_22336157;

architecture Behavioral of RF_DFlipFlop_22336157 is

   signal Q_t, Q_not_t, X, S, R, Y, Z : std_logic;
   
   -- Propagation Delay
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   
begin
    X <= Y nand S after NAND_gate_delay;
    S <= X nand CLK after NAND_gate_delay;
    Z <= S and CLK after AND_gate_delay;
    R <= Z nand Y after NAND_gate_delay;
    Y <= R nand D after NAND_gate_delay;
    Q_t <= S nand Q_not_t after NAND_gate_delay;
    Q_not_t <= R nand Q_t after NAND_gate_delay;
    Q <= Q_t;
    Q_not <= Q_not_t;
    
end Behavioral;
