----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 22:19:50
-- Design Name: 
-- Module Name: DP_Shifter_22336157 - Behavioral
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

entity DP_Shifter_22336157 is
    Port ( B : in STD_LOGIC_VECTOR(31 downto 0);
         S1, S2 : in STD_LOGIC;
          G : out STD_LOGIC_VECTOR(31 downto 0);
end DP_Shifter_22336157;

architecture Behavioral of DP_Shifter_22336157 is:
  component DP_Mux3_1Bit
    Port();
  end_component; 

      -- Propagation Delay according to Student ID
    constant AND_gate_delay : Time := 6 ns; 
    constant NAND_gate_delay : Time := 3 ns;
    constant OR_gate_delay : Time := 8 ns;
    constant NOR_gate_delay : Time := 6 ns;
    constant XOR_gate_delay : Time := 4 ns;
    constant XNOR_gate_delay : Time := 4 ns;
    constant NOT_gate_delay : Time := 7 ns;

begin
    BIT0: DP_Mux3_1Bit_22336157 PORT MAP (
