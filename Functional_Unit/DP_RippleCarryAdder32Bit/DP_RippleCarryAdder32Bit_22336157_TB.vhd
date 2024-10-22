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
   
	-- carry unset 
	A_TB <= 00000;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 00001;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 00010;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 00011;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 00100;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 00101;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 00110;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 00111;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 01000;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 01001;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 01010;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 01011;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 01100;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 01101;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 01110;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 01111;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 10000;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 10001;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 10010;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 10011;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 10100;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 10101;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 10110;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 10111;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 11000;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 11001;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 11010;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 11011;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 11100;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 11101;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 11110;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
	A_TB <= 11111;
	B_TB <= "00001";
	C_IN_TB <= '0';     
	
	wait for WaitPERIOD;
        
  -- carry set 
   		
      A_TB <= "000";
      B_TB <= "000";
      C_IN_TB <= '1';
      
      wait for WaitPERIOD;	
	A_TB <= 00000;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 00001;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 00010;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 00011;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 00100;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 00101;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 00110;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 00111;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 01000;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 01001;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 01010;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 01011;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 01100;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 01101;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 01110;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 01111;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 10000;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 10001;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 10010;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 10011;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 10100;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 10101;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 10110;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 10111;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 11000;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 11001;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 11010;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 11011;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 11100;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 11101;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 11110;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
	A_TB <= 11111;
	B_TB <= "00001";
	C_IN_TB <= '1';     
	
	wait for WaitPERIOD;
 
   end process;
end Sim;
