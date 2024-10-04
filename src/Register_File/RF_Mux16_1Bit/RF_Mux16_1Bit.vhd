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
	
	    signal and00, and01, and02, and03 : STD_LOGIC;
	    signal and10, and11, and12, and13 : STD_LOGIC;
	    signal and20, and21, and22, and23 : STD_LOGIC;
	    signal and30, and31, and32, and33 : STD_LOGIC;
		
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
    -- Invert selection signals
    S0_not <= not S(0) after NOT_gate_delay;
    S1_not <= not S(1) after NOT_gate_delay;
    S2_not <= not S(2) after NOT_gate_delay;
    S3_not <= not S(3) after NOT_gate_delay;
    
    -- AND gates to choose the correct input
    -- Select for I0 to I7
    and00 <= S3_not and S2_not and S1_not and S0_not after AND_gate_delay;
    and10 <= S3_not and S2_not and S1_not and S(0) after AND_gate_delay;
    and20 <= S3_not and S2_not and S(1) and S0_not after AND_gate_delay;
    and30 <= S3_not and S2_not and S(1) and S(0) after AND_gate_delay;
    
    and01 <= S3_not and S(2) and S1_not and S0_not after AND_gate_delay;
    and11 <= S3_not and S(2) and S1_not and S(0) after AND_gate_delay;
    and21 <= S3_not and S(2) and S(1) and S0_not after AND_gate_delay;
    and31 <= S3_not and S(2) and S(1) and S(0) after AND_gate_delay;
    
    -- Select for I8 to I15
    and02 <= S(3) and S2_not and S1_not and S0_not after AND_gate_delay;
    and12 <= S(3) and S2_not and S1_not and S(0) after AND_gate_delay;
    and22 <= S(3) and S2_not and S(1) and S0_not after AND_gate_delay;
    and32 <= S(3) and S2_not and S(1) and S(0) after AND_gate_delay;
    
    and03 <= S(3) and S(2) and S1_not and S0_not after AND_gate_delay;
    and13 <= S(3) and S(2) and S1_not and S(0) after AND_gate_delay;
    and23 <= S(3) and S(2) and S(1) and S0_not after AND_gate_delay;
    and33 <= S(3) and S(2) and S(1) and S(0) after AND_gate_delay;

    -- OR gates to combine all the selections
    l1or0 <= (and00 and I0) or (and10 and I1) after OR_gate_delay;
    l1or1 <= (and20 and I2) or (and30 and I3) after OR_gate_delay;
    l1or2 <= (and01 and I4) or (and11 and I5) after OR_gate_delay;
    l1or3 <= (and21 and I6) or (and31 and I7) after OR_gate_delay;
    
    l2or0 <= (and02 and I8) or (and12 and I9) after OR_gate_delay;
    l2or1 <= (and22 and I10) or (and32 and I11) after OR_gate_delay;
    
    -- Final output OR gate
    Y <= l1or0 or l1or1 or l1or2 or l1or3 or l2or0 or l2or1 or
         (and23 and I12) or (and33 and I13) or 
         (and03 and I14) or (and13 and I15) after OR_gate_delay;

end Behavioral;
