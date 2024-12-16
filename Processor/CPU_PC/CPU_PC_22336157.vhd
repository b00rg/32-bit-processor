----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 12:34:24
-- Design Name: 
-- Module Name: CPU_PC_22336157_TB - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for CPU_PC_22336157
-- 
-- Dependencies: CPU_PC_22336157
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_PC_22336157_TB is
-- Testbench has no ports
end CPU_PC_22336157_TB;

architecture Simulation of CPU_PC_22336157_TB is

  -- Component declaration for the DUT (Device Under Test)
  component CPU_PC_22336157
    Port (
      Displacement : in STD_LOGIC_VECTOR(31 downto 0);
      Clock, Reset, PL, PI : in STD_LOGIC;
      InstAdd : out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  -- Testbench signals to connect to the DUT
  signal Displacement : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal Clock : STD_LOGIC := '0';
  signal Reset : STD_LOGIC := '0';
  signal PL : STD_LOGIC := '0';
  signal PI : STD_LOGIC := '0';
  signal InstAdd : STD_LOGIC_VECTOR(31 downto 0);

  -- Clock period constant
  constant Clock_Period : time := 10 ns;

begin

  -- Instantiate the DUT
  DUT: CPU_PC_22336157
    Port map (
      Displacement => Displacement,
      Clock => Clock,
      Reset => Reset,
      PL => PL,
      PI => PI,
      InstAdd => InstAdd
    );

  -- Clock generation process
  Clock_Process: process
  begin
    Clock <= '0';
    wait for Clock_Period / 2;
    Clock <= '1';
    wait for Clock_Period / 2;
  end process;

  -- Stimulus process to apply inputs to DUT and check outputs
  Stimulus: process
  begin
    -- Initialize signals
    Displacement <= x"00000010";  -- Example displacement
    Reset <= '1';  -- Start with reset active
    wait for 20 ns;

    -- Release Reset
    Reset <= '0';
    wait for 20 ns;

    -- Test case 1: PI = 0, PL = 0 (no load)
    PI <= '0';
    PL <= '0';
    wait for 40 ns;
    assert (InstAdd = x"00000010") report "Test case 1 failed!" severity error;

    -- Test case 2: PI = 1 (should increment PC)
    PI <= '1';
    wait for 40 ns;
    assert (InstAdd = x"00000011") report "Test case 2 failed!" severity error;

    -- Test case 3: PL = 1 (should load displacement value)
    PL <= '1';
    PI <= '0';
    wait for 40 ns;
    assert (InstAdd = x"00000010") report "Test case 3 failed!" severity error;

    -- Test case 4: Reset during operation
    Reset <= '1';  -- Assert reset
    wait for 20 ns;
    Reset <= '0';  -- Release reset
    wait for 40 ns;

    -- End simulation
    wait;
  end process;

end Simulation;
