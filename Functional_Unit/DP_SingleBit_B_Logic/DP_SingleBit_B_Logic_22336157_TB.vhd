----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: Single Bit B Logic Circuit - Behavioral
-- Module Name: DP_SingleBit_B_LogicCircuit_22336157_TB
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for Single Bit B Logic Circuit
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: 
-- This testbench simulates various inputs to verify the functionality of the Single Bit B Logic Circuit.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DP_SingleBit_B_LogicCircuit_22336157_TB is
end DP_SingleBit_B_LogicCircuit_22336157_TB;

architecture Behavioral of DP_SingleBit_B_LogicCircuit_22336157_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component DP_SingleBit_B_LogicCircuit_22336157
        Port (
            A : in STD_LOGIC;
            S0, S1 : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- Signal Declarations
    signal A : STD_LOGIC;
    signal S0, S1 : STD_LOGIC;
    signal Y : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: DP_SingleBit_B_LogicCircuit_22336157
        Port Map (
            A => A,
            S0 => S0,
            S1 => S1,
            Y => Y
        );

    -- Stimulus Process
    stimulus: process
    begin
        -- Test Case 1
        A <= '0'; S0 <= '0'; S1 <= '0';
        wait for 20 ns;  -- Wait for 20 ns to observe output
        
        -- Test Case 2
        A <= '0'; S0 <= '1'; S1 <= '0';
        wait for 20 ns;  -- Wait for 20 ns to observe output

        -- Test Case 3
        A <= '0'; S0 <= '1'; S1 <= '0';
        wait for 20 ns;  -- Wait for 20 ns to observe output

        -- Test Case 4
        A <= '0'; S0 <= '1'; S1 <= '1';
        wait for 20 ns;  -- Wait for 20 ns to observe output

        -- Test Case 5: S0=1, S1=0, A=0
        A <= '1'; S0 <= '0'; S1 <= '0';
        wait for 20 ns;  -- Wait for 20 ns to observe output

        -- Test Case 6: S0=1, S1=0, A=1
        A <= '1'; S0 <= '1'; S1 <= '0';
        wait for 20 ns;  -- Wait for 20 ns to observe output

        -- Test Case 7: S0=1, S1=1, A=0
        A <= '1'; S0 <= '0'; S1 <= '1';
        wait for 20 ns;  -- Wait for 20 ns to observe output

        -- Test Case 8: S0=1, S1=1, A=1
        A <= '1'; S0 <= '1'; S1 <= '1';
        wait for 20 ns;  -- Wait for 20 ns to observe output

        -- End Simulation
        wait;
    end process;

end Simulation;
