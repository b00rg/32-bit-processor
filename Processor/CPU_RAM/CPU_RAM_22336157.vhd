
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
use IEEE.NUMERIC_STD.ALL;

entity CPU_ControlMemory_22336157 is
    Port (
        Address : in STD_LOGIC_VECTOR(16 downto 0); -- Address input
        NA      : out STD_LOGIC_VECTOR(16 downto 0); -- 34-50
        MS      : out STD_LOGIC_VECTOR(2 downto 0);  -- 31-33
        MC      : out STD_LOGIC;                    -- 30
        IL      : out STD_LOGIC;                    -- 29
        PI      : out STD_LOGIC;                    -- 28
        PL      : out STD_LOGIC;                    -- 27
        TD      : out STD_LOGIC_VECTOR(3 downto 0); -- 23-26
        TA      : out STD_LOGIC_VECTOR(3 downto 0); -- 19-22
        TB      : out STD_LOGIC_VECTOR(3 downto 0); -- 15-18
        MB      : out STD_LOGIC;                    -- 14
        FS      : out STD_LOGIC_VECTOR(4 downto 0); -- 09-13
        MD      : out STD_LOGIC;                    -- 08
        RW      : out STD_LOGIC;                    -- 07
        MM      : out STD_LOGIC;                    -- 06
        MW      : out STD_LOGIC;                    -- 05
        RV      : out STD_LOGIC;                    -- 04
        RC      : out STD_LOGIC;                    -- 03
        RN      : out STD_LOGIC;                    -- 02
        RZ      : out STD_LOGIC;                    -- 01
        FL      : out STD_LOGIC                     -- 00
    );
end CPU_ControlMemory_22336157;
signal content_at_address : STD_LOGIC_VECTOR(50 downto 0);

begin

    content_at_address <= ROM(to_integer(unsigned(Address(6 downto 0)))) after 2 ns;

    NA <= content_at_address(50 downto 34); -- 34-50
    MS <= content_at_address(33 downto 31); -- 31-33
    MC <= content_at_address(30);           -- 30
    IL <= content_at_address(29);           -- 29
    PI <= content_at_address(28);           -- 28
    PL <= content_at_address(27);           -- 27
    TD <= content_at_address(26 downto 23); -- 23-26
    TA <= content_at_address(22 downto 19); -- 19-22
    TB <= content_at_address(18 downto 15); -- 15-18
    MB <= content_at_address(14);           -- 14
    FS <= content_at_address(13 downto 9);  -- 09-13
    MD <= content_at_address(8);            -- 08
    RW <= content_at_address(7);            -- 07
    MM <= content_at_address(6);            -- 06
    MW <= content_at_address(5);            -- 05
    RV <= content_at_address(4);            -- 04
    RC <= content_at_address(3);            -- 03
    RN <= content_at_address(2);            -- 02
    RZ <= content_at_address(1);            -- 01
    FL <= content_at_address(0);            -- 00

end Behavioral;
