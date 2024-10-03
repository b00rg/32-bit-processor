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
		S0, S1, S2, S3, S4 : in STD_LOGIC; 		            	      -- Selection Signals (2^4 = 16) 
		Y : out STD_LOGIC ) ;  			                              -- 1 bit output
end RF_Mux16_1Bit;

architecture Behavioral of RF_Mux16_1Bit is
	-- Internal signals to handle the inverted select lines
	signal S0_not, S1_not, S2_not, S3_not : std_logic;
	-- Intermediate signals for AND gates
	signal and0, and1, and2, and3, and4, and5, and6, and7, and8 : std_logic;              
	signal and9, and10, and11, and12, and13, and14, and15 : std_logic;
begin
	-- Invert the selection signals
	S0_not <= not S0 after 3 ns;			-- Might have to change this here for student numbers...
	S1_not <= not S1 after 3 ns;
	S2_not <= not S2 after 3 ns;		
	S3_not <= not S3 after 3 ns;
	-- AND gates to choose the correct input
	and0  <= I0  and S0_not and S1_not and S2_not and S3_not after 4 ns; 
	and1  <= I1  and S0 and S1_not and S2_not and S3_not after 4 ns;
	and2  <= I2  and S0_not and S1 and S2_not and S3_not after 4 ns;
	and3  <= I3  and S0 and S1 and S2_not and S3_not after 4 ns;
	and4  <= I4  and S0_not and S1_not and S2 and S3_not after 4 ns;
	and5  <= I5  and S0 and S1_not and S2 and S3_not after 4 ns;
	and6  <= I6  and S0_not and S1 and S2 and S3_not after 4 ns;
	and7  <= I7  and S0 and S1 and S2 and S3_not after 4 ns;
	and8  <= I8  and S0_not and S1_not and S2_not and S3 after 4 ns; 
	and9  <= I9  and S0 and S1_not and S2_not and S3 after 4 ns;
	and10 <= I10 and S0_not and S1 and S2_not and S3 after 4 ns;
	and11 <= I11 and S0 and S1 and S2_not and S3 after 4 ns;
	and12 <= I12 and S0_not and S1_not and S2 and S3 after 4 ns;
	and13 <= I13 and S0 and S1_not and S2 and S3 after 4 ns;
	and14 <= I14 and S0_not and S1 and S2 and S3 after 4 ns;
	and15 <= I15 and S0 and S1 and S2 and S3 after 4 ns;  

    	-- OR the AND gates to produce the final output
	Y <= and0 or and1 or and2 or and3 or and4 or and5 or and6 or and7 
		or and8 or and9 or and10 or and11 or and12 or and13 or and14 or and15 after 2 ns;
end Behavioral;
