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

architecture Behavioral of CPU_DFlipFlop_Qnot is
   constant AND_gate_delay : Time := 8ns;      
   constant NAND_gate_delay : Time := 6ns;     
   constant OR_gate_delay : Time := 2ns;       
   constant NOR_gate_delay : Time := 7ns;      
   constant XOR_gate_delay : Time := 4ns;      
   constant XNOR_gate_delay : Time := 4ns;     
   constant NOT_gate_delay : Time := 3ns;      
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   
   signal Z, R0, R, Reset_not, L, Y0, Y, X0, K, S0, S, M, Q_t0, Q_not_t0, Q_t, Q_not_t, Q_not_signal : STD_LOGIC;
begin
    Z <= Clock and S; 
    R0 <= Z and Y;
    R <= not R0;
    Reset_not <= not Reset; 
    L <= R and D;
    
    Y0 <= L and Reset_not;
    Y <= not Y0;
    X0 <= Y and S;
    K <= X0 and Clock;
    
    S0 <= K and Reset_not;
    S <= not S0; 
    Q_t0 <= S and Q_not_signal;
    Q_t <= Q_t0;
    Q_not_signal <= not Q_t0; 
    M <= Q_t and R;
    Q_not_t0 <= M and Reset_not;
    Q_not_t <= not Q_not_t0;
    Q <= Q_t;
    Q_not <= Q_not_signal;  -- Drive Q_not from Q_not_signal
end Behavioral;
