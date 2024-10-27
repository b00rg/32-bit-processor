----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: 32Bit_B_Logic_Circuit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 32-bit logic circuit using single-bit logic components.
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

entity DP_32Bit_B_Logic_Circuit_22336157 is
    Port (
        B : in STD_LOGIC_VECTOR(31 downto 0);        -- 32-bit input
        S0, S1 : in STD_LOGIC;                        -- Selection Signals
        G : out STD_LOGIC_VECTOR(31 downto 0)        -- 32-bit output
    );
end DP_32Bit_B_Logic_Circuit_22336157;

architecture Behavioral of DP_32Bit_B_Logic_Circuit_22336157 is 
    component DP_SingleBit_B_LogicCircuit_22336157
        Port (
            B : in STD_LOGIC;                         -- 1 bit input B
            S0, S1 : in STD_LOGIC;                    -- Selection Signals
            Y : out STD_LOGIC                          -- 1 bit output
        );  
    end component;
    
begin 
   BIT00: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(0), S0 => S0, S1 => S1, Y => G(0));
   BIT01: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(1), S0 => S0, S1 => S1, Y => G(1));
   BIT02: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(2), S0 => S0, S1 => S1, Y => G(2));
   BIT03: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(3), S0 => S0, S1 => S1, Y => G(3));
   BIT04: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(4), S0 => S0, S1 => S1, Y => G(4));
   BIT05: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(5), S0 => S0, S1 => S1, Y => G(5));
   BIT06: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(6), S0 => S0, S1 => S1, Y => G(6));
   BIT07: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(7), S0 => S0, S1 => S1, Y => G(7));
   BIT08: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(8), S0 => S0, S1 => S1, Y => G(8));
   BIT09: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(9), S0 => S0, S1 => S1, Y => G(9));
   BIT10: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(10), S0 => S0, S1 => S1, Y => G(10));
   BIT11: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(11), S0 => S0, S1 => S1, Y => G(11));
   BIT12: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(12), S0 => S0, S1 => S1, Y => G(12));
   BIT13: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(13), S0 => S0, S1 => S1, Y => G(13));
   BIT14: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(14), S0 => S0, S1 => S1, Y => G(14));
   BIT15: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(15), S0 => S0, S1 => S1, Y => G(15));
   BIT16: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(16), S0 => S0, S1 => S1, Y => G(16));
   BIT17: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(17), S0 => S0, S1 => S1, Y => G(17));
   BIT18: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(18), S0 => S0, S1 => S1, Y => G(18));
   BIT19: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(19), S0 => S0, S1 => S1, Y => G(19));
   BIT20: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(20), S0 => S0, S1 => S1, Y => G(20));
   BIT21: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(21), S0 => S0, S1 => S1, Y => G(21));
   BIT22: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(22), S0 => S0, S1 => S1, Y => G(22));
   BIT23: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(23), S0 => S0, S1 => S1, Y => G(23));
   BIT24: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(24), S0 => S0, S1 => S1, Y => G(24));
   BIT25: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(25), S0 => S0, S1 => S1, Y => G(25));
   BIT26: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(26), S0 => S0, S1 => S1, Y => G(26));
   BIT27: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(27), S0 => S0, S1 => S1, Y => G(27));
   BIT28: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(28), S0 => S0, S1 => S1, Y => G(28));
   BIT29: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(29), S0 => S0, S1 => S1, Y => G(29));
   BIT30: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(30), S0 => S0, S1 => S1, Y => G(30));
   BIT31: DP_SingleBit_B_LogicCircuit_22336157 Port map (B => B(31), S0 => S0, S1 => S1, Y => G(31));
end Behavioral;
