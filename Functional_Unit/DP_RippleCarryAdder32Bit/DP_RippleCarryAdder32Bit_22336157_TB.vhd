----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 23:51:26
-- Design Name: 
-- Module Name: RippleCarryAdder32Bit_22336157_TB - Behavioral
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

entity RippleCarryAdder32Bit_22336157_TB is
--  Port ( ); We don't need ports 
end RippleCarryAdder32Bit_22336157_TB;

architecture Sim of RippleCarryAdder32Bit_22336157_TB is

-- Component Declaration for the Unit Under Test (UUT)

component RippleCarryAdder32Bit_22336157

Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
       B : in STD_LOGIC_VECTOR (31 downto 0);
       C_IN : in STD_LOGIC;
       SUM : out STD_LOGIC_VECTOR (31 downto 0);
       C_OUT : out STD_LOGIC;
       V : out STD_LOGIC);
end component;

--Inputs

    signal A_TB : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal B_TB : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal C_IN_TB : STD_LOGIC := '0';
  
--Outputs

    signal SUM_TB : STD_LOGIC_VECTOR (31 downto 0)  := (others => '0');
    signal C_OUT_TB : STD_LOGIC := '0';
    signal V_TB : STD_LOGIC := '0';
    
-- StudentID e.g. 26 33 57 25(DEC) = 1 91 D9 ED(HEX)
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D"; 
   constant WaitPERIOD : time := 100ns;
   
begin

	-- Instantiate the Unit Under Test (UUT)
   uut: RippleCarryAdder32Bit_22336157 PORT MAP (
       A => A_TB,
       B => B_TB,
       C_IN => C_IN_TB,
       SUM => SUM_TB,
       C_OUT => C_OUT_TB,
       V => V_TB
       );

 stim_proc: process
   begin
A_TB <= x"0000000000000000000000000000000";
B_TB <= x"01";
C_IN_TB <= '0'
--Test case 0
A_TB <= x"0000000000000000000000000000000";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 1
A_TB <= x"0000000000000000000000000000001";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 2
A_TB <= x"0000000000000000000000000000010";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 3
A_TB <= x"0000000000000000000000000000011";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 4
A_TB <= x"0000000000000000000000000000100";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 5
A_TB <= x"0000000000000000000000000000101";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 6
A_TB <= x"0000000000000000000000000000110";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 7
A_TB <= x"0000000000000000000000000000111";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '0';
wait for WaitPERIOD;
	
--Test case 8
A_TB <= x"0000000000000000000000000000000";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 9
A_TB <= x"0000000000000000000000000000001";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 10
A_TB <= x"0000000000000000000000000000010";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 11
A_TB <= x"0000000000000000000000000000011";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 12
A_TB <= x"0000000000000000000000000000100";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 13
A_TB <= x"0000000000000000000000000000101";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 14
A_TB <= x"0000000000000000000000000000110";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 15
A_TB <= x"0000000000000000000000000000111";
B_TB <= x"0000000000000000000000000000001";
C_IN_TB <= '1'; 
wait for WaitPERIOD;

 
   end process;
end Sim;
