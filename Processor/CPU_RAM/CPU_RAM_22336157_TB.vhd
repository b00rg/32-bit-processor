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
    constant START_VAL : STD_LOGIC_VECTOR (31 downto 0) := x"00001805"; -- Decimal 6157 in hex
    constant INIT_VAL : integer := 57; -- Decimal value to initialize memory
    constant PERIOD : time := 300 ns;

begin

    -- Instantiation of CPU_RAM_22336157
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
        -- Initialize memory with incremental values starting at INIT_VAL (57 decimal)
        WriteEnable_TB <= '1';
        for i in 0 to 127 loop
            Address_TB <= std_logic_vector(to_unsigned(i, 32));
            DataIn_TB <= std_logic_vector(to_unsigned(INIT_VAL + i, 32));
            wait for PERIOD;
        end loop;

        -- Disable WriteEnable
        WriteEnable_TB <= '0';

        -- Read back and verify all 128 memory locations
        for i in 0 to 127 loop
            Address_TB <= std_logic_vector(to_unsigned(i, 32));
            wait for PERIOD;
            assert DataOut_TB = std_logic_vector(to_unsigned(INIT_VAL + i, 32))
            report "Read data mismatch at address " & integer'image(i) severity error;
        end loop;

        -- Overwrite 32 memory locations starting at address 7
        WriteEnable_TB <= '1';
        for i in 7 to 38 loop
            Address_TB <= std_logic_vector(to_unsigned(i, 32));
            DataIn_TB <= x"0000ABCD"; -- Example new data
            wait for PERIOD;
        end loop;

        -- Demonstrate that overwrite doesn’t work if WriteEnable_TB is unset
        WriteEnable_TB <= '0';
        for i in 7 to 38 loop
            Address_TB <= std_logic_vector(to_unsigned(i, 32));
            DataIn_TB <= x"0000FFFF"; -- Attempt to write new data
            wait for PERIOD;
            assert DataOut_TB /= x"0000FFFF"
            report "Write operation occurred when WriteEnable was unset!" severity error;
        end loop;

        -- End simulation
        wait;
    end process;

end Simulation;
