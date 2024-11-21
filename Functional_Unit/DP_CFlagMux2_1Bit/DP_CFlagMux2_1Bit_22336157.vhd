----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 22:19:50
-- Design Name: 
-- Module Name: DP_CFlagMux2_1Bit_22336157 - Behavioral
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

library IEEE ;
use IEEE . STD_LOGIC_1164 .ALL;

entity DP_CFlagMux2_1Bit_22336157 is
  Port (I0 , I1 , S : in STD_LOGIC ;
  Y : out STD_LOGIC );
  end DP_CFlagMux2_1Bit_22336157 ;

  architecture Behavioral of DP_CFlagMux2_1Bit_22336157 is
    signal S_not , and0 , and1 : std_logic ;
    constant AND_gate_delay : Time := 6ns; -- 6 =5+1
    constant NAND_gate_delay : Time := 3ns;-- 3=2+1
    constant OR_gate_delay : Time := 8ns;  -- 8=7+1
    constant NOR_gate_delay : Time := 6ns; -- 6=5+1
    constant XOR_gate_delay : Time := 4ns; -- 4=3+1
    constant XNOR_gate_delay : Time := 4ns;-- 4=3+1
    constant NOT_gate_delay : Time := 7ns; -- 7=6+1

  begin
    S_not <= not S after NOT_gate_delay;
    and0 <= I0 and S_not after AND_gate_delay;
    and1 <= I1 and S after AND_gate_delay;
    Y <= and0 or and1 after OR_gate_delay;
  end Behavioral ;
