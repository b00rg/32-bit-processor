----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: DP_ZeroDetection_22336157_TB - Behavioral
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

entity DP_ZeroDetection_22336157_TB is
    -- Testbench has no ports
end DP_ZeroDetection_22336157_TB;

architecture Simulation of DP_ZeroDetection_22336157_TB is
    signal input_vector : STD_LOGIC_VECTOR(31 downto 0);  -- 31-bit input vector
    signal zero_flag    : STD_LOGIC;                       -- 1-bit output flag

    -- Instantiate the DP_ZeroDetection_22336157
    component DP_ZeroDetection_22336157
        Port (
            input_vector : in  STD_LOGIC_VECTOR(31 downto 0);
            zero_flag    : out STD_LOGIC
        );
    end component;

begin
    uut: DP_ZeroDetection_22336157
        Port Map (
            input_vector => input_vector,
            zero_flag    => zero_flag
        );
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
    -- Test procedure
    process
    begin
        -- Test case 1: All zeros
        input_vector <= "00000000000000000000000000000000";
        wait for 10 ns;
        assert (zero_flag = '1') report "Test Case 1 Failed: Expected zero_flag = 1" severity error;

        -- Test case 2: Some non-zero value
        input_vector <= "00000000000000000000000000000001";  -- Only the LSB is 1
        wait for 10 ns;
        assert (zero_flag = '0') report "Test Case 2 Failed: Expected zero_flag = 0" severity error;

        -- Test case 3: All ones
        input_vector <= (others => '1');  -- All bits set to 1
        wait for 10 ns;
        assert (zero_flag = '0') report "Test Case 3 Failed: Expected zero_flag = 0" severity error;

        -- Test case 4: Mixed values
        input_vector <= "00000000000000000000000000000010";  -- 2nd LSB is 1
        wait for 10 ns;
        assert (zero_flag = '0') report "Test Case 4 Failed: Expected zero_flag = 0" severity error;

        -- Test case 5: Another non-zero value
        input_vector <= "00000000000000000000000000000000";  -- All bits set to 0
        wait for 10 ns;
        assert (zero_flag = '1') report "Test Case 5 Failed: Expected zero_flag = 1" severity error;

        -- End simulation
        wait;
    end process;

end Simulation;
