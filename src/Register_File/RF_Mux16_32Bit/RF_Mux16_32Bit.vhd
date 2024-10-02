----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: RF_Mux16_32Bit - Behavioral
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

entity RF_Mux16_32Bit is
    Port (
        I0, I1, I2 : in STD_LOGIC_VECTOR(31 downto 0);    -- 32-bit inputs
        S0, S1 : in STD_LOGIC;                            -- Selection signals
        Y : out STD_LOGIC_VECTOR(31 downto 0)             -- 32-bit output
    );
end Mux3_32Bit;

architecture Structural of RF_Mux16_32Bit is

    -- Component declaration for the 3-to-1 1-bit multiplexer
    component RF_Mux16_32Bit is
        Port (
            I0, I1, I2 : in STD_LOGIC;
            S0, S1 : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

begin
    -- Generate 32 instances of Mux_3_to_1
    gen_mux: for i in 0 to 31 generate
        MuxInst: Mux16_1Bit
        port map (
            I0 => I0(i),          -- ith bit of input I0
            I1 => I1(i),          -- ith bit of input I1
            I2 => I2(i),          -- ith bit of input I2
            S0 => S0,             -- Selection signal S0
            S1 => S1,             -- Selection signal S1
            Y  => Y(i)            -- ith bit of output Y
        );
    end generate gen_mux;

end Structural;
