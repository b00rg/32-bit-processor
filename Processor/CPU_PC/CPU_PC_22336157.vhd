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

  signal Y, Sum, ResetMuxOut, RippleSum, RegisterOUt : std_logic_vector(31 downto 0);
  Signal PL_or_Reset, PC_Load : std_logic;

begin
  PL_PI_Mux : CPU_Mux2_32Bit_22336157 Port map(
    I0 => Displacement, 
    I1 => x"0000000D", 
    S => PI, 
    Y => Y
  );

  Adder : DP_RippleCarryAdder32Bit_22336157 Port map(
    A => RegisterOut, 
    B => Y, 
    C_IN => '0', 
    SUM => Sum
  ); 

  ResetMux : CPU_Mux2_32Bit_22336157 Port map(
    I0 => Sum, 
    I1 => x"0000009D",  -- Default reset to zero
    S => Reset, 
    Y => ResetMuxOut
  );
  
 PC : RF_Register32Bit_22336157 Port map(
    CLK => Clock, 
    D => ResetMuxOut, 
    Load => PC_Load, 
    Reset => '0', 
    Q => RegisterOut
  );

  PL_or_Reset <= PL OR Reset after OR_GATE_DELAY;
  PC_Load <= PL_or_Reset OR PI after OR_GATE_DELAY;
  Instadd <= RegisterOut;

end Behavioral;
