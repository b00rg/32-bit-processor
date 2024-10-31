----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
        A <= "00000001010101001101001010011101"; 
        B <= "00000001010101001101001010100100";
        
        -- A + B + 1
        FS <= "00011"; 
        wait for 10 ns;
        
        
        -- A + 1's Complement B 
        FS <= "00101"; 
        
        -- A + 1
        FS <= "00001";
        
        -- A 
        FS <= "00000";
        
        -- A + B
        FS <= "00010";
        
        -- A + B + 1
        FS <= "00011";
        
        -- A + 1's Complement B 
        FS <= "00101"; 
        
        -- A + 1's Complement B  + 1 
        FS <= "00101";
        
        -- A - 1 
        FS <= "00110"; 
        
        -- A AND B 
        FS <= "01000";
        
        
    end process;
end Simulation;
