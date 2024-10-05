----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 04.10.2024
-- Design Name: 
-- Module Name: Mux32_1Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 32-to-1 Mux
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

----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 04.10.2024
-- Design Name: 
-- Module Name: Mux32_1Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 32-to-1 Mux
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

entity RF_Mux32_1Bit is
    Port ( 
        I : in STD_LOGIC_VECTOR (31 downto 0);   -- 32 1-bit inputs
        S : in STD_LOGIC_VECTOR (4 downto 0);     -- 5 Selection Signals (for 32 inputs)
        Y : out STD_LOGIC                          -- 1-bit output
    );
end RF_Mux32_1Bit;

architecture Behavioral of RF_Mux32_1Bit is
    -- Intermediate signals for AND gates
    signal and_gates : STD_LOGIC_VECTOR (31 downto 0); -- 32 AND gate outputs

    -- Propagation Delay
    constant AND_gate_delay : time := 8 ns;
    constant OR_gate_delay : time := 2 ns;
    constant NOT_gate_delay : Time := 3 ns;
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin
    -- Invert the selection signals
    signal S_not : STD_LOGIC_VECTOR (4 downto 0);
    S_not(0) <= not S(0) after NOT_gate_delay;
    S_not(1) <= not S(1) after NOT_gate_delay;
    S_not(2) <= not S(2) after NOT_gate_delay;
    S_not(3) <= not S(3) after NOT_gate_delay;
    S_not(4) <= not S(4) after NOT_gate_delay;

    -- AND gates for the selection of inputs
    and_gates(0) <= I(0) and S_not(0) and S_not(1) and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay;
    and_gates(1) <= I(1) and S(0) and S_not(1) and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay;
    and_gates(2) <= I(2) and S_not(0) and S(1) and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay;
    and_gates(3) <= I(3) and S(0) and S(1) and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay;
    and_gates(4) <= I(4) and S_not(0) and S_not(1) and S(2) and S_not(3) and S_not(4) after AND_gate_delay;
    and_gates(5) <= I(5) and S(0) and S_not(1) and S(2) and S_not(3) and S_not(4) after AND_gate_delay;
    and_gates(6) <= I(6) and S_not(0) and S(1) and S(2) and S_not(3) and S_not(4) after AND_gate_delay;
    and_gates(7) <= I(7) and S(0) and S(1) and S(2) and S_not(3) and S_not(4) after AND_gate_delay;
    and_gates(8) <= I(8) and S_not(0) and S_not(1) and S(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(9) <= I(9) and S(0) and S_not(1) and S(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(10) <= I(10) and S_not(0) and S(1) and S(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(11) <= I(11) and S(0) and S(1) and S(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(12) <= I(12) and S_not(0) and S_not(1) and S_not(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(13) <= I(13) and S(0) and S_not(1) and S_not(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(14) <= I(14) and S_not(0) and S(1) and S_not(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(15) <= I(15) and S(0) and S(1) and S_not(2) and S(3) and S_not(4) after AND_gate_delay;

    and_gates(16) <= I(16) and S_not(0) and S_not(1) and S(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(17) <= I(17) and S(0) and S_not(1) and S(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(18) <= I(18) and S_not(0) and S(1) and S(2) and S(3) and S_not(4) after AND_gate_delay;
    and_gates(19) <= I(19) and S(0) and S(1) and S(2) and S_not(3) and S_not(4) after AND_gate_delay;

    and_gates(20) <= I(20) and S_not(0) and S_not(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(21) <= I(21) and S(0) and S_not(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(22) <= I(22) and S_not(0) and S(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(23) <= I(23) and S(0) and S(1) and S(2) and S(3) and S(4) after AND_gate_delay;

    and_gates(24) <= I(24) and S_not(0) and S_not(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(25) <= I(25) and S(0) and S_not(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(26) <= I(26) and S_not(0) and S(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(27) <= I(27) and S(0) and S(1) and S(2) and S(3) and S(4) after AND_gate_delay;

    and_gates(28) <= I(28) and S_not(0) and S_not(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(29) <= I(29) and S(0) and S_not(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(30) <= I(30) and S_not(0) and S(1) and S(2) and S(3) and S(4) after AND_gate_delay;
    and_gates(31) <= I(31) and S(0) and S(1) and S(2) and S(3) and S(4) after AND_gate_delay;

    -- OR the AND gates to produce the final output
    Y <= and_gates(0) or and_gates(1) or and_gates(2) or and_gates(3) or and_gates(4) or 
         and_gates(5) or and_gates(6) or and_gates(7) or and_gates(8) or and_gates(9) or 
         and_gates(10) or and_gates(11) or and_gates(12) or and_gates(13) or and_gates(14) or 
         and_gates(15) or and_gates(16) or and_gates(17) or and_gates(18) or and_gates(19) or 
         and_gates(20) or and_gates(21) or and_gates(22) or and_gates(23) or and_gates(24) or 
         and_gates(25) or and_gates(26) or and_gates(27) or and_gates(28) or and_gates(29) or 
         and_gates(30) or and_gates(31) after OR_gate_delay;

end Behavioral;
