----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: CPU_Mux2_17Bit_TB - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for a 2-to-1 17-bit multiplexer.
-- 
-- Dependencies: CPU_Mux2_17Bit.vhd (the main design file)
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU_Mux2_17Bit_22336157_TB is
end CPU_Mux2_17Bit_22336157_TB;

architecture simulation of CPU_Mux2_17Bit_22336157_TB is
    -- Component Declaration for the UUT
    component CPU_Mux2_17Bit_22336157
        Port ( I0 : in  STD_LOGIC_VECTOR(16 downto 0);
               I1 : in  STD_LOGIC_VECTOR(16 downto 0);
               S  : in  STD_LOGIC;
               Y  : out STD_LOGIC_VECTOR(16 downto 0)
             );
    end component;

    -- Signals for inputs and outputs
    signal I0_TB, I1_TB : STD_LOGIC_VECTOR(16 downto 0) := (others => '0');  -- Initialize inputs
    signal S_TB : STD_LOGIC := '0';  -- Initialize select signal
    signal Y_TB : STD_LOGIC_VECTOR(16 downto 0);  -- Output
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: CPU_Mux2_17Bit_22336157 Port map (
            I0 => I0_TB,
            I1 => I1_TB,
            S  => S_TB,
            Y  => Y_TB
        );

    -- Test process
    stim_proc: process
    begin
        -- Test case 1: Select I0 (S = '0')
        I0_TB <= "000000010101010";  -- 17-bit value for I0
        I1_TB <= "000000010101011";  -- 17-bit value for I1
        S_TB <= '0';
        wait for 200 ns;
        assert (Y_TB = I0_TB) report "Error: Output Y_TB should be I0_TB" severity error;

        -- Test case 2: Select I1 (S = '1')
        S_TB <= '1';
        wait for 200 ns;
        assert (Y_TB = I1_TB) report "Error: Output Y_TB should be I1_TB" severity error;

        -- Test case 3: Switch back to I0 (S = '0')
        S_TB <= '0';
        wait for 200 ns;
        assert (Y_TB = I0_TB) report "Error: Output Y_TB should be I0_TB" severity error;

        -- Finish simulation
        wait;
    end process;
end simulation;
