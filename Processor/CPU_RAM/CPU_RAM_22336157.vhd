
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 16.12.2024 15:24:05
-- Design Name: 
-- Module Name: CPU_RAM_22336157 - Behavioural
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_memory is
Port (FL : out std_logic; -- 0
    RZ : out std_logic; -- 1
    RN : out std_logic; -- 2
    RC : out std_logic; -- 3
    RV : out std_logic; -- 4
    MW : out std_logic; -- 5
    MM : out std_logic; -- 6
    RW : out std_logic; -- 7
    MD : out std_logic; -- 8
    FS : out std_logic_vector(4 downto 0); -- 9 to 13
    MB : out std_logic; -- 14
    TB : out std_logic; -- 15
    TA : out std_logic; -- 16
    TD : out std_logic; -- 17
    PL : out std_logic; -- 18
    PI : out std_logic; -- 19
    IL : out std_logic; -- 20
    MC : out std_logic; -- 21
    MS : out std_logic_vector(2 downto 0); -- 22 to 24
    NA : out std_logic_vector(16 downto 0); -- 25 to 41
    IN_CAR : in std_logic_vector(16 downto 0));
end control_memory;

architecture Behavioral of control_memory is
type mem_array is array(0 to 255) of std_logic_vector(41 downto 0);

  memory_m: process(in_car)
    variable addr: integer;
    variable control_out: std_logic_vector(41 downto 0);
  begin
    addr := conv_integer(IN_CAR);
    control_out := control_mem(addr);
    FL <= control_out(0);
    RZ <= control_out(1);
    RN <= control_out(2);
    RC <= control_out(3);
    RV <= control_out(4);
    MW <= control_out(5);
    MM <= control_out(6);
    RW <= control_out(7);
    MD <= control_out(8);
    FS <= control_out(13 downto 9);
    MB <= control_out(14);
    TB <= control_out(15);
    TA <= control_out(16);
    TD <= control_out(12);
    PL <= control_out(17);
    PI <= control_out(19);
    IL <= control_out(20);
    MC <= control_out(21);
    MS <= control_out(24 downto 22);
    NA <= control_out(41 downto 25);
  end process;
end Behavioral;
