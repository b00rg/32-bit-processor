LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY TB_RF_RegisterFile_32_15_22336157 IS
END TB_RF_RegisterFile_32_15_22336157;

ARCHITECTURE behavior OF TB_RF_RegisterFile_32_15_22336157 IS
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_RegisterFile_32_15_22336157
    PORT(
        RW : IN  std_logic;             -- Read/Write signal (1 = write, 0 = read)
        DR : IN  std_logic_vector(4 downto 0); -- Destination register address
        D  : IN  std_logic_vector(31 downto 0); -- Data input
        CLK : IN std_logic;             -- Clock signal
        Reset : IN std_logic;           -- Reset signal
        S0, S1, S2, S3, S4 : IN std_logic; -- Selection inputs
        Y : OUT std_logic_vector(31 downto 0) -- Data output
    );
    END COMPONENT;

    -- Clock signal
    signal CLK : std_logic := '0';
    signal RW : std_logic := '0';  -- Initially set to read mode
    signal Reset : std_logic := '0';  -- Initially not reset
    signal DR : std_logic_vector(4 downto 0) := (others => '0'); -- Destination register address
    signal D : std_logic_vector(31 downto 0) := (others => '0'); -- Data input
    signal S0, S1, S2, S3, S4 : std_logic := '0'; -- Selection inputs for output mux
    signal Y : std_logic_vector(31 downto 0); -- Data output

    -- Clock period definition
    constant clk_period : time := 10 ns;

BEGIN

    -- Clock generation process
    clk_process :process
    begin
        CLK <= '0';
        wait for clk_period/2;
        CLK <= '1';
        wait for clk_period/2;
    end process;

    -- Instantiate the Unit Under Test (UUT)
    uut: RF_RegisterFile_32_15_22336157 PORT MAP (
          RW => RW,
          DR => DR,
          D => D,
          CLK => CLK,
          Reset => Reset,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          S3 => S3,
          S4 => S4,
          Y => Y
    );

    -- Stimulus process
    stim_proc: process
    begin		
        -- Initialize Inputs
        Reset <= '1';  -- Assert reset
        wait for 20 ns;
        Reset <= '0';  -- Deassert reset
        
        -- Test Case 1: Write to register 0
        RW <= '1';  -- Enable write
        DR <= "00000";  -- Select register 0
        D <= x"00000001";  -- Write 1 to register 0
        wait for clk_period;
        
        -- Test Case 2: Write to register 1
        DR <= "00001";  -- Select register 1
        D <= x"00000002";  -- Write 2 to register 1
        wait for clk_period;

        -- Test Case 3: Write to register 31
        DR <= "11111";  -- Select register 31
        D <= x"12345678";  -- Write a specific value to register 31
        wait for clk_period;

        -- Test Case 4: Read from register 0
        RW <= '0';  -- Disable write (read mode)
        S0 <= '0';  S1 <= '0';  S2 <= '0';  S3 <= '0';  S4 <= '0';  -- Select register 0
        wait for clk_period;
        
        -- Test Case 5: Read from register 1
        S0 <= '1';  S1 <= '0';  S2 <= '0';  S3 <= '0';  S4 <= '0';  -- Select register 1
        wait for clk_period;

        -- Test Case 6: Read from register 31
        S0 <= '1';  S1 <= '1';  S2 <= '1';  S3 <= '1';  S4 <= '1';  -- Select register 31
        wait for clk_period;
        
        -- Test Case 7: Reset the registers
        Reset <= '1';  -- Assert reset to clear all registers
        wait for 20 ns;
        Reset <= '0';  -- Deassert reset
        wait for clk_period;

        -- Test Case 8: Try reading register 0 after reset (should be 0)
        RW <= '0';  -- Read mode
        S0 <= '0';  S1 <= '0';  S2 <= '0';  S3 <= '0';  S4 <= '0';  -- Select register 0
        wait for clk_period;

        -- Test completed
        wait;
    end process;

END;
