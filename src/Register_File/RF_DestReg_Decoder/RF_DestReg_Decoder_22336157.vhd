----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 18:06:29
-- Design Name: 
-- Module Name: RF_DestReg_Decoder_22336157 - Behavioral
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

entity RF_DestReg_Decoder_22336157 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out STD_LOGIC);
end RF_DestReg_Decoder_22336157;

architecture Behavioral of RF_DestReg_Decoder_22336157 is

    signal A0_not, A1_not, A2_not : std_logic;
    signal S0, S1, S2, S3 : std_logic;
    
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

     A0_not <= not A(0) after NOT_gate_delay;
     A1_not <= not A(1) after NOT_gate_delay;
     A2_not <= not A(2) after NOT_gate_delay;


     S0 <= A2_not and A1_not after AND_gate_delay;
     S1 <= A2_not and A(1) after AND_gate_delay;
     S2 <= A(2) and A1_not after AND_gate_delay;
     S3 <= A(2) and A(1) after AND_gate_delay;
 
     Q0 <= S0 and A0_not after AND_gate_delay;
     Q1 <= S0 and A(0) after AND_gate_delay;

     Q2 <= S1 and A0_not after AND_gate_delay;
     Q3 <= S1 and A(0) after AND_gate_delay;
     
     Q4 <= S2 and A0_not after AND_gate_delay;
     Q5 <= S2 and A(0) after AND_gate_delay;
     
     Q6 <= S3 and A0_not after AND_gate_delay;     
     Q7 <= S3 and A(0) after AND_gate_delay;

end Behavioral;
