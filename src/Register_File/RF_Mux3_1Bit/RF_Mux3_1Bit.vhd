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
    signal S0_not, S1_not : std_logic;
    -- Intermediate signals for AND gates
    signal and0, and1, and2 : std_logic;

   -- Propagation Delay
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1

begin
    -- Invert the selection signals
    S0_not <= not S0 after 3 ns;			-- Might have to change this here for student numbers...
    S1_not <= not S1 after 3 ns;

    -- AND gates to choose the correct input
    and0 <= I0 and S0_not and S1_not after 4 ns;
    and1 <= I1 and S0 and S1_not after 4 ns;
    and2 <= I2 and S0 and S1 after 4 ns;

    -- OR the AND gates to produce the final output
    Y <= and0 or and1 or and2 after 2 ns;
end Behavioral;
