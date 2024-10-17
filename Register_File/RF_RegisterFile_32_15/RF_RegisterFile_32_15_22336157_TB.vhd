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
        
-- Test Case 0: register 0
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010011101";
    wait for clk_period;
    RW_TB <= '1';
    wait for clk_period*2;
-- Test Case 1: register 1
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00001";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010011110";
    wait for clk_period;
    RW_TB <= '1';
    sa_TB <="00001";
    sb_TB <= "00001";
    wait for period;

-- Test Case 2: register 2
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00010";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010011111";
    wait for clk_period;
    RW_TB <= '1';
    sa_TB <="00010";
    sb_TB <= "00010";
    wait for period;

-- Test Case 3: register 3
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00011";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010100000";
    wait for clk_period;
    RW_TB <= '1';
    sa_TB <="00011";
    sb_TB <="00011";
    wait for period;

-- Test Case 4: register 4
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00100";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010100001";
    wait for clk_period;
    RW_TB <= '1';
    sa_TB <="00100";
    sb_TB <= "00100";
    wait for period;

-- Test Case 5: register 5
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00101";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010100010";
    wait for clk_period;
    RW_TB <= '1';
    sa_TB <="00101";
    sb_TB <= "00101";
    wait for period;

-- Test Case 6: register 6
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00110";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010100011";
    wait for clk_period;
    RW_TB <= '1';
    sa_TB <="00110";
    sb_TB <= "00110";
    wait for period;

-- Test Case 7: register 7
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00111";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010100100";
    wait for clk_period;
    RW_TB <= '1';
    sa_TB <="00111";
    sb_TB <= "00111";
    wait for period;

-- Test Case 8: register 8
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "01000";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010100101";
    wait for clk_period;
    RW_TB <= '1';
    sa_TB <="01000";
    sb_TB <= "01000";
    wait for period;
-- Test Case 9: register 9
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "01001";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010100110";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <="01001";
    sb_TB <="01001";
    wait for period;

-- Test Case 10: register 10
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "01010";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010100111";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "01010";
    sb_TB <= "01010";
    wait for period;

-- Test Case 11: register 11
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "01011";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010101000";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "01011";
    sb_TB <="01011";
    wait for period;

-- Test Case 12: register 12
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "01100";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010101001";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "01100";
    sb_TB <="01100";
    wait for period;

-- Test Case 13: register 13
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "01101";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010101010";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "01101";
    sb_TB <="01101";
    wait for period;

-- Test Case 14: register 14
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "01110";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010101011";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "01110";
    sb_TB <="01110";
    wait for period;

-- Test Case 15: register 15
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "01111";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010101100";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "01111";
    sb_TB <="01111";
    wait for period;

-- Test Case 16: register 16
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "10000";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010101101";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "10000";
    sb_TB <="10000";
    wait for period;


-- Test Case 17: register 17
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "10001";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010101110";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "10001";
    sb_TB <="10001";
    wait for period;

-- Test Case 18: register 18
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "10010";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010101111";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <=  "10010";
    sb_TB <= "10010";
    wait for period;

-- Test Case 19: register 19
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "10011";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010110000";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <=  "10011";
    sb_TB <= "10011";
    wait for period;

-- Test Case 20: register 20
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "10100";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010110001";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <=   "10100";
    sb_TB <=  "10100";
    wait for period;

-- Test Case 21: register 21
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "10101";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010110010";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <=  "10101";
    sb_TB <=  "10101";
    wait for period;
-- Test Case 22: register 22
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "10110";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010110011";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <=  "10110";
    sb_TB <= "10110";
    wait for period;

-- Test Case 23: register 23
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "10111";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010110100";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "10111";
    sb_TB <="10111";
    wait for period;


-- Test Case 24: register 24
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "11000";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010110101";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "11000";
    sb_TB <="11000";
    wait for period;

-- Test Case 25: register 25
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "11001";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010110110";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "11001";
    sb_TB <="11001";
    wait for period;

-- Test Case 26: register 26
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "11010";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010110111";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "11010";
    sb_TB <="11010";
    wait for period;


-- Test Case 27: register 27
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "11011";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010111000";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "11011";
    sb_TB <="11011";
    wait for period;

-- Test Case 28: register 28
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "11100";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010111001";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "11100";
    sb_TB <="11100";
    wait for period;


-- Test Case 29: register 29
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "11101";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010111010";
    wait for clk_period;
        RW_TB <= '1';
    sa_TB <= "11101";
    sb_TB <="11101";
    wait for period;

-- Test Case 30: register 30
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "11110";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010111011";
    wait for clk_period;
       RW_TB <= '1';
    sa_TB <= "11110";
    sb_TB <="11110";
    wait for period;

-- Test Case 31: register 31
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "11111";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010111100";
    wait for clk_period;
       RW_TB <= '1';
    sa_TB <=  "11111";
    sb_TB <= "11111";
    wait for period;

-- Test Case 32: register 0
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0000";
    D_TB <= "00000001010101001101001010111101";
    wait for clk_period;
    RW_TB <= '1';
    wait for period;

-- Test Case 33: register 1
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0001";
    D_TB <= "00000001010101001101001010111110";
    wait for clk_period;
    RW_TB <= '1';
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
    wait for period;
        
    end process;

END simulation;
