----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU_PC_22336157 is
    Port (
      Displacement         :  in STD_LOGIC_VECTOR(31 downto 0); 
      Clock, Reset, PL, PI     : in STD_LOGIC;                     
      InstAdd         : out STD_LOGIC_VECTOR(31 downto 0)
    );
end CPU_PC_22336157;

architecture Behavioral of CPU_PC_22336157 is
  constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
  constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
  constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
  constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
  constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
  constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
  constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
  constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
  
  
   component  CPU_Mux2_32Bit_22336157 is   
   Port (
        I0, I1 : in STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit inputs
        S      : in STD_LOGIC;                      -- single select bit
        Y      : out STD_LOGIC_VECTOR(31 downto 0)  -- 32-bit output
    );
    end component;
    
    component DP_RippleCarryAdder32Bit_22336157
      Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
        B : in STD_LOGIC_VECTOR (31 downto 0);
        C_IN : in STD_LOGIC; -- single bit initial carry-in
        SUM : out STD_LOGIC_VECTOR (31 downto 0);
        C_OUT : out STD_LOGIC; -- final carry-out bit
        V : out STD_LOGIC); -- overflow indicator
  end component;
  
  COMPONENT RF_Register32Bit_22336157
  Port ( D : in STD_LOGIC_VECTOR (31 downto 0);
           Load : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (31 downto 0));
  END COMPONENT;
    
  signal PL_PI_Mux_Out, AddderToInstAdd, AdderToResetMux, ResetMuxToPC : STD_LOGIC_Vector(31 downto 0);
  signal PCLoad0, PCLoad : STD_LOGIC;
begin
 PL_PI_Mux : CPU_Mux2_32Bit_22336157 Port map(I0 => Displacement, I1 => x"00000001", S=> PI, Y=>PL_PI_Mux_Out);
 Adder : DP_RippleCarryAdder32Bit_22336157 Port map(A => AddderToInstAdd, B => PL_PI_Mux_Out, C_IN => '0', SUM => AdderToResetMux); 
 ResetMux : CPU_Mux2_32Bit_22336157 Port map(I0 => AdderToResetMux, I1 => x"00000002", S=> Reset, Y=>ResetMuxToPC);
 PCLoad0 <= Reset or PL after OR_gate_delay ;
 PCLoad <= PCLoad0 or PI after OR_gate_delay; 
 PC : RF_Register32Bit_22336157(CLK => Clock, D => ResetMuxToPC, Load => PCLoad, Reset =>  x"00000000", Q => AdderToInstAdd);
 InstAdd <= AdderToInstAdd; 
 
end Behavioral;
