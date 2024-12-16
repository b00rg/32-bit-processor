LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY CPU_DFlipFlop_Qnot_TB IS
    -- No ports for testbench
END CPU_DFlipFlop_Qnot_TB;

ARCHITECTURE Simulation OF CPU_DFlipFlop_Qnot_TB IS

    -- Component declaration for the Unit Under Test (UUT)
    COMPONENT CPU_DFlipFlop_Qnot
    PORT(
        Clock : IN  STD_LOGIC;
        Reset : IN  STD_LOGIC;
        D     : IN  STD_LOGIC;
        Q     : OUT STD_LOGIC;
        Q_not : OUT STD_LOGIC
    );
    END COMPONENT;

    -- Signals to connect to the UUT
    SIGNAL Clock : STD_LOGIC := '0';
    SIGNAL Reset : STD_LOGIC := '0';
    SIGNAL D     : STD_LOGIC := '0';
    SIGNAL Q     : STD_LOGIC;
    SIGNAL Q_not : STD_LOGIC;

    -- Clock period definition
    CONSTANT Clock_period : TIME := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: CPU_DFlipFlop_Qnot PORT MAP (
        Clock => Clock,
        Reset => Reset,
        D     => D,
        Q     => Q,
        Q_not => Q_not
    );

    -- Clock generation process
    Clock_process : PROCESS
    BEGIN
        Clock <= '0';
        WAIT FOR Clock_period / 2;
        Clock <= '1';
        WAIT FOR Clock_period / 2;
    END PROCESS;

    -- Stimulus process
    Stimulus_process: PROCESS
    BEGIN
        -- Initialize inputs
        Reset <= '1';
        D <= '0';
        WAIT FOR 20 ns;
        
        -- Release reset
        Reset <= '0';
        WAIT FOR 20 ns;

        -- Test case 1: D=0
        D <= '0';
        WAIT FOR Clock_period * 2;

        -- Test case 2: D=1
        D <= '1';
        WAIT FOR Clock_period * 2;

        -- Test case 3: Toggle D
        D <= '0';
        WAIT FOR Clock_period * 2;
        D <= '1';
        WAIT FOR Clock_period * 2;

        -- Test case 4: Assert Reset
        Reset <= '1';
        WAIT FOR Clock_period * 2;
        Reset <= '0';
        WAIT FOR Clock_period * 2;

        -- Stop the simulation
        WAIT;
    END PROCESS;

END Simulation;
