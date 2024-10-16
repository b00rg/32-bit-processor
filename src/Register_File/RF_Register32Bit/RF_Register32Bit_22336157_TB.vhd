----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 10.10.2024 17:12:37
-- Design Name: 
-- Module Name: RF_Register32Bit_22336157_TB - Simulation
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

entity RF_Register32Bit_22336157_TB is
    -- No ports are needed in the testbench
end RF_Register32Bit_22336157_TB;

architecture Simulation of RF_Register32Bit_22336157_TB is

-- Component Declaration for the Unit Under Test (UUT)
component RF_Register32Bit_22336157
    Port ( 
        D : in STD_LOGIC_VECTOR (31 downto 0);
        Load : in STD_LOGIC;
        CLK : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (31 downto 0)
    );      
end component;

-- Signals for testbench to drive inputs and observe outputs
signal D_TB : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal CLK_TB : std_logic := '0';
signal Load_TB : std_logic := '0';
signal Reset_TB : std_logic := '0';
signal Q_TB : std_logic_vector(31 downto 0);

-- StudentID in binary format
-- Your student ID in DEC: 26 33 57 25 -> HEX: 1 91 D9 ED
-- Binary representation: 00000001010101001101001010011101
constant StudentID : STD_LOGIC_VECTOR (31 downto 0) := "00000001010101001101001010011101";
constant PERIOD : time := 100 ns; -- Clock period of 100 ns

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: RF_Register32Bit_22336157
        port map (
            D => D_TB,
            Load => Load_TB,
            CLK => CLK_TB,
            Reset => Reset_TB,
            Q => Q_TB
        );
        
    -- Clock generation process: toggle clock every PERIOD/2
    CLK_TB <= not CLK_TB after PERIOD / 2;
   
    -- Stimulus process to drive inputs and test the register functionality
    stim_proc: process
    begin
        -- Case 1: Apply an initial reset
        Reset_TB <= '1'; -- Assert reset
        wait for PERIOD;  -- Wait for 1 clock cycle
        Reset_TB <= '0'; -- Deassert reset
        
        -- Case 2: Load the student ID into the register
        D_TB <= StudentID;  -- Set input D to student ID
        Load_TB <= '1';     -- Assert load to load the value into the register
        wait for PERIOD;    -- Wait for 1 clock cycle
        
        -- Deassert the load signal, so the register holds the value
        Load_TB <= '0';

        -- Case 4: Wait for several clock cycles to observe the output
        wait for 10 * PERIOD; -- Wait for 10 clock cycles
        
        -- End simulation after observing the behavior
        wait;
    end process;

end Simulation;
