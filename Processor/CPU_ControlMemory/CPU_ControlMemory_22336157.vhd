----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU_ControlMemory_22336157 is
  Port ( Address: in std_logic_vector(16 downto 0);
         NA : out std_logic_vector(16 downto 0);
         MS : out std_logic_vector(2 downto 0);
         MC, IL, PI, PL, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out std_logic;
         FS : out std_logic_vector(4 downto 0);
         TA, TB, TD : out std_logic_vector(3 downto 0)
  );
end CPU_ControlMemory_22336157;

architecture Behavioral of CPU_ControlMemory_22336157 is
type mem_array is array(0 to 255) of std_logic_vector(50 downto 0);
signal control_mem : mem_array;

-- Example process to initialize the memory
begin
process
begin
    for i in 0 to 255 loop
        -- Example initialization logic:
        -- Assign a 51-bit value to each index of the array.
        -- Customize the logic based on your requirements.
        control_mem(i) <= std_logic_vector(to_unsigned(i, 51)); -- Example: Assign binary representation of `i` with 51 bits.
    end loop;

    -- If specific values are required for some indices:
    -- control_mem(5) <= "000000000000000000000000000000000111000000";
    -- control_mem(10) <= "000000000000000000000000000000000001110000";

    wait; -- Ends the process to prevent it from running repeatedly.
end process;

begin
    -- Process to decode memory content based on Address input
    process(Address)
    begin
        if unsigned(Address) < 256 then
            -- Assign memory fields to outputs
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
        else
            -- Assign default values if address is out of range
            NA <= (others => '0');
            MS <= (others => '0');
            MC <= '0';
            IL <= '0';
            PI <= '0';
            PL <= '0';
            MB <= '0';
            MD <= '0';
            RW <= '0';
            MM <= '0';
            MW <= '0';
            RV <= '0';
            RC <= '0';
            RN <= '0';
            RZ <= '0';
            FL <= '0';
            FS <= (others => '0');
            TA <= (others => '0');
            TB <= (others => '0');
            TD <= (others => '0');
        end if;
    end process;

end Behavioral;
