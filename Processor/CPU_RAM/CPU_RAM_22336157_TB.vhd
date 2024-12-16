----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 16:30:26
-- Design Name: CPU_RAM Testbench
-- Module Name: CPU_RAM_22336157_TB - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for the CPU_RAM_23373470 module
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

entity CPU_RAM_22336157_TB is
end CPU_RAM_22336157_TB;

architecture Simulation of CPU_RAM_22336157_TB is

    -- Component declaration for CPU_RAM_23373470
    component CPU_RAM_22336157 is
        Port ( 
            Clock : in STD_LOGIC ;
            Address : in STD_LOGIC_VECTOR (31 downto 0) ;
            DataIn : in STD_LOGIC_VECTOR (31 downto 0) ;
            WriteEnable : in STD_LOGIC ;
            DataOut : out STD_LOGIC_VECTOR (31 downto 0)
        );
    end component;

    -- Signal declarations
    signal Address_TB, DataIn_TB, DataOut_TB : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal CLK_TB, WriteEnable_TB : STD_LOGIC := '0';
    constant STUDENTID : STD_LOGIC_VECTOR (31 downto 0) := x"0164A69E";
    constant PERIOD : time := 300 ns;

begin

    -- Instantiation of CPU_RAM_23373470
    uut : CPU_RAM_22336157
        port map (
            Clock => CLK_TB,
            Address => Address_TB,
            DataIn => DataIn_TB,
            WriteEnable => WriteEnable_TB,
            DataOut => DataOut_TB
        );

    -- Clock generation
    CLK_TB <= not CLK_TB after PERIOD / 2;

    -- Stimulus process
    stim_proc : process
    begin
        -- Write operation
        WriteEnable_TB <= '1';        -- Enable writing
        DataIn_TB <= x"12345678";    -- Input data
        Address_TB <= x"00000001";   -- Address for writing
        wait for PERIOD;

        -- Disable write and check read
        WriteEnable_TB <= '0';       -- Disable writing
        Address_TB <= x"00000001";   -- Address to read
        wait for PERIOD;

        -- Verify the output data
        assert DataOut_TB = x"12345678"
        report "Read data mismatch!" severity error;

        -- End of test
        wait;
    end process;

end Simulation;
