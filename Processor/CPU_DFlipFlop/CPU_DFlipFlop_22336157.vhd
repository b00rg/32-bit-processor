----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 16.12.2024 15:35:16
-- Design Name: 
-- Module Name: CPU_DFlipFlop_22336157 - Behavioral
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

entity CPU_DFlipFlop_22336157 is
    Port (
        Clock, D, Reset : in STD_LOGIC;   -- single select bit
        Q  : out STD_LOGIC  -- 17-bit output
    );
end CPU_DFlipFlop_22336157;

architecture Behavioral of CPU_DFlipFlop_22336157 is
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   signal Z, R0, R, Reset_not, L, Y0, Y, X0, K, S0, S, M, Q_t0, Q_not_t0, Q_t, Q_not_t, Q_not_t0_Negated : STD_LOGIC;
begin
    Reset_not <= not Reset after NOT_gate_delay;
    Z <= Clock and S after AND_gate_delay;  
    R0 <= Z and Y after AND_gate_delay;    
    R <= not R0 after NOT_gate_delay;   
    L <= R and D after AND_gate_delay;     
    Y0 <= L and Reset_not after AND_gate_delay; 
    Y <= not Y0 after NOT_gate_delay; 
    X0 <= Y and S after AND_gate_delay;   
    K <= X0 and Clock after AND_gate_delay;
    S0 <= K and Reset_not after AND_gate_delay;
    S <= not S0 after NOT_gate_delay;  
    Q_not_t0 <= M and Reset_not after AND_gate_delay; 
    M <= Q_t and R after AND_gate_delay;   
    Q_t0 <= S and Q_not_t0_Negated after AND_gate_delay; 
    Q_not_t0_Negated <= not Q_not_t0 after NOT_gate_delay; 
    Q_t <= not Q_t0 after NOT_gate_delay;
    Q <= Q_t;                
end Behavioral;
