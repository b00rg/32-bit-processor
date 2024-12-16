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

entity CPU_PC_22336157_tb is
-- Test bench has no ports
end CPU_PC_22336157_tb;

architecture Simulation of CPU_PC_22336157_tb is

  -- Component declaration for the DUT (Device Under Test)
  component CPU_PC_22336157
    Port (
      Displacement : in STD_LOGIC_VECTOR(31 downto 0);
      Clock, Reset, PL, PI : in STD_LOGIC;
      InstAdd : out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  -- Testbench signals to connect to the DUT
  signal Displacement : STD_LOGIC_VECTOR(31 downto 0);
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
   clock <= not clock after clock_period / 2; 

  -- Stimulus process
  Stimulus: process
  begin
    -- Initialize signals
    Displacement <= x"00000010";
    Reset <= '1';
    PL <= '0';
    PI <= '0';
    wait for 20 ns;

    -- Release Reset
    Reset <= '0';
    wait for 20 ns;

    -- Test case 1: PI = 0, PL = 0
    PI <= '0';
    PL <= '0';
    wait for 40 ns;

    -- Test case 2: PI = 1
    PI <= '1';
    wait for 40 ns;

    -- Test case 3: PL = 1
    PL <= '1';
    PI <= '0';
    wait for 40 ns;

    -- Test case 4: Reset during operation
    Reset <= '1';
    wait for 20 ns;
    Reset <= '0';
    wait for 40 ns;

    -- End simulation
    wait;
  end process;

end Simulation;
