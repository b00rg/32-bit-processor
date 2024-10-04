----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Mux16_1Bit - Behavioral
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

entity RF_Mux16_1Bit is
	Port ( I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC;     -- Input Signals
    I8, I9, I10, I11, I12, I13, I14, I15:  in STD_LOGIC ; 		
		S : in STD_LOGIC_VECTOR(2 downto 0);            	      -- Selection Signals (2^4 = 16) 
		Y : out STD_LOGIC ) ;  			                              -- 1 bit output
end RF_Mux16_1Bit;

architecture Behavioral of RF_Mux16_1Bit is
	-- Internal signals to handle the inverted select lines
	signal S0_not, S1_not, S2_not, S3_not : std_logic;
	-- Intermediate signals for AND gates
	signal and0, and1, and2, and3, and4, and5, and6, and7, and8 : std_logic;              
	signal and9, and10, and11, and12, and13, and14, and15 : std_logic;
	
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
	S0_not <= not S0 after NOT_gate_delay;			-- Might have to change this here for student numbers...
	S1_not <= not S1 after NOT_gate_delay;
	S2_not <= not S2 after NOT_gate_delay;		
	S3_not <= not S3 after NOT_gate_delay;
	-- AND gates to choose the correct input
	and00 <= S2_not and S1_not after 2 ns ;
	and10 <= and00 and S0_not after 2 ns ;
	and20 <= and10 and I0 after 2 ns ;
	and11 <= and00 and S (0) after 2 ns ;
	and21 <= and11 and I1 after 2 ns ;
	
	and01 <= S2_not and S (1) after 2 ns ;
	and12 <= and01 and S0_not after 2 ns ;
	and22 <= and12 and I2 after 2 ns ;
	and13 <= and01 and S (0) after 2 ns ;
	and23 <= and13 and I3 after 2 ns ;

	and02 <= S (2) and S1_not after 2 ns ;
	and14 <= and02 and S0_not after 2 ns ;
	and24 <= and14 and I4 after 2 ns ;
	and15 <= and02 and S (0) after 2 ns ;
	and25 <= and15 and I5 after 2 ns ;
	
	and03 <= S (2) and S (1) after 2 ns ;
	and16 <= and03 and S0_not after 2 ns ;
	and26 <= and16 and I6 after 2 ns ;
	and17 <= and03 and S (0) after 2 ns ;
	and27 <= and17 and I7 after 2 ns ;

	l1or0 <= and20 or and21 after 4 ns ;
	l1or1 <= and22 or and23 after 4 ns ;
	l1or2 <= and24 or and25 after 4 ns ;
	l1or3 <= and26 or and27 after 4 ns ;

	l2or0 <= l1or0 or l1or1 after 4 ns ;
	l2or1 <= l1or2 or l1or3 after 4 ns ;
	
	Y <= l2or0 or l2or1 after 4 ns ;

end Behavioral ;
