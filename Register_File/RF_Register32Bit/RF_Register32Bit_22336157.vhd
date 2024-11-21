----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 08.10.2023 15:52:42
-- Design Name: 
-- Module Name: RF_Register32Bit_22336157 - Behavioral
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

entity RF_Register32Bit_22336157 is
    Port ( D : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (31 downto 0));
end RF_Register32Bit_22336157;

architecture Behavioral of RF_Register32Bit_22336157 is
 
    COMPONENT RF_DFlipFlop_22336157
    Port ( CLK, D, Reset : in STD_LOGIC;
           Q : out STD_LOGIC);
    END COMPONENT;
    
    signal Not_Load_FF, Load_FF : std_logic;

    signal Q_bit0,  Q_bit1,  Q_bit2,  Q_bit3,  Q_bit4,  Q_bit5,  Q_bit6,  Q_bit7,  Q_bit8,  Q_bit9,  Q_bit10,  Q_bit11,  Q_bit12,  Q_bit13,  Q_bit14,   Q_bit15 : std_logic; 
    signal Q_bit16,  Q_bit17,  Q_bit18,  Q_bit19,  Q_bit20,  Q_bit21,  Q_bit22,  Q_bit23,  Q_bit24,  Q_bit25,  Q_bit26,  Q_bit27,  Q_bit28,  Q_bit29,  Q_bit30,  Q_bit31 : std_logic;  
    
    signal OR_D0, OR_D1, OR_D2, OR_D3 : std_logic;
    signal OR_D4, OR_D5, OR_D6, OR_D7 : std_logic;
    signal   OR_D8,  OR_D9,  OR_D10,  OR_D11,  OR_D12,  OR_D13,  OR_D14,  OR_D15,  OR_D16,  OR_D17,  OR_D18,  OR_D19,  OR_D20,  OR_D21,  OR_D22,  OR_D23,  OR_D24,  OR_D25,  OR_D26,  OR_D27,  OR_D28,  OR_D29,  OR_D30,  OR_D31 : std_logic;

    signal Not_Load_And0, Not_Load_And1, Not_Load_And2, Not_Load_And3 : std_logic;
    signal Not_Load_And4, Not_Load_And5, Not_Load_And6, Not_Load_And7 : std_logic;
    signal Not_Load_And8,  Not_Load_And9,  Not_Load_And10,  Not_Load_And11,  Not_Load_And12,  Not_Load_And13,  Not_Load_And14,  Not_Load_And15,  Not_Load_And16,  Not_Load_And17,  Not_Load_And18,  Not_Load_And19,  Not_Load_And20,  Not_Load_And21,  Not_Load_And22,  Not_Load_And23,  Not_Load_And24,  Not_Load_And25,  Not_Load_And26,  Not_Load_And27,  Not_Load_And28,  Not_Load_And29,  Not_Load_And30,  Not_Load_And31 : std_logic;  
    

    signal Load_And0, Load_And1, Load_And2, Load_And3: std_logic;  
    signal Load_And4, Load_And5, Load_And6, Load_And7: std_logic;  
    signal Load_And8,  Load_And9,  Load_And10,  Load_And11,  Load_And12,  Load_And13,  Load_And14,  Load_And15,  Load_And16,  Load_And17,  Load_And18,  Load_And19,  Load_And20,  Load_And21,  Load_And22,  Load_And23,  Load_And24,  Load_And25,  Load_And26,  Load_And27,  Load_And28,  Load_And29,  Load_And30,  Load_And31 : std_logic; 
    --  Propagation Delay according to StdentID e.g. 26 33 57 25(DEC)
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1

begin

   Not_Load_FF <= not Load after NOT_gate_delay;
   Load_FF <= not Not_Load_FF after NOT_gate_delay;

   -- Instantiate the least significant bit -------------------------
    bit0: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D0, Reset => Reset, Q => Q_bit0);          
    -- Load signal logic   
    Not_Load_And0 <= Q_bit0 and Not_Load_FF after AND_gate_delay;
    OR_D0 <= Not_Load_And0 or Load_And0 after OR_gate_delay;
    Load_And0 <= D(0) and Load_FF after AND_gate_delay;    
    Q(0) <= Q_bit0; 

    

    bit1: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D1, Reset => Reset, Q => Q_bit1);          
    -- Load signal logic   
    Not_Load_And1 <= Q_bit1 and Not_Load_FF after AND_gate_delay;
    OR_D1 <= Not_Load_And1 or Load_And1 after OR_gate_delay;
    Load_And1 <= D(1) and Load_FF after AND_gate_delay;    
    Q(1) <= Q_bit1; 

    

    bit2: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D2, Reset => Reset, Q => Q_bit2);          
    -- Load signal logic   
    Not_Load_And2 <= Q_bit2 and Not_Load_FF after AND_gate_delay;
    OR_D2 <= Not_Load_And2 or Load_And2 after OR_gate_delay;
    Load_And2 <= D(2) and Load_FF after AND_gate_delay;    
    Q(2) <= Q_bit2; 

    

    bit3: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D3, Reset => Reset, Q => Q_bit3);          
    -- Load signal logic   
    Not_Load_And3 <= Q_bit3 and Not_Load_FF after AND_gate_delay;
    OR_D3 <= Not_Load_And3 or Load_And3 after OR_gate_delay;
    Load_And3 <= D(3) and Load_FF after AND_gate_delay;    
    Q(3) <= Q_bit3; 

    

    bit4: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D4, Reset => Reset, Q => Q_bit4);          
    -- Load signal logic   
    Not_Load_And4 <= Q_bit4 and Not_Load_FF after AND_gate_delay;
    OR_D4 <= Not_Load_And4 or Load_And4 after OR_gate_delay;
    Load_And4 <= D(4) and Load_FF after AND_gate_delay;    
    Q(4) <= Q_bit4; 

    

    bit5: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D5, Reset => Reset, Q => Q_bit5);          
    -- Load signal logic   
    Not_Load_And5 <= Q_bit5 and Not_Load_FF after AND_gate_delay;
    OR_D5 <= Not_Load_And5 or Load_And5 after OR_gate_delay;
    Load_And5 <= D(5) and Load_FF after AND_gate_delay;    
    Q(5) <= Q_bit5; 

    

    bit6: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D6, Reset => Reset, Q => Q_bit6);          
    -- Load signal logic   
    Not_Load_And6 <= Q_bit6 and Not_Load_FF after AND_gate_delay;
    OR_D6 <= Not_Load_And6 or Load_And6 after OR_gate_delay;
    Load_And6 <= D(6) and Load_FF after AND_gate_delay;    
    Q(6) <= Q_bit6; 

    

    bit7: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D7, Reset => Reset, Q => Q_bit7);          
    -- Load signal logic   
    Not_Load_And7 <= Q_bit7 and Not_Load_FF after AND_gate_delay;
    OR_D7 <= Not_Load_And7 or Load_And7 after OR_gate_delay;
    Load_And7 <= D(7) and Load_FF after AND_gate_delay;    
    Q(7) <= Q_bit7; 

    

    bit8: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D8, Reset => Reset, Q => Q_bit8);          
    -- Load signal logic   
    Not_Load_And8 <= Q_bit8 and Not_Load_FF after AND_gate_delay;
    OR_D8 <= Not_Load_And8 or Load_And8 after OR_gate_delay;
    Load_And8 <= D(8) and Load_FF after AND_gate_delay;    
    Q(8) <= Q_bit8; 

    

    bit9: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D9, Reset => Reset, Q => Q_bit9);          
    -- Load signal logic   
    Not_Load_And9 <= Q_bit9 and Not_Load_FF after AND_gate_delay;
    OR_D9 <= Not_Load_And9 or Load_And9 after OR_gate_delay;
    Load_And9 <= D(9) and Load_FF after AND_gate_delay;    
    Q(9) <= Q_bit9; 

    

    bit10: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D10, Reset => Reset, Q => Q_bit10);          
    -- Load signal logic   
    Not_Load_And10 <= Q_bit10 and Not_Load_FF after AND_gate_delay;
    OR_D10 <= Not_Load_And10 or Load_And10 after OR_gate_delay;
    Load_And10 <= D(10) and Load_FF after AND_gate_delay;    
    Q(10) <= Q_bit10; 

    

    bit11: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D11, Reset => Reset, Q => Q_bit11);          
    -- Load signal logic   
    Not_Load_And11 <= Q_bit11 and Not_Load_FF after AND_gate_delay;
    OR_D11 <= Not_Load_And11 or Load_And11 after OR_gate_delay;
    Load_And11 <= D(11) and Load_FF after AND_gate_delay;    
    Q(11) <= Q_bit11; 

    

    bit12: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D12, Reset => Reset, Q => Q_bit12);          
    -- Load signal logic   
    Not_Load_And12 <= Q_bit12 and Not_Load_FF after AND_gate_delay;
    OR_D12 <= Not_Load_And12 or Load_And12 after OR_gate_delay;
    Load_And12 <= D(12) and Load_FF after AND_gate_delay;    
    Q(12) <= Q_bit12; 

    

    bit13: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D13, Reset => Reset, Q => Q_bit13);          
    -- Load signal logic   
    Not_Load_And13 <= Q_bit13 and Not_Load_FF after AND_gate_delay;
    OR_D13 <= Not_Load_And13 or Load_And13 after OR_gate_delay;
    Load_And13 <= D(13) and Load_FF after AND_gate_delay;    
    Q(13) <= Q_bit13; 

    

    bit14: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D14, Reset => Reset, Q => Q_bit14);          
    -- Load signal logic   
    Not_Load_And14 <= Q_bit14 and Not_Load_FF after AND_gate_delay;
    OR_D14 <= Not_Load_And14 or Load_And14 after OR_gate_delay;
    Load_And14 <= D(14) and Load_FF after AND_gate_delay;    
    Q(14) <= Q_bit14; 

    

    bit15: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D15, Reset => Reset, Q => Q_bit15);          
    -- Load signal logic   
    Not_Load_And15 <= Q_bit15 and Not_Load_FF after AND_gate_delay;
    OR_D15 <= Not_Load_And15 or Load_And15 after OR_gate_delay;
    Load_And15 <= D(15) and Load_FF after AND_gate_delay;    
    Q(15) <= Q_bit15; 

    

    bit16: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D16, Reset => Reset, Q => Q_bit16);          
    -- Load signal logic   
    Not_Load_And16 <= Q_bit16 and Not_Load_FF after AND_gate_delay;
    OR_D16 <= Not_Load_And16 or Load_And16 after OR_gate_delay;
    Load_And16 <= D(16) and Load_FF after AND_gate_delay;    
    Q(16) <= Q_bit16; 

    

    bit17: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D17, Reset => Reset, Q => Q_bit17);          
    -- Load signal logic   
    Not_Load_And17 <= Q_bit17 and Not_Load_FF after AND_gate_delay;
    OR_D17 <= Not_Load_And17 or Load_And17 after OR_gate_delay;
    Load_And17 <= D(17) and Load_FF after AND_gate_delay;    
    Q(17) <= Q_bit17; 

    

    bit18: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D18, Reset => Reset, Q => Q_bit18);          
    -- Load signal logic   
    Not_Load_And18 <= Q_bit18 and Not_Load_FF after AND_gate_delay;
    OR_D18 <= Not_Load_And18 or Load_And18 after OR_gate_delay;
    Load_And18 <= D(18) and Load_FF after AND_gate_delay;    
    Q(18) <= Q_bit18; 

    

    bit19: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D19, Reset => Reset, Q => Q_bit19);          
    -- Load signal logic   
    Not_Load_And19 <= Q_bit19 and Not_Load_FF after AND_gate_delay;
    OR_D19 <= Not_Load_And19 or Load_And19 after OR_gate_delay;
    Load_And19 <= D(19) and Load_FF after AND_gate_delay;    
    Q(19) <= Q_bit19; 

    

    bit20: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D20, Reset => Reset, Q => Q_bit20);          
    -- Load signal logic   
    Not_Load_And20 <= Q_bit20 and Not_Load_FF after AND_gate_delay;
    OR_D20 <= Not_Load_And20 or Load_And20 after OR_gate_delay;
    Load_And20 <= D(20) and Load_FF after AND_gate_delay;    
    Q(20) <= Q_bit20; 

    

    bit21: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D21, Reset => Reset, Q => Q_bit21);          
    -- Load signal logic   
    Not_Load_And21 <= Q_bit21 and Not_Load_FF after AND_gate_delay;
    OR_D21 <= Not_Load_And21 or Load_And21 after OR_gate_delay;
    Load_And21 <= D(21) and Load_FF after AND_gate_delay;    
    Q(21) <= Q_bit21; 

    

    bit22: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D22, Reset => Reset, Q => Q_bit22);          
    -- Load signal logic   
    Not_Load_And22 <= Q_bit22 and Not_Load_FF after AND_gate_delay;
    OR_D22 <= Not_Load_And22 or Load_And22 after OR_gate_delay;
    Load_And22 <= D(22) and Load_FF after AND_gate_delay;    
    Q(22) <= Q_bit22; 

    

    bit23: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D23, Reset => Reset, Q => Q_bit23);          
    -- Load signal logic   
    Not_Load_And23 <= Q_bit23 and Not_Load_FF after AND_gate_delay;
    OR_D23 <= Not_Load_And23 or Load_And23 after OR_gate_delay;
    Load_And23 <= D(23) and Load_FF after AND_gate_delay;    
    Q(23) <= Q_bit23; 

    

    bit24: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D24, Reset => Reset, Q => Q_bit24);          
    -- Load signal logic   
    Not_Load_And24 <= Q_bit24 and Not_Load_FF after AND_gate_delay;
    OR_D24 <= Not_Load_And24 or Load_And24 after OR_gate_delay;
    Load_And24 <= D(24) and Load_FF after AND_gate_delay;    
    Q(24) <= Q_bit24; 

    

    bit25: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D25, Reset => Reset, Q => Q_bit25);          
    -- Load signal logic   
    Not_Load_And25 <= Q_bit25 and Not_Load_FF after AND_gate_delay;
    OR_D25 <= Not_Load_And25 or Load_And25 after OR_gate_delay;
    Load_And25 <= D(25) and Load_FF after AND_gate_delay;    
    Q(25) <= Q_bit25; 

    

    bit26: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D26, Reset => Reset, Q => Q_bit26);          
    -- Load signal logic   
    Not_Load_And26 <= Q_bit26 and Not_Load_FF after AND_gate_delay;
    OR_D26 <= Not_Load_And26 or Load_And26 after OR_gate_delay;
    Load_And26 <= D(26) and Load_FF after AND_gate_delay;    
    Q(26) <= Q_bit26; 

    

    bit27: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D27, Reset => Reset, Q => Q_bit27);          
    -- Load signal logic   
    Not_Load_And27 <= Q_bit27 and Not_Load_FF after AND_gate_delay;
    OR_D27 <= Not_Load_And27 or Load_And27 after OR_gate_delay;
    Load_And27 <= D(27) and Load_FF after AND_gate_delay;    
    Q(27) <= Q_bit27; 

    

    bit28: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D28, Reset => Reset, Q => Q_bit28);          
    -- Load signal logic   
    Not_Load_And28 <= Q_bit28 and Not_Load_FF after AND_gate_delay;
    OR_D28 <= Not_Load_And28 or Load_And28 after OR_gate_delay;
    Load_And28 <= D(28) and Load_FF after AND_gate_delay;    
    Q(28) <= Q_bit28; 

    

    bit29: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D29, Reset => Reset, Q => Q_bit29);          
    -- Load signal logic   
    Not_Load_And29 <= Q_bit29 and Not_Load_FF after AND_gate_delay;
    OR_D29 <= Not_Load_And29 or Load_And29 after OR_gate_delay;
    Load_And29 <= D(29) and Load_FF after AND_gate_delay;    
    Q(29) <= Q_bit29; 

    

    bit30: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D30, Reset => Reset, Q => Q_bit30);          
    -- Load signal logic   
    Not_Load_And30 <= Q_bit30 and Not_Load_FF after AND_gate_delay;
    OR_D30 <= Not_Load_And30 or Load_And30 after OR_gate_delay;
    Load_And30 <= D(30) and Load_FF after AND_gate_delay;    
    Q(30) <= Q_bit30; 

    

    bit31: RF_DFlipFlop_22336157 PORT MAP (
            CLK => CLK, D => OR_D31, Reset => Reset, Q => Q_bit31);          
    -- Load signal logic   
    Not_Load_And31 <= Q_bit31 and Not_Load_FF after AND_gate_delay;
    OR_D31 <= Not_Load_And31 or Load_And31 after OR_gate_delay;
    Load_And31 <= D(31) and Load_FF after AND_gate_delay;    
    Q(31) <= Q_bit31;
   
end Behavioral;
