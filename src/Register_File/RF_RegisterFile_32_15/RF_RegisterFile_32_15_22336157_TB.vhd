LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY RF_RegisterFile_32_15_22336157_TB IS
END RF_RegisterFile_32_15_22336157_TB;

ARCHITECTURE behavior OF RF_RegisterFile_32_15_22336157_TB IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_RegisterFile_32_15_22336157
    Port ( DR : in STD_LOGIC_VECTOR (4 downto 0); 
          RW : in STD_LOGIC; 
          SA : in STD_LOGIC_VECTOR(4 downto 0);
          SB : in STD_LOGIC_VECTOR(4 downto 0);
          CLK : in STD_LOGIC;
          D : in STD_LOGIC_VECTOR (31 downto 0);
          Reset : in STD_LOGIC;
          TB : in STD_LOGIC_VECTOR (3 downto 0);
          TA : in STD_LOGIC_VECTOR (3 downto 0);
          TD : in STD_LOGIC_VECTOR (3 downto 0);
          A : out STD_LOGIC_VECTOR(31 downto 0);
          B : out STD_LOGIC_VECTOR(31 downto 0));
    END COMPONENT;

    -- Signals Declaration
    signal CLK : std_logic := '0';
    signal RW : std_logic := '0';                     -- Read/Write signal
    signal Reset : std_logic := '0';                  -- Reset signal
    signal DR : std_logic_vector(4 downto 0) := (others => '0'); -- 5-bit destination register address
    signal D : std_logic_vector(31 downto 0) := (others => '0'); -- 32-bit data input
    signal sa, sb : std_logic_vector(4 downto 0) := (others => '0'); 
    signal ta, td, tb : std_logic_vector(3 downto 0) := (others => '0'); 
    signal a, b : std_logic_vector(3 downto 0) := (others => '0');  -- Selection/control inputs

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
          tb    => tb, 
          td    => td,
          a     => a,
          b     => b 
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
        sa <= "00000";  sb <= "000000";  ta <= "000000";  td <= "000000";  a <= "0000";  b <= "00000";  -- Select register 0
        wait for clk_period;
        
        -- Test Case 5: Read from register 1
        sa <= "00001";  sb <= "000000";  ta <= "000000";  td <= "000000";  a <= "0000";  b <= "00000";
        wait for clk_period;

        -- Test Case 6: Read from register 31
                sa <= "00001";  sb <= "000001";  ta <= "000001";  td <= "000001";  a <= "0001";  b <= "00001";
        wait for clk_period;
        
        -- Test Case 7: Reset the registers
        Reset <= '1';  -- Assert reset to clear all registers
        wait for 20 ns;
        Reset <= '0';  -- Deassert reset
        wait for clk_period;

        -- Test Case 8: Try reading register 0 after reset (should be 0)
        RW <= '0';  -- Read mode
        sa <= "00000";  sb <= "000000";  ta <= "000000";  td <= "000000";  a <= "0000";  b <= "00000";
        wait for clk_period;

        -- Test completed
        wait;
    end process;

END behavior;
