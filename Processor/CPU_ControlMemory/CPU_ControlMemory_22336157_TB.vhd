----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 19:30:10
-- Design Name: 
-- Module Name: CPU_ControlMemory_22336157_TB - Simulation
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
use IEEE.NUMERIC_STD.ALL;

entity CPU_ControlMemory_22336157_TB is
end CPU_ControlMemory_22336157_TB;

architecture sim of CPU_ControlMemory_22336157_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component CPU_ControlMemory_22336157
        Port (
            Address : in std_logic_vector(16 downto 0);
            NA : out std_logic_vector(16 downto 0);
            MS : out std_logic_vector(2 downto 0);
            MC, IL, PI, PL, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out std_logic;
            FS : out std_logic_vector(4 downto 0);
            TA, TB, TD : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Testbench signals
    signal Address : std_logic_vector(16 downto 0) := (others => '0');
    signal NA : std_logic_vector(16 downto 0);
    signal MS : std_logic_vector(2 downto 0);
    signal MC, IL, PI, PL, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : std_logic;
    signal FS : std_logic_vector(4 downto 0);
    signal TA, TB, TD : std_logic_vector(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: CPU_ControlMemory_22336157
        Port map (
            Address => Address,
            NA => NA,
            MS => MS,
            MC => MC,
            IL => IL,
            PI => PI,
            PL => PL,
            MB => MB,
            MD => MD,
            RW => RW,
            MM => MM,
            MW => MW,
            RV => RV,
            RC => RC,
            RN => RN,
            RZ => RZ,
            FL => FL,
            FS => FS,
            TA => TA,
            TB => TB,
            TD => TD
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Initialize memory with address 0
        -- Read all 128 addresses, incrementing the address after each cycle
        for i in 57 to 127 loop
            -- Set address value
            Address <= std_logic_vector(to_unsigned(i, 17));
        end loop;
        for i in 0 to 56 loop
           Address <= std_logic_vector(to_unsigned(i, 17));
        end loop;

        -- End simulation
        wait;
    end process;

end sim;
