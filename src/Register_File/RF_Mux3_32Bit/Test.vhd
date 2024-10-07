----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: RF_Mux3_32Bit_TB
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for RF_Mux3_32Bit
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
use IEEE.STD_LOGIC_ARITH.ALL;  -- Optional: for arithmetic operations
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Optional: for unsigned operations

entity RF_Mux3_32Bit_TB is
end RF_Mux3_32Bit_TB;

architecture Behavioral of RF_Mux3_32Bit_TB is

    -- Component declaration for the Unit Under Test (UUT)
    component RF_Mux3_32Bit
        Port (
            I0, I1, I2 : in STD_LOGIC_VECTOR(31 downto 0); -- 32-bit inputs
            S0, S1 : in STD_LOGIC;                        -- Selection Signals
            Y : out STD_LOGIC_VECTOR(31 downto 0)       -- 32-bit output
        );
    end component;

    -- Signals for connecting to the UUT
    signal I0, I1, I2 : STD_LOGIC_VECTOR(31 downto 0);
    signal S0, S1 : STD_LOGIC;
    signal Y : STD_LOGIC_VECTOR(31 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: RF_Mux3_32Bit Port Map (
        I0 => I0,
        I1 => I1,
        I2 => I2,
        S0 => S0,
        S1 => S1,
        Y => Y
    );

    -- Test process
    stim_proc: process
    begin
        -- Initialize inputs
        I0 <= (others => '0');
        I1 <= (others => '0');
        I2 <= (others => '0');
        S0 <= '0';
        S1 <= '0';
        
        -- Test case 1: Select I0
        I0 <= "00000000000000000000000000000001"; -- I0 = 1
        I1 <= "00000000000000000000000000000010"; -- I1 = 2
        I2 <= "00000000000000000000000000000011"; -- I2 = 3
        S0 <= '0'; S1 <= '0';  -- Select I0
        wait for 10 ns;
        assert (Y = I0) report "Test Case 1 Failed: Expected " & std_logic_vector'IMAGE(I0) & " but got " & std_logic_vector'IMAGE(Y) severity ERROR;

        -- Test case 2: Select I1
        S0 <= '1'; S1 <= '0';  -- Select I1
        wait for 10 ns;
        assert (Y = I1) report "Test Case 2 Failed: Expected " & std_logic_vector'IMAGE(I1) & " but got " & std_logic_vector'IMAGE(Y) severity ERROR;

        -- Test case 3: Select I2
        S0 <= '0'; S1 <= '1';  -- Select I2
        wait for 10 ns;
        assert (Y = I2) report "Test Case 3 Failed: Expected " & std_logic_vector'IMAGE(I2) & " but got " & std_logic_vector'IMAGE(Y) severity ERROR;

        -- Test case 4: Random values
        I0 <= "00000000000000000000000000001111"; -- I0 = 15
        I1 <= "00000000000000000000000000011111"; -- I1 = 31
        I2 <= "00000000000000000000000000111111"; -- I2 = 63
        S0 <= '1'; S1 <= '1';  -- Select I2
        wait for 10 ns;
        assert (Y = I2) report "Test Case 4 Failed: Expected " & std_logic_vector'IMAGE(I2) & " but got " & std_logic_vector'IMAGE(Y) severity ERROR;

        -- End of test
        wait;
    end process;

end Behavioral;
