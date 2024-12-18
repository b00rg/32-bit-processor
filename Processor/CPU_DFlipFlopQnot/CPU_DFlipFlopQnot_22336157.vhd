----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 16:28:51
-- Design Name: 
-- Module Name: CPU_DFlipFlop_Qnot_22336157 - Behavioral
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

entity CPU_DFlipFlop_Qnot_22336157 is
    Port (Clock : in std_logic;
          D : in std_logic;
          Reset : in std_logic; 
          Q : out std_logic;
          Q_not : out std_logic  );
end CPU_DFlipFlop_Qnot_22336157;

architecture Behavioral of CPU_DFlipFlop_Qnot_22336157 is

   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   
   signal X, Z, R0, R, Reset_not, L, Y0, Y, X0, K, S0 ,S, M, Q_t, Q_not_t, Q_t0, Q_not_t0  : std_logic; 
begin

    Z <= Clock AND S after AND_GATE_DELAY;
    R0 <= Z AND Y after AND_GATE_DELAY;
    R <= NOT R0 after NOT_GATE_DELAY; 
    
    L <= R AND D after AND_GATE_DELAY; 
    Reset_not <= NOT Reset after NOT_GATE_DELAY;
    Y0 <= L AND Reset_not after AND_GATE_DELAY;
    Y <= NOT Y0 after NOT_GATE_DELAY; 
    X0 <= S AND Y after AND_GATE_DELAY;
    X <= NOT X0 after NOT_GATE_DELAY;
    K <= X AND Clock after AND_GATE_DELAY;
    S0 <= K AND Reset_Not after AND_GATE_DELAY;
    S <= NOT S0 after NOT_GATE_DELAY;
    M <= R AND Q_t after AND_GATE_DELAY;
    Q_t0 <= S AND Q_not_t after AND_GATE_DELAY;
    Q_t <= NOT Q_t0 after NOT_GATE_DELAY;
    Q_not_t0 <= M AND Reset_Not after AND_GATE_DELAY;
    Q_not_t <= NOT Q_not_t0 after NOT_GATE_DELAY;
    
    Q_not <= Q_not_t;
    Q <= Q_t;

end Behavioral;
