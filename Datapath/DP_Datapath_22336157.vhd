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
      MB, MD, RW, Reset, clock      : in STD_LOGIC;                     
      DR, FS, SA, SB         : in STD_LOGIC_VECTOR(4 downto 0);
      TA, TB, TD             : in STD_LOGIC_VECTOR(3 downto 0);
      DATA_OUT, ADD          : out STD_LOGIC_VECTOR(31 downto 0);  
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

   component  CPU_Mux2_32Bit_22336157 is   
   Port (
        I0, I1 : in STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit inputs
        S      : in STD_LOGIC;                      -- single select bit
        Y      : out STD_LOGIC_VECTOR(31 downto 0)  -- 32-bit output
    );
    end component;
    
    component RF_RegisterFile_32_15_22336157 is
    Port ( DR : in STD_LOGIC_VECTOR (4 downto 0); 
          RW : in STD_LOGIC; 
          SA : in STD_LOGIC_VECTOR(4 downto 0);
          SB : in STD_LOGIC_VECTOR(4 downto 0);
          CLK : in STD_LOGIC;
          D : in STD_LOGIC_VECTOR (31 downto 0);
          Reset : in STD_LOGIC;
          TB : in STD_LOGIC_VECTOR (3 downto 0);
          TA : in STD_LOGIC_VECTOR (3 downto 0);
          TD : in STD_LOGIC_VECTOR (3 downto 0);
	  A : out STD_LOGIC_VECTOR(31 downto 0);
	  B : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component DP_FunctionalUnit_22336157 is
    Port ( B, A : in STD_LOGIC_VECTOR(31 downto 0);
        FS : in STD_LOGIC_VECTOR(4 downto 0);
        C, N, Z, V : out STD_LOGIC; 
        F : out STD_LOGIC_VECTOR(31 downto 0));
end component;
  signal MuxBOut, MuxDout, FunctionalUnitFout, RegFileAout, RegFileBout : STD_LOGIC_Vector(31 downto 0);
begin
  MuxB : CPU_Mux2_32Bit_22336157 Port map(I0 => RegFileBOut, I1 => IR_IN, S=> MB, Y => MuxBOut);
  DATA_OUT <= MuxBout; 
  MuxD : CPU_Mux2_32Bit_22336157 Port map(I0 => FunctionalUnitFout, I1 => DATA_IN, S=> MD, Y => MuxDout);
  FunctionalUnit : DP_FunctionalUnit_22336157 Port Map(A => RegFileAOut, B => MuxBOut, FS => FS, C => C, F => FunctionalUnitFout, N=>N, V=>V, Z=>Z);
  RegFile : RF_RegisterFile_32_15_22336157 Port Map(Clk => Clock, D => MuxDOut, DR => Dr, RW => RW, Reset => Reset, SA => SA, SB => SB, TA=> TA, TB => TB, TD=>TD,
                                                   B=>  RegFileBout, A =>RegFileAout);
  ADD <= RegFileAout; 
end Behavioral; 
