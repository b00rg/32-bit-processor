----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Single Bit Logic Circuit - Behavioral
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

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL;

entity DP_SingleBit_LogicCircuit_22336157 is
	Port ( A , B , C :  in STD_LOGIC ; 		-- 1 bit inputs
		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		G : out STD_LOGIC ) ;  			-- 1 bit output
end DP_SingleBit_LogicCircuit_22336157;

architecture Behavioral of DP_SingleBit_LogicCircuit_22336157 is

     -- Propagation Delay
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

	   -- Signal declarations
    signal AndIN_to_And_i, OrIN_to_And_i, NotS0_i : STD_LOGIC;
    signal AndAnd_to_Or0_i, OrAnd_to_Or0_i, XorIN_to_And_i : STD_LOGIC;
    signal NotS1_i, AndAnd_to_Or_i, OrAnd_to_Or_i, XorAnd_to_Or0_i : STD_LOGIC;
    signal G1_i, XorAnd_to_Or_i, NotAnd_to_Or0_i, G0_i, NotAnd_to_Or_i : STD_LOGIC;
    signal G_i : STD_LOGIC;

begin
  AndIN_to_And_i <= A AND B after AND_gate_delay; 
  OrIN_to_And_i <= A or B after OR_gate_delay; 
  NotS0_i <= not S0 after NOT_gate_delay; 

  AndAnd_to_Or0_i  <= AndIN_to_And_i and NotS0_i after AND_gate_delay;
  OrAnd_to_Or0_i <= OrIN_to_And_i and S0 after AND_gate_delay; 
  XorIN_to_And_i <= A XOR B after XOR_gate_delay;
  NotS1_i <=  not S1 after NOT_gate_delay; 

  AndAnd_to_Or_i <= AndAnd_to_Or0_i and NotS1_i after AND_gate_delay;
  OrAnd_to_Or_i <= OrAnd_to_Or0_i and NotS1_i after AND_gate_delay;
  XorAnd_to_Or0_i <= XorIN_to_And_i and NotS0_i after AND_gate_delay; 

  G1_i <= AndAnd_to_Or_i or OrAnd_to_Or_i after OR_gate_delay; 
  XorAnd_to_Or_i <= XorAnd_to_Or0_i and S1 after AND_gate_delay;
  NotAnd_to_Or0_i <= S0 and A after AND_gate_delay; 

  G0_i <= G1_i or XorAnd_to_Or_i after OR_gate_delay; 
  NotAnd_to_Or_i <= NotAnd_to_Or0_i and S1 after AND_gate_delay; 

  G_i <= G0_i or NotAnd_to_Or_i after OR_gate_delay; 

  G <= G_i;

end Behavioral;
