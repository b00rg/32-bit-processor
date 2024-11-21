
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2024 14:58:12
-- Design Name: 
-- Module Name: DP_ShifterCFlagMux2_1Bit_22336157 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DP_ShifterCFlagMux2_1Bit_22336157 is
	Port ( LSB, MSB:  in STD_LOGIC ; 		-- 1 bit inputs
		S1, S2 : in STD_LOGIC; 			-- Selection Signals
		C : out STD_LOGIC ) ;  			-- 1 bit output
end DP_ShifterCFlagMux2_1Bit_22336157;

architecture Behavioral of DP_ShifterCFlagMux2_1Bit_22336157 is
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   
   signal A, B : STD_LOGIC;
begin
    A <= LSB and S1 after AND_GATE_DELAY;
    B <= MSB and S2 after AND_GATE_DELAY;
    C <= A or B after OR_GATE_DELAY; 
end Behavioral;


