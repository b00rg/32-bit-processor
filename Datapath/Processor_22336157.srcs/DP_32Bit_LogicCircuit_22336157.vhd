----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 22:19:50
-- Design Name: 
-- Module Name: 32Bit_LogicCircuit_22336157 - Behavioral
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

entity DP_32Bit_LogicCircuit_22336157 is
	Port ( A , B :  in STD_LOGIC_VECTOR(31 downto 0) ; 		-- 1 bit inputs
		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		G : out STD_LOGIC_VECTOR(31 downto 0));		-- 1 bit output
end DP_32Bit_LogicCircuit_22336157;

architecture Behavioral of DP_32Bit_LogicCircuit_22336157 is 
    component DP_SingleBit_Logic_Circuit_22336157
        Port ( A , B :  in STD_LOGIC ; 		-- 1 bit inputs
            S0, S1 : in STD_LOGIC; 			-- Selection Signals
            G : out STD_LOGIC ) ;  			-- 1 bit output
    end component;
        
begin 
   BIT00:  DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(0), B => B(0), S0 => S0, S1 => S1, G => G(0));
   BIT01:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(1), B => B(1), S0 => S0, S1 => S1, G => G(1));
   BIT02:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(2), B => B(2), S0 => S0, S1 => S1, G => G(2));
   BIT03:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(3), B => B(3), S0 => S0, S1 => S1, G => G(3));
   BIT04:  DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(4), B => B(4), S0 => S0, S1 => S1, G => G(4));
   BIT05:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(5), B => B(5), S0 => S0, S1 => S1, G => G(5));
   BIT06:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(6), B => B(6), S0 => S0, S1 => S1, G => G(6));
   BIT07:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(7), B => B(7), S0 => S0, S1 => S1, G => G(7));
   BIT08:  DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(8), B => B(8), S0 => S0, S1 => S1, G => G(8));
   BIT09:  DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(9), B => B(9), S0 => S0, S1 => S1, G => G(9));
   BIT10:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(10), B => B(10), S0 => S0, S1 => S1, G => G(10));
   BIT11:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(11), B => B(11), S0 => S0, S1 => S1, G => G(11));
   BIT12:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(12), B => B(12), S0 => S0, S1 => S1, G => G(12));
   BIT13:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(13), B => B(13), S0 => S0, S1 => S1, G => G(13));
   BIT14:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(14), B => B(14), S0 => S0, S1 => S1, G => G(14));
   BIT15:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(15), B => B(15), S0 => S0, S1 => S1, G => G(15));
   BIT16:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(16), B => B(16), S0 => S0, S1 => S1, G => G(16));
   BIT17:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(17), B => B(17), S0 => S0, S1 => S1, G => G(17));
   BIT18:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(18), B => B(18), S0 => S0, S1 => S1, G => G(18));
   BIT19:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(19), B => B(19), S0 => S0, S1 => S1, G => G(19));
   BIT20:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(20), B => B(20), S0 => S0, S1 => S1, G => G(20));
   BIT21:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(21), B => B(21), S0 => S0, S1 => S1, G => G(21));
   BIT22:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(22), B => B(22), S0 => S0, S1 => S1, G => G(22));
   BIT23:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(23), B => B(23), S0 => S0, S1 => S1, G => G(23));
   BIT24:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(24), B => B(24), S0 => S0, S1 => S1, G => G(24));
   BIT25:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(25), B => B(25), S0 => S0, S1 => S1, G => G(25));
   BIT26:  DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(26), B => B(26), S0 => S0, S1 => S1, G => G(26));
   BIT27:  DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(27), B => B(27), S0 => S0, S1 => S1, G => G(27));
   BIT28:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(28), B => B(28), S0 => S0, S1 => S1, G => G(28));
   BIT29:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(29), B => B(29), S0 => S0, S1 => S1, G => G(29));
   BIT30:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(30), B => B(30), S0 => S0, S1 => S1, G => G(30));
   BIT31:   DP_SingleBit_Logic_Circuit_22336157 Port map (A => A(31), B => B(31), S0 => S0, S1 => S1, G => G(31));
end Behavioral; 