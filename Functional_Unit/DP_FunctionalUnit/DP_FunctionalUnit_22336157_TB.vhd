----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 31.10.2024 13:47:34
-- Design Name: 
-- Module Name: DP_FunctionalUnit_22336157_TB - Simulation
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

entity DP_FunctionalUnit_22336157_tb is
end DP_FunctionalUnit_22336157_tb;

architecture Simulation of DP_FunctionalUnit_22336157_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component DP_FunctionalUnit_22336157
        Port ( 
            B : in STD_LOGIC_VECTOR(31 downto 0);
            A : in STD_LOGIC_VECTOR(31 downto 0);
            FS : in STD_LOGIC_VECTOR(4 downto 0);
            C : out STD_LOGIC; 
            N : out STD_LOGIC; 
            Z : out STD_LOGIC; 
            V : out STD_LOGIC; 
            F : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

    -- Test signals
    signal B, A : STD_LOGIC_VECTOR(31 downto 0);
    signal FS : STD_LOGIC_VECTOR(4 downto 0);
    signal C, N, Z, V : STD_LOGIC;
    signal F : STD_LOGIC_VECTOR(31 downto 0);
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
    constant operation_wait_time : time := 1000 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: DP_FunctionalUnit_22336157 Port Map (
        B => B,
        A => A,
        FS => FS,
        C => C,
        N => N,
        Z => Z,
        V => V,
        F => F
    );

    -- Test Process
    stim_proc: process
    begin
    
    
        -- Test 1st Group
        A <= "00000000000000000000000000000101"; 
        B <= "00000000000000000000000000000110";
        
   -- Test Case 1: A OR B
    FS <= "01010";
    wait for operation_wait_time; 
    
    -- Test Case 2: A XOR B
    FS <= "01100";
    wait for operation_wait_time; 
    
    -- Test Case 3: A AND B
    FS <= "01000";
    wait for operation_wait_time;
    
    -- Test Case 4: B
    FS <= "10000";
    wait for operation_wait_time;
    
    -- Test Case 5: A - 1 
    FS <= "00110"; 
    wait for operation_wait_time;
    
    -- Test case 6: slB
    FS <= "11000"; 
    wait for operation_wait_time; 
    
    -- Test case 7: A + 1's complement B + 1 
    FS <= "00101";
    wait for operation_wait_time;

    -- Test case 8: A (FS=00111)
    FS <= "00111";
    wait for operation_wait_time;
    
    -- Test case 9: A + 1's complement B 
    FS <= "00100"; 
    wait for operation_wait_time;
    
    -- Test case 10: srB 
    FS <= "10100";
    wait for operation_wait_time; 
    
    -- Test case 11: A + B + 1
    FS <= "00011"; 
    wait for operation_wait_time;
    
    -- Test case 12: 1's c A 
    FS <= "01110";
    wait for operation_wait_time;
    
    -- Test case 13: A + B
    FS <= "00010";
    wait for operation_wait_time;
    
    -- Test case 14: FS = 0000
    FS <= "00000"; 
    wait for operation_wait_time;
    
    -- Test case 15: A + 1
    FS <= "00001";
    wait for operation_wait_time; 
        
        
    end process;
end Simulation;
