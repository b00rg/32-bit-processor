----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
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

entity RF_Mux3_1Bit is
	Port ( I0 , I1 , I2 :  in STD_LOGIC ; 		-- 1 bit inputs
		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		Y : out STD_LOGIC ) ;  			-- 1 bit output
end RF_Mux3_1Bit;

architecture Behavioral of RF_Mux3_1Bit is
    -- Internal signals to handle the inverted select lines
    signal S0_not, S1_not : STD_LOGIC;
    -- Intermediate signals for AND gates
    signal and0, and1, and2 : STD_LOGIC;

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
    S0_not <= not S0 after NOT_gate_delay;			-- Might have to change this here for student numbers...
    S1_not <= not S1 after NOT_gate_delay;

	-- Selection signals using OR gates
	S0_S1_not <= S0 or S1_not after AND_gate_delay;
	S0_not_S1 <= S0_not or S1 after AND_gate_delay;
	
	-- Two-input AND gates
	and0 <= I0 and S0_S1_not after AND_gate_delay;  -- S0_not and S1_not
	and1 <= I1 and S0 and S1_not after AND_gate_delay; 
	and2 <= I2 and S0_not_S1 after AND_gate_delay; -- S0_not and S1

    -- OR the AND gates to produce the final output
    Y <= and0 or and1 or and2 after OR_gate_delay;
end Behavioral;
