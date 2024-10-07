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
        I0 : in STD_LOGIC;
        I1 : in STD_LOGIC;
        I2 : in STD_LOGIC;
        I3 : in STD_LOGIC;
        I4 : in STD_LOGIC;
        I5 : in STD_LOGIC;
        I6 : in STD_LOGIC;
        I7 : in STD_LOGIC;
        I8 : in STD_LOGIC;
        I9 : in STD_LOGIC;
        I10 : in STD_LOGIC;
        I11 : in STD_LOGIC;
        I12 : in STD_LOGIC;
        I13 : in STD_LOGIC;
        I14 : in STD_LOGIC;
        I15 : in STD_LOGIC;
        I16 : in STD_LOGIC;
        I17 : in STD_LOGIC;
        I18 : in STD_LOGIC;
        I19 : in STD_LOGIC;
        I20 : in STD_LOGIC;
        I21 : in STD_LOGIC;
        I22 : in STD_LOGIC;
        I23 : in STD_LOGIC;
        I24 : in STD_LOGIC;
        I25 : in STD_LOGIC;
        I26 : in STD_LOGIC;
        I27 : in STD_LOGIC;
        I28 : in STD_LOGIC;
        I29 : in STD_LOGIC;
        I30 : in STD_LOGIC;
        I31 : in STD_LOGIC;
        
        S0 : in STD_LOGIC;
        S1 : in STD_LOGIC;
        S2 : in STD_LOGIC;
        S3 : in STD_LOGIC;
        S4 : in STD_LOGIC;
        
        Y : out STD_LOGIC
    );
end RF_Mux32_1Bit;

architecture Behavioral of RF_Mux32_1Bit is

    -- Intermediate signals for AND gates
    signal and_g : STD_LOGIC_Vector(31 downto 0);
    signal S_not : STD_Logic_Vector(4 downto 0);
    
    -- Propagation Delay
    constant AND_gate_delay : time := 8 ns;
    constant OR_gate_delay : time := 2 ns;
    constant NOT_gate_delay : Time := 3 ns;
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin

    -- Invert the selection signals
    S_not0 <= not S0 after NOT_gate_delay;
    S_not1 <= not S1 after NOT_gate_delay;
    S_not2 <= not S2 after NOT_gate_delay;
    S_not3 <= not S3 after NOT_gate_delay;
    S_not4 <= not S4 after NOT_gate_delay;
    -- AND gates for the selection of inputs

    -- AND gates for the selection of inputs
-- AND gates for the selection of inputs
    and_g(0)  <= I0   and S_not(0)   and S_not(1) and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay; -- I0
    and_g(1)  <= I1   and S0         and S_not(1) and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay; -- I1
    and_g(2)  <= I2   and S_not(0)   and S0       and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay; -- I2
    and_g(3)  <= I3   and S0         and S0       and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay; -- I3

    and_g(4)  <= I4   and S_not(0)   and S_not(1) and S2       and S_not(3) and S_not(4) after AND_gate_delay; -- I4
    and_g(5)  <= I5   and S0         and S_not(1) and S2       and S_not(3) and S_not(4) after AND_gate_delay; -- I5
    and_g(6)  <= I6   and S_not(0)   and S0       and S2       and S_not(3) and S_not(4) after AND_gate_delay; -- I6
    and_g(7)  <= I7   and S0         and S0       and S2       and S_not(3) and S_not(4) after AND_gate_delay; -- I7

    and_g(8)  <= I8   and S_not(0)   and S_not(1) and S_not(2) and S3       and S_not(4) after AND_gate_delay; -- I8
    and_g(9)  <= I9   and S0         and S_not(1) and S_not(2) and S3       and S_not(4) after AND_gate_delay; -- I9
    and_g(10) <= I10  and S_not(0)   and S0       and S_not(2) and S3       and S_not(4) after AND_gate_delay; -- I10
    and_g(11) <= I11  and S0         and S0       and S_not(2) and S3       and S_not(4) after AND_gate_delay; -- I11

    and_g(12) <= I12  and S_not(0)   and S_not(1) and S2       and S3       and S_not(4) after AND_gate_delay; -- I12
    and_g(13) <= I13  and S0         and S_not(1) and S2       and S3       and S_not(4) after AND_gate_delay; -- I13
    and_g(14) <= I14  and S_not(0)   and S0       and S2       and S3       and S_not(4) after AND_gate_delay; -- I14
    and_g(15) <= I15  and S0         and S0       and S2       and S3       and S_not(4) after AND_gate_delay; -- I15

    and_g(16) <= I16  and S_not(0)   and S_not(1) and S_not(2) and S_not(3) and S4 after AND_gate_delay; -- I16
    and_g(17) <= I17  and S0         and S_not(1) and S_not(2) and S_not(3) and S4 after AND_gate_delay; -- I17
    and_g(18) <= I18  and S_not(0)   and S0       and S_not(2) and S_not(3) and S4 after AND_gate_delay; -- I18
    and_g(19) <= I19  and S0         and S0       and S_not(2) and S_not(3) and S4 after AND_gate_delay; -- I19

    and_g(20) <= I20  and S_not(0)   and S_not(1) and S2       and S_not(3) and S4 after AND_gate_delay; -- I20
    and_g(21) <= I21  and S0         and S_not(1) and S2       and S_not(3) and S4 after AND_gate_delay; -- I21
    and_g(22) <= I22  and S_not(0)   and S0       and S2       and S_not(3) and S4 after AND_gate_delay; -- I22
    and_g(23) <= I23  and S0         and S0       and S2       and S_not(3) and S4 after AND_gate_delay; -- I23

    and_g(24) <= I24  and S_not(0)   and S_not(1) and S_not(2) and S3       and S4 after AND_gate_delay; -- I24
    and_g(25) <= I25  and S0         and S_not(1) and S_not(2) and S3       and S4 after AND_gate_delay; -- I25
    and_g(26) <= I26  and S_not(0)   and S0       and S_not(2) and S3       and S4 after AND_gate_delay; -- I26
    and_g(27) <= I27  and S0         and S0       and S_not(2) and S3       and S4 after AND_gate_delay; -- I27

    and_g(28) <= I28  and S_not(0)   and S_not(1) and S2       and S3       and S4 after AND_gate_delay; -- I28
    and_g(29) <= I29  and S0         and S_not(1) and S2       and S3       and S4 after AND_gate_delay; -- I29
    and_g(30) <= I30  and S_not(0)   and S0       and S2       and S3       and S4 after AND_gate_delay; -- I30
    and_g(31) <= I31  and S0         and S0       and S2       and S3       and S4 after AND_gate_delay; -- I31

    -- OR gate logic
    Y <= and_g(0) or and_g(1) or and_g(2) or and_g(3+----------------------------------------------------------------------------------
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
        I0 : in STD_LOGIC;
        I1 : in STD_LOGIC;
        I2 : in STD_LOGIC;
        I3 : in STD_LOGIC;
        I4 : in STD_LOGIC;
        I5 : in STD_LOGIC;
        I6 : in STD_LOGIC;
        I7 : in STD_LOGIC;
        I8 : in STD_LOGIC;
        I9 : in STD_LOGIC;
        I10 : in STD_LOGIC;
        I11 : in STD_LOGIC;
        I12 : in STD_LOGIC;
        I13 : in STD_LOGIC;
        I14 : in STD_LOGIC;
        I15 : in STD_LOGIC;
        I16 : in STD_LOGIC;
        I17 : in STD_LOGIC;
        I18 : in STD_LOGIC;
        I19 : in STD_LOGIC;
        I20 : in STD_LOGIC;
        I21 : in STD_LOGIC;
        I22 : in STD_LOGIC;
        I23 : in STD_LOGIC;
        I24 : in STD_LOGIC;
        I25 : in STD_LOGIC;
        I26 : in STD_LOGIC;
        I27 : in STD_LOGIC;
        I28 : in STD_LOGIC;
        I29 : in STD_LOGIC;
        I30 : in STD_LOGIC;
        I31 : in STD_LOGIC;
        
        S0 : in STD_LOGIC;
        S1 : in STD_LOGIC;
        S2 : in STD_LOGIC;
        S3 : in STD_LOGIC;
        S4 : in STD_LOGIC;
        
        Y : out STD_LOGIC
    );

architecture Behavioral of RF_Mux32_1Bit is

    -- Intermediate signals for AND gates
    signal and_g : STD_LOGIC_Vector(31 downto 0);
    signal S_not : STD_Logic_Vector(4 downto 0);
    
    -- Propagation Delay
    constant AND_gate_delay : time := 8 ns;
    constant OR_gate_delay : time := 2 ns;
    constant NOT_gate_delay : Time := 3 ns;
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin

    -- Invert the selection signals
    S_not0 <= not S0 after NOT_gate_delay;
    S_not1 <= not S1 after NOT_gate_delay;
    S_not2 <= not S2 after NOT_gate_delay;
    S_not3 <= not S3 after NOT_gate_delay;
    S_not4 <= not S4 after NOT_gate_delay;
    -- AND gates for the selection of inputs

    -- AND gates for the selection of inputs
-- AND gates for the selection of inputs
    and_g(0)  <= I0   and S_not(0)   and S_not(1) and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay; -- I0
    and_g(1)  <= I1   and S0         and S_not(1) and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay; -- I1
    and_g(2)  <= I2   and S_not(0)   and S0       and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay; -- I2
    and_g(3)  <= I3   and S0         and S0       and S_not(2) and S_not(3) and S_not(4) after AND_gate_delay; -- I3

    and_g(4)  <= I4   and S_not(0)   and S_not(1) and S2       and S_not(3) and S_not(4) after AND_gate_delay; -- I4
    and_g(5)  <= I5   and S0         and S_not(1) and S2       and S_not(3) and S_not(4) after AND_gate_delay; -- I5
    and_g(6)  <= I6   and S_not(0)   and S0       and S2       and S_not(3) and S_not(4) after AND_gate_delay; -- I6
    and_g(7)  <= I7   and S0         and S0       and S2       and S_not(3) and S_not(4) after AND_gate_delay; -- I7

    and_g(8)  <= I8   and S_not(0)   and S_not(1) and S_not(2) and S3       and S_not(4) after AND_gate_delay; -- I8
    and_g(9)  <= I9   and S0         and S_not(1) and S_not(2) and S3       and S_not(4) after AND_gate_delay; -- I9
    and_g(10) <= I10  and S_not(0)   and S0       and S_not(2) and S3       and S_not(4) after AND_gate_delay; -- I10
    and_g(11) <= I11  and S0         and S0       and S_not(2) and S3       and S_not(4) after AND_gate_delay; -- I11

    and_g(12) <= I12  and S_not(0)   and S_not(1) and S2       and S3       and S_not(4) after AND_gate_delay; -- I12
    and_g(13) <= I13  and S0         and S_not(1) and S2       and S3       and S_not(4) after AND_gate_delay; -- I13
    and_g(14) <= I14  and S_not(0)   and S0       and S2       and S3       and S_not(4) after AND_gate_delay; -- I14
    and_g(15) <= I15  and S0         and S0       and S2       and S3       and S_not(4) after AND_gate_delay; -- I15

    and_g(16) <= I16  and S_not(0)   and S_not(1) and S_not(2) and S_not(3) and S4 after AND_gate_delay; -- I16
    and_g(17) <= I17  and S0         and S_not(1) and S_not(2) and S_not(3) and S4 after AND_gate_delay; -- I17
    and_g(18) <= I18  and S_not(0)   and S0       and S_not(2) and S_not(3) and S4 after AND_gate_delay; -- I18
    and_g(19) <= I19  and S0         and S0       and S_not(2) and S_not(3) and S4 after AND_gate_delay; -- I19

    and_g(20) <= I20  and S_not(0)   and S_not(1) and S2       and S_not(3) and S4 after AND_gate_delay; -- I20
    and_g(21) <= I21  and S0         and S_not(1) and S2       and S_not(3) and S4 after AND_gate_delay; -- I21
    and_g(22) <= I22  and S_not(0)   and S0       and S2       and S_not(3) and S4 after AND_gate_delay; -- I22
    and_g(23) <= I23  and S0         and S0       and S2       and S_not(3) and S4 after AND_gate_delay; -- I23

    and_g(24) <= I24  and S_not(0)   and S_not(1) and S_not(2) and S3       and S4 after AND_gate_delay; -- I24
    and_g(25) <= I25  and S0         and S_not(1) and S_not(2) and S3       and S4 after AND_gate_delay; -- I25
    and_g(26) <= I26  and S_not(0)   and S0       and S_not(2) and S3       and S4 after AND_gate_delay; -- I26
    and_g(27) <= I27  and S0         and S0       and S_not(2) and S3       and S4 after AND_gate_delay; -- I27

    and_g(28) <= I28  and S_not(0)   and S_not(1) and S2       and S3       and S4 after AND_gate_delay; -- I28
    and_g(29) <= I29  and S0         and S_not(1) and S2       and S3       and S4 after AND_gate_delay; -- I29
    and_g(30) <= I30  and S_not(0)   and S0       and S2       and S3       and S4 after AND_gate_delay; -- I30
    and_g(31) <= I31  and S0         and S0       and S2       and S3       and S4 after AND_gate_delay; -- I31

    -- OR gate logic
    Y <= and_g(0) or and_g(1) or and_g(2) or and_g(3) or and_g(4) or and_g(5) or and_g(6) or and_g(7) or
         and_g(8) or and_g(9) or and_g(10) or and_g(11) or and_g(12) or and_g(13) or and_g(14) or and_g(15) or
         and_g(16) or and_g(17) or and_g(18) or and_g(19) or and_g(20) or and_g(21) or and_g(22) or and_g(23) or
         and_g(24) or and_g(25) or and_g(26) or and_g(27) or and_g(28) or and_g(29) or and_g(30) or and_g(31) after OR_gate_delay;

end Behavioral;
