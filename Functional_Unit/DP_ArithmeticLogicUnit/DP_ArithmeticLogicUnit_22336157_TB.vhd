----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: DP_ArithmeticLogicUnit_22336157_TB - Simulation
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

entity DP_ArithmeticLogicUnit_22336157_TB is
end DP_ArithmeticLogicUnit_22336157_TB;

architecture Simulation of DP_ArithmeticLogicUnit_22336157_TB is

    -- Test signals
    signal A, B, G : STD_LOGIC_VECTOR(31 downto 0);
    signal S0, S1, S2, C_IN : STD_LOGIC;
    signal C, V : STD_LOGIC;

    -- Instantiate the DP_ArithmeticLogicUnit_22336157 unit under test (UUT)
    component DP_ArithmeticLogicUnit_22336157
        Port ( 
            A, B : in STD_LOGIC_VECTOR(31 downto 0);
            S0, S1, S2, C_IN : in STD_LOGIC;
            G : out STD_LOGIC_VECTOR(31 downto 0);
            C, V : out STD_LOGIC
        );
    end component;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: DP_ArithmeticLogicUnit_22336157 Port map (
        A => A,
        B => B,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        C_IN => C_IN,
        G => G,
        C => C,
        V => V
    );
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
    -- Test process
    stim_proc: process
    begin
        -- Initialize Inputs
        A <= "00000001010101001101001010011101";    -- Student ID in hexadecimal
        B <= "00000000000000000000000000000111";    -- Example B value (all bits set to 1 for simplicity)
        C_IN <= '0';

        -- Test A
        S0 <= '0'; S1 <= '0'; S2 <= '0';  C_IN <= '0';
        wait for 1000 ns;
        
        -- Test A + 1
        S0 <= '0'; S1 <= '0'; S2 <= '0';  C_IN <= '1';
        wait for 1000 ns;
        
        -- Test A + B   
        S0 <= '1'; S1 <= '0'; S2 <= '0';  C_IN <= '0';
        wait for 1000 ns;
        
        -- Test A + B + 1 
        S0 <= '1'; S1 <= '0'; S2 <= '0';  C_IN <= '1';
        wait for 1000 ns;
        
        -- Test A + NOT(B) 
        S0 <= '0'; S1 <= '1'; S2 <= '0'; C_IN <='0'; 
        wait for 1000 ns;
        
        -- Test A + NOT(B) + 1 
        S0 <= '0'; S1 <= '1'; S2 <= '0'; C_IN <='1'; 
        wait for 1000 ns;
        
        -- Test A - 1
         S0 <= '1'; S1 <= '1'; S2 <= '0'; C_IN <='0'; 
        wait for 1000 ns;
        
        -- Test A AND B !! from hereeee 
        S0 <= '0'; S1 <= '0'; S2 <= '1';  C_IN <= '0';
        wait for 1000 ns;
        
        -- Test A OR B 
        S0 <= '1'; S1 <= '0'; S2 <= '1';  C_IN <= '0';
        wait for 1000 ns;
        
        -- Test A XOR B
        S0 <= '0'; S1 <= '1'; S2 <= '1';  C_IN <= '0';
        wait for 1000 ns;
        
        -- Test NOT(A) 
        S0 <= '1'; S1 <= '1'; S2 <= '1';  C_IN <= '0';
        wait for 1000 ns;

    end process;

end simulation;
