----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.09.2023
-- Design Name: 
-- Module Name: Mux16_32Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 16-to-1 Multiplexer
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

entity RF_Mux16_1Bit is
    Port (
        I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : in STD_LOGIC;
        S0, S1, S2, S3 : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end RF_Mux16_1Bit;

architecture Behavioral of RF_Mux16_1Bit is
    -- Internal signals for AND gates
    signal and00, and01, and02, and03, and10, and11, and12, and13, and20, and21, and22, and23, and30, and31, and32, and33, and40, and41, and42, and43, and50, and51, and52, and53, and60, and61, and62, and63, and70, and71, and72, and73, and80, and81, and82, and83, and90, and91, and92, and93, and100, and101, and102, and103, and110, and111, and112, and113, and120, and121, and122, and123, and130, and131, and132, and133, and140, and141, and142, and143, and150, and151, and152, and153 : STD_LOGIC := '0';

    -- OR gates to combine the AND outputs
    signal or00, or01, or02, or03, or04, or05, or06, or07, or08, or09, or10, or11, or12, or13, or14 : STD_LOGIC := '0';
    
    signal S0_not, S1_not, S2_not, S3_not : STD_LOGIC := '0';
        -- Propagation Delay (as per your original specification)
    constant AND_gate_delay : Time := 8ns;
    constant OR_gate_delay : Time := 2ns;
    constant NOT_gate_delay : Time := 3ns;
    

begin
    -- Invert the selection signals
    S0_not <= not S0 after NOT_gate_delay;
    S1_not <= not S1 after NOT_gate_delay;
    S2_not <= not S2 after NOT_gate_delay;
    S3_not <= not S3 after NOT_gate_delay;

    -- AND gates for each input (unpacked)
    and00 <= I0 and S0_not after AND_gate_delay;
    and01 <= and00 and S1_not fter AND_gate_delay;
    and02 <= and01 and S2_not after AND_gate_delay;
    and03 <= and02 and S3_not after AND_gate_delay;

    and10 <= I1 and S0 after AND_gate_delay;
    and11 <= and10 and S1_not after AND_gate_delay;
    and12 <= and11 and S2_not after AND_gate_delay;
    and13 <= and12 and S3_not after AND_gate_delay;

    and20 <= I2 and S0_not after AND_gate_delay;
    and21 <= and20 and S1 after AND_gate_delay;
    and22 <= and21 and S2_not after AND_gate_delay;
    and23 <= and22 and S3_not after AND_gate_delay;

    and30 <= I3 and S0 after AND_gate_delay;
    and31 <= and30 and S1 after AND_gate_delay;
    and32 <= and31 and S2_not after AND_gate_delay;
    and33 <= and32 and S3_not after AND_gate_delay;

    and40 <= I4 and S0_not after AND_gate_delay;
    and41 <= and40 and S1_not after AND_gate_delay;
    and42 <= and41 and S2 after AND_gate_delay;
    and43 <= and42 and S3_not after AND_gate_delay;

    and50 <= I5 and S0 after AND_gate_delay;
    and51 <= and50 and S1_not after AND_gate_delay;
    and52 <= and51 and S2 after AND_gate_delay;
    and53 <= and52 and S3_not after AND_gate_delay;

    and60 <= I6 and S0_not after AND_gate_delay;
    and61 <= and60 and S1 after AND_gate_delay;
    and62 <= and61 and S2 after AND_gate_delay;
    and63 <= and62 and S3_not after AND_gate_delay;

    and70 <= I7 and S0 after AND_gate_delay;
    and71 <= and70 and S1 after AND_gate_delay;
    and72 <= and71 and S2 after AND_gate_delay;
    and73 <= and72 and S3_not after AND_gate_delay;

    and80 <= I8 and S0_not after AND_gate_delay;
    and81 <= and80 and S1_not after AND_gate_delay;
    and82 <= and81 and S2_not after AND_gate_delay;
    and83 <= and82 and S3 after AND_gate_delay;

    and90 <= I9 and S0 after AND_gate_delay;
    and91 <= and90 and S1_not after AND_gate_delay;
    and92 <= and91 and S2_not after AND_gate_delay;
    and93 <= and92 and S3 after AND_gate_delay;

    and100 <= I10 and S0_not after AND_gate_delay;
    and101 <= and100 and S1 after AND_gate_delay;
    and102 <= and101 and S2_not after AND_gate_delay;
    and103 <= and102 and S3 after AND_gate_delay;

    and110 <= I11 and S0 after AND_gate_delay;
    and111 <= and110 and S1 after AND_gate_delay;
    and112 <= and111 and S2_not after AND_gate_delay;
    and113 <= and112 and S3 after AND_gate_delay;

    and120 <= I12 and S0_not after AND_gate_delay;
    and121 <= and120 and S1_not after AND_gate_delay;
    and122 <= and121 and S2 after AND_gate_delay;
    and123 <= and122 and S3 after AND_gate_delay;

    and130 <= I13 and S0 after AND_gate_delay;
    and131 <= and130 and S1_not after AND_gate_delay;
    and132 <= and131 and S2 after AND_gate_delay;
    and133 <= and132 and S3 after AND_gate_delay;

    and140 <= I14 and S0_not after AND_gate_delay;
    and141 <= and140 and S1 after AND_gate_delay;
    and142 <= and141 and S2 after AND_gate_delay;
    and143 <= and142 and S3 after AND_gate_delay;

    and150 <= I15 and S0 after AND_gate_delay;
    and151 <= and150 and S1 after AND_gate_delay;
    and152 <= and151 and S2 after AND_gate_delay;
    and153 <= and152 and S3 after AND_gate_delay;

    -- OR gates
    or00 <= and03 or and13 after OR_gate_delay;
    or01 <= or00 or and23 after OR_gate_delay;
    or02 <= or01 or and33 after OR_gate_delay;
    or03 <= or02 or and43 after OR_gate_delay;
    or04 <= or03 or and53 after OR_gate_delay;
    or05 <= or04 or and63 after OR_gate_delay;
    or06 <= or05 or and73 after OR_gate_delay;
    or07 <= or06 or and83 after OR_gate_delay;
    or08 <= or07 or and93 after OR_gate_delay;
    or09 <= or08 or and103 after OR_gate_delay;
    or10 <= or09 or and113 after OR_gate_delay;
    or11 <= or10 or and123 after OR_gate_delay;
    or12 <= or11 or and133 after OR_gate_delay;
    or13 <= or12 or and143 after OR_gate_delay;
    or14 <= or13 or and153 after OR_gate_delay;

    -- Final output
    Y <= or14;

end Behavioral;
