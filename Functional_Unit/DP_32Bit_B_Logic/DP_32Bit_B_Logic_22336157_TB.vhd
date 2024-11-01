----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: DP_32Bit_B_Logic_22336157_TB - Simulation
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
use IEEE.STD_LOGIC_ARITH.ALL; -- Needed for arithmetic operations
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Needed for vector operations

entity DP_32Bit_B_Logic_22336157_TB is
end DP_32Bit_B_Logic_22336157_TB;

architecture Simulation of DP_32Bit_B_Logic_22336157_TB is
    -- Component Declaration for the Unit Under Test (UUT)
    component DP_32Bit_B_Logic_22336157
        Port ( 
            B : in STD_LOGIC_VECTOR(31 downto 0);   -- Input B (Student ID)
            S0, S1 : in STD_LOGIC;                    -- Selection Signals
            G : out STD_LOGIC_VECTOR(31 downto 0)    -- Output G
        );
    end component;

    -- Signals to connect to the UUT
    signal B : STD_LOGIC_VECTOR(31 downto 0);
    signal S0, S1 : STD_LOGIC;
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D"; 
    signal G : STD_LOGIC_VECTOR(31 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: DP_32Bit_B_Logic_22336157 
        Port Map (
            B => B,
            S0 => S0,
            S1 => S1,
            G => G
        );

    -- Test Process
    process
    begin

        B <= "00000001010101001101001010011101"; -- Padded Student ID
        S0 <= '0';
        S1 <= '0';
        wait for 1000 ns;


        -- Test Output: 1's Complement of Student ID
        S0 <= '1';
        S1 <= '0';
        wait for 1000 ns;
        
        S0 <= '0';
        S1 <= '1';
        wait for 1000 ns;


        -- Test Output: All 1's
        S0 <= '1';
        S1 <= '1';
        wait for 1000 ns;


    end process;
end Simulation;
