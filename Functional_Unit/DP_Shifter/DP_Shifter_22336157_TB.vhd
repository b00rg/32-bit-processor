----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Mux3_1Bit - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DP_Shifter_22336157_TB is
end DP_Shifter_22336157_TB;

architecture Simulation of DP_Shifter_22336157_TB is
    -- Component declaration for the DUT (Device Under Test)
    component DP_Shifter_22336157
        Port ( B : in STD_LOGIC_VECTOR(31 downto 0);
               S1, S2 : in STD_LOGIC;
               G : out STD_LOGIC_VECTOR(31 downto 0);
               C : out STD_LOGIC);
    end component;

    -- Signals to connect to the DUT
    signal B : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal S1, S2 : STD_LOGIC := '0';
    signal G : STD_LOGIC_VECTOR(31 downto 0);
    signal C : STD_LOGIC;

begin
    -- Instantiate the DUT
    UUT: DP_Shifter_22336157
        Port Map ( B => B,
                   S1 => S1,
                   S2 => S2,
                   G => G,
                   C => C);

    -- Test process
    process
    begin
        G <= (others => '0'); 
        -- Test case 1: Initial value
        B <= "00000001010101001101001010011101";  -- Input = 0
        S1 <= '0'; S2 <= '0';  -- No shift
        wait for 10 ns;

        -- Test case 2: Shift left
        S1 <= '1'; S2 <= '0';  -- Shift left
        wait for 10 ns;

        -- Test case 3: Shift right ( should be back to initial value)
        S1 <= '0'; S2 <= '1';  -- Shift right
        wait for 10 ns;

        -- Test case 4: shift right, set C flag
        B <= "11111111111111111111111111111111"; 
        S1 <= '1'; S2 <= '0';  -- Shift left
        wait for 10 ns;

        -- Test case 5: shift left, unset C flag
        S1 <= '0'; S2 <= '1';  -- Shift left
        wait for 10 ns;
        -- Finish simulation
        wait;
    end process;

end Simulation;
