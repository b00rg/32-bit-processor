library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Mux32_1 is
    Port (
        I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : in STD_LOGIC;
        S0, S1, S2, S3 : in STD_LOGIC;
        Y : out STD_LOGIC
    );
end RF_Mux32_1;

architecture Behavioral of RF_Mux32_1 is
-- Internal signals for AND gates
signal and00, and01, and02, and03, and04 : STD_LOGIC := '0';
signal and10, and11, and12, and13, and14 : STD_LOGIC := '0';
signal and20, and21, and22, and23, and24 : STD_LOGIC := '0';
signal and30, and31, and32, and33, and34 : STD_LOGIC := '0';
signal and40, and41, and42, and43, and44 : STD_LOGIC := '0';
signal and50, and51, and52, and53, and54 : STD_LOGIC := '0';
signal and60, and61, and62, and63, and64 : STD_LOGIC := '0';
signal and70, and71, and72, and73, and74 : STD_LOGIC := '0';
signal and80, and81, and82, and83, and84 : STD_LOGIC := '0';
signal and90, and91, and92, and93, and94 : STD_LOGIC := '0';
signal and100, and101, and102, and103, and104 : STD_LOGIC := '0';
signal and110, and111, and112, and113, and114 : STD_LOGIC := '0';
signal and120, and121, and122, and123, and124 : STD_LOGIC := '0';
signal and130, and131, and132, and133, and134 : STD_LOGIC := '0';
signal and140, and141, and142, and143, and144 : STD_LOGIC := '0';
signal and150, and151, and152, and153, and154 : STD_LOGIC := '0';
signal and160, and161, and162, and163, and164 : STD_LOGIC := '0';
signal and170, and171, and172, and173, and174 : STD_LOGIC := '0';
signal and180, and181, and182, and183, and184 : STD_LOGIC := '0';
signal and190, and191, and192, and193, and194 : STD_LOGIC := '0';
signal and200, and201, and202, and203, and204 : STD_LOGIC := '0';
signal and210, and211, and212, and213, and214 : STD_LOGIC := '0';
signal and220, and221, and222, and223, and224 : STD_LOGIC := '0';
signal and230, and231, and232, and233, and234 : STD_LOGIC := '0';
signal and240, and241, and242, and243, and244 : STD_LOGIC := '0';
signal and250, and251, and252, and253, and254 : STD_LOGIC := '0';
signal and260, and261, and262, and263, and264 : STD_LOGIC := '0';
signal and270, and271, and272, and273, and274 : STD_LOGIC := '0';
signal and280, and281, and282, and283, and284 : STD_LOGIC := '0';
signal and290, and291, and292, and293, and294 : STD_LOGIC := '0';
signal and300, and301, and302, and303, and304 : STD_LOGIC := '0';
signal and310, and311, and312, and313, and314 : STD_LOGIC := '0';

    -- OR gates to combine the AND outputs
    signal or00, or01, or02, or03, or04, or05, or06, or07, or08, or09, or10, or11, or12, or13, or14 : STD_LOGIC := '0';
    signal or15, or16, or17, or18, or19, or20, or21, or22, or23, or24, or25, or26, or27, or28, or29, or30 : STD_LOGIC := '0';
    
    signal S0_not, S1_not, S2_not, S3_not, S4_not : STD_LOGIC := '0';
        -- Propagation Delay (as per your original specification)
    constant AND_gate_delay : Time := 8ns;
    constant OR_gate_delay : Time := 2ns;
    constant NOT_gate_delay : Time := 3ns;
    constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";
    

begin
    -- Invert the selection signals
    S0_not <= not S0;
    S1_not <= not S1;
    S2_not <= not S2;
    S3_not <= not S3;
    S4_not <= not S4; 

    -- AND gates for each input (unpacked)
    and00 <= I0 and S0_not;
    and01 <= and00 and S1_not;
    and02 <= and01 and S2_not;
    and03 <= and02 and S3_not;

    and10 <= I1 and S0;
    and11 <= and10 and S1_not;
    and12 <= and11 and S2_not;
    and13 <= and12 and S3_not;

    and20 <= I2 and S0_not;
    and21 <= and20 and S1;
    and22 <= and21 and S2_not;
    and23 <= and22 and S3_not;

    and30 <= I3 and S0;
    and31 <= and30 and S1;
    and32 <= and31 and S2_not;
    and33 <= and32 and S3_not;

    and40 <= I4 and S0_not;
    and41 <= and40 and S1_not;
    and42 <= and41 and S2;
    and43 <= and42 and S3_not;

    and50 <= I5 and S0;
    and51 <= and50 and S1_not;
    and52 <= and51 and S2;
    and53 <= and52 and S3_not;

    and60 <= I6 and S0_not;
    and61 <= and60 and S1;
    and62 <= and61 and S2;
    and63 <= and62 and S3_not;

    and70 <= I7 and S0;
    and71 <= and70 and S1;
    and72 <= and71 and S2;
    and73 <= and72 and S3_not;

    and80 <= I8 and S0_not;
    and81 <= and80 and S1_not;
    and82 <= and81 and S2_not;
    and83 <= and82 and S3;

    and90 <= I9 and S0;
    and91 <= and90 and S1_not;
    and92 <= and91 and S2_not;
    and93 <= and92 and S3;

    and100 <= I10 and S0_not;
    and101 <= and100 and S1;
    and102 <= and101 and S2_not;
    and103 <= and102 and S3;

    and110 <= I11 and S0;
    and111 <= and110 and S1;
    and112 <= and111 and S2_not;
    and113 <= and112 and S3;

    and120 <= I12 and S0_not;
    and121 <= and120 and S1_not;
    and122 <= and121 and S2;
    and123 <= and122 and S3;

    and130 <= I13 and S0;
    and131 <= and130 and S1_not;
    and132 <= and131 and S2;
    and133 <= and132 and S3;

    and140 <= I14 and S0_not;
    and141 <= and140 and S1;
    and142 <= and141 and S2;
    and143 <= and142 and S3;

    and150 <= I15 and S0;
    and151 <= and150 and S1;
    and152 <= and151 and S2;
    and153 <= and152 and S3;

    -- OR gates
    or00 <= and03 or and13;
    or01 <= or00 or and23;
    or02 <= or01 or and33;
    or03 <= or02 or and43;
    or04 <= or03 or and53;
    or05 <= or04 or and63; 
    or06 <= or05 or and73;
    or07 <= or06 or and83;
    or08 <= or07 or and93;
    or09 <= or08 or and103;
    or10 <= or09 or and113;
    or11 <= or10 or and123;
    or12 <= or11 or and133;
    or13 <= or12 or and143;
    or14 <= or13 or and153;

    -- Final output
    Y <= or14;

end Behavioral;
