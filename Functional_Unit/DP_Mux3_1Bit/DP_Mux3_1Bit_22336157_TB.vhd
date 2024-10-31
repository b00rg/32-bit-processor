----------------------------------------------------------------------------------
-- Test Bench for DP_Mux3_1Bit_22336157
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

entity DP_Mux3_1Bit_22336157_tb is
end DP_Mux3_1Bit_22336157_tb;

architecture Behavioral of DP_Mux3_1Bit_22336157_tb is

    -- Component Declaration of the Unit Under Test (UUT)
    component DP_Mux3_1Bit_22336157
        Port ( B    : in STD_LOGIC;
               SLB  : in STD_LOGIC;
               srB  : in STD_LOGIC;
               S1   : in STD_LOGIC;
               S2   : in STD_LOGIC;
               G    : out STD_LOGIC);
    end component;

    -- Testbench Signals
    signal B    : STD_LOGIC := '0';
    signal SLB  : STD_LOGIC := '0';
    signal srB  : STD_LOGIC := '0';
    signal S1   : STD_LOGIC := '0';
    signal S2   : STD_LOGIC := '0';
    signal G    : STD_LOGIC;

    -- Constants
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: DP_Mux3_1Bit_22336157
        Port map (
            B => B,
            SLB => SLB,
            srB => srB,
            S1 => S1,
            S2 => S2,
            G => G
        );

    -- Stimulus Process
    process
    begin
        -- Test case 1: S1 = '0', S2 = '0' => Expect output = B
        B <= '1'; SLB <= '0'; srB <= '0'; S1 <= '0'; S2 <= '0';
        wait for CLK_PERIOD;
        assert (G = B)
        report "Test case 1 failed" severity error;

        -- Test case 2: S1 = '1', S2 = '0' => Expect output = srB
        B <= '0'; SLB <= '0'; srB <= '1'; S1 <= '1'; S2 <= '0';
        wait for CLK_PERIOD;
        assert (G = srB)
        report "Test case 2 failed" severity error;

        -- Test case 3: S1 = '0', S2 = '1' => Expect output = SLB
        B <= '0'; SLB <= '1'; srB <= '0'; S1 <= '0'; S2 <= '1';
        wait for CLK_PERIOD;
        assert (G = SLB)
        report "Test case 3 failed" severity error;

        -- Test case 4: S1 = '1', S2 = '1' => Undefined behavior, check stability
        B <= '1'; SLB <= '1'; srB <= '1'; S1 <= '1'; S2 <= '1';
        wait for CLK_PERIOD;
        assert (G = '1') or (G = '0')
        report "Test case 4 stability check failed" severity warning;

        -- End simulation
        wait;
    end process;

end Behavioral;
