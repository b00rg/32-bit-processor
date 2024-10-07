----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2024 19:34:00
-- Design Name: 
-- Module Name: Mux3_32Bit_TB - Simulation
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RF_Mux3_32Bit_TB is
end RF_Mux3_32Bit_TB;

architecture Simulation of RF_Mux3_32Bit_TB is
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_Mux3_32Bit
        Port ( 
            I0  : in  STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit inputs
            I1  : in  STD_LOGIC_VECTOR(31 downto 0);
            I2  : in  STD_LOGIC_VECTOR(31 downto 0);
            S0  : in  STD_LOGIC;                       -- Selection lines
            S1  : in  STD_LOGIC;
            Y   : out STD_LOGIC_VECTOR(31 downto 0)    -- 32-bit output
        );
    END COMPONENT;

    -- Signals to connect to UUT inputs and outputs
    signal I0_TB, I1_TB, I2_TB : STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit input signals
    signal S0_TB, S1_TB : STD_LOGIC := '0';                      -- Selection lines
    signal Y_TB : STD_LOGIC_VECTOR(31 downto 0);                 -- 32-bit output signal

    constant PERIOD : time := 200ns;                             -- Simulation period

begin

   -- Instantiate the Unit Under Test (UUT)
   uut: RF_Mux3_32Bit PORT MAP (
        I0 => I0_TB,
        I1 => I1_TB,
        I2 => I2_TB,
        S0 => S0_TB,
        S1 => S1_TB,
        Y  => Y_TB
    );

   -- Stimulus process to apply test cases
   stim_proc: process
   begin
        -- Test Case 1: S1 = 0, S0 = 0 -> Select I0
        I0_TB <= "10101010101010101010101010101010";  -- I0 = 10101010101010101010101010101010
        I1_TB <= "11111111111111111111111111111111";  -- I1 = 11111111111111111111111111111111
        I2_TB <= "00000000000000000000000000000000";  -- I2 = 00000000000000000000000000000000
        S1_TB <= '0';          -- S1 = 0
        S0_TB <= '0';          -- S0 = 0
        wait for PERIOD;
        assert (Y_TB = I0_TB) report "Test Case 1 Failed: I0 was not selected!" severity error;

        -- Test Case 2: S1 = 0, S0 = 1 -> Select I1
        S1_TB <= '0';          -- S1 = 0
        S0_TB <= '1';          -- S0 = 1
        wait for PERIOD;
        assert (Y_TB = I1_TB) report "Test Case 2 Failed: I1 was not selected!" severity error;

        -- Test Case 3: S1 = 1, S0 = 0 -> Select I2
        S1_TB <= '1';          -- S1 = 1
        S0_TB <= '0';          -- S0 = 0
        wait for PERIOD;
        assert (Y_TB = I2_TB) report "Test Case 3 Failed: I2 was not selected!" severity error;

        -- Test Case 4: S1 = 1, S0 = 1 -> Undefined or specific handling
        S1_TB <= '1';          -- S1 = 1
        S0_TB <= '1';          -- S0 = 1
        wait for PERIOD;
        -- Depending on the design, this case could be handled as invalid or output a specific result.
        assert (Y_TB = (others => '0')) report "Test Case 4 Failed: Invalid state was not handled!" severity error;

        -- Final wait to keep the simulation running
        wait;
    end process;

end Simulation;
