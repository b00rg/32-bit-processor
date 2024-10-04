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
		S : in STD_LOGIC_VECTOR(3 downto 0);            	      -- Selection Signals (2^4 = 16) 
		Y : out STD_LOGIC ) ;  			                              -- 1 bit output
end RF_Mux16_1Bit;

architecture Behavioral of RF_Mux16_1Bit is
	signal S0_not , S1_not , S2_not, S3_not : std_logic ;
	
	signal and00 , and01 , and02 , and03 : std_logic ;

	signal and10 , and11 , and12 , and13 : std_logic ;
	signal and14 , and15 , and16 , and17 : std_logic ;

	signal and20 , and21 , and22 , and23 : std_logic ;
	signal and24 , and25 , and26 , and27 : std_logic ;
	
	signal l1or0 , l1or1 , l1or2 , l1or3 : std_logic ;
	signal l2or0 , l2or1 : std_logic ;
	
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
	S0_not <= not S(0) after NOT_gate_delay;			-- Might have to change this here for student numbers...
	S1_not <= not S(1) after NOT_gate_delay;
	S2_not <= not S(2) after NOT_gate_delay;		
	S3_not <= not S(3) after NOT_gate_delay;
	
	-- AND gates to choose the correct input
	and00 <= S2_not and S1_not after AND_gate_delay;
	and10 <= and00 and S0_not after AND_gate_delay;
	and20 <= and10 and I0 after AND_gate_delay;
	and11 <= and00 and S (0) after AND_gate_delay;
	and21 <= and11 and I1 after AND_gate_delay;
	
	and01 <= S2_not and S (1) after AND_gate_delay;
	and12 <= and01 and S0_not after AND_gate_delay;
	and22 <= and12 and I2 after AND_gate_delay;
	and13 <= and01 and S (0) after AND_gate_delay;
	and23 <= and13 and I3 after AND_gate_delay;

	and02 <= S (2) and S1_not after AND_gate_delay;
	and14 <= and02 and S0_not after AND_gate_delay;
	and24 <= and14 and I4 after AND_gate_delay;
	and15 <= and02 and S (0) after AND_gate_delay;
	and25 <= and15 and I5 after AND_gate_delay;
	
	and03 <= S (2) and S (1) after AND_gate_delay;
	and16 <= and03 and S0_not after AND_gate_delay;
	and26 <= and16 and I6 after AND_gate_delay;
	and17 <= and03 and S (0) after AND_gate_delay;
	and27 <= and17 and I7 after AND_gate_delay;

-- now for 16 bit 
	and04 <= S3_not and S2_not after AND_gate_delay;
	and18 <= and04 and S0_not after AND_gate_delay;
	and28 <= and10 and I8 after AND_gate_delay;
	and11 <= and04 and S (0) after AND_gate_delay;
	and21 <= and19 and I9 after AND_gate_delay;
	
	and05 <= S3_not and S (2) after AND_gate_delay;
	and12 <= and05 and S0_not after AND_gate_delay;
	and22 <= and12 and I10 after AND_gate_delay;
	and13 <= and05 and S (0) after AND_gate_delay;
	and23 <= and21 and I11 after AND_gate_delay;

	and06 <= S (3) and S2_not after AND_gate_delay;
	and14 <= and06 and S0_not after AND_gate_delay;
	and24 <= and14 and I12 after AND_gate_delay;
	and15 <= and06 and S (0) after AND_gate_delay;
	and25 <= and23 and I13 after AND_gate_delay;
	
	and07 <= S (3) and S (2) after AND_gate_delay;
	and16 <= and07 and S0_not after AND_gate_delay;
	and26 <= and16 and I14 after AND_gate_delay;
	and17 <= and07 and S (0) after AND_gate_delay;
	and27 <= and25 and I15 after AND_gate_delay;

	l1or0 <= and20 or and21 after OR_gate_delay;
	l1or1 <= and22 or and23 after OR_gate_delay;
	l1or2 <= and24 or and25 after OR_gate_delay;
	l1or3 <= and26 or and27 after OR_gate_delay;

	l2or0 <= l1or0 or l1or1 after OR_gate_delay;
	l2or1 <= l1or2 or l1or3 after OR_gate_delay;
	
	Y <= l2or0 or l2or1 after OR_gate_delay;

end Behavioral ;
