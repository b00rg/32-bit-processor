----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: DP_Datapath_22336157 - Behavioral
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

entity DP_Datapath_22336157 is
    Port (
      IR_IN, DATA_IN         :  in STD_LOGIC_VECTOR(31 downto 0); 
      MB, MD, RW, Reset      : in STD_LOGIC;                     
      FS, SA, SB             : in STD_LOGIC_VECTOR(4 downto 0);
      TA, TB, TD             : in STD_LOGIC_VECTOR(3 downto 0);
      DATA_OUT, ADD          : out STD_LOGIC_VECTOR(31 downto 0)  
      C, N, V, Z             : out STD_LOGIC
    );
end DP_Datapath_22336157;

architecture Behavioral of DP_Datapath_22336157 is
  constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
  constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
  constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
  constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
  constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
  constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
  constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
  constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

  signal MuxBOut, MuxDout, FunctionalUnitFout, FunctionalUnitAIn, RegFileAout, RegFileBout : STD_LOGIC_Vector(31 downto 0);
begin
  MuxB : CPU_Mux2_32Bit_22336157 Port map(I0 => RegFileAOut, I1 => IR_IN, S=> MB, Y => MuxBOut);
  DATA_OUT <= MuxBout; 
  MuxD : CPU_Mux2_32Bit_22336157 Port map(I0 => FunctionalUnitFout, I1 => DATA_IN, S=> MD, Y => MuxDout);
  FunctionalUnit : DP_FunctionalUnit_22336157 Port Map(A => RegFileBOut, B => MuxBOut, FS => FS, C => C, F => FunctionalUnitFout, N, V, Z);
  RegFile : RF_RegisterFile_32_15_22336157 Port Map(Clock => Clock, D => MuxDOut, DR => Dr, RW => RW, Reset => Reset, SA => SA, SB => SB, TA=> TA, TB => TB, TD=>TD,
                                                   A=> RegFileAout, B => RegFileBout);
  ADD => RegFileAout; 
end Behavioral; 
