library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RF_Mux32_1Bit is
    Port (
        I0, I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15 : in STD_LOGIC;
        I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31 : in STD_LOGIC;
        S0, S1, S2, S3, S4 : in STD_LOGIC;
        Y : out STD_LOGIC);
end RF_Mux32_1Bit;

architecture Behavioral of RF_Mux32_1Bit is
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
    S0_not <= not S0 after NOT_gate_delay;
    S1_not <= not S1 after NOT_gate_delay;
    S2_not <= not S2 after NOT_gate_delay;
    S3_not <= not S3 after NOT_gate_delay;
    S4_not <= not S4 after NOT_gate_delay;

    -- AND gates for each input (unpacked)
    and00 <= I0 and S0_not after AND_gate_delay;
    and01 <= and00 and S1_not after AND_gate_delay;
    and02 <= and01 and S2_not after AND_gate_delay;
    and03 <= and02 and S3_not after AND_gate_delay;
    and04 <= and03 and S4_not after AND_gate_delay;

    and10 <= I1 and S0 after AND_gate_delay;
    and11 <= and10 and S1_not after AND_gate_delay;
    and12 <= and11 and S2_not after AND_gate_delay;
    and13 <= and12 and S3_not after AND_gate_delay;
    and14 <= and13 and S4_not after AND_gate_delay;

    and20 <= I2 and S0_not after AND_gate_delay;
    and21 <= and20 and S1 after AND_gate_delay;
    and22 <= and21 and S2_not after AND_gate_delay;
    and23 <= and22 and S3_not after AND_gate_delay;
    and24 <= and23 and S4_not after AND_gate_delay;

    and30 <= I3 and S0 after AND_gate_delay;
    and31 <= and30 and S1 after AND_gate_delay;
    and32 <= and31 and S2_not after AND_gate_delay;
    and33 <= and32 and S3_not after AND_gate_delay;
    and34 <= and33 and S4_not after AND_gate_delay;

    and40 <= I4 and S0_not after AND_gate_delay;
    and41 <= and40 and S1_not after AND_gate_delay;
    and42 <= and41 and S2 after AND_gate_delay;
    and43 <= and42 and S3_not after AND_gate_delay;
    and44 <= and43 and S4_not after AND_gate_delay; 

    and50 <= I5 and S0 after AND_gate_delay;
    and51 <= and50 and S1_not after AND_gate_delay;
    and52 <= and51 and S2 after AND_gate_delay;
    and53 <= and52 and S3_not after AND_gate_delay;
    and54 <= and53 and S4_not after AND_gate_delay; 

    and60 <= I6 and S0_not after AND_gate_delay;
    and61 <= and60 and S1 after AND_gate_delay;
    and62 <= and61 and S2 after AND_gate_delay;
    and63 <= and62 and S3_not after AND_gate_delay;
    and64 <= and63 and S4_not after AND_gate_delay;

    and70 <= I7 and S0 after AND_gate_delay;
    and71 <= and70 and S1 after AND_gate_delay;
    and72 <= and71 and S2 after AND_gate_delay;
    and73 <= and72 and S3_not after AND_gate_delay;
    and74 <= and73 and S4_not after AND_gate_delay;

    and80 <= I8 and S0_not after AND_gate_delay;
    and81 <= and80 and S1_not after AND_gate_delay;
    and82 <= and81 and S2_not after AND_gate_delay;
    and83 <= and82 and S3 after AND_gate_delay;
    and84 <= and83 and S4_not after AND_gate_delay; 

    and90 <= I9 and S0 after AND_gate_delay;
    and91 <= and90 and S1_not after AND_gate_delay;
    and92 <= and91 and S2_not after AND_gate_delay;
    and93 <= and92 and S3 after AND_gate_delay;
    and94 <= and93 and S4_not after AND_gate_delay; 

    and100 <= I10 and S0_not after AND_gate_delay;
    and101 <= and100 and S1 after AND_gate_delay;
    and102 <= and101 and S2_not after AND_gate_delay;
    and103 <= and102 and S3 after AND_gate_delay;
    and104 <= and103 and S4_not after AND_gate_delay;

    and110 <= I11 and S0 after AND_gate_delay;
    and111 <= and110 and S1 after AND_gate_delay;
    and112 <= and111 and S2_not after AND_gate_delay;
    and113 <= and112 and S3 after AND_gate_delay;
    and114 <= and113 and S4_not after AND_gate_delay;

    and120 <= I12 and S0_not after AND_gate_delay;
    and121 <= and120 and S1_not after AND_gate_delay;
    and122 <= and121 and S2 after AND_gate_delay;
    and123 <= and122 and S3 after AND_gate_delay;
    and124 <= and123 and S4_not after AND_gate_delay;

    and130 <= I13 and S0 after AND_gate_delay;
    and131 <= and130 and S1_not after AND_gate_delay;
    and132 <= and131 and S2 after AND_gate_delay;
    and133 <= and132 and S3 after AND_gate_delay;
    and134 <= and133 and S4_not after AND_gate_delay;

    and140 <= I14 and S0_not after AND_gate_delay;
    and141 <= and140 and S1 after AND_gate_delay;
    and142 <= and141 and S2 after AND_gate_delay;
    and143 <= and142 and S3 after AND_gate_delay;
    and144 <= and143 and S4_not after AND_gate_delay;

    and150 <= I15 and S0 after AND_gate_delay;
    and151 <= and150 and S1 after AND_gate_delay;
    and152 <= and151 and S2 after AND_gate_delay;
    and153 <= and152 and S3 after AND_gate_delay;
    and154 <= and153 and S4_not after AND_gate_delay; 

    and160 <= I16 and S0_not after AND_gate_delay;
    and161 <= and160 and S1_not after AND_gate_delay;
    and162 <= and161 and S2_not after AND_gate_delay;
    and163 <= and162 and S3_not after AND_gate_delay;
    and164 <= and163 and S4 after AND_gate_delay;

    and170 <= I17 and S0 after AND_gate_delay;
    and171 <= and170 and S1_not after AND_gate_delay;
    and172 <= and171 and S2_not after AND_gate_delay;
    and173 <= and172 and S3_not after AND_gate_delay;
    and174 <= and172 and S4 after AND_gate_delay;

    and180 <= I18 and S0_not after AND_gate_delay;
    and181 <= and180 and S1 after AND_gate_delay;
    and182 <= and181 and S2_not after AND_gate_delay;
    and183 <= and182 and S3_not after AND_gate_delay;
    and184 <= and183 and S4 after AND_gate_delay;

    and190 <= I19 and S0 after AND_gate_delay;
    and191 <= and190 and S1 after AND_gate_delay;
    and192 <= and191 and S2_not after AND_gate_delay;
    and193 <= and192 and S3_not after AND_gate_delay;
    and194 <= and193 and S4 after AND_gate_delay;

    and200  <= I20 and S0_not after AND_gate_delay;
    and201 <= and200 and S1_not after AND_gate_delay;
    and202 <= and201 and S2 after AND_gate_delay;
    and203 <= and202 and S3_not after AND_gate_delay;
    and204 <= and203 and S4 after AND_gate_delay; 

    and210 <= I21 and S0 after AND_gate_delay;
    and211 <= and210 and S1_not after AND_gate_delay;
    and212 <= and211 and S2 after AND_gate_delay;
    and213 <= and212 and S3_not after AND_gate_delay;
    and214 <= and213 and S4 after AND_gate_delay; 

    and220 <= I22 and S0_not after AND_gate_delay;
    and221 <= and220 and S1 after AND_gate_delay;
    and222 <= and221 and S2 after AND_gate_delay;
    and223 <= and222 and S3_not after AND_gate_delay;
    and224 <= and223 and S4 after AND_gate_delay;

    and230 <= I23 and S0 after AND_gate_delay;
    and231 <= and230 and S1 after AND_gate_delay;
    and232 <= and231 and S2 after AND_gate_delay;
    and233 <= and232 and S3_not after AND_gate_delay;
    and234 <= and233 and S4 after AND_gate_delay;

    and240 <= I24 and S0_not after AND_gate_delay;
    and241 <= and240 and S1_not after AND_gate_delay;
    and242 <= and241 and S2_not after AND_gate_delay;
    and243 <= and242 and S3 after AND_gate_delay;
    and244 <= and243 and S4 after AND_gate_delay; 

    and250 <= I25 and S0 after AND_gate_delay;
    and251 <= and250 and S1_not after AND_gate_delay;
    and252 <= and251 and S2_not after AND_gate_delay;
    and253 <= and252 and S3 after AND_gate_delay;
    and254 <= and253 and S4 after AND_gate_delay; 

    and260 <= I26 and S0_not after AND_gate_delay;
    and261 <= and260 and S1 after AND_gate_delay;
    and262 <= and261 and S2_not after AND_gate_delay;
    and263 <= and262 and S3 after AND_gate_delay;
    and264 <= and263 and S4 after AND_gate_delay;

    and270 <= I27 and S0 after AND_gate_delay;
    and271 <= and270 and S1 after AND_gate_delay;
    and272 <= and271 and S2_not after AND_gate_delay;
    and273 <= and272 and S3 after AND_gate_delay;
    and274 <= and273 and S4 after AND_gate_delay;

    and280 <= I28 and S0_not after AND_gate_delay;
    and281 <= and280 and S1_not after AND_gate_delay;
    and282 <= and281 and S2 after AND_gate_delay;
    and283 <= and282 and S3 after AND_gate_delay;
    and284 <= and283 and S4 after AND_gate_delay;

    and290 <= I29 and S0 after AND_gate_delay;
    and291 <= and290 and S1_not after AND_gate_delay;
    and292 <= and291 and S2 after AND_gate_delay;
    and293 <= and292 and S3 after AND_gate_delay;
    and294 <= and293 and S4 after AND_gate_delay;

    and300 <= I30 and S0_not after AND_gate_delay;
    and301 <= and300 and S1 after AND_gate_delay;
    and302 <= and301 and S2 after AND_gate_delay;
    and303 <= and302 and S3 after AND_gate_delay;
    and304 <= and303 and S4 after AND_gate_delay;

    and310 <= I31 and S0 after AND_gate_delay;
    and311 <= and310 and S1 after AND_gate_delay;
    and312 <= and311 and S2 after AND_gate_delay;
    and313 <= and312 and S3 after AND_gate_delay;
    and314 <= and313 and S4 after AND_gate_delay; 

    -- OR gates
    or00 <= and04 or and14;
    or01 <= or00 or and24;
    or02 <= or01 or and34;
    or03 <= or02 or and44;
    or04 <= or03 or and54;
    or05 <= or04 or and64; 
    or06 <= or05 or and74;
    or07 <= or06 or and84;
    or08 <= or07 or and94;
    or09 <= or08 or and104;
    or10 <= or09 or and114;
    or11 <= or10 or and124;
    or12 <= or11 or and134;
    or13 <= or12 or and144;
    or14 <= or13 or and154;

    or15 <= or14 or and164;
    or16 <= or15 or and174;
    or17 <= or16 or and184;
    or18 <= or17 or and194;
    or19 <= or18 or and204;
    or20 <= or19 or and214;
    or21 <= or20 or and224;
    or22 <= or21 or and234;
    or23 <= or22 or and244;
    or24 <= or23 or and254;
    or25 <= or24 or and264;
    or26 <= or25 or and274;
    or27 <= or26 or and284;
    or28 <= or27 or and294;
    or29 <= or28 or and304;
    or30 <= or29 or and314;  

    -- Final output
    Y <= or30; 

end Behavioral;
