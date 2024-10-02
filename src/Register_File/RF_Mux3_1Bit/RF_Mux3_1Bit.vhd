----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: Mux3_1Bit - Behavioral
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

entity Mux_3_to_1 is
	Port ( I0 , I1 , I2 :  in STD_LOGIC ;
		S0, S1 : in STD_LOGIC;
		Y : out STD_LOGIC ) ;  
	end Mux_3_to_1 ;

architecture Behavioral of Mux_3_to_1 is

	signal S0_not , S1_not  : std_logic ;
	
	signal and00 , and01 , and02 : std_logic ;
	
	signal l1or0 , l1or1 , l1or2 , l1or3 : std_logic ;
	signal l2or0 , l2or1 : std_logic ;

begin -- this may have to be changed to student number at a later date
	S0_not <= not S (0) after 3 ns ;
	S1_not <= not S (1) after 3 ns ;
	S2_not <= not S (2) after 3 ns ;

	and0 <= I0 and S0_not and S1_not after 4 ns; 
	and1 <= I1 and S0 and S1_not after 4 ns; 
	and2 <= I2 and S0 and S1 after 4 ns; 
	Y <= and0 or and1 or and2 after 2 ns; 
end Behavioral;
