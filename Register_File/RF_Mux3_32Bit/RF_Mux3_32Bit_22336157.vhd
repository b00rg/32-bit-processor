----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
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

entity RF_Mux3_32Bit_22336157 is
    Port (
        I0, I1, I2 : in STD_LOGIC_VECTOR(31 downto 0); -- 32-bit inputs
        S0, S1  : in STD_LOGIC;                        -- Selection Signals
        Y : out STD_LOGIC_Vector(31 downto 0));       -- 32-bit output
end RF_Mux3_32Bit_22336157;

architecture Behavioral of RF_Mux3_32Bit_22336157 is
    -- Component declaration of the 1-bit mux
    component RF_Mux3_1Bit_22336157
        Port (
            I0, I1, I2 : in STD_LOGIC;  -- 1-bit inputs
            S0, S1 : in STD_LOGIC;      -- Selection Signals
            Y : out STD_LOGIC);            -- 1-bit output
    end component;

begin
    -- Instantiate 32 1-bit multiplexers
    mux_instance0: RF_Mux3_1Bit_22336157 Port map (I0 => I0(0), I1 => I1(0), I2 => I2(0), S0 => S0, S1 => S1, Y => Y(0));
    mux_instance1: RF_Mux3_1Bit_22336157 Port map (I0 => I0(1), I1 => I1(1), I2 => I2(1), S0 => S0, S1 => S1, Y => Y(1));
    mux_instance2: RF_Mux3_1Bit_22336157 Port map (I0 => I0(2), I1 => I1(2), I2 => I2(2), S0 => S0, S1 => S1, Y => Y(2));
    mux_instance3: RF_Mux3_1Bit_22336157 Port map (I0 => I0(3), I1 => I1(3), I2 => I2(3), S0 => S0, S1 => S1, Y => Y(3));
    mux_instance4: RF_Mux3_1Bit_22336157 Port map (I0 => I0(4), I1 => I1(4), I2 => I2(4), S0 => S0, S1 => S1, Y => Y(4));
    mux_instance5: RF_Mux3_1Bit_22336157 Port map (I0 => I0(5), I1 => I1(5), I2 => I2(5), S0 => S0, S1 => S1, Y => Y(5));
    mux_instance6: RF_Mux3_1Bit_22336157 Port map (I0 => I0(6), I1 => I1(6), I2 => I2(6), S0 => S0, S1 => S1, Y => Y(6));
    mux_instance7: RF_Mux3_1Bit_22336157 Port map (I0 => I0(7), I1 => I1(7), I2 => I2(7), S0 => S0, S1 => S1, Y => Y(7));
    mux_instance8: RF_Mux3_1Bit_22336157 Port map (I0 => I0(8), I1 => I1(8), I2 => I2(8), S0 => S0, S1 => S1, Y => Y(8));
    mux_instance9: RF_Mux3_1Bit_22336157 Port map (I0 => I0(9), I1 => I1(9), I2 => I2(9), S0 => S0, S1 => S1, Y => Y(9));
    mux_instance10: RF_Mux3_1Bit_22336157 Port map (I0 => I0(10), I1 => I1(10), I2 => I2(10), S0 => S0, S1 => S1, Y => Y(10));
    mux_instance11: RF_Mux3_1Bit_22336157 Port map (I0 => I0(11), I1 => I1(11), I2 => I2(11), S0 => S0, S1 => S1, Y => Y(11));
    mux_instance12: RF_Mux3_1Bit_22336157 Port map (I0 => I0(12), I1 => I1(12), I2 => I2(12), S0 => S0, S1 => S1, Y => Y(12));
    mux_instance13: RF_Mux3_1Bit_22336157 Port map (I0 => I0(13), I1 => I1(13), I2 => I2(13), S0 => S0, S1 => S1, Y => Y(13));
    mux_instance14: RF_Mux3_1Bit_22336157 Port map (I0 => I0(14), I1 => I1(14), I2 => I2(14), S0 => S0, S1 => S1, Y => Y(14));
    mux_instance15: RF_Mux3_1Bit_22336157 Port map (I0 => I0(15), I1 => I1(15), I2 => I2(15), S0 => S0, S1 => S1, Y => Y(15));
    mux_instance16: RF_Mux3_1Bit_22336157 Port map (I0 => I0(16), I1 => I1(16), I2 => I2(16), S0 => S0, S1 => S1, Y => Y(16));
    mux_instance17: RF_Mux3_1Bit_22336157 Port map (I0 => I0(17), I1 => I1(17), I2 => I2(17), S0 => S0, S1 => S1, Y => Y(17));
    mux_instance18: RF_Mux3_1Bit_22336157 Port map (I0 => I0(18), I1 => I1(18), I2 => I2(18), S0 => S0, S1 => S1, Y => Y(18));
    mux_instance19: RF_Mux3_1Bit_22336157 Port map (I0 => I0(19), I1 => I1(19), I2 => I2(19), S0 => S0, S1 => S1, Y => Y(19));
    mux_instance20: RF_Mux3_1Bit_22336157 Port map (I0 => I0(20), I1 => I1(20), I2 => I2(20), S0 => S0, S1 => S1, Y => Y(20));
    mux_instance21: RF_Mux3_1Bit_22336157 Port map (I0 => I0(21), I1 => I1(21), I2 => I2(21), S0 => S0, S1 => S1, Y => Y(21));
    mux_instance22: RF_Mux3_1Bit_22336157 Port map (I0 => I0(22), I1 => I1(22), I2 => I2(22), S0 => S0, S1 => S1, Y => Y(22));
    mux_instance23: RF_Mux3_1Bit_22336157 Port map (I0 => I0(23), I1 => I1(23), I2 => I2(23), S0 => S0, S1 => S1, Y => Y(23));
    mux_instance24: RF_Mux3_1Bit_22336157 Port map (I0 => I0(24), I1 => I1(24), I2 => I2(24), S0 => S0, S1 => S1, Y => Y(24));
    mux_instance25: RF_Mux3_1Bit_22336157 Port map (I0 => I0(25), I1 => I1(25), I2 => I2(25), S0 => S0, S1 => S1, Y => Y(25));
    mux_instance26: RF_Mux3_1Bit_22336157 Port map (I0 => I0(26), I1 => I1(26), I2 => I2(26), S0 => S0, S1 => S1, Y => Y(26));
    mux_instance27: RF_Mux3_1Bit_22336157 Port map (I0 => I0(27), I1 => I1(27), I2 => I2(27), S0 => S0, S1 => S1, Y => Y(27));
    mux_instance28: RF_Mux3_1Bit_22336157 Port map (I0 => I0(28), I1 => I1(28), I2 => I2(28), S0 => S0, S1 => S1, Y => Y(28));
    mux_instance29: RF_Mux3_1Bit_22336157 Port map (I0 => I0(29), I1 => I1(29), I2 => I2(29), S0 => S0, S1 => S1, Y => Y(29));
    mux_instance30: RF_Mux3_1Bit_22336157 Port map (I0 => I0(30), I1 => I1(30), I2 => I2(30), S0 => S0, S1 => S1, Y => Y(30));
    mux_instance31: RF_Mux3_1Bit_22336157 Port map (I0 => I0(31), I1 => I1(31), I2 => I2(31), S0 => S0, S1 => S1, Y => Y(31));

end Behavioral;
