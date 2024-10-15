LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY RF_RegisterFile_32_TB IS
END RF_RegisterFile_32_TB;

ARCHITECTURE behavior OF RF_RegisterFile_32_TB IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_RegisterFile_32
    PORT (
        DR    : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- Destination register address
        RW    : IN  STD_LOGIC;                      -- Read/Write signal
        SA    : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- Source register A
        SB    : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  -- Source register B
        CLK   : IN  STD_LOGIC;                      -- Clock signal
        D     : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); -- Data input
        Reset : IN  STD_LOGIC;                      -- Reset signal
        A     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- Output A
        B     : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)  -- Output B
    );
    END COMPONENT;

    -- Signals Declaration
    signal CLK : STD_LOGIC := '0';
    signal RW : STD_LOGIC;                         -- Read/Write signal
    signal Reset : STD_LOGIC;                      -- Reset signal
    signal DR : STD_LOGIC_VECTOR(4 DOWNTO 0);     -- Destination register address
    signal D : STD_LOGIC_VECTOR(31 DOWNTO 0);      -- Data input
    signal SA : STD_LOGIC_VECTOR(4 DOWNTO 0);      -- Source register A
    signal SB : STD_LOGIC_VECTOR(4 DOWNTO 0);      -- Source register B
    signal A : STD_LOGIC_VECTOR(31 DOWNTO 0);      -- Output A
    signal B : STD_LOGIC_VECTOR(31 DOWNTO 0);      -- Output B

    -- Clock period definition
    constant clk_period : time := 10 ns;

BEGIN

    -- Clock generation
    CLK <= NOT CLK AFTER clk_period / 2;

    -- Instantiate the Unit Under Test (UUT)
    uut: RF_RegisterFile_32 PORT MAP (
        DR    => DR,
        RW    => RW,
        D     => D,
        CLK   => CLK,
        Reset => Reset,
        SA    => SA,
        SB    => SB,
        A     => A,
        B     => B
    );

    -- Stimulus process
    stim_proc: PROCESS
    BEGIN
        -- Initialize Inputs
        Reset <= '1';  -- Assert reset
        wait for 20 ns;
        Reset <= '0';  -- Deassert reset
        
        -- Test Case 1: Write to register 0
        RW <= '1';                     -- Enable write
        DR <= "00000";                 -- Select register 0
        D <= X"00000001";              -- Write 1 to register 0
        wait for clk_period;

        -- Test Case 2: Read from register 0
        RW <= '0';                     -- Disable write (read mode)
        SA <= "00000";                 -- Select register 0 for output A
        SB <= "00000";                 -- Select register 0 for output B
        wait for clk_period;           -- Wait for clock edge
        assert A = X"00000001" report "Error: Register 0 value mismatch!" severity ERROR;

        -- Test Case 3: Write to register 1
        RW <= '1';                     -- Enable write
        DR <= "00001";                 -- Select register 1
        D <= X"00000002";              -- Write 2 to register 1
        wait for clk_period;

        -- Test Case 4: Read from register 1
        RW <= '0';                     -- Disable write (read mode)
        SA <= "00001";                 -- Select register 1 for output A
        SB <= "00000";                 -- Select register 0 for output B
        wait for clk_period;           -- Wait for clock edge
        assert A = X"00000002" report "Error: Register 1 value mismatch!" severity ERROR;

        -- Test Case 5: Write to register 2
        RW <= '1';                     -- Enable write
        DR <= "00010";                 -- Select register 2
        D <= X"00000003";              -- Write 3 to register 2
        wait for clk_period;

        -- Test Case 6: Read from register 2
        RW <= '0';                     -- Disable write (read mode)
        SA <= "00010";                 -- Select register 2 for output A
        SB <= "00001";                 -- Select register 1 for output B
        wait for clk_period;           -- Wait for clock edge
        assert A = X"00000003" report "Error: Register 2 value mismatch!" severity ERROR;
        assert B = X"00000002" report "Error: Register 1 value mismatch!" severity ERROR;

        -- Test Case 7: Write to register 31
        RW <= '1';                     -- Enable write
        DR <= "11111";                 -- Select register 31
        D <= X"12345678";              -- Write 0x12345678 to register 31
        wait for clk_period;

        -- Test Case 8: Read from register 31
        RW <= '0';                     -- Disable write (read mode)
        SA <= "11111";                 -- Select register 31 for output A
        SB <= "00000";                 -- Select register 0 for output B
        wait for clk_period;           -- Wait for clock edge
        assert A = X"12345678" report "Error: Register 31 value mismatch!" severity ERROR;
        assert B = X"00000001" report "Error: Register 0 value mismatch!" severity ERROR;

        -- Test Case 9: Reset the registers
        Reset <= '1';                  -- Assert reset to clear all registers
        wait for 20 ns;
        Reset <= '0';                  -- Deassert reset
        wait for clk_period;

        -- Test Case 10: Check values after reset (should be 0)
        RW <= '0';                     -- Read mode
        SA <= "00000";                 -- Select register 0 for output A
        SB <= "00001";                 -- Select register 1 for output B
        wait for clk_period;           -- Wait for clock edge
        assert A = X"00000000" report "Error: Register 0 should be 0 after reset!" severity ERROR;
        assert B = X"00000000" report "Error: Register 1 should be 0 after reset!" severity ERROR;

        -- Test Case 11: Verify all registers are reset
        FOR i IN 0 TO 31 LOOP
            SA <= STD_LOGIC_VECTOR(to_unsigned(i, 5));  -- Select register i for output A
            wait for clk_period;
            assert A = X"00000000" report "Error: Register " & INTEGER'IMAGE(i) & " should be 0 after reset!" severity ERROR;
        END LOOP;

        -- Finish simulation
        wait;
    END PROCESS;

END behavior;
