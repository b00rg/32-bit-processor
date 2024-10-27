----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Single Bit B Logic Circuit - Behavioral
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

entity DP_SingleBit_B_LogicCircuit_22336157 is
	Port ( A :   in STD_LOGIC ; 		-- 1 bit inputs
		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		Y : out STD_LOGIC ) ;  			-- 1 bit output
end DP_SingleBit_B_LogicCircuit_22336157;

architecture Behavioral of DP_SingleBit_B_LogicCircuit_22336157 is

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
	signal S0andB, S1andNOTB, Y : STD_LOGIC;
	signal notB : STD_LOGIC

begin
	S0andB <= S0 and B after AND_gate_delay;
	notB <= not B after NOT_gate_delay;
	S1andBn <= S1 and notB after AND_gate_delay; 
	Y <= S0andB or S1andNOTB after OR_gate_delay;

end Behavioral;
