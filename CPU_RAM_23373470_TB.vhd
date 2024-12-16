
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2024 16:30:26
-- Design Name: 
-- Module Name: CPU_RAM_23373470_TB - Simulation
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU_RAM_23373470_TB is
--  Port ( );
end CPU_RAM_23373470_TB;

architecture Simulation of CPU_RAM_23373470_TB is

component CPU_RAM_23373470 is
    Port ( 
        Clock : in STD_LOGIC ;
        Address : in STD_LOGIC_VECTOR (31 downto 0) ;
        DataIn : in STD_LOGIC_VECTOR (31 downto 0) ;
        WriteEnable : in STD_LOGIC ;
        DataOut : out STD_LOGIC_VECTOR (31 downto 0)
     ) ;
end component;
    
    Signal Address_TB, DataIn_TB, DataOut_TB : std_logic_vector (31 downto 0);
    Signal CLK_TB, WriteEnable_TB : STD_LOGIC := '0';
    constant STUDENTID : std_logic_vector (31 downto 0) := x"0164A69E";
    constant PERIOD : time := 300 ns;
    
begin

     uut : CPU_RAM_23373470 
     Port map(
            Clock => CLK_tb,
            Address => Address_TB,
            DataIn => DataIn_TB,
            WriteEnable => WriteEnable_TB,
            DataOut => DataOut_TB
        );

  CLK_TB <= not CLK_TB after PERIOD/2;         
  
  
stim_proc : process                                      
begin                                                    
   
WriteEnable_TB <= '0' after PERIOD/4;        
wait until CLK_Tb'event and CLK_TB='1';                  
    DataIn_TB <= x"00000000";
    Address_TB <= x"00000001";                           
wait until CLK_Tb'event and CLK_TB='1'; 
        
end process;


end Simulation;
