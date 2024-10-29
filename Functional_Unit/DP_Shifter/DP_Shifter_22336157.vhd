----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 22:19:50
-- Design Name: 
-- Module Name: DP_Shifter_22336157 - Behavioral
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

entity DP_Shifter_22336157 is
    Port ( B : in STD_LOGIC_VECTOR(31 downto 0);
         S1, S2 : in STD_LOGIC;
          G : out STD_LOGIC_VECTOR(31 downto 0);
          C : out STD_LOGIC);
end DP_Shifter_22336157;

architecture Behavioral of DP_Shifter_22336157 is:
  component DP_Mux3_1Bit
	Port ( I0 , I1 , I2 :  in STD_LOGIC ; 		-- 1 bit inputs
		S0, S1 : in STD_LOGIC; 			-- Selection Signals
		Y : out STD_LOGIC ) ;  			-- 1 bit output
  end_component; 

      -- Propagation Delay according to Student ID
    constant AND_gate_delay : Time := 6 ns; 
    constant NAND_gate_delay : Time := 3 ns;
    constant OR_gate_delay : Time := 8 ns;
    constant NOR_gate_delay : Time := 6 ns;
    constant XOR_gate_delay : Time := 4 ns;
    constant XNOR_gate_delay : Time := 4 ns;
    constant NOT_gate_delay : Time := 7 ns;

begin
    BIT0: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(0), S1 => S1, i0 => 0, i1 => B(1), Gi => G(0));
    BIT1: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(1), S1 => S1, i0 => B(0), i1 => B(2), Gi => G(1));
    BIT2: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(2), S1 => S1, i0 => B(1), i1 => B(3), Gi => G(2));
    BIT3: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(3), S1 => S1, i0 => B(2), i1 => B(4), Gi => G(3));
    BIT4: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(4), S1 => S1, i0 => B(3), i1 => B(5), Gi => G(4));
    BIT5: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(5), S1 => S1, i0 => B(4), i1 => B(6), Gi => G(5));
    BIT6: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(6), S1 => S1, i0 => B(5), i1 => B(7), Gi => G(6));
    BIT7: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(7), S1 => S1, i0 => B(6), i1 => B(8), Gi => G(7));
    BIT8: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(8), S1 => S1, i0 => B(7), i1 => B(9), Gi => G(8));
    BIT9: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(9), S1 => S1, i0 => B(8), i1 => B(10), Gi => G(9));
    BIT10: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(10), S1 => S1, i0 => B(9), i1 => B(11), Gi => G(10));
    BIT11: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(11), S1 => S1, i0 => B(10), i1 => B(12), Gi => G(11));
    BIT12: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(12), S1 => S1, i0 => B(11), i1 => B(13), Gi => G(12));
    BIT13: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(13), S1 => S1, i0 => B(12), i1 => B(14), Gi => G(13));
    BIT14: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(14), S1 => S1, i0 => B(13), i1 => B(15), Gi => G(14));
    BIT15: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(15), S1 => S1, i0 => B(14), i1 => B(16), Gi => G(15));
    BIT16: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(16), S1 => S1, i0 => B(15), i1 => B(17), Gi => G(16));
    BIT17: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(17), S1 => S1, i0 => B(16), i1 => B(18), Gi => G(17));
    BIT18: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(18), S1 => S1, i0 => B(17), i1 => B(19), Gi => G(18));
    BIT19: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(19), S1 => S1, i0 => B(18), i1 => B(20), Gi => G(19));
    BIT20: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(20), S1 => S1, i0 => B(19), i1 => B(21), Gi => G(20));
    BIT21: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(21), S1 => S1, i0 => B(20), i1 => B(22), Gi => G(21));
    BIT22: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(22), S1 => S1, i0 => B(21), i1 => B(23), Gi => G(22));
    BIT23: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(23), S1 => S1, i0 => B(22), i1 => B(24), Gi => G(23));
    BIT24: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(24), S1 => S1, i0 => B(23), i1 => B(25), Gi => G(24));
    BIT25: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(25), S1 => S1, i0 => B(24), i1 => B(26), Gi => G(25));
    BIT26: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(26), S1 => S1, i0 => B(25), i1 => B(27), Gi => G(26));
    BIT27: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(27), S1 => S1, i0 => B(26), i1 => B(28), Gi => G(27));
    BIT28: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(28), S1 => S1, i0 => B(27), i1 => B(29), Gi => G(28));
    BIT29: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(29), S1 => S1, i0 => B(28), i1 => B(30), Gi => G(29));
    BIT30: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(30), S1 => S1, i0 => B(29), i1 => B(31), Gi => G(30));
    BIT31: DP_Mux3_1Bit_22336157 PORT MAP (Bi => B(31), S1 => S1, i0 => B(30), i1 => 0, Gi => G(31));

    CFlagMux : DP_ShifterCFlagMux2_1Bit_22336157 PORT MAP (LSB => B(0), MSB => B(31), S1 => S1, S2 => S2, C => C));

end Behavioral; 
