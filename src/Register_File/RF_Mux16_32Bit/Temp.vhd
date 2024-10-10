library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Mux16_1Bit is
    Port (
        I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : in STD_LOGIC;
        S0, S1, S2, S3 : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end RF_Mux16_1Bit;

architecture Behavioral of RF_Mux16_1Bit is
begin
    process (S0, S1, S2, S3, I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15)
    begin
        case (S3 & S2 & S1 & S0) is
            when "0000" => Y <= I0;
            when "0001" => Y <= I1;
            when "0010" => Y <= I2;
            when "0011" => Y <= I3;
            when "0100" => Y <= I4;
            when "0101" => Y <= I5;
            when "0110" => Y <= I6;
            when "0111" => Y <= I7;
            when "1000" => Y <= I8;
            when "1001" => Y <= I9;
            when "1010" => Y <= I10;
            when "1011" => Y <= I11;
            when "1100" => Y <= I12;
            when "1101" => Y <= I13;
            when "1110" => Y <= I14;
            when "1111" => Y <= I15;
            when others => Y <= '0';  -- Default case
        end case;
    end process;
end Behavioral;
