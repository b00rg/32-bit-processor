LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY RF_RegisterFile_32_15_22336157_TB IS
END RF_RegisterFile_32_15_22336157_TB;

ARCHITECTURE simulation OF RF_RegisterFile_32_15_22336157_TB IS

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
    signal CLK_TB : std_logic := '0';
    signal RW_TB : std_logic := '0';                     -- Read/Write signal
    signal Reset_TB : std_logic := '0';                  -- Reset signal
    signal DR_TB : std_logic_vector(4 downto 0) := (others => '0'); -- 5-bit destination register address
    signal D_TB : std_logic_vector(31 downto 0) := (others => '0'); -- 32-bit data input
    signal sa_TB, sb_TB : std_logic_vector(4 downto 0) := (others => '0'); 
    signal ta_TB, td_TB, tb_TB : std_logic_vector(3 downto 0) := (others => '0'); 
    signal a_TB, b_TB : std_logic_vector(31 downto 0) := (others => '0');  -- Selection/control inputs

    -- Clock period definition
    constant clk_period : time := 400 ns;
    constant period : time := 1000ns; 

BEGIN

    -- Clock generation without a process
    CLK_TB <= not CLK_TB after clk_period / 2;

    -- Instantiate the Unit Under Test (UUT)
    uut: RF_RegisterFile_32_15_22336157 PORT MAP (
          RW    => RW_TB,
          DR    => DR_TB,
          D     => D_TB,
          CLK   => CLK_TB,
          Reset => Reset_TB,
          sa    => sa_TB,
          sb    => sb_TB,
          ta    => ta_TB,
          tb    => tb_TB, 
          td    => td_TB,
          a     => a_TB,
          b     => b_TB 
    );

    -- Stimulus process
    stim_proc: process
    begin	
        reset_TB <= '1';
        wait for clk_period;
        

-- Test Case 33: register 1
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0001";
    D_TB <= "00000001010101001101001010111110";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "0001";
    tb_TB <= "0001";
    wait for period;

-- Test Case 34: register 2
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0010";
    D_TB <= "00000001010101001101001010111111";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "0011";
    tb_TB <= "0011";
    wait for period;

-- Test Case 35: register 3
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0011";
    D_TB <= "00000001010101001101001011000000";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "0100";
    tb_TB <= "0100";
    wait for period;

-- Test Case 36: register 4
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0100";
    D_TB <= "00000001010101001101001011000001";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "0101";
    tb_TB <= "0101";
    wait for period;

-- Test Case 37: register 5
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0101";
    D_TB <= "00000001010101001101001011000010";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "0110";
    tb_TB <= "0110";
    wait for period;

-- Test Case 38: register 6
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0110";
    D_TB <= "00000001010101001101001011000011";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "0111";
    tb_TB <= "0111";
    wait for period;

-- Test Case 39: register 7
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0111";
    D_TB <= "00000001010101001101001011000100";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1000";
    tb_TB <= "1000";
    wait for period;

-- Test Case 40: register 8
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1000";
    D_TB <= "00000001010101001101001011000101";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1001";
    tb_TB <= "1001";
    wait for period;

-- Test Case 41: register 9
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1001";
    D_TB <= "00000001010101001101001011000110";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1010";
    tb_TB <= "1010";
    wait for period;

-- Test Case 42: register 10
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1010";
    D_TB <= "00000001010101001101001011000111";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1010";
    tb_TB <= "1010";
    wait for period;

-- Test Case 43: register 11
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1011";
    D_TB <= "00000001010101001101001011001000";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1011";
    tb_TB <= "1011";
    wait for period;

-- Test Case 44: register 12
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1100";
    D_TB <= "00000001010101001101001011001001";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1100";
    tb_TB <= "1100";
    wait for period;

-- Test Case 45: register 13
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1101";
    D_TB <= "00000001010101001101001011001010";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1101";
    tb_TB <= "1101";
    wait for period;

-- Test Case 46: register 14
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1110";
    D_TB <= "00000001010101001101001011001011";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1110";
    tb_TB <= "1110";
    wait for period;

-- Test Case 47: register 15
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1111";
    D_TB <= "00000001010101001101001011001100";
    wait for clk_period;
    RW_TB <= '1';
    ta_TB <= "1111";
    tb_TB <= "1111";
    wait for period;
       
    
    wait for period; 
    end process;

END simulation;
