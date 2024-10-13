----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 15:52:42
-- Design Name: 
-- Module Name: RF_RegisterFile_32_15_22336157 - Behavioral
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

entity RF_RegisterFile_32_15_22336157 is
    Port ( DR : in STD_LOGIC_VECTOR (4 downto 0); 
          RW : in STD_LOGIC; 
          SA : in STD_LOGIC_VECTOR(4 downto 0);
          SB : in STD_LOGIC_VECTOR(4 downto 0);
          CLK : in STD_LOGIC;
          D : in STD_LOGIC_VECTOR (31 downto 0);
          Reset : in STD_LOGIC;
          TB : in STD_LOGIC_VECTOR (3 downto 0);
          TA : in STD_LOGIC_VECTOR (3 downto 0);
          TD : in STD_LOGIC_VECTOR (3 downto 0));
end RF_Register32Bit_22336157;

architecture Behavioral of RF_RegisterFile_32_15_22336157 is
    COMPONENT RF_DestReg_Decoder_22336157
    Port ( A : in STD_LOGIC_VECTOR (4 downto 0); -- five to 32 line decoder
           Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
           Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31 : out STD_LOGIC);
    END COMPONENT;

  COMPONENT RF_DestReg_Decoder_22336157 is
    Port ( A : in STD_LOGIC_VECTOR (4 downto 0); -- five to 32 line decoder
           Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15,
           Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31 : out STD_LOGIC);
    END COMPONENT;

  COMPONENT RF_Temp_DestReg_Decoder_22336157 
  Port (
        A : in STD_LOGIC_VECTOR (3 downto 0); -- Input: 4-bit binary
        Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, 
        Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15 : out STD_LOGIC -- Output: 16 lines
    );
  END COMPONENT; 

  COMPONENT RF_Register32Bit_22336157
  Port ( D : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (31 downto 0));
  END COMPONENT;

  COMPONENT RF_Mux32_32Bit_22336157 is
	Port ( I0 , I1 , I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(31 downto 0);             -- Input Signals
      	I8, I9, I10, I11, I12, I13, I14, I15:  in STD_LOGIC_VECTOR(31 downto 0); 	
      	I16, I17, I18, I19, I20, I21, I22, I23 : in STD_LOGIC_VECTOR(31 downto 0);
      	I24, I25, I26, I27, I28, I29, I30, I31 : in STD_LOGIC_VECTOR(31 downto 0);
  		  S0, S1, S2, S3, S4: in STD_LOGIC; 		            	        -- Selection Signals (2^5 = 32) 
  		  Y : out STD_LOGIC_VECTOR(31 downto 0)) ;  			                                                    -- 1 bit output
  END COMPONENT;

  COMPONENT RF_Mux16_32Bit_22336157 is
    Port ( 
        I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(31 downto 0);   -- 32-bit Input Signals
        I8, I9, I10, I11, I12, I13, I14, I15 : in STD_LOGIC_VECTOR(31 downto 0); -- 32-bit Input Signals
        S0, S1, S2, S3 : in STD_LOGIC;      -- 4 Selection Signals for 16 inputs
        Y : out STD_LOGIC_VECTOR(31 downto 0)  -- 32-bit Output Signal
    );
  END COMPONENT;

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
    DestReg_Decoder : RF_DestReg_Decoder_22336157 Port map(
      A[4:0] => DR[4:0],
      Q0 => Q0_DestReg, Q1 => Q1_DestReg, Q2 => Q2_DestReg, Q3 => Q3_DestReg, 
      Q4 => Q4_DestReg, Q5 => Q5_DestReg, Q6 => Q6_DestReg, Q7 => Q7_DestReg, 
      Q8 => Q8_DestReg, Q9 => Q9_DestReg, Q10 => Q10_DestReg, Q11 => Q11_DestReg, 
      Q12 => Q12_DestReg, Q13 => Q13_DestReg, Q14 => Q14_DestReg, Q15 => Q15_DestReg,
      Q16 => Q16_DestReg, Q17 => Q17_DestReg, Q18 => Q18_DestReg, 
      Q19 => Q19_DestReg, Q20 => Q20_DestReg, Q21 => Q21_DestReg, 
      Q22 => Q22_DestReg, Q23 => Q23_DestReg, Q24 => Q24_DestReg, 
      Q25 => Q25_DestReg, Q26 => Q26_DestReg, Q27 => Q27_DestReg, 
      Q28 => Q28_DestReg, Q29 => Q29_DestReg, Q30 => Q30_DestReg, 
      Q31 => Q31_DestReg
    );
      
    AND_Gate_to_register000_i <= RW and Q0 after AND_GATE_DELAY;
    AND_Gate_to_register010_i <= RW and Q1 after AND_GATE_DELAY;
    AND_Gate_to_register020_i <= RW and Q2 after AND_GATE_DELAY;
    AND_Gate_to_register030_i <= RW and Q3 after AND_GATE_DELAY;
    AND_Gate_to_register040_i <= RW and Q4 after AND_GATE_DELAY;
    AND_Gate_to_register050_i <= RW and Q5 after AND_GATE_DELAY;
    AND_Gate_to_register060_i <= RW and Q6 after AND_GATE_DELAY;
    AND_Gate_to_register070_i <= RW and Q7 after AND_GATE_DELAY;
    AND_Gate_to_register080_i <= RW and Q8 after AND_GATE_DELAY;
    AND_Gate_to_register090_i <= RW and Q9 after AND_GATE_DELAY;
    AND_Gate_to_register100_i <= RW and Q10 after AND_GATE_DELAY;
    AND_Gate_to_register110_i <= RW and Q11 after AND_GATE_DELAY;
    AND_Gate_to_register120_i <= RW and Q12 after AND_GATE_DELAY;
    AND_Gate_to_register130_i <= RW and Q13 after AND_GATE_DELAY;
    AND_Gate_to_register140_i <= RW and Q14 after AND_GATE_DELAY;
    AND_Gate_to_register150_i <= RW and Q15 after AND_GATE_DELAY;
    AND_Gate_to_register160_i <= RW and Q16 after AND_GATE_DELAY;
    AND_Gate_to_register170_i <= RW and Q17 after AND_GATE_DELAY;
    AND_Gate_to_register180_i <= RW and Q18 after AND_GATE_DELAY;
    AND_Gate_to_register190_i <= RW and Q19 after AND_GATE_DELAY;
    AND_Gate_to_register200_i <= RW and Q20 after AND_GATE_DELAY;
    AND_Gate_to_register210_i <= RW and Q21 after AND_GATE_DELAY;
    AND_Gate_to_register220_i <= RW and Q22 after AND_GATE_DELAY;
    AND_Gate_to_register230_i <= RW and Q23 after AND_GATE_DELAY;
    AND_Gate_to_register240_i <= RW and Q24 after AND_GATE_DELAY;
    AND_Gate_to_register250_i <= RW and Q25 after AND_GATE_DELAY;
    AND_Gate_to_register260_i <= RW and Q26 after AND_GATE_DELAY;
    AND_Gate_to_register270_i <= RW and Q27 after AND_GATE_DELAY;
    AND_Gate_to_register280_i <= RW and Q28 after AND_GATE_DELAY;
    AND_Gate_to_register290_i <= RW and Q29 after AND_GATE_DELAY;
    AND_Gate_to_register300_i <= RW and Q30 after AND_GATE_DELAY;
    AND_Gate_to_register310_i <= RW and Q31 after AND_GATE_DELAY;


    AND_Gate_to_register00_i <= AND_Gate_to_register000_i and Q0 after AND_GATE_DELAY;
    AND_Gate_to_register01_i <= AND_Gate_to_register010_i and Q1 after AND_GATE_DELAY;
    AND_Gate_to_register02_i <= AND_Gate_to_register020_i and Q2 after AND_GATE_DELAY;
    AND_Gate_to_register03_i <= AND_Gate_to_register030_i and Q3 after AND_GATE_DELAY;
    AND_Gate_to_register04_i <= AND_Gate_to_register040_i and Q4 after AND_GATE_DELAY;
    AND_Gate_to_register05_i <= AND_Gate_to_register050_i and Q5 after AND_GATE_DELAY;
    AND_Gate_to_register06_i <= AND_Gate_to_register060_i and Q6 after AND_GATE_DELAY;
    AND_Gate_to_register07_i <= AND_Gate_to_register070_i and Q7 after AND_GATE_DELAY;
    AND_Gate_to_register08_i <= AND_Gate_to_register080_i and Q8 after AND_GATE_DELAY;
    AND_Gate_to_register09_i <= AND_Gate_to_register090_i and Q9 after AND_GATE_DELAY;
    AND_Gate_to_register10_i <= AND_Gate_to_register100_i and Q10 after AND_GATE_DELAY;
    AND_Gate_to_register11_i <= AND_Gate_to_register110_i and Q11 after AND_GATE_DELAY;
    AND_Gate_to_register12_i <= AND_Gate_to_register120_i and Q12 after AND_GATE_DELAY;
    AND_Gate_to_register13_i <= AND_Gate_to_register130_i and Q13 after AND_GATE_DELAY;
    AND_Gate_to_register14_i <= AND_Gate_to_register140_i and Q14 after AND_GATE_DELAY;
    AND_Gate_to_register15_i <= AND_Gate_to_register150_i and Q15 after AND_GATE_DELAY;
    AND_Gate_to_register16_i <= AND_Gate_to_register160_i and Q16 after AND_GATE_DELAY;
    AND_Gate_to_register17_i <= AND_Gate_to_register170_i and Q17 after AND_GATE_DELAY;
    AND_Gate_to_register18_i <= AND_Gate_to_register180_i and Q18 after AND_GATE_DELAY;
    AND_Gate_to_register19_i <= AND_Gate_to_register190_i and Q19 after AND_GATE_DELAY;
    AND_Gate_to_register20_i <= AND_Gate_to_register200_i and Q20 after AND_GATE_DELAY;
    AND_Gate_to_register21_i <= AND_Gate_to_register210_i and Q21 after AND_GATE_DELAY;
    AND_Gate_to_register22_i <= AND_Gate_to_register220_i and Q22 after AND_GATE_DELAY;
    AND_Gate_to_register23_i <= AND_Gate_to_register230_i and Q23 after AND_GATE_DELAY;
    AND_Gate_to_register24_i <= AND_Gate_to_register240_i and Q24 after AND_GATE_DELAY;
    AND_Gate_to_register25_i <= AND_Gate_to_register250_i and Q25 after AND_GATE_DELAY;
    AND_Gate_to_register26_i <= AND_Gate_to_register260_i and Q26 after AND_GATE_DELAY;
    AND_Gate_to_register27_i <= AND_Gate_to_register270_i and Q27 after AND_GATE_DELAY;
    AND_Gate_to_register28_i <= AND_Gate_to_register280_i and Q28 after AND_GATE_DELAY;
    AND_Gate_to_register29_i <= AND_Gate_to_register290_i and Q29 after AND_GATE_DELAY;
    AND_Gate_to_register30_i <= AND_Gate_to_register300_i and Q30 after AND_GATE_DELAY;
    AND_Gate_to_register31_i <= AND_Gate_to_register310_i and Q31 after AND_GATE_DELAY;

    DestTempRegDecoder : RF_Temp_DestReg_Decoder_22336157 Port map(
      A[4:0] => TD[4:0], 
      Q0 => Q0_TempReg, Q1 => Q1_TempReg, Q2 => Q2_TempReg, Q3 => Q3_TempReg, 
      Q4 => Q4_TempReg, Q5 => Q5_TempReg, Q6 => Q6_TempReg, Q7 => Q7_TempReg, 
      Q8 => Q8_TempReg, Q9 => Q9_TempReg, Q10 => Q10_TempReg, 
      Q11 => Q11_TempReg, Q12 => Q12_TempReg, Q13 => Q13_TempReg, 
      Q14 => Q14_TempReg, Q15 => Q15_TempReg
    );

  AND_Gate_to_TempReg00_i <= RW and Q0_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg01_i <= RW and Q1_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg02_i <= RW and Q2_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg03_i <= RW and Q3_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg04_i <= RW and Q4_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg05_i <= RW and Q5_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg06_i <= RW and Q6_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg07_i <= RW and Q7_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg08_i <= RW and Q8_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg09_i <= RW and Q9_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg10_i <= RW and Q10_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg11_i <= RW and Q11_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg12_i <= RW and Q12_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg13_i <= RW and Q13_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg14_i <= RW and Q14_TempReg after AND_GATE_DELAY;
  AND_Gate_to_TempReg15_i <= RW and Q15_TempReg after AND_GATE_DELAY;

  Rf_register_32Bit : RF_Register32Bit_22336157

    
