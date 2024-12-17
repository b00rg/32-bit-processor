
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
    Port (
        FL, IL, MB, MC, MD, MM, MW, PI, PL, RC, RN, RV, RW, RZ : out std_logic; 
        FS : out std_logic_vector(4 downto 0); 
        MS : out std_logic_vector(2 downto 0); 
        NA : out std_logic_vector(16 downto 0); 
        Address : in std_logic_vector(16 downto 0);
        TA, TB, TD : out std_logic_vector(3 downto 0)
    );
end control_memory;

architecture Behavioral of control_memory is

    -- Define a type for the memory array
    type mem_array is array(0 to 50) of std_logic_vector(50 downto 0);
    -- Declare a signal to represent the memory
    signal control_mem : mem_array := (
        -- Initialize memory with example values, replace these with your actual values
        others => (others => '0')
    );

begin

    -- Process to handle memory control logic
    memory_m: process(Address)
        variable addr: integer;
        variable control_out: std_logic_vector(50 downto 0);
    begin
        -- Convert Address to integer
        addr := to_integer(unsigned(Address(5 downto 0))); -- Address size adjusted for array indexing (0 to 50)
        if addr >= 0 and addr < 51 then
            control_out := control_mem(addr);
        else
            control_out := (others => '0'); -- Default output for invalid addresses
        end if;

        -- Assign control outputs from the memory array
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
        TB <= control_out(15 downto 12);
        TA <= control_out(16 downto 13);
        TD <= control_out(12 downto 9);
        PL <= control_out(17);
        PI <= control_out(19);
        IL <= control_out(20);
        MC <= control_out(21);
        MS <= control_out(24 downto 22);
        NA <= control_out(41 downto 25);
    end process;

end Behavioral;
