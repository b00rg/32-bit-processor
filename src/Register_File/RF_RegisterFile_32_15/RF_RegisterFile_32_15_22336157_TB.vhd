LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY TB_RF_RegisterFile_32_15_22336157 IS
END TB_RF_RegisterFile_32_15_22336157;

ARCHITECTURE behavior OF TB_RF_RegisterFile_32_15_22336157 IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_RegisterFile_32_15_22336157
    PORT(
        RW    : IN  std_logic;                      -- Read/Write signal (1 = write, 0 = read)
        DR    : IN  std_logic_vector(4 downto 0);   -- Destination register address (5-bit)
        D     : IN  std_logic_vector(31 downto 0);  -- Data input (32-bit)
        CLK   : IN  std_logic;                      -- Clock signal
        Reset : IN  std_logic;                      -- Reset signal
        sa    : IN  std_logic;                      -- Selection input A
        sb    : IN  std_logic;                      -- Selection input B
        ta    : IN  std_logic;                      -- Temporary selection A
        td    : IN  std_logic;                      -- Temporary selection B
        a     : IN  std_logic;                      -- Additional input A
        b     : IN  std_logic;                      -- Additional input B
        Y     : OUT std_logic_vector(31 downto 0)   -- Data output (32-bit)
    );
    END COMPONENT;

    -- Signals Declaration
    signal CLK : std_logic := '0';
    signal RW : std_logic := '0';                     -- Read/Write signal
    signal Reset : std_logic := '0';                  -- Reset signal
    signal DR : std_logic_vector(4 downto 0) := (others => '0'); -- 5-bit destination register address
    signal D : std_logic_vector(31 downto 0) := (others => '0'); -- 32-bit data input
    signal sa, sb, ta, td, a, b : std_logic := '0';  -- Selection/control inputs
    signal Y : std_logic_vector(31 downto 0);        -- 32-bit data output

    -- Clock period definition
    constant clk_period : time := 10 ns;

BEGIN

    -- Clock generation without a process
    CLK <= not CLK after clk_period / 2;

    -- Instantiate the Unit Under Test (UUT)
    uut: RF_RegisterFile_32_15_22336157 PORT MAP (
          RW    => RW,
          DR    => DR,
          D     => D,
          CLK   => CLK,
          Reset => Reset,
          sa    => sa,
          sb    => sb,
          ta    => ta,
          td    => td,
          a     => a,
          b     => b,
          Y     => Y
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
        sa <= '0';  sb <= '0';  ta <= '0';  td <= '0';  a <= '0';  b <= '0';  -- Select register 0
        wait for clk_period;
        
        -- Test Case 5: Read from register 1
        sa <= '1';  sb <= '0';  ta <= '0';  td <= '0';  a <= '0';  b <= '0';  -- Select register 1
        wait for clk_period;

        -- Test Case 6: Read from register 31
        sa <= '1';  sb <= '1';  ta <= '1';  td <= '1';  a <= '1';  b <= '1';  -- Select register 31
        wait for clk_period;
        
        -- Test Case 7: Reset the registers
        Reset <= '1';  -- Assert reset to clear all registers
        wait for 20 ns;
        Reset <= '0';  -- Deassert reset
        wait for clk_period;

        -- Test Case 8: Try reading register 0 after reset (should be 0)
        RW <= '0';  -- Read mode
        sa <= '0';  sb <= '0';  ta <= '0';  td <= '0';  a <= '0';  b <= '0';  -- Select register 0
        wait for clk_period;

        -- Test completed
        wait;
    end process;

END behavior;
