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
    Port (Zero : in std_logic;
          Z_Flag : in std_logic;
          V_Flag : in std_logic;
          One : in std_logic;
          C_Flag : in std_logic;
          N_Flag : in std_logic;
          C_Flag_Not : in std_logic;
          Z_Flag_Not : in std_logic;
          MS : in std_logic_vector(2 downto 0);
          CAR : out std_logic
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
   
signal MS0, MS1, MS2, MS3, MS4, MS5, MS6, MS7, MS8, MS9, MS10, MS11, MS12, not_MS_0, not_MS_1,not_MS_2 : std_logic;
signal Zero_MS4, ZFlag_MS5, VFlag_MS6, One_MS7, CFlag_MS8, NFlag_MS9, NotCFlag_MS10, NotZFLag_MS11: std_logic;
signal OR0, OR1,OR2, OR3,OR4, OR5,OR6, OR7 : std_logic;

begin

    not_MS_0 <= NOT MS(0) after NOT_GATE_DELAY;
    not_MS_1 <= NOT MS(0) after NOT_GATE_DELAY;
    not_MS_2 <= NOT MS(0) after NOT_GATE_DELAY; 
    
    MS0 <= not_MS_1  AND not_MS_0 after AND_GATE_DELAY;
    MS1 <= MS(1) AND not_MS_0 after AND_GATE_DELAY;
    MS2 <= not_MS_1 AND MS(0) after AND_GATE_DELAY;
    MS3 <= MS(1) AND MS(0) after AND_GATE_DELAY;
    MS4 <= MS0 AND not_MS_2 after AND_GATE_DELAY;
    MS5 <= MS0 AND MS(2) after AND_GATE_DELAY;
    MS6 <= MS1 AND not_MS_2 after AND_GATE_DELAY;
    MS7 <= MS1 AND MS(2)  after AND_GATE_DELAY;
    MS8 <= MS2 AND not_MS_2 after AND_GATE_DELAY;
    MS9 <= MS2 AND MS(2)  after AND_GATE_DELAY;
    MS10 <= MS3 AND not_MS_2 after AND_GATE_DELAY;
    MS11 <= MS3 AND MS(2) after AND_GATE_DELAY;
    
    Zero_MS4 <= MS4 AND Zero after AND_GATE_DELAY;
    ZFlag_MS5 <= MS5 AND Z_Flag after AND_GATE_DELAY;
    VFlag_MS6 <= MS6 AND V_Flag after AND_GATE_DELAY;
    One_MS7 <= MS7 AND One after AND_GATE_DELAY;
    CFlag_MS8 <= MS8 AND C_Flag after AND_GATE_DELAY;
    NFlag_MS9 <= MS9 AND N_Flag after AND_GATE_DELAY;
    NotCFlag_MS10 <= MS10 AND C_Flag_Not after AND_GATE_DELAY;
    NotZFLag_MS11 <= MS11 AND Z_Flag_Not after AND_GATE_DELAY;
    
    OR0 <= Zero_MS4 OR ZFlag_MS5 after OR_GATE_DELAY;
    OR1 <= VFlag_MS6 OR One_MS7 after OR_GATE_DELAY;
    OR2 <= CFlag_MS8 OR NFlag_MS9  after OR_GATE_DELAY;
    OR3 <= NotCFlag_MS10 OR NotZFLag_MS11 after OR_GATE_DELAY;
    OR4 <= OR0 OR OR1 after OR_GATE_DELAY;
    OR5 <= OR2 OR OR3 after OR_GATE_DELAY;
    OR6 <= OR4 OR OR5 after OR_GATE_DELAY;
    
    CAR <= OR6;

end Behavioral;
