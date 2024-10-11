----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michael Manzke
-- 
-- Create Date: 08.10.2023 15:52:42
-- Design Name: 
-- Module Name: RF_Register8Bit_XXXXXXXX - Behavioral
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
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           Load : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end RF_Register32Bit__22336157;

architecture Behavioral of RF_Register8Bit is
 
    COMPONENT RF_DFlipFlop_22336157
    Port ( CLK, D, Reset : in STD_LOGIC;
           Q : out STD_LOGIC);
    END COMPONENT;
    
    signal Not_Load_FF, Load_FF : std_logic;

    signal Q_bit0, Q_bit1, Q_bit2, Q_bit3 : std_logic;
    signal Q_bit4, Q_bit5, Q_bit6, Q_bit7 : std_logic;
    
    signal OR_D0, OR_D1, OR_D2, OR_D3 : std_logic;
    signal OR_D4, OR_D5, OR_D6, OR_D7 : std_logic;

    signal Not_Load_And0, Not_Load_And1, Not_Load_And2, Not_Load_And3 : std_logic;
    signal Not_Load_And4, Not_Load_And5, Not_Load_And6, Not_Load_And7 : std_logic;
    
    signal Load_And0, Load_And1, Load_And2, Load_And3: std_logic;  
    signal Load_And4, Load_And5, Load_And6, Load_And7: std_logic;  

    --  Propagation Delay according to StdentID e.g. 26 33 57 25(DEC)
    constant AND_gate_delay : Time := 6ns; -- 6 =5+1
    constant NAND_gate_delay : Time := 3ns;-- 3=2+1
    constant OR_gate_delay : Time := 8ns;  -- 8=7+1
    constant NOR_gate_delay : Time := 6ns; -- 6=5+1
    constant XOR_gate_delay : Time := 4ns; -- 4=3+1
    constant XNOR_gate_delay : Time := 4ns;-- 4=3+1
    constant NOT_gate_delay : Time := 7ns; -- 7=6+1

begin

   Not_Load_FF <= not Load after NOT_gate_delay;
   Load_FF <= not Not_Load_FF after NOT_gate_delay;

   -- Instantiate the least significant bit -------------------------
   bit0: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK, D => OR_D0, Reset => Reset, Q => Q_bit0 );
   -- Load signal logic       
   Not_Load_And0 <= Q_bit0 and Not_Load_FF after AND_gate_delay;         
   OR_D0 <= Not_Load_And0 or Load_And0 after OR_gate_delay;
   Load_And0 <= D(0) and Load_FF after AND_gate_delay;         
   Q(0) <= Q_bit0;
   
   -- Instantiate bit 1 ---------------------------------------------
   bit1: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK, D => OR_D1, Reset => Reset, Q => Q_bit1 );
   -- Load signal logic
   Not_Load_And1 <= Q_bit1 and Not_Load_FF after AND_gate_delay;    
   OR_D1 <= Not_Load_And1 or Load_And1 after OR_gate_delay;
   Load_And1 <= D(1) and Load_FF after AND_gate_delay;
   Q(1) <= Q_bit1;
   
   -- Instantiate bit 2 ---------------------------------------------
   bit2: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK, D => OR_D2, Reset => Reset,  Q => Q_bit2);          
   -- Load signal logic   
   Not_Load_And2 <= Q_bit2 and Not_Load_FF after AND_gate_delay;
   OR_D2 <= Not_Load_And2 or Load_And2 after OR_gate_delay;
   Load_And2 <= D(2) and Load_FF after AND_gate_delay;    
   Q(2) <= Q_bit2; 
   
   -- Instantiate bit 3 ---------------------------------------------
   bit3: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK, D => OR_D3, Reset => Reset, Q => Q_bit3);          
   -- Load signal logic   
   Not_Load_And3 <= Q_bit3 and Not_Load_FF after AND_gate_delay;
   OR_D3 <= Not_Load_And3 or Load_And3 after OR_gate_delay;
   Load_And3 <= D(3) and Load_FF after AND_gate_delay;    
   Q(3) <= Q_bit3; 
   
   -- Instantiate bit 4 ---------------------------------------------
   bit4: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK, D => OR_D4, Reset => Reset, Q => Q_bit4);          
   -- Load signal logic   
   Not_Load_And4 <= Q_bit4 and Not_Load_FF after AND_gate_delay;
   OR_D4 <= Not_Load_And4 or Load_And4 after OR_gate_delay;
   Load_And4 <= D(4) and Load_FF after AND_gate_delay;    
   Q(4) <= Q_bit4; 
   
   -- Instantiate bit 5 ---------------------------------------------
   bit5: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK, D => OR_D5, Reset => Reset, Q => Q_bit5);          
   -- Load signal logic   
   Not_Load_And5 <= Q_bit5 and Not_Load_FF after AND_gate_delay;
   OR_D5 <= Not_Load_And5 or Load_And5 after OR_gate_delay;
   Load_And5 <= D(5) and Load_FF after AND_gate_delay;    
   Q(5) <= Q_bit5; 
   
   -- Instantiate bit 6 ---------------------------------------------
   bit6: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK, D => OR_D6, Reset => Reset, Q => Q_bit6);          
   -- Load signal logic   
   Not_Load_And6 <= Q_bit6 and Not_Load_FF after AND_gate_delay;
   OR_D6 <= Not_Load_And6 or Load_And6 after OR_gate_delay;
   Load_And6 <= D(6) and Load_FF after AND_gate_delay;    
   Q(6) <= Q_bit6; 
   
   -- Instantiate the most significant bit
   bit7: RF_DFlipFlop_22336157 PORT MAP (
          CLK => CLK, D => OR_D7, Reset => Reset, Q => Q_bit7);          
   -- Load signal logic   
   Not_Load_And7 <= Q_bit7 and Not_Load_FF after AND_gate_delay;
   OR_D7 <= Not_Load_And7 or Load_And7 after OR_gate_delay;
   Load_And7 <= D(7) and Load_FF after AND_gate_delay;    
   Q(7) <= Q_bit7; 
   
end Behavioral;
