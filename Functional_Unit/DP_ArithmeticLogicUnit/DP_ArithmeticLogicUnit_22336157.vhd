----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 22:19:50
-- Design Name: 
-- Module Name: 32Bit_B_Logic_22336157 - Behavioral
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

entity DP_ArithmeticLogicUnit_22336157 is
	Port ( A, B :  in STD_LOGIC_VECTOR(31 downto 0) ; 		
		S0, S1, S2, C_IN : in STD_LOGIC; 			
		G : out STD_LOGIC_VECTOR(31 downto 0));		
    C, V : out STD_LOGIC;
end DP_ArithmeticLogicUnit_22336157;

architecture Behavioral of DP_ArithmeticLogicUnit_22336157 is 

    component DP_32Bit_B_Logic_Circuit_22336157
      Port (
        B : in STD_LOGIC_VECTOR(31 downto 0);        -- 32-bit input
        S0, S1 : in STD_LOGIC;                        -- Selection Signals
        G : out STD_LOGIC_VECTOR(31 downto 0)        -- 32-bit output
    );
  end component; 

  component DP_RippleCarryAdder32Bit_22336157
      Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
        B : in STD_LOGIC_VECTOR (31 downto 0);
        C_IN : in STD_LOGIC; -- single bit initial carry-in
        SUM : out STD_LOGIC_VECTOR (31 downto 0);
        C_OUT : out STD_LOGIC; -- final carry-out bit
        V : out STD_LOGIC); -- overflow indicator
  end component;

  component DP_32Bit_LogicCircuit_22336157 is
	Port ( A , B :  in STD_LOGIC_VECTOR(31 downto 0) ; 		-- 1 bit inputs
		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		G : out STD_LOGIC_VECTOR(31 downto 0));		-- 1 bit output
end component;

  component CPU_Mux2_32Bit_22336157 is
    Port (
        I0, I1 : in STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit inputs
        S      : in STD_LOGIC;                      -- single select bit
        Y      : out STD_LOGIC_VECTOR(31 downto 0));  -- 32-bit output
end component;

  signal BLogicToAdder, AdderToALUMux, LogicCircuitToALUMux : STD_LOGIC_VECTOR(31 downto 0);
  
        
begin 
  BLogic: DP_32Bit_LogicCircuit_22336157 Port map(B => B, S0 => S0, S1 => S1, Y=> BLogicToAdder);
  
  Adder : DP_RippleCarryAdder32Bit_22336157 Port map(A => A, B => BLogicToAdder, C_IN => C_IN, C_OUT => C, SUM => AdderToALUMux, V=>V);
  
  LogicCircuit : DP_32Bit_LogicCircuit_22336157 Port map(A => A, B => B, S0 => S0, S1=> S1, G => LogicCircuitToALUMux);
  
  ALUMux : CPU_Mux2_32Bit_22336157 Port map(I0 => AdderToALUMux, I1 => LogicCircuitToALUMux, S=> S2, Y => G); 
end Behavioral; 
