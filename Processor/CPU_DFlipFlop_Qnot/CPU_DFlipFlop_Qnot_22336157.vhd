----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 15:35:16
-- Design Name: 
-- Module Name: CPU_DFlipFlop_Qnot - Behavioral
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

entity CPU_DFlipFlop_Qnot is
    Port (
        Clock, D, Reset : in STD_LOGIC;   -- single select bit
        Q_not, Q  : out STD_LOGIC  -- 17-bit output
    );
end CPU_DFlipFlop_Qnot;

architecture Behavioral of CPU_DFlipFlop_Qnot is
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   signal Z, R0, R, Reset_not, L, Y0, Y, X0, K, S0, S, M, Q_t0, Q_not_t0, Q_t, Q_not_t, Q_not_signal : STD_LOGIC;
begin
    -- Proper order of assignments based on signal dependencies:
    
    -- Calculate Reset_not (inverted Reset signal)
    Reset_not <= not Reset after NOT_gate_delay;
    
    -- Calculate intermediate signals for logic
    Z <= Clock and S after AND_gate_delay;  -- Z depends on Clock and S
    R0 <= Z and Y after AND_gate_delay;     -- R0 depends on Z and Y
    R <= not R0 after NOT_gate_delay;       -- R is the inversion of R0
    
    L <= R and D after AND_gate_delay;      -- L depends on R and D
    Y0 <= L and Reset_not after AND_gate_delay; -- Y0 depends on L and Reset_not
    Y <= not Y0 after NOT_gate_delay;       -- Y is the inversion of Y0
    
    -- Calculate more intermediate signals
    X0 <= Y and S after AND_gate_delay;     -- X0 depends on Y and S
    K <= X0 and Clock after AND_gate_delay; -- K depends on X0 and Clock
    
    S0 <= K and Reset_not after AND_gate_delay; -- S0 depends on K and Reset_not
    S <= not S0 after NOT_gate_delay;      -- S is the inversion of S0
    
    -- Calculate Q_t0 and Q_not_t0 based on Q_not_signal and other signals
    Q_t0 <= S and Q_not_signal after AND_gate_delay; -- Q_t0 depends on S and Q_not_signal
    Q_t <= Q_t0 after NOT_gate_delay;       -- Q_t is the same as Q_t0 (no inversion)
    
    Q_not_signal <= not Q_t0 after NOT_gate_delay; -- Q_not_signal is the inversion of Q_t0
    
    -- Calculate M and Q_not_t0 based on Q_t and R
    M <= Q_t and R after AND_gate_delay;    -- M depends on Q_t and R
    Q_not_t0 <= M and Reset_not after AND_gate_delay; -- Q_not_t0 depends on M and Reset_not
    Q_not_t <= not Q_not_t0 after NOT_gate_delay; -- Q_not_t is the inversion of Q_not_t0
    
    -- Final outputs
    Q <= Q_t;                              -- Q is directly assigned from Q_t
    Q_not <= Q_not_t;                 -- Q_not
end Behavioral;
