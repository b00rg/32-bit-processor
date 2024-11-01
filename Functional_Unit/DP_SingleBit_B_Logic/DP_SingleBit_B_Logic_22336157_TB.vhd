----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Single Bit B Logic Circuit - Simulation
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

entity DP_SingleBit_B_Logic_22336157_TB is
end DP_SingleBit_B_Logic_22336157_TB;

architecture Simulation of DP_SingleBit_B_Logic_22336157_TB is

    -- Component declaration for the DUT (Device Under Test)
    component DP_SingleBit_B_Logic_22336157
	Port ( B :   in STD_LOGIC ; 		-- 1 bit inputs
		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		Y : out STD_LOGIC ) ;  			-- 1 bit output
    end component;

    -- Signals for inputs and output
    signal B, S0, S1 : STD_LOGIC;
    signal G : STD_LOGIC;
    constant WAITPERIOD : time  := 100ns; 
    
begin

    -- Instantiate the DUT
    uut: DP_SingleBit_B_Logic_22336157
        Port Map (
            B => B,
            S0 => S0,
            S1 => S1,
            Y => G
        );


    -- Test process
    process
    begin
        -- Test Case 0: A=0, B=0, S0=0, S1=0
        B <= '0'; S0 <= '0'; S1 <= '0';
        wait for 10 ns;

        -- Test Case 1: A=0, B=0, S0=0, S1=1
        B <= '0'; S0 <= '0'; S1 <= '1';
        wait for WAITPERIOD;

        -- Test Case 2: A=0, B=0, S0=1, S1=0
        B <= '0'; S0 <= '1'; S1 <= '0';
        wait for WAITPERIOD;

        -- Test Case 3: A=0, B=0, S0=1, S1=1
        B <= '0'; S0 <= '1'; S1 <= '1';
        wait for WAITPERIOD;

        -- Test Case 4: A=0, B=1, S0=0, S1=0
        B <= '1'; S0 <= '0'; S1 <= '0';
        wait for WAITPERIOD;

        -- Test Case 5: A=0, B=1, S0=0, S1=1
        B <= '1'; S0 <= '0'; S1 <= '1';
        wait for WAITPERIOD;

        -- Test Case 6: A=0, B=1, S0=1, S1=0
        B <= '1'; S0 <= '1'; S1 <= '0';
        wait for WAITPERIOD;

        -- Test Case 7: A=0, B=1, S0=1, S1=1
        B <= '1'; S0 <= '1'; S1 <= '1';
        wait for WAITPERIOD;

    end process;
end Simulation;
