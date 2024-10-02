----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Mux3_32Bit - Behavioral
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

entity Mux3_32Bit is
    Port (
        I0, I1, I2 : in STD_LOGIC_VECTOR(31 downto 0);    -- 32-bit inputs
        S0, S1 : in STD_LOGIC;                            -- Selection signals
        Y : out STD_LOGIC_VECTOR(31 downto 0)             -- 32-bit output
    );
end Mux3_32Bit;

architecture Structural of RF_Mux3_32Bit is

    -- Component declaration for the 3-to-1 1-bit multiplexer
    component Mux3_1Bit is
        Port (
            I0, I1, I2 : in STD_LOGIC;
            S0, S1 : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

begin
 -- Invert the selection signals
    S0_not <= not S0 after 3 ns;
    S1_not <= not S1 after 3 ns;
    S2_not <= not S2 after 3 ns;
    S3_not <= not S3 after 3 ns;

    -- AND gates to choose the correct input
    and0  <= I0  and S0_not and S1_not and S2_not and S3_not after 4 ns; 
    and1  <= I1  and S0 and S1_not and S2_not and S3_not after 4 ns;
    and2  <= I2  and S0_not and S1 and S2_not and S3_not after 4 ns;
    and3  <= I3  and S0 and S1 and S2_not and S3_not after 4 ns;
    and4  <= I4  and S0_not and S1_not and S2 and S3_not after 4 ns;
    and5  <= I5  and S0 and S1_not and S2 and S3_not after 4 ns;
    and6  <= I6  and S0_not and S1 and S2 and S3_not after 4 ns;
    and7  <= I7  and S0 and S1 and S2 and S3_not after 4 ns;
    and8  <= I8  and S0_not and S1_not and S2_not and S3 after 4 ns; 
    and9  <= I9  and S0 and S1_not and S2_not and S3 after 4 ns;
    and10 <= I10 and S0_not and S1 and S2_not and S3 after 4 ns;
    and11 <= I11 and S0 and S1 and S2_not and S3 after 4 ns;
    and12 <= I12 and S0_not and S1_not and S2 and S3 after 4 ns;
    and13 <= I13 and S0 and S1_not and S2 and S3 after 4 ns;
    and14 <= I14 and S0_not and S1 and S2 and S3 after 4 ns;
    and15 <= I15 and S0 and S1 and S2 and S3 after 4 ns;

    -- OR the AND gates to produce the final output
    Y <= and0 or and1 or and2 or and3 or and4 or and5 or and6 or and7 or 
         and8 or and9 or and10 or and11 or and12 or and13 or and14 or and15 after 2 ns;
end Behavioral;

