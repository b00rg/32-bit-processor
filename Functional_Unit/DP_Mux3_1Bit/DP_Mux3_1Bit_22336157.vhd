----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Mux3_1Bit - Behavioral
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

entity DP_Mux3_1Bit_22336157 is
	Port ( B , SLB , srB :  in STD_LOGIC ; 		-- 1 bit inputs
		S1, S2 : in STD_LOGIC; 			-- Selection Signals
		G : out STD_LOGIC ) ;  			-- 1 bit output
end DP_Mux3_1Bit_22336157;

architecture Behavioral of DP_Mux3_1Bit_22336157 is
    -- Internal signals to handle the inverted select lines

    
    signal nots1, nots2, and1, and2, and3, and4, and5, and6, or1 : STD_LOGIC; 

   -- Propagation Delay
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin
    -- Invert the selection signals
    nots1 <= not S1 after NOT_gate_delay;
    nots2 <= not S2 after NOT_gate_delay;
    and1 <= nots1 and nots2 after AND_gate_delay;
    and2 <= s1 and nots2 after AND_gate_delay;
    
    and3 <= nots1 and s2 after AND_gate_delay;
    and4 <= and1 and B after AND_gate_delay;
    and5 <= and2 and SrB after AND_gate_delay;
    
    or1 <= and4 or and5 after OR_gate_delay; 
    and6 <= and3 and SlB after and_gate_delay;
    
    G <= or1 or and6 after OR_gate_delay; 

end Behavioral;
