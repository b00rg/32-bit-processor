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
   		
A_TB <= x"00
B_TB <= x"01";
C_IN_TB <= '0'
wait for WaitPERIOD;
--Test case 0
A_TB <= x"00";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 1
A_TB <= x"01";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 2
A_TB <= x"02";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 3
A_TB <= x"03";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 4
A_TB <= x"04";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 5
A_TB <= x"05";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 6
A_TB <= x"06";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 7
A_TB <= x"07";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 8
A_TB <= x"08";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 9
A_TB <= x"09";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 10
A_TB <= x"0a";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 11
A_TB <= x"0b";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 12
A_TB <= x"0c";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 13
A_TB <= x"0d";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 14
A_TB <= x"0e";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 15
A_TB <= x"0f";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 16
A_TB <= x"10";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 17
A_TB <= x"11";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 18
A_TB <= x"12";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 19
A_TB <= x"13";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 20
A_TB <= x"14";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 21
A_TB <= x"15";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 22
A_TB <= x"16";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 23
A_TB <= x"17";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 24
A_TB <= x"18";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 25
A_TB <= x"19";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 26
A_TB <= x"1a";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 27
A_TB <= x"1b";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 28
A_TB <= x"1c";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 29
A_TB <= x"1d";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 30
A_TB <= x"1e";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 31
A_TB <= x"1f";
B_TB <= x"01";
C_IN_TB <= '0';
wait for WaitPERIOD;


--Test case 32
A_TB <= x"00";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 33
A_TB <= x"01";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 34
A_TB <= x"02";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 35
A_TB <= x"03";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 36
A_TB <= x"04";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 37
A_TB <= x"05";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 38
A_TB <= x"06";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 39
A_TB <= x"07";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 40
A_TB <= x"08";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 41
A_TB <= x"09";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 42
A_TB <= x"0a";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 43
A_TB <= x"0b";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 44
A_TB <= x"0c";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 45
A_TB <= x"0d";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 46
A_TB <= x"0e";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 47
A_TB <= x"0f";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 48
A_TB <= x"10";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 49
A_TB <= x"11";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 50
A_TB <= x"12";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 51
A_TB <= x"13";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 52
A_TB <= x"14";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 53
A_TB <= x"15";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 54
A_TB <= x"16";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 55
A_TB <= x"17";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 56
A_TB <= x"18";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 57
A_TB <= x"19";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 58
A_TB <= x"1a";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 59
A_TB <= x"1b";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 60
A_TB <= x"1c";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 61
A_TB <= x"1d";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 62
A_TB <= x"1e";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;


--Test case 63
A_TB <= x"1f";
B_TB <= x"01";
C_IN_TB <= '1'; 
wait for WaitPERIOD;
 
   end process;
end Sim;
