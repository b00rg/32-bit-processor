----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 14:49:20
-- Design Name: 
-- Module Name: CPU_SMux_22336157 - Behavioral
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

entity CPU_SMux_22336157 is
    Port (Zero : in STD_LOGIC;
          Z_Flag : in STD_LOGIC;
          V_Flag : in STD_LOGIC;
          One : in STD_LOGIC;
          C_Flag : in STD_LOGIC;
          N_Flag : in STD_LOGIC;
          C_Flag_Not : in STD_LOGIC;
          Z_Flag_Not : in STD_LOGIC;
          MS : in STD_LOGIC_vector(2 downto 0);
          CAR : out STD_LOGIC
             );
end CPU_SMux_22336157;

architecture Behavioral of CPU_SMux_22336157 is

   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   
signal MS_0, MS_1, MS_2, MS_3, MS_4, MS_5, MS_6, MS_7, MS_8, MS_9, MS_10, MS_11, MS_12, not_MS_0, not_MS_1,not_MS_2 : STD_LOGIC;
signal Zero_MS_4, ZFlag_MS_5, VFlag_MS_6, One_MS_7, CFlag_MS_8, NFlag_MS_9, NotCFlag_MS_10, NotZFLag_MS_11: STD_LOGIC;
signal OR_0, OR_1,OR_2, OR_3,OR_4, OR_5,OR_6, OR_7 : STD_LOGIC;

begin

    not_MS_0 <= NOT MS(0) after NOT_GATE_DELAY;
    not_MS_1 <= NOT MS(0) after NOT_GATE_DELAY;
    not_MS_2 <= NOT MS(0) after NOT_GATE_DELAY; 
    
    MS_0 <= not_MS_1  AND not_MS_0 after AND_GATE_DELAY;
    MS_1 <= MS(1) AND not_MS_0 after AND_GATE_DELAY;
    MS_2 <= not_MS_1 AND MS(0) after AND_GATE_DELAY;
    MS_3 <= MS(1) AND MS(0) after AND_GATE_DELAY;
    MS_4 <= MS_0 AND not_MS_2 after AND_GATE_DELAY;
    MS_5 <= MS_0 AND MS(2) after AND_GATE_DELAY;
    MS_6 <= MS_1 AND not_MS_2 after AND_GATE_DELAY;
    MS_7 <= MS_1 AND MS(2)  after AND_GATE_DELAY;
    MS_8 <= MS_2 AND not_MS_2 after AND_GATE_DELAY;
    MS_9 <= MS_2 AND MS(2)  after AND_GATE_DELAY;
    MS_10 <= MS_3 AND not_MS_2 after AND_GATE_DELAY;
    MS_11 <= MS_3 AND MS(2) after AND_GATE_DELAY;
    
    Zero_MS_4 <= MS_4 AND Zero after AND_GATE_DELAY;
    ZFlag_MS_5 <= MS_5 AND Z_Flag after AND_GATE_DELAY;
    VFlag_MS_6 <= MS_6 AND V_Flag after AND_GATE_DELAY;
    One_MS_7 <= MS_7 AND One after AND_GATE_DELAY;
    CFlag_MS_8 <= MS_8 AND C_Flag after AND_GATE_DELAY;
    NFlag_MS_9 <= MS_9 AND N_Flag after AND_GATE_DELAY;
    NotCFlag_MS_10 <= MS_10 AND C_Flag_Not after AND_GATE_DELAY;
    NotZFLag_MS_11 <= MS_11 AND Z_Flag_Not after AND_GATE_DELAY;
    
    OR_0 <= Zero_MS_4 OR ZFlag_MS_5 after OR_GATE_DELAY;
    OR_1 <= VFlag_MS_6 OR One_MS_7 after OR_GATE_DELAY;
    OR_2 <= CFlag_MS_8 OR NFlag_MS_9  after OR_GATE_DELAY;
    OR_3 <= NotCFlag_MS_10 OR NotZFLag_MS_11 after OR_GATE_DELAY;
    OR_4 <= OR_0 OR OR_1 after OR_GATE_DELAY;
    OR_5 <= OR_2 OR OR_3 after OR_GATE_DELAY;
    OR_6 <= OR_4 OR OR_5 after OR_GATE_DELAY;
    
    CAR <= OR_6;

end Behavioral;
