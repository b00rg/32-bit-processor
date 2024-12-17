----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 17:24:01
-- Design Name: 
-- Module Name: CPU_ControlMemory_22336157 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity CPU_ControlMemory_22336157 is
  Port (
    Address: in std_logic_vector(16 downto 0); -- 17-bit input address
    NA : out std_logic_vector(16 downto 0);   -- 17-bit output
    MS : out std_logic_vector(2 downto 0);    -- 3-bit output
    MC, IL, PI, PL, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out std_logic; -- Single-bit outputs
    FS : out std_logic_vector(4 downto 0);    -- 5-bit output
    TA, TB, TD : out std_logic_vector(3 downto 0) -- 4-bit outputs
  );
end CPU_ControlMemory_22336157;

architecture Behavioral of CPU_ControlMemory_22336157 is
    -- Define memory array type: 256 elements, each 51 bits wide
    type mem_array is array(0 to 255) of std_logic_vector(50 downto 0);
    -- Signal to hold the memory
    signal control_mem : mem_array;

begin
    -- Process to initialize the memory array
    process
    begin
        for i in 0 to 255 loop
            -- Initialize memory with index values for simplicity
            -- Customize as needed for specific memory patterns
            control_mem(i) <= std_logic_vector(to_unsigned(i, 51));
        end loop;
        wait; -- End process after initialization
    end process;

    -- Process to decode and output memory content based on Address input
            -- Map memory content to outputs based on the 17-bit Address input
            NA <= control_mem(to_integer(unsigned(Address)))(50 downto 34);
            MS <= control_mem(to_integer(unsigned(Address)))(33 downto 31);
            MC <= control_mem(to_integer(unsigned(Address)))(30);
            IL <= control_mem(to_integer(unsigned(Address)))(29);
            PI <= control_mem(to_integer(unsigned(Address)))(28);
            PL <= control_mem(to_integer(unsigned(Address)))(27);
            MB <= control_mem(to_integer(unsigned(Address)))(26);
            MD <= control_mem(to_integer(unsigned(Address)))(25);
            RW <= control_mem(to_integer(unsigned(Address)))(24);
            MM <= control_mem(to_integer(unsigned(Address)))(23);
            MW <= control_mem(to_integer(unsigned(Address)))(22);
            RV <= control_mem(to_integer(unsigned(Address)))(21);
            RC <= control_mem(to_integer(unsigned(Address)))(20);
            RN <= control_mem(to_integer(unsigned(Address)))(19);
            RZ <= control_mem(to_integer(unsigned(Address)))(18);
            FL <= control_mem(to_integer(unsigned(Address)))(17);
            FS <= control_mem(to_integer(unsigned(Address)))(16 downto 12);
            TA <= control_mem(to_integer(unsigned(Address)))(11 downto 8);
            TB <= control_mem(to_integer(unsigned(Address)))(7 downto 4);
            TD <= control_mem(to_integer(unsigned(Address)))(3 downto 0);

end Behavioral;
