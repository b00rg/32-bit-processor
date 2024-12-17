library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_ControlMemory_22336157_TB is
end CPU_ControlMemory_22336157_TB;

architecture sim of CPU_ControlMemory_22336157_TB is

    -- Component Declaration for the Unit Under Test (UUT)
    component CPU_ControlMemory_22336157
        Port (
            Address : in std_logic_vector(16 downto 0);
            NA : out std_logic_vector(16 downto 0);
            MS : out std_logic_vector(2 downto 0);
            MC, IL, PI, PL, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : out std_logic;
            FS : out std_logic_vector(4 downto 0);
            TA, TB, TD : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Testbench signals
    signal Address : std_logic_vector(16 downto 0) := (others => '0');
    signal NA : std_logic_vector(16 downto 0);
    signal MS : std_logic_vector(2 downto 0);
    signal MC, IL, PI, PL, MB, MD, RW, MM, MW, RV, RC, RN, RZ, FL : std_logic;
    signal FS : std_logic_vector(4 downto 0);
    signal TA, TB, TD : std_logic_vector(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: CPU_ControlMemory_22336157
        Port map (
            Address => Address,
            NA => NA,
            MS => MS,
            MC => MC,
            IL => IL,
            PI => PI,
            PL => PL,
            MB => MB,
            MD => MD,
            RW => RW,
            MM => MM,
            MW => MW,
            RV => RV,
            RC => RC,
            RN => RN,
            RZ => RZ,
            FL => FL,
            FS => FS,
            TA => TA,
            TB => TB,
            TD => TD
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Initialize memory with address 0
        -- Read all 128 addresses, incrementing the address after each cycle
        for i in 0 to 127 loop
            -- Set address value
            Address <= std_logic_vector(to_unsigned(i, 17));

            -- Wait for a time step to let the UUT react
            wait for 10 ns;  -- Adjust time for simulation speed

            -- You can print or check the outputs here for validation
            report "Address: " & integer'image(i) & 
                   " NA: " & std_logic_vector'image(NA) &
                   " MS: " & std_logic_vector'image(MS) &
                   " MC: " & std_logic'image(MC) &
                   " FL: " & std_logic'image(FL);

        end loop;

        -- End simulation
        wait;
    end process;

end sim;
