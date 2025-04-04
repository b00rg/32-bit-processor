----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Single Bit B Logic - Behavioral
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

entity DP_SingleBit_Logic_Circuit_22336157 is
	Port ( A , B  :  in STD_LOGIC ; 		-- 1 bit inputs
		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		G : out STD_LOGIC ) ;  			-- 1 bit output
end DP_SingleBit_Logic_Circuit_22336157;

architecture Behavioral of DP_SingleBit_Logic_Circuit_22336157 is

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
    signal AndIN_to_And, OrIN_to_And, NotS0 : STD_LOGIC;
    signal AndAnd_to_Or0, notA, OrAnd_to_Or0, XorIN_to_And : STD_LOGIC;
    signal NotS1, AndAnd_to_Or, OrAnd_to_Or, XorAnd_to_Or0 : STD_LOGIC;
    signal G1, XorAnd_to_Or, NotAnd_to_Or0, G0, NotAnd_to_Or : STD_LOGIC;

begin
  AndIN_to_And <= A AND B after AND_gate_delay; 
  OrIN_to_And <= A or B after OR_gate_delay; 
  NotS0 <= not S0 after NOT_gate_delay; 

  NotA <= not A after NOT_gate_delay;
  AndAnd_to_Or0  <= AndIN_to_And and NotS0 after AND_gate_delay;
  OrAnd_to_Or0 <= OrIN_to_And and S0 after AND_gate_delay; 
  XorIN_to_And <= A XOR B after XOR_gate_delay;
  NotS1 <=  not S1 after NOT_gate_delay; 

  AndAnd_to_Or <= AndAnd_to_Or0 and NotS1 after AND_gate_delay;
  OrAnd_to_Or <= OrAnd_to_Or0 and NotS1 after AND_gate_delay;
  XorAnd_to_Or0 <= XorIN_to_And and NotS0 after AND_gate_delay; 

  G1 <= AndAnd_to_Or or OrAnd_to_Or after OR_gate_delay; 
  XorAnd_to_Or <= XorAnd_to_Or0 and S1 after AND_gate_delay;
  NotAnd_to_Or0 <= S0 and NotA after AND_gate_delay; 

  G0 <= G1 or XorAnd_to_Or after OR_gate_delay; 
  NotAnd_to_Or <= NotAnd_to_Or0 and S1 after AND_gate_delay; 

  G <= G0 or NotAnd_to_Or after OR_gate_delay; 


end Behavioral;