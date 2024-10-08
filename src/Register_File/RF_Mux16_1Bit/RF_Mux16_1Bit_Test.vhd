library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Mux16_1 is
    Port (
        I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : in STD_LOGIC;
        S0, S1, S2, S3 : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end RF_Mux16_1;

architecture Behavioral of RF_Mux16_1 is
    -- Internal signals for AND gates
    signal and00, and01, and02, and03, and10, and11, and12, and13, and20, and21, and22, and23, and30, and31, and32, and33 : STD_LOGIC;

    -- Internal signals for OR gates
    signal or00, or01, or02, or10, or11, or12, or20, or21, or30, or31, or32, or33, or40, or41, or42, or43 : STD_LOGIC;

begin
    -- AND gates for each input, separated into smaller steps
    and00 <= I0 and not S0;
    and01 <= and00 and not S1;
    and02 <= and01 and not S2;
    and03 <= and02 and not S3;
    -- ... similar steps for and10, and20, and30

    and10 <= I1 and not S0;
    and11 <= and10 and not S1;
    and12 <= and11 and not S2;
    and13 <= and12 and S3;
    -- ... similar steps for and14, and15

    and20 <= I2 and not S0;
    and21 <= and20 and not S1;
    and22 <= and21 and S2;
    and23 <= and22 and not S3;
    -- ... similar steps for and23

    and30 <= I3 and not S0;
    and31 <= and30 and not S1;
    and32 <= and31 and S2;
    and33 <= and32 and S3;
    -- ... similar steps for and33

    -- OR gates to combine the AND outputs, separated into smaller steps
    or00 <= and03 or and13;
    or01 <= or00 or and23;
    or02 <= or01 or and33;

    or10 <= and02 or and12;
    or11 <= or10 or and22;
    or12 <= or11 or and32;

    or20 <= and01 or and11;
    or21 <= or20 or and21;
    or22 <= or21 or and31;

    or30 <= and00 or and10;
    or31 <= or30 or and20;
    or32 <= or31 or and30;

    -- Final OR gate to combine the OR outputs
    or40 <= or02 or or12;
    or41 <= or40 or or22;
    or42 <= or41 or or32;
    or43 <= or42 or or33;

    Y <= or43;
end Behavioral;
