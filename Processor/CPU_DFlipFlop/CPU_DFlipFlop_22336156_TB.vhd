----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 16.12.2024 15:36:03
-- Design Name: 
-- Module Name: CPU_DFlipFlop_22336157_TB - Simulation
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

entity CPU_DFlipFlop_22336157_tb is
-- Testbench has no ports
end CPU_DFlipFlop_22336157_tb;

architecture Simulation of CPU_DFlipFlop_22336157_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component CPU_DFlipFlop_22336157
        Port (
            Clock : in STD_LOGIC;
            D : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the UUT
    signal Clock : STD_LOGIC := '0';
    signal D : STD_LOGIC := '0';
    signal Reset : STD_LOGIC := '0';
    signal Q : STD_LOGIC;

    -- Clock period constant
    constant Clock_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: CPU_DFlipFlop_22336157
        Port map (
            Clock => Clock,
            D => D,
            Reset => Reset,
            Q => Q
        );

    -- Clock process definitions
    Clock_process : process
    begin
        while true loop
            Clock <= '0';
            wait for Clock_period / 2;
            Clock <= '1';
            wait for Clock_period / 2;
        end loop;
    end process;

    -- Stimulus process
    Stimulus_process : process
    begin
        -- Test 1: Reset the flip-flop
        Reset <= '1'; D <= '0';
        wait for 20 ns;
        Reset <= '0';
        wait for 20 ns;

        -- Test 2: Set D = 1, observe Q
        D <= '1';
        wait for 20 ns;

        -- Test 3: Change D to 0, observe Q
        D <= '0';
        wait for 20 ns;

        -- Test 4: Apply Reset again
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        wait for 20 ns;

        -- Test 5: Complex toggling
        D <= '1'; wait for 10 ns;
        D <= '0'; wait for 10 ns;
        D <= '1'; wait for 10 ns;

        -- End simulation
        wait for 50 ns;
        assert false report "Simulation Ended" severity note;
        wait;
    end process;

end Simulation;
