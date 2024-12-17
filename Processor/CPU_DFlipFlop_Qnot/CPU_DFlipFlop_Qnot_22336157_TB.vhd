----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 16.12.2024 15:36:03
-- Design Name: 
-- Module Name: CPU_DFlipFlop_Qnot_22336157_TB - Simulation
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

entity tb_CPU_DFlipFlop_Qnot_22336157 is
end tb_CPU_DFlipFlop_Qnot_22336157;

architecture Simulation of tb_CPU_DFlipFlop_Qnot_22336157 is
    -- Component Declaration for the Unit Under Test (UUT)
    component CPU_DFlipFlop_Qnot_22336157
        Port (
            Clock  : in  STD_LOGIC;
            D      : in  STD_LOGIC;
            Reset  : in  STD_LOGIC;
            Q      : out STD_LOGIC
        );
    end component;

    -- Signals for driving the UUT
    signal Clock  : STD_LOGIC := '0';
    signal D      : STD_LOGIC := '0';
    signal Reset  : STD_LOGIC := '0';
    signal Q      : STD_LOGIC;

    -- Clock period definition
    constant Clock_Period : time := 10 ns;

begin

    -- Instantiate the UUT
    uut: CPU_DFlipFlop_Qnot_22336157
        Port map (
            Clock => Clock,
            D => D,
            Reset => Reset,
            Q => Q
        );

    -- Clock Process: Generate a clock signal
    Clock_Process : process
    begin
        for i in 0 to 100 loop -- Run for 100 clock cycles
            Clock <= '0';
            wait for Clock_Period / 2;
            Clock <= '1';
            wait for Clock_Period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus Process: Apply input scenarios
    Stimulus_Process : process
    begin
        -- Initialize inputs
        D <= '0';
        Reset <= '0';
        wait for 20 ns;

        -- Scenario 1: Assert Reset and verify output
        Reset <= '1';
        wait for 20 ns;
        assert (Q = '0') report "Reset failed: Q is not 0 after Reset" severity error;
        Reset <= '0';
        wait for 20 ns;

        -- Scenario 2: Toggle D on rising clock edges
        wait until Clock = '1' and Clock'event;
        D <= '1';
        wait until Clock = '1' and Clock'event;
        assert (Q = '1') report "D=1 not captured on rising edge" severity error;

        wait until Clock = '1' and Clock'event;
        D <= '0';
        wait until Clock = '1' and Clock'event;
        assert (Q = '0') report "D=0 not captured on rising edge" severity error;

        -- Scenario 3: Assert Reset while D changes
        Reset <= '1';
        wait for 10 ns;
        D <= '1';
        wait for 10 ns;
        Reset <= '0';
        wait for 20 ns;
        assert (Q = '0') report "Reset during D=1 did not clear Q" severity error;

        -- End simulation
        wait for 200 ns;
        report "Simulation complete" severity note;
        wait;
    end process;

end Simulation;
