----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Mux32_32Bit - Behavioral
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

entity Mux32_32Bit is
	Port ( I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(31 downto 0);             -- Input Signals
    	I8, I9, I10, I11, I12, I13, I14, I15:  in STD_LOGIC_VECTOR(31 downto 0); 	
	I16, I17, I18, I19, I20, I21, I22, I23 : in STD_LOGIC_VECTOR(31 downto 0);
	I24, I25, I26, I27, I28, I29, I30, I31 : in STD_LOGIC_VECTOR(31 downto 0);
		S0, S1, S2, S3, S4, S5 : in STD_LOGIC; 		            	        -- Selection Signals (2^5 = 32) 
		Y : out STD_LOGIC ) ;  			                                                    -- 1 bit output
end Mux32_32Bit;

architecture Behavioral of Mux32_32Bit is
    -- Intermediate signal to hold outputs from 1-bit muxes
    signal Y_temp : STD_LOGIC_VECTOR(31 downto 0);

    -- Component declaration of the 1-bit mux
    component Mux32_1Bit
    	Port ( I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC;     -- Input Signals
        I8, I9, I10, I11, I12, I13, I14, I15:  in STD_LOGIC ; 		
	I16, I17, I18, I19, I20, I21, I22, I23 : in STD_LOGIC;
	I24, I25, I26, I27, I28, I29, I30, I31 : in STD_LOGIC;
    		S0, S1, S2, S3, S4, S5: in STD_LOGIC; 		            	      -- Selection Signals (2^5 = 32) 
    		Y : out STD_LOGIC ) ;  			                              -- 1 bit output
    end component;

begin
 mux_instance0: Mux16_1Bit Port map (I0 => I0(0), I1 => I1(0), I2 => I2(0), I3 => I3(0), 
                                        I4 => I4(0), I5 => I5(0), I6 => I6(0), I7 => I7(0), 
                                        I8 => I8(0), I9 => I9(0), I10 => I10(0), I11 => I11(0), 
                                        I12 => I12(0), I13 => I13(0), I14 => I14(0), I15 => I15(0), 
                                        I16 => I16(0), I17 => I17(0), I18 => I18(0), I19 => I19(0), 
                                        I20 => I20(0), I21 => I21(0), I22 => I22(0), I23 => I23(0), 
                                        I24 => I24(0), I25 => I25(0), I26 => I26(0), I27 => I127(0), 
                                        I28 => I28(0), I29 => I29(0), I30 => I30(0), I31 => I31(0), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(0));

 mux_instance1: Mux16_1Bit Port map (I0 => I0(1), I1 => I1(1), I2 => I2(1), I3 => I3(1), 
                                        I4 => I4(1), I5 => I5(1), I6 => I6(1), I7 => I7(1), 
                                        I8 => I8(1), I9 => I9(1), I10 => I10(1), I11 => I11(1), 
                                        I12 => I12(1), I13 => I13(1), I14 => I14(1), I15 => I15(1), 
                                        I16 => I16(1), I17 => I17(1), I18 => I18(1), I19 => I19(1), 
                                        I20 => I20(1), I21 => I21(1), I22 => I22(1), I23 => I23(1), 
                                        I24 => I24(1), I25 => I25(1), I26 => I26(1), I27 => I127(1), 
                                        I28 => I28(1), I29 => I29(1), I30 => I30(1), I31 => I31(1), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(1));

 mux_instance2: Mux16_1Bit Port map (I0 => I0(2), I1 => I1(2), I2 => I2(2), I3 => I3(2), 
                                        I4 => I4(2), I5 => I5(2), I6 => I6(2), I7 => I7(2), 
                                        I8 => I8(2), I9 => I9(2), I10 => I10(2), I11 => I11(2), 
                                        I12 => I12(2), I13 => I13(2), I14 => I14(2), I15 => I15(2), 
                                        I16 => I16(2), I17 => I17(2), I18 => I18(2), I19 => I19(2), 
                                        I20 => I20(2), I21 => I21(2), I22 => I22(2), I23 => I23(2), 
                                        I24 => I24(2), I25 => I25(2), I26 => I26(2), I27 => I127(2), 
                                        I28 => I28(2), I29 => I29(2), I30 => I30(2), I31 => I31(2), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(2));

 mux_instance3: Mux16_1Bit Port map (I0 => I0(3), I1 => I1(3), I2 => I2(3), I3 => I3(3), 
                                        I4 => I4(3), I5 => I5(3), I6 => I6(3), I7 => I7(3), 
                                        I8 => I8(3), I9 => I9(3), I10 => I10(3), I11 => I11(3), 
                                        I12 => I12(3), I13 => I13(3), I14 => I14(3), I15 => I15(3), 
                                        I16 => I16(3), I17 => I17(3), I18 => I18(3), I19 => I19(3), 
                                        I20 => I20(3), I21 => I21(3), I22 => I22(3), I23 => I23(3), 
                                        I24 => I24(3), I25 => I25(3), I26 => I26(3), I27 => I127(3), 
                                        I28 => I28(3), I29 => I29(3), I30 => I30(3), I31 => I31(3), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(3));

 mux_instance4: Mux16_1Bit Port map (I0 => I0(4), I1 => I1(4), I2 => I2(4), I3 => I3(4), 
                                        I4 => I4(4), I5 => I5(4), I6 => I6(4), I7 => I7(4), 
                                        I8 => I8(4), I9 => I9(4), I10 => I10(4), I11 => I11(4), 
                                        I12 => I12(4), I13 => I13(4), I14 => I14(4), I15 => I15(4), 
                                        I16 => I16(4), I17 => I17(4), I18 => I18(4), I19 => I19(4), 
                                        I20 => I20(4), I21 => I21(4), I22 => I22(4), I23 => I23(4), 
                                        I24 => I24(4), I25 => I25(4), I26 => I26(4), I27 => I127(4), 
                                        I28 => I28(4), I29 => I29(4), I30 => I30(4), I31 => I31(4), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(4));

 mux_instance5: Mux16_1Bit Port map (I0 => I0(5), I1 => I1(5), I2 => I2(5), I3 => I3(5), 
                                        I4 => I4(5), I5 => I5(5), I6 => I6(5), I7 => I7(5), 
                                        I8 => I8(5), I9 => I9(5), I10 => I10(5), I11 => I11(5), 
                                        I12 => I12(5), I13 => I13(5), I14 => I14(5), I15 => I15(5), 
                                        I16 => I16(5), I17 => I17(5), I18 => I18(5), I19 => I19(5), 
                                        I20 => I20(5), I21 => I21(5), I22 => I22(5), I23 => I23(5), 
                                        I24 => I24(5), I25 => I25(5), I26 => I26(5), I27 => I127(5), 
                                        I28 => I28(5), I29 => I29(5), I30 => I30(5), I31 => I31(5), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(5));

 mux_instance6: Mux16_1Bit Port map (I0 => I0(6), I1 => I1(6), I2 => I2(6), I3 => I3(6), 
                                        I4 => I4(6), I5 => I5(6), I6 => I6(6), I7 => I7(6), 
                                        I8 => I8(6), I9 => I9(6), I10 => I10(6), I11 => I11(6), 
                                        I12 => I12(6), I13 => I13(6), I14 => I14(6), I15 => I15(6), 
                                        I16 => I16(6), I17 => I17(6), I18 => I18(6), I19 => I19(6), 
                                        I20 => I20(6), I21 => I21(6), I22 => I22(6), I23 => I23(6), 
                                        I24 => I24(6), I25 => I25(6), I26 => I26(6), I27 => I127(6), 
                                        I28 => I28(6), I29 => I29(6), I30 => I30(6), I31 => I31(6), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(6));

 mux_instance7: Mux16_1Bit Port map (I0 => I0(7), I1 => I1(7), I2 => I2(7), I3 => I3(7), 
                                        I4 => I4(7), I5 => I5(7), I6 => I6(7), I7 => I7(7), 
                                        I8 => I8(7), I9 => I9(7), I10 => I10(7), I11 => I11(7), 
                                        I12 => I12(7), I13 => I13(7), I14 => I14(7), I15 => I15(7), 
                                        I16 => I16(7), I17 => I17(7), I18 => I18(7), I19 => I19(7), 
                                        I20 => I20(7), I21 => I21(7), I22 => I22(7), I23 => I23(7), 
                                        I24 => I24(7), I25 => I25(7), I26 => I26(7), I27 => I127(7), 
                                        I28 => I28(7), I29 => I29(7), I30 => I30(7), I31 => I31(7), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(7));

 mux_instance8: Mux16_1Bit Port map (I0 => I0(8), I1 => I1(8), I2 => I2(8), I3 => I3(8), 
                                        I4 => I4(8), I5 => I5(8), I6 => I6(8), I7 => I7(8), 
                                        I8 => I8(8), I9 => I9(8), I10 => I10(8), I11 => I11(8), 
                                        I12 => I12(8), I13 => I13(8), I14 => I14(8), I15 => I15(8), 
                                        I16 => I16(8), I17 => I17(8), I18 => I18(8), I19 => I19(8), 
                                        I20 => I20(8), I21 => I21(8), I22 => I22(8), I23 => I23(8), 
                                        I24 => I24(8), I25 => I25(8), I26 => I26(8), I27 => I127(8), 
                                        I28 => I28(8), I29 => I29(8), I30 => I30(8), I31 => I31(8), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(8));

 mux_instance9: Mux16_1Bit Port map (I0 => I0(9), I1 => I1(9), I2 => I2(9), I3 => I3(9), 
                                        I4 => I4(9), I5 => I5(9), I6 => I6(9), I7 => I7(9), 
                                        I8 => I8(9), I9 => I9(9), I10 => I10(9), I11 => I11(9), 
                                        I12 => I12(9), I13 => I13(9), I14 => I14(9), I15 => I15(9), 
                                        I16 => I16(9), I17 => I17(9), I18 => I18(9), I19 => I19(9), 
                                        I20 => I20(9), I21 => I21(9), I22 => I22(9), I23 => I23(9), 
                                        I24 => I24(9), I25 => I25(9), I26 => I26(9), I27 => I127(9), 
                                        I28 => I28(9), I29 => I29(9), I30 => I30(9), I31 => I31(9), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(9));

 mux_instance10: Mux16_1Bit Port map (I0 => I0(10), I1 => I1(10), I2 => I2(10), I3 => I3(10), 
                                        I4 => I4(10), I5 => I5(10), I6 => I6(10), I7 => I7(10), 
                                        I8 => I8(10), I9 => I9(10), I10 => I10(10), I11 => I11(10), 
                                        I12 => I12(10), I13 => I13(10), I14 => I14(10), I15 => I15(10), 
                                        I16 => I16(10), I17 => I17(10), I18 => I18(10), I19 => I19(10), 
                                        I20 => I20(10), I21 => I21(10), I22 => I22(10), I23 => I23(10), 
                                        I24 => I24(10), I25 => I25(10), I26 => I26(10), I27 => I127(10), 
                                        I28 => I28(10), I29 => I29(10), I30 => I30(10), I31 => I31(10), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(10));

 mux_instance11: Mux16_1Bit Port map (I0 => I0(11), I1 => I1(11), I2 => I2(11), I3 => I3(11), 
                                        I4 => I4(11), I5 => I5(11), I6 => I6(11), I7 => I7(11), 
                                        I8 => I8(11), I9 => I9(11), I10 => I10(11), I11 => I11(11), 
                                        I12 => I12(11), I13 => I13(11), I14 => I14(11), I15 => I15(11), 
                                        I16 => I16(11), I17 => I17(11), I18 => I18(11), I19 => I19(11), 
                                        I20 => I20(11), I21 => I21(11), I22 => I22(11), I23 => I23(11), 
                                        I24 => I24(11), I25 => I25(11), I26 => I26(11), I27 => I127(11), 
                                        I28 => I28(11), I29 => I29(11), I30 => I30(11), I31 => I31(11), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(11));

 mux_instance12: Mux16_1Bit Port map (I0 => I0(12), I1 => I1(12), I2 => I2(12), I3 => I3(12), 
                                        I4 => I4(12), I5 => I5(12), I6 => I6(12), I7 => I7(12), 
                                        I8 => I8(12), I9 => I9(12), I10 => I10(12), I11 => I11(12), 
                                        I12 => I12(12), I13 => I13(12), I14 => I14(12), I15 => I15(12), 
                                        I16 => I16(12), I17 => I17(12), I18 => I18(12), I19 => I19(12), 
                                        I20 => I20(12), I21 => I21(12), I22 => I22(12), I23 => I23(12), 
                                        I24 => I24(12), I25 => I25(12), I26 => I26(12), I27 => I127(12), 
                                        I28 => I28(12), I29 => I29(12), I30 => I30(12), I31 => I31(12), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(12));

 mux_instance13: Mux16_1Bit Port map (I0 => I0(13), I1 => I1(13), I2 => I2(13), I3 => I3(13), 
                                        I4 => I4(13), I5 => I5(13), I6 => I6(13), I7 => I7(13), 
                                        I8 => I8(13), I9 => I9(13), I10 => I10(13), I11 => I11(13), 
                                        I12 => I12(13), I13 => I13(13), I14 => I14(13), I15 => I15(13), 
                                        I16 => I16(13), I17 => I17(13), I18 => I18(13), I19 => I19(13), 
                                        I20 => I20(13), I21 => I21(13), I22 => I22(13), I23 => I23(13), 
                                        I24 => I24(13), I25 => I25(13), I26 => I26(13), I27 => I127(13), 
                                        I28 => I28(13), I29 => I29(13), I30 => I30(13), I31 => I31(13), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(13));

 mux_instance14: Mux16_1Bit Port map (I0 => I0(14), I1 => I1(14), I2 => I2(14), I3 => I3(14), 
                                        I4 => I4(14), I5 => I5(14), I6 => I6(14), I7 => I7(14), 
                                        I8 => I8(14), I9 => I9(14), I10 => I10(14), I11 => I11(14), 
                                        I12 => I12(14), I13 => I13(14), I14 => I14(14), I15 => I15(14), 
                                        I16 => I16(14), I17 => I17(14), I18 => I18(14), I19 => I19(14), 
                                        I20 => I20(14), I21 => I21(14), I22 => I22(14), I23 => I23(14), 
                                        I24 => I24(14), I25 => I25(14), I26 => I26(14), I27 => I127(14), 
                                        I28 => I28(14), I29 => I29(14), I30 => I30(14), I31 => I31(14), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(14));

 mux_instance15: Mux16_1Bit Port map (I0 => I0(15), I1 => I1(15), I2 => I2(15), I3 => I3(15), 
                                        I4 => I4(15), I5 => I5(15), I6 => I6(15), I7 => I7(15), 
                                        I8 => I8(15), I9 => I9(15), I10 => I10(15), I11 => I11(15), 
                                        I12 => I12(15), I13 => I13(15), I14 => I14(15), I15 => I15(15), 
                                        I16 => I16(15), I17 => I17(15), I18 => I18(15), I19 => I19(15), 
                                        I20 => I20(15), I21 => I21(15), I22 => I22(15), I23 => I23(15), 
                                        I24 => I24(15), I25 => I25(15), I26 => I26(15), I27 => I127(15), 
                                        I28 => I28(15), I29 => I29(15), I30 => I30(15), I31 => I31(15), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(15));

 mux_instance16: Mux16_1Bit Port map (I0 => I0(16), I1 => I1(16), I2 => I2(16), I3 => I3(16), 
                                        I4 => I4(16), I5 => I5(16), I6 => I6(16), I7 => I7(16), 
                                        I8 => I8(16), I9 => I9(16), I10 => I10(16), I11 => I11(16), 
                                        I12 => I12(16), I13 => I13(16), I14 => I14(16), I15 => I15(16), 
                                        I16 => I16(16), I17 => I17(16), I18 => I18(16), I19 => I19(16), 
                                        I20 => I20(16), I21 => I21(16), I22 => I22(16), I23 => I23(16), 
                                        I24 => I24(16), I25 => I25(16), I26 => I26(16), I27 => I127(16), 
                                        I28 => I28(16), I29 => I29(16), I30 => I30(16), I31 => I31(16), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(16));

 mux_instance17: Mux16_1Bit Port map (I0 => I0(17), I1 => I1(17), I2 => I2(17), I3 => I3(17), 
                                        I4 => I4(17), I5 => I5(17), I6 => I6(17), I7 => I7(17), 
                                        I8 => I8(17), I9 => I9(17), I10 => I10(17), I11 => I11(17), 
                                        I12 => I12(17), I13 => I13(17), I14 => I14(17), I15 => I15(17), 
                                        I16 => I16(17), I17 => I17(17), I18 => I18(17), I19 => I19(17), 
                                        I20 => I20(17), I21 => I21(17), I22 => I22(17), I23 => I23(17), 
                                        I24 => I24(17), I25 => I25(17), I26 => I26(17), I27 => I127(17), 
                                        I28 => I28(17), I29 => I29(17), I30 => I30(17), I31 => I31(17), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(17));

 mux_instance18: Mux16_1Bit Port map (I0 => I0(18), I1 => I1(18), I2 => I2(18), I3 => I3(18), 
                                        I4 => I4(18), I5 => I5(18), I6 => I6(18), I7 => I7(18), 
                                        I8 => I8(18), I9 => I9(18), I10 => I10(18), I11 => I11(18), 
                                        I12 => I12(18), I13 => I13(18), I14 => I14(18), I15 => I15(18), 
                                        I16 => I16(18), I17 => I17(18), I18 => I18(18), I19 => I19(18), 
                                        I20 => I20(18), I21 => I21(18), I22 => I22(18), I23 => I23(18), 
                                        I24 => I24(18), I25 => I25(18), I26 => I26(18), I27 => I127(18), 
                                        I28 => I28(18), I29 => I29(18), I30 => I30(18), I31 => I31(18), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(18));

 mux_instance19: Mux16_1Bit Port map (I0 => I0(19), I1 => I1(19), I2 => I2(19), I3 => I3(19), 
                                        I4 => I4(19), I5 => I5(19), I6 => I6(19), I7 => I7(19), 
                                        I8 => I8(19), I9 => I9(19), I10 => I10(19), I11 => I11(19), 
                                        I12 => I12(19), I13 => I13(19), I14 => I14(19), I15 => I15(19), 
                                        I16 => I16(19), I17 => I17(19), I18 => I18(19), I19 => I19(19), 
                                        I20 => I20(19), I21 => I21(19), I22 => I22(19), I23 => I23(19), 
                                        I24 => I24(19), I25 => I25(19), I26 => I26(19), I27 => I127(19), 
                                        I28 => I28(19), I29 => I29(19), I30 => I30(19), I31 => I31(19), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(19));

 mux_instance20: Mux16_1Bit Port map (I0 => I0(20), I1 => I1(20), I2 => I2(20), I3 => I3(20), 
                                        I4 => I4(20), I5 => I5(20), I6 => I6(20), I7 => I7(20), 
                                        I8 => I8(20), I9 => I9(20), I10 => I10(20), I11 => I11(20), 
                                        I12 => I12(20), I13 => I13(20), I14 => I14(20), I15 => I15(20), 
                                        I16 => I16(20), I17 => I17(20), I18 => I18(20), I19 => I19(20), 
                                        I20 => I20(20), I21 => I21(20), I22 => I22(20), I23 => I23(20), 
                                        I24 => I24(20), I25 => I25(20), I26 => I26(20), I27 => I127(20), 
                                        I28 => I28(20), I29 => I29(20), I30 => I30(20), I31 => I31(20), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(20));

 mux_instance21: Mux16_1Bit Port map (I0 => I0(21), I1 => I1(21), I2 => I2(21), I3 => I3(21), 
                                        I4 => I4(21), I5 => I5(21), I6 => I6(21), I7 => I7(21), 
                                        I8 => I8(21), I9 => I9(21), I10 => I10(21), I11 => I11(21), 
                                        I12 => I12(21), I13 => I13(21), I14 => I14(21), I15 => I15(21), 
                                        I16 => I16(21), I17 => I17(21), I18 => I18(21), I19 => I19(21), 
                                        I20 => I20(21), I21 => I21(21), I22 => I22(21), I23 => I23(21), 
                                        I24 => I24(21), I25 => I25(21), I26 => I26(21), I27 => I127(21), 
                                        I28 => I28(21), I29 => I29(21), I30 => I30(21), I31 => I31(21), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(21));

 mux_instance22: Mux16_1Bit Port map (I0 => I0(22), I1 => I1(22), I2 => I2(22), I3 => I3(22), 
                                        I4 => I4(22), I5 => I5(22), I6 => I6(22), I7 => I7(22), 
                                        I8 => I8(22), I9 => I9(22), I10 => I10(22), I11 => I11(22), 
                                        I12 => I12(22), I13 => I13(22), I14 => I14(22), I15 => I15(22), 
                                        I16 => I16(22), I17 => I17(22), I18 => I18(22), I19 => I19(22), 
                                        I20 => I20(22), I21 => I21(22), I22 => I22(22), I23 => I23(22), 
                                        I24 => I24(22), I25 => I25(22), I26 => I26(22), I27 => I127(22), 
                                        I28 => I28(22), I29 => I29(22), I30 => I30(22), I31 => I31(22), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(22));

 mux_instance23: Mux16_1Bit Port map (I0 => I0(23), I1 => I1(23), I2 => I2(23), I3 => I3(23), 
                                        I4 => I4(23), I5 => I5(23), I6 => I6(23), I7 => I7(23), 
                                        I8 => I8(23), I9 => I9(23), I10 => I10(23), I11 => I11(23), 
                                        I12 => I12(23), I13 => I13(23), I14 => I14(23), I15 => I15(23), 
                                        I16 => I16(23), I17 => I17(23), I18 => I18(23), I19 => I19(23), 
                                        I20 => I20(23), I21 => I21(23), I22 => I22(23), I23 => I23(23), 
                                        I24 => I24(23), I25 => I25(23), I26 => I26(23), I27 => I127(23), 
                                        I28 => I28(23), I29 => I29(23), I30 => I30(23), I31 => I31(23), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(23));

 mux_instance24: Mux16_1Bit Port map (I0 => I0(24), I1 => I1(24), I2 => I2(24), I3 => I3(24), 
                                        I4 => I4(24), I5 => I5(24), I6 => I6(24), I7 => I7(24), 
                                        I8 => I8(24), I9 => I9(24), I10 => I10(24), I11 => I11(24), 
                                        I12 => I12(24), I13 => I13(24), I14 => I14(24), I15 => I15(24), 
                                        I16 => I16(24), I17 => I17(24), I18 => I18(24), I19 => I19(24), 
                                        I20 => I20(24), I21 => I21(24), I22 => I22(24), I23 => I23(24), 
                                        I24 => I24(24), I25 => I25(24), I26 => I26(24), I27 => I127(24), 
                                        I28 => I28(24), I29 => I29(24), I30 => I30(24), I31 => I31(24), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(24));

 mux_instance25: Mux16_1Bit Port map (I0 => I0(25), I1 => I1(25), I2 => I2(25), I3 => I3(25), 
                                        I4 => I4(25), I5 => I5(25), I6 => I6(25), I7 => I7(25), 
                                        I8 => I8(25), I9 => I9(25), I10 => I10(25), I11 => I11(25), 
                                        I12 => I12(25), I13 => I13(25), I14 => I14(25), I15 => I15(25), 
                                        I16 => I16(25), I17 => I17(25), I18 => I18(25), I19 => I19(25), 
                                        I20 => I20(25), I21 => I21(25), I22 => I22(25), I23 => I23(25), 
                                        I24 => I24(25), I25 => I25(25), I26 => I26(25), I27 => I127(25), 
                                        I28 => I28(25), I29 => I29(25), I30 => I30(25), I31 => I31(25), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(25));

 mux_instance26: Mux16_1Bit Port map (I0 => I0(26), I1 => I1(26), I2 => I2(26), I3 => I3(26), 
                                        I4 => I4(26), I5 => I5(26), I6 => I6(26), I7 => I7(26), 
                                        I8 => I8(26), I9 => I9(26), I10 => I10(26), I11 => I11(26), 
                                        I12 => I12(26), I13 => I13(26), I14 => I14(26), I15 => I15(26), 
                                        I16 => I16(26), I17 => I17(26), I18 => I18(26), I19 => I19(26), 
                                        I20 => I20(26), I21 => I21(26), I22 => I22(26), I23 => I23(26), 
                                        I24 => I24(26), I25 => I25(26), I26 => I26(26), I27 => I127(26), 
                                        I28 => I28(26), I29 => I29(26), I30 => I30(26), I31 => I31(26), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(26));

 mux_instance27: Mux16_1Bit Port map (I0 => I0(27), I1 => I1(27), I2 => I2(27), I3 => I3(27), 
                                        I4 => I4(27), I5 => I5(27), I6 => I6(27), I7 => I7(27), 
                                        I8 => I8(27), I9 => I9(27), I10 => I10(27), I11 => I11(27), 
                                        I12 => I12(27), I13 => I13(27), I14 => I14(27), I15 => I15(27), 
                                        I16 => I16(27), I17 => I17(27), I18 => I18(27), I19 => I19(27), 
                                        I20 => I20(27), I21 => I21(27), I22 => I22(27), I23 => I23(27), 
                                        I24 => I24(27), I25 => I25(27), I26 => I26(27), I27 => I127(27), 
                                        I28 => I28(27), I29 => I29(27), I30 => I30(27), I31 => I31(27), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(27));

 mux_instance28: Mux16_1Bit Port map (I0 => I0(28), I1 => I1(28), I2 => I2(28), I3 => I3(28), 
                                        I4 => I4(28), I5 => I5(28), I6 => I6(28), I7 => I7(28), 
                                        I8 => I8(28), I9 => I9(28), I10 => I10(28), I11 => I11(28), 
                                        I12 => I12(28), I13 => I13(28), I14 => I14(28), I15 => I15(28), 
                                        I16 => I16(28), I17 => I17(28), I18 => I18(28), I19 => I19(28), 
                                        I20 => I20(28), I21 => I21(28), I22 => I22(28), I23 => I23(28), 
                                        I24 => I24(28), I25 => I25(28), I26 => I26(28), I27 => I127(28), 
                                        I28 => I28(28), I29 => I29(28), I30 => I30(28), I31 => I31(28), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(28));

 mux_instance29: Mux16_1Bit Port map (I0 => I0(29), I1 => I1(29), I2 => I2(29), I3 => I3(29), 
                                        I4 => I4(29), I5 => I5(29), I6 => I6(29), I7 => I7(29), 
                                        I8 => I8(29), I9 => I9(29), I10 => I10(29), I11 => I11(29), 
                                        I12 => I12(29), I13 => I13(29), I14 => I14(29), I15 => I15(29), 
                                        I16 => I16(29), I17 => I17(29), I18 => I18(29), I19 => I19(29), 
                                        I20 => I20(29), I21 => I21(29), I22 => I22(29), I23 => I23(29), 
                                        I24 => I24(29), I25 => I25(29), I26 => I26(29), I27 => I127(29), 
                                        I28 => I28(29), I29 => I29(29), I30 => I30(29), I31 => I31(29), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(29));

 mux_instance30: Mux16_1Bit Port map (I0 => I0(30), I1 => I1(30), I2 => I2(30), I3 => I3(30), 
                                        I4 => I4(30), I5 => I5(30), I6 => I6(30), I7 => I7(30), 
                                        I8 => I8(30), I9 => I9(30), I10 => I10(30), I11 => I11(30), 
                                        I12 => I12(30), I13 => I13(30), I14 => I14(30), I15 => I15(30), 
                                        I16 => I16(30), I17 => I17(30), I18 => I18(30), I19 => I19(30), 
                                        I20 => I20(30), I21 => I21(30), I22 => I22(30), I23 => I23(30), 
                                        I24 => I24(30), I25 => I25(30), I26 => I26(30), I27 => I127(30), 
                                        I28 => I28(30), I29 => I29(30), I30 => I30(30), I31 => I31(30), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(30));

 mux_instance31: Mux16_1Bit Port map (I0 => I0(31), I1 => I1(31), I2 => I2(31), I3 => I3(31), 
                                        I4 => I4(31), I5 => I5(31), I6 => I6(31), I7 => I7(31), 
                                        I8 => I8(31), I9 => I9(31), I10 => I10(31), I11 => I11(31), 
                                        I12 => I12(31), I13 => I13(31), I14 => I14(31), I15 => I15(31), 
                                        I16 => I16(31), I17 => I17(31), I18 => I18(31), I19 => I19(31), 
                                        I20 => I20(31), I21 => I21(31), I22 => I22(31), I23 => I23(31), 
                                        I24 => I24(31), I25 => I25(31), I26 => I26(31), I27 => I127(31), 
                                        I28 => I28(31), I29 => I29(31), I30 => I30(31), I31 => I31(31), 
                                        S0 => S0, S1 => S1, S2 => S2, S3 => S3, S4 => S4, S5 => S5, Y => Y_temp(31));
		  	
	-- Assign the temporary output to the final output
    	Y <= Y_temp;

end Behavioral;
