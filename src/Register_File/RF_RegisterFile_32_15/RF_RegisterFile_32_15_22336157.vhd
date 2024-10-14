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
          TD : in STD_LOGIC_VECTOR (3 downto 0);
	  A : out STD_LOGIC_VECTOR(31 downto 0);
	  B : out STD_LOGIC_VECTOR(31 downto 0));
end RF_RegisterFile_32_15_22336157;

architecture Behavioral of RF_RegisterFile_32_15_22336157 is
    COMPONENT RF_DestReg_Decoder_22336157
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
	
    signal AND_Gate_to_register000_i, AND_Gate_to_register010_i, AND_Gate_to_register020_i, AND_Gate_to_register030_i, AND_Gate_to_register040_i, AND_Gate_to_register050_i, AND_Gate_to_register060_i, AND_Gate_to_register070_i, AND_Gate_to_register080_i,AND_Gate_to_register090_i, AND_Gate_to_register100_i, AND_Gate_to_register110_i, AND_Gate_to_register120_i, AND_Gate_to_register130_i, AND_Gate_to_register140_i, AND_Gate_to_register150_i, AND_Gate_to_register160_i, AND_Gate_to_register170_i : STD_LOGIC;
    signal AND_Gate_to_register180_i, AND_Gate_to_register190_i, AND_Gate_to_register200_i, AND_Gate_to_register210_i, AND_Gate_to_register220_i, AND_Gate_to_register230_i, AND_Gate_to_register240_i, AND_Gate_to_register250_i, AND_Gate_to_register260_i : STD_LOGIC; 
    signal AND_Gate_to_register270_i, AND_Gate_to_register280_i, AND_Gate_to_register290_i, AND_Gate_to_register300_i, AND_Gate_to_register310_i : STD_LOGIC;

signal AND_Gate_to_register00_i, AND_Gate_to_register01_i, AND_Gate_to_register02_i, 
       AND_Gate_to_register03_i, AND_Gate_to_register04_i, AND_Gate_to_register05_i, 
       AND_Gate_to_register06_i, AND_Gate_to_register07_i, AND_Gate_to_register08_i, 
       AND_Gate_to_register09_i, AND_Gate_to_register10_i, AND_Gate_to_register11_i, 
       AND_Gate_to_register12_i, AND_Gate_to_register13_i, AND_Gate_to_register14_i, 
       AND_Gate_to_register15_i, AND_Gate_to_register16_i, AND_Gate_to_register17_i, 
       AND_Gate_to_register18_i, AND_Gate_to_register19_i, AND_Gate_to_register20_i, 
       AND_Gate_to_register21_i, AND_Gate_to_register22_i, AND_Gate_to_register23_i, 
       AND_Gate_to_register24_i, AND_Gate_to_register25_i, AND_Gate_to_register26_i, 
       AND_Gate_to_register27_i, AND_Gate_to_register28_i, AND_Gate_to_register29_i, 
       AND_Gate_to_register30_i, AND_Gate_to_register31_i : STD_LOGIC;

signal AND_Gate_to_TempReg00_i, AND_Gate_to_TempReg01_i, AND_Gate_to_TempReg02_i, 
       AND_Gate_to_TempReg03_i, AND_Gate_to_TempReg04_i, AND_Gate_to_TempReg05_i, 
       AND_Gate_to_TempReg06_i, AND_Gate_to_TempReg07_i, AND_Gate_to_TempReg08_i, 
       AND_Gate_to_TempReg09_i, AND_Gate_to_TempReg10_i, AND_Gate_to_TempReg11_i, 
       AND_Gate_to_TempReg12_i, AND_Gate_to_TempReg13_i, AND_Gate_to_TempReg14_i, 
       AND_Gate_to_TempReg15_i : STD_LOGIC;


  begin
    DestReg_Decoder : RF_DestReg_Decoder_22336157 Port map(
      A => DR(4 downto 0),
      Q0 => Q0_DestReg, Q1 => Q1_DestReg, Q2 => Q2_DestReg, Q3 => Q3_DestReg;
      Q4 => Q4_DestReg, Q5 => Q5_DestReg, Q6 => Q6_DestReg, Q7 => Q7_DestReg;
      Q8 => Q8_DestReg, Q9 => Q9_DestReg, Q10 => Q10_DestReg, Q11 => Q11_DestReg;
      Q12 => Q12_DestReg, Q13 => Q13_DestReg, Q14 => Q14_DestReg, Q15 => Q15_DestReg;
      Q16 => Q16_DestReg, Q17 => Q17_DestReg, Q18 => Q18_DestReg;
      Q19 => Q19_DestReg, Q20 => Q20_DestReg, Q21 => Q21_DestReg;
      Q22 => Q22_DestReg, Q23 => Q23_DestReg, Q24 => Q24_DestReg;
      Q25 => Q25_DestReg, Q26 => Q26_DestReg, Q27 => Q27_DestReg;
      Q28 => Q28_DestReg, Q29 => Q29_DestReg, Q30 => Q30_DestReg;
      Q31 => Q31_DestReg
    );
      
	AND_Gate_to_register000_i <= RW and Q0_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register010_i <= RW and Q1_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register020_i <= RW and Q2_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register030_i <= RW and Q3_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register040_i <= RW and Q4_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register050_i <= RW and Q5_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register060_i <= RW and Q6_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register070_i <= RW and Q7_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register080_i <= RW and Q8_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register090_i <= RW and Q9_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register100_i <= RW and Q10_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register110_i <= RW and Q11_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register120_i <= RW and Q12_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register130_i <= RW and Q13_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register140_i <= RW and Q14_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register150_i <= RW and Q15_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register160_i <= RW and Q16_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register170_i <= RW and Q17_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register180_i <= RW and Q18_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register190_i <= RW and Q19_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register200_i <= RW and Q20_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register210_i <= RW and Q21_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register220_i <= RW and Q22_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register230_i <= RW and Q23_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register240_i <= RW and Q24_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register250_i <= RW and Q25_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register260_i <= RW and Q26_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register270_i <= RW and Q27_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register280_i <= RW and Q28_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register290_i <= RW and Q29_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register300_i <= RW and Q30_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register310_i <= RW and Q31_DestReg after AND_GATE_DELAY;
	
	AND_Gate_to_register00_i <= AND_Gate_to_register000_i and Q0_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register01_i <= AND_Gate_to_register010_i and Q1_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register02_i <= AND_Gate_to_register020_i and Q2_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register03_i <= AND_Gate_to_register030_i and Q3_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register04_i <= AND_Gate_to_register040_i and Q4_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register05_i <= AND_Gate_to_register050_i and Q5_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register06_i <= AND_Gate_to_register060_i and Q6_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register07_i <= AND_Gate_to_register070_i and Q7_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register08_i <= AND_Gate_to_register080_i and Q8_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register09_i <= AND_Gate_to_register090_i and Q9_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register10_i <= AND_Gate_to_register100_i and Q10_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register11_i <= AND_Gate_to_register110_i and Q11_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register12_i <= AND_Gate_to_register120_i and Q12_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register13_i <= AND_Gate_to_register130_i and Q13_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register14_i <= AND_Gate_to_register140_i and Q14_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register15_i <= AND_Gate_to_register150_i and Q15_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register16_i <= AND_Gate_to_register160_i and Q16_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register17_i <= AND_Gate_to_register170_i and Q17_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register18_i <= AND_Gate_to_register180_i and Q18_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register19_i <= AND_Gate_to_register190_i and Q19_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register20_i <= AND_Gate_to_register200_i and Q20_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register21_i <= AND_Gate_to_register210_i and Q21_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register22_i <= AND_Gate_to_register220_i and Q22_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register23_i <= AND_Gate_to_register230_i and Q23_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register24_i <= AND_Gate_to_register240_i and Q24_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register25_i <= AND_Gate_to_register250_i and Q25_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register26_i <= AND_Gate_to_register260_i and Q26_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register27_i <= AND_Gate_to_register270_i and Q27_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register28_i <= AND_Gate_to_register280_i and Q28_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register29_i <= AND_Gate_to_register290_i and Q29_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register30_i <= AND_Gate_to_register300_i and Q30_DestReg after AND_GATE_DELAY;
	AND_Gate_to_register31_i <= AND_Gate_to_register310_i and Q31_DestReg after AND_GATE_DELAY;
	
	Register00 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register00_i);
	Register01 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register01_i);
	Register02 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register02_i);
	Register03 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register03_i);
	Register04 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register04_i);
	Register05 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register05_i);
	Register06 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register06_i);
	Register07 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register07_i);
	Register08 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register08_i);
	Register09 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register09_i);
	Register10 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register10_i);
	Register11 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register11_i);
	Register12 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register12_i);
	Register13 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register13_i);
	Register14 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register14_i);
	Register15 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register15_i);
	Register16 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register16_i);
	Register17 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register17_i);
	Register18 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register18_i);
	Register19 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register19_i);
	Register20 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register20_i);
	Register21 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register21_i);
	Register22 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register22_i);
	Register23 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register23_i);
	Register24 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register24_i);
	Register25 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register25_i);
	Register26 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register26_i);
	Register27 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register27_i);
	Register28 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register28_i);
	Register29 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register29_i);
	Register30 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register30_i);
	Register31 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_register31_i);

	DestTempRegDecoder : RF_Temp_DestReg_Decoder_22336157 Port map(
		A[4:0] => TD[4:0], 
		Q0 => Q0_TempReg, Q1 => Q1_TempReg, Q2 => Q2_TempReg, Q3 => Q3_TempReg, 
		Q4 => Q4_TempReg, Q5 => Q5_TempReg, Q6 => Q6_TempReg, Q7 => Q7_TempReg, 
		Q8 => Q8_TempReg, Q9 => Q9_TempReg, Q10 => Q10_TempReg, 
		Q11 => Q11_TempReg, Q12 => Q12_TempReg, Q13 => Q13_TempReg, 
		Q14 => Q14_TempReg, Q15 => Q15_TempReg
	);

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

	TempReg01 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg01_i);
	TempReg02 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg02_i);
	TempReg03 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg03_i);
	TempReg04 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg04_i);
	TempReg05 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg05_i);
	TempReg06 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg06_i);
	TempReg07 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg07_i);
	TempReg08 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg08_i);
	TempReg09 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg09_i);
	TempReg10 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg10_i);
	TempReg11 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg11_i);
	TempReg12 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg12_i);
	TempReg13 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg13_i);
	TempReg14 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg14_i);
	TempReg15 : RF_Register32Bit_22336157 Port Map(CLK => CLK, D[31:0] => D[31:0], Rest => Reset, Load => AND_Gate_to_TempReg15_i);

	
	Mux32_a : RF_Mux32_32Bit_22336157 Port Map(S0 => SA(0), S1 => SA(1), S2 => SA(2), S3 => SA(3), S4 => SA(4); -- Signals
		I0 => Register00, I1 => Register1, I2 => Register02, I3 => Register03, I4 => Register04, I5 => Register05, I6 => Register06, I7 => Register07; -- Inputs
		I8 => Register08, I9 => Register09, I10 => Register10, I11 => Register11, I12 => Register12, I13 => Register13, I14 => Register14, I15 => Register15);

	Mux32_b : RF_Mux32_32Bit_22336157 Port Map(S0 => SB(0), S1 => SB(1), S2 => SB(2), S3 => SB(3), S4 => SB(4); -- Signals
		I0 => Register00, I1 => Register1, I2 => Register02, I3 => Register03, I4 => Register04, I5 => Register05, I6 => Register06, I7 => Register07; -- Inputs
		I8 => Register08, I9 => Register09, I10 => Register10, I11 => Register11, I12 => Register12, I13 => Register13, I14 => Register14, I15 => Register15);

	Mux16_a : RF_Mux16_32Bit_22336157 Port Map(S0 => TA(0), S1 => TA(1), S2 => TA(2), S3 => TA(3); -- Signals
		I0 => Mux32_a, I1 => TempReg01, I2 => TempReg02, I3 => TempReg03, I4 => TempReg04, I5 => TempReg05, I6 => TempReg06, I7 => TempReg07; -- Inputs 
		I8 => TempReg08, I9 => TempReg09, I10 => TempReg10, I11 => TempReg11, I12 => TempReg12, I13 => TempReg13, I14 => TempReg14, I15 => TempReg15);

	Mux16_b : RF_Mux16_32Bit_22336157 Port Map(S0 => TB(0), S1 => TB(1), S2 => TB(2), S3 => TB(3); -- Signals
		I0 => Mux32_b, I1 => TempReg01, I2 => TempReg02, I3 => TempReg03, I4 => TempReg04, I5 => TempReg05, I6 => TempReg06, I7 => TempReg07; -- Inputs
		I8 => TempReg08, I9 => TempReg09, I10 => TempReg10, I11 => TempReg11, I12 => TempReg12, I13 => TempReg13, I14 => TempReg14, I15 => TempReg15);

	A <= Mux16_a; -- outputs
	B <= Mux16_b; 

end Behavioral;
