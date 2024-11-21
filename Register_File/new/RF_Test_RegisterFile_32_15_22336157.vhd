----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 16.10.2024 11:56:23
-- Design Name: 
-- Module Name: RF_Test_RegisterFile_32_15_22336157 - Behavioral
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

entity RF_Test_RegisterFile_32_15_22336157 is
    Port ( DR_Test : in STD_LOGIC_VECTOR (4 downto 0); 
          RW_Test : in STD_LOGIC; 
          SA_Test : in STD_LOGIC_VECTOR(4 downto 0);
          SB_Test : in STD_LOGIC_VECTOR(4 downto 0);
          CLK_Test : in STD_LOGIC;
          Reset_Test : in STD_LOGIC;
          TB_Test : in STD_LOGIC_VECTOR (3 downto 0);
          TA_Test : in STD_LOGIC_VECTOR (3 downto 0);
          TD_Test : in STD_LOGIC_VECTOR (3 downto 0);
          A_B_DataIN_Test : in STD_LOGIC_VECTOR (1 downto 0); 
          D_Test : in STD_LOGIC_VECTOR(31 downto 0));
end RF_Test_RegisterFile_32_15_22336157;

architecture Behavioral of RF_Test_RegisterFile_32_15_22336157 is
        COMPONENT RF_RegisterFile_32_15_22336157
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
    END COMPONENT;
    
    Component RF_Mux3_32Bit_22336157
    Port (
        I0, I1, I2 : in STD_LOGIC_VECTOR(31 downto 0); -- 32-bit inputs
        S0, S1  : in STD_LOGIC;                        -- Selection Signals
        Y : out STD_LOGIC_Vector(31 downto 0));       -- 32-bit output
    end component; 
    
         -- Propagation Delay
   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
   constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
   
   signal muxToReg, A_Signal, B_Signal : STD_LOGIC_VECTOR (31 downto 0); 
begin
    RegFile : RF_RegisterFile_32_15_22336157 Port Map(CLK => CLK_Test, DR => DR_Test, RW => RW_Test, SA => SA_Test, SB => SB_Test, TA => TA_Test, TB => TB_Test, TD => TD_Test, D=>muxToReg, Reset => Reset_Test, A => A_Signal, B=> B_Signal);
    
    	Mux3 : RF_Mux3_32Bit_22336157 Port Map(S0 => A_B_DataIN_Test(0), S1 => A_B_DataIN_Test(1), -- Signals
		I0 => A_Signal, I1 => B_Signal, I2 => D_Test,
		Y => muxToReg);
    
end Behavioral;