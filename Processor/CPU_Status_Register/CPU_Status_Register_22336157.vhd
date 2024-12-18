----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 18.12.2024 13:44:29
-- Design Name: 
-- Module Name: CPU_Status_Register_22336157 - Behavioral
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

entity CPU_Status_Register_22336157 is
    Port (Clock : in STD_LOGIC;
          Load : in STD_LOGIC;
          Reset_N : in STD_LOGIC;
          N : in STD_LOGIC; 
          Reset_C : in STD_LOGIC;
          C : in STD_LOGIC;
          Reset_V : in STD_LOGIC;
          V : in STD_LOGIC;
          Reset_Z : in STD_LOGIC;
          Z : in STD_LOGIC;
          StatusOut : out STD_LOGIC_vector(3 downto 0));
end CPU_Status_Register_22336157;

architecture Behavioral of CPU_Status_Register_22336157 is

component CPU_JKFlipFlop_22336157 is
    Port (K : in STD_LOGIC;
          J : in STD_LOGIC;
          Clock : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Q : out STD_LOGIC;
          Q_not : out STD_LOGIC );
end component;
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   
Signal Load_C, Load_Z, Load_V, Load_N : STD_LOGIC;


begin
JKFLipFlop_C : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => Load_C,
                K => '0',
                Reset => Reset_C,
                Q => StatusOut(0)
                
            );
JKFLipFlop_V : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => Load_V,
                K => '0',
                Reset => Reset_V,
                Q => StatusOut(1)
           
            );
JKFLipFlop_Z : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => Load_Z,
                K => '0',
                Reset => Reset_Z,
                Q => StatusOut(3)
               
            );
JKFLipFlop_N : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => Load_N,
                K => '0',
                Reset => Reset_N,
                Q => StatusOut(2)
           
            );

Load_C <= Load AND C after AND_GATE_DELAY; 
Load_Z <= Load AND Z after AND_GATE_DELAY; 
Load_V <= Load AND V after AND_GATE_DELAY; 
Load_N <= Load AND N after AND_GATE_DELAY; 



end Behavioral;
