library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DP_ZeroDetection_22336157 is
    Port (
        input_vector : in  STD_LOGIC_VECTOR(30 downto 0);  -- 31-bit input vector
        zero_flag    : out STD_LOGIC                         -- 1-bit output flag
    );
end DP_ZeroDetection_22336157;

architecture Simulation of DP_ZeroDetection_22336157 is
begin
    -- Directly assign zero_flag based on the condition of input_vector
    zero_flag <= '1' when (input_vector = (others => '0')) else '0';

end Simulation;