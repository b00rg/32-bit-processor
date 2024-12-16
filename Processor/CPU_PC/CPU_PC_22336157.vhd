----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 16.12.2024 12:33:52
-- Design Name: 
-- Module Name: CPU_PC_22336157 - Behavioral
-- Project Name: CPU_PC_22336157
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

entity CPU_PC_22336157 is
    Port (
      Displacement : in STD_LOGIC_VECTOR(31 downto 0); 
      Clock, Reset, PL, PI : in STD_LOGIC;                     
      InstAdd : out STD_LOGIC_VECTOR(31 downto 0)
    );
end CPU_PC_22336157;

architecture Behavioral of CPU_PC_22336157 is
  constant AND_gate_delay : Time := 8 ns;
  constant OR_gate_delay : Time := 2 ns;

  component CPU_Mux2_32Bit_22336157 is   
    Port (
        I0, I1 : in STD_LOGIC_VECTOR(31 downto 0);  
        S : in STD_LOGIC;                      
        Y : out STD_LOGIC_VECTOR(31 downto 0)  
    );
  end component;

  component DP_RippleCarryAdder32Bit_22336157 is
    Port (
        A, B : in STD_LOGIC_VECTOR(31 downto 0);
        C_IN : in STD_LOGIC; 
        SUM : out STD_LOGIC_VECTOR(31 downto 0);
        C_OUT : out STD_LOGIC; 
        V : out STD_LOGIC
    );
  end component;

  component RF_Register32Bit_22336157 is
    Port (
        D : in STD_LOGIC_VECTOR(31 downto 0);
        Load : in STD_LOGIC;
        CLK : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  signal PL_PI_Mux_Out, AdderToResetMux, ResetMuxToPC : STD_LOGIC_VECTOR(31 downto 0);
  signal PCLoad0, PCLoad : STD_LOGIC;
  signal PC_Out : STD_LOGIC_VECTOR(31 downto 0);  -- Renamed signal for clarity

begin
  -- Mux to select between Displacement and x"00000001"
  PL_PI_Mux : CPU_Mux2_32Bit_22336157 Port map(
    I0 => Displacement, 
    I1 => x"00000001", 
    S => PI, 
    Y => PL_PI_Mux_Out
  );

  -- Adder to compute the sum of AdderToInstAdd (PC output) and PL_PI_Mux_Out
  Adder : DP_RippleCarryAdder32Bit_22336157 Port map(
    A => PC_Out, 
    B => PL_PI_Mux_Out, 
    C_IN => '0', 
    SUM => AdderToResetMux, 
    C_OUT => open, 
    V => open
  ); 

  -- Mux to select between Adder output and reset value
  ResetMux : CPU_Mux2_32Bit_22336157 Port map(
    I0 => AdderToResetMux, 
    I1 => x"00000002",  -- Default reset to zero
    S => Reset, 
    Y => ResetMuxToPC
  );

  -- Logic to determine when to load the PC
  PCLoad0 <= Reset or PL after OR_gate_delay;
  PCLoad <= PCLoad0 or PI after OR_gate_delay;

  -- PC Register to store the value of InstAdd (Output)
  PC : RF_Register32Bit_22336157 Port map(
    CLK => Clock, 
    D => ResetMuxToPC, 
    Load => PCLoad, 
    Reset => '0', 
    Q => PC_Out  -- PC_Out is the output of the PC register
  );

  -- InstAdd is assigned the value of PC_Out, the current program counter
  InstAdd <= PC_Out;

end Behavioral;
