----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Mux16_32Bit - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16_32Bit is
	Port ( I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(31 downto 0);             -- Input Signals
    I8, I9, I10, I11, I12, I13, I14, I15:  in STD_LOGIC_VECTOR(31 downto 0); 		
		S0, S1, S2, S3, S4 : in STD_LOGIC_VECTOR(31 downto 0); 		            	        -- Selection Signals (2^4 = 16) 
		Y : out STD_LOGIC ) ;  			                                                    -- 1 bit output
end Mux16_32Bit;

architecture Behavioral of Mux16_32Bit is
    -- Intermediate signal to hold outputs from 1-bit muxes
    signal Y_temp : STD_LOGIC_VECTOR(31 downto 0);

    -- Component declaration of the 1-bit mux
    component Mux16_1Bit
    	Port ( I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC;     -- Input Signals
        I8, I9, I10, I11, I12, I13, I14, I15:  in STD_LOGIC ; 		
    		S0, S1, S2, S3, S4 : in STD_LOGIC; 		            	      -- Selection Signals (2^4 = 16) 
    		Y : out STD_LOGIC ) ;  			                              -- 1 bit output
    end component;

begin
    -- Instantiate 32 1-bit multiplexers
	mux_instance0: Mux16_1Bit Port map (I0n => I0(0), I1 => I1(0), I2 => I2(0), S0 => S0, S1 => S1, Y => Y_temp(0));
	mux_instance1: Mux16_1Bit Port map (I0n => I0(1), I1 => I1(1), I2 => I2(1), S0 => S0, S1 => S1, Y => Y_temp(1));
	mux_instance2: Mux16_1Bit Port map (I0n => I0(2), I1 => I1(2), I2 => I2(2), S0 => S0, S1 => S1, Y => Y_temp(2));
	mux_instance3: Mux16_1Bit Port map (I0n => I0(3), I1 => I1(3), I2 => I2(3), S0 => S0, S1 => S1, Y => Y_temp(3));
	mux_instance4: Mux16_1Bit Port map (I0n => I0(4), I1 => I1(4), I2 => I2(4), S0 => S0, S1 => S1, Y => Y_temp(4));
	mux_instance5: Mux16_1Bit Port map (I0n => I0(5), I1 => I1(5), I2 => I2(5), S0 => S0, S1 => S1, Y => Y_temp(5));
	mux_instance6: Mux16_1Bit Port map (I0n => I0(6), I1 => I1(6), I2 => I2(6), S0 => S0, S1 => S1, Y => Y_temp(6));
	mux_instance7: Mux16_1Bit Port map (I0n => I0(7), I1 => I1(7), I2 => I2(7), S0 => S0, S1 => S1, Y => Y_temp(7));
	mux_instance8: Mux16_1Bit Port map (I0n => I0(8), I1 => I1(8), I2 => I2(8), S0 => S0, S1 => S1, Y => Y_temp(8));
	mux_instance9: Mux16_1Bit Port map (I0n => I0(9), I1 => I1(9), I2 => I2(9), S0 => S0, S1 => S1, Y => Y_temp(9));
	mux_instance10: Mux16_1Bit Port map (I0n => I0(10), I1 => I1(10), I2 => I2(10), S0 => S0, S1 => S1, Y => Y_temp(10));
	mux_instance11: Mux16_1Bit Port map (I0n => I0(11), I1 => I1(11), I2 => I2(11), S0 => S0, S1 => S1, Y => Y_temp(11));
	mux_instance12: Mux16_1Bit Port map (I0n => I0(12), I1 => I1(12), I2 => I2(12), S0 => S0, S1 => S1, Y => Y_temp(12));
	mux_instance13: Mux16_1Bit Port map (I0n => I0(13), I1 => I1(13), I2 => I2(13), S0 => S0, S1 => S1, Y => Y_temp(13));
	mux_instance14: Mux16_1Bit Port map (I0n => I0(14), I1 => I1(14), I2 => I2(14), S0 => S0, S1 => S1, Y => Y_temp(14));
	mux_instance15: Mux16_1Bit Port map (I0n => I0(15), I1 => I1(15), I2 => I2(15), S0 => S0, S1 => S1, Y => Y_temp(15));
	mux_instance16: Mux16_1Bit Port map (I0n => I0(16), I1 => I1(16), I2 => I2(16), S0 => S0, S1 => S1, Y => Y_temp(16));
	mux_instance17: Mux16_1Bit Port map (I0n => I0(17), I1 => I1(17), I2 => I2(17), S0 => S0, S1 => S1, Y => Y_temp(17));
	mux_instance18: Mux16_1Bit Port map (I0n => I0(18), I1 => I1(18), I2 => I2(18), S0 => S0, S1 => S1, Y => Y_temp(18));
	mux_instance19: Mux16_1Bit Port map (I0n => I0(19), I1 => I1(19), I2 => I2(19), S0 => S0, S1 => S1, Y => Y_temp(19));
	mux_instance20: Mux16_1Bit Port map (I0n => I0(20), I1 => I1(20), I2 => I2(20), S0 => S0, S1 => S1, Y => Y_temp(20));
	mux_instance21: Mux16_1Bit Port map (I0n => I0(21), I1 => I1(21), I2 => I2(21), S0 => S0, S1 => S1, Y => Y_temp(21));
	mux_instance22: Mux16_1Bit Port map (I0n => I0(22), I1 => I1(22), I2 => I2(22), S0 => S0, S1 => S1, Y => Y_temp(22));
	mux_instance23: Mux16_1Bit Port map (I0n => I0(23), I1 => I1(23), I2 => I2(23), S0 => S0, S1 => S1, Y => Y_temp(23));
	mux_instance24: Mux16_1Bit Port map (I0n => I0(24), I1 => I1(24), I2 => I2(24), S0 => S0, S1 => S1, Y => Y_temp(24));
	mux_instance25: Mux16_1Bit Port map (I0n => I0(25), I1 => I1(25), I2 => I2(25), S0 => S0, S1 => S1, Y => Y_temp(25));
	mux_instance26: Mux16_1Bit Port map (I0n => I0(26), I1 => I1(26), I2 => I2(26), S0 => S0, S1 => S1, Y => Y_temp(26));
	mux_instance27: Mux16_1Bit Port map (I0n => I0(27), I1 => I1(27), I2 => I2(27), S0 => S0, S1 => S1, Y => Y_temp(27));
	mux_instance28: Mux16_1Bit Port map (I0n => I0(28), I1 => I1(28), I2 => I2(28), S0 => S0, S1 => S1, Y => Y_temp(28));
	mux_instance29: Mux16_1Bit Port map (I0n => I0(29), I1 => I1(29), I2 => I2(29), S0 => S0, S1 => S1, Y => Y_temp(29));
	mux_instance30: Mux16_1Bit Port map (I0n => I0(30), I1 => I1(30), I2 => I2(30), S0 => S0, S1 => S1, Y => Y_temp(30));
	mux_instance31: Mux16_1Bit Port map (I0n => I0(31), I1 => I1(31), I2 => I2(31), S0 => S0, S1 => S1, Y => Y_temp(31));

   	 -- Assign the temporary output to the final output
    	Y <= Y_temp;

end Behavioral;
