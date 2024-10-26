----------------------------------------------------------------------------------
-- Company:
-- Engineer: Emma Burgess
-- 
-- Create Date: 06.10.2022 23:37:03
-- Design Name: 
-- Module Name: RippleCarryAdder32Bit_22336157 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 32-bit Ripple Carry Adder
-- 
-- Dependencies: FullAdder_22336157.vhdl
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

entity RippleCarryAdder32Bit_22336157 is
    Port ( 
        A : in STD_LOGIC_VECTOR (31 downto 0);
        B : in STD_LOGIC_VECTOR (31 downto 0);
        C_IN : in STD_LOGIC; -- single bit initial carry-in
        SUM : out STD_LOGIC_VECTOR (31 downto 0);
        C_OUT : out STD_LOGIC; -- final carry-out bit
        V : out STD_LOGIC -- overflow indicator
    );
end RippleCarryAdder32Bit_22336157;

architecture Behavioral of RippleCarryAdder32Bit_22336157 is

    COMPONENT FullAdder_22336157
        PORT(
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            C_IN : in STD_LOGIC;
            SUM : out STD_LOGIC;
            C_OUT : out STD_LOGIC
        );
    END COMPONENT;

    -- Propagation Delay according to StdentID
    constant AND_gate_delay : Time := 6 ns; 
    constant NAND_gate_delay : Time := 3 ns;
    constant OR_gate_delay : Time := 8 ns;
    constant NOR_gate_delay : Time := 6 ns;
    constant XOR_gate_delay : Time := 4 ns;
    constant XNOR_gate_delay : Time := 4 ns;
    constant NOT_gate_delay : Time := 7 ns;

    -- Internal signal to hold carry between stages
    signal carry : STD_LOGIC_VECTOR(31 downto 0);

begin

    -- Initial carry-in to the first full adder
    carry(0) <= C_IN after NOT_gate_delay;

    -- Instantiate Full Adders for each bit position
    gen_adders: for i in 0 to 31 generate
        adder: FullAdder_22336157 
        port map (
            A => A(i),
            B => B(i),
            C_IN => carry(i),
            SUM => SUM(i),
            C_OUT => carry(i+1) -- cascaded carry
        );
    end generate;

    -- Set the final carry-out bit (from the last adder stage)
    C_OUT <= carry(31) after AND_gate_delay;

    -- Overflow flag (V) calculation: XOR between carry-in and carry-out of the MSB
    V <= carry(30) XOR carry(31) after XOR_gate_delay;

end Behavioral;
