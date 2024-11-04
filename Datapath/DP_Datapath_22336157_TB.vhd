LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY RF_RegisterFile_32_15_22336157_TB IS
END RF_RegisterFile_32_15_22336157_TB;

ARCHITECTURE simulation OF DP_Datapath_22336157_TB IS

    -- Component Declaration for the Unit Under Test (UUT)

    Component DP_Datapath_22336157 is
      Port (
        IR_IN, DATA_IN         :  in STD_LOGIC_VECTOR(31 downto 0); 
        MB, MD, RW, Reset      : in STD_LOGIC;                     
        FS, SA, SB             : in STD_LOGIC_VECTOR(4 downto 0);
        TA, TB, TD             : in STD_LOGIC_VECTOR(3 downto 0);
        DATA_OUT, ADD          : out STD_LOGIC_VECTOR(31 downto 0)  
        C, N, V, Z             : out STD_LOGIC
      );
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
    constant operation_wait_time : time := 1000 ns;

BEGIN
  -- Clock generation without a process
    CLK_TB <= not CLK_TB after clk_period / 2;

    -- Instantiate the Unit Under Test (UUT)
    uut: DP_Datapath_22336157 Port Map(
        IR_IN => IR_IN_TB, DATA_IN => DATA_IN_TB; 
        MB => MB_TB, MD => MD_TB, RW => RW_TB, Reset => Reset_TB;                  
        FS => FS_TB, SA => SA_TB, SB => SB_TB; 
        TA => TA_TB, TB => TB_TB, TD => TD_TB;
        DATA_OUT => DATA_OUT_TB, ADD => ADD_TB;
        C => C_TB, N => N_TB, V => V_TB, Z => Z_TB 
      );

    -- Stimulus process
    stim_proc: process
    begin
      Reset_TB <= '1';
      wait for clk_period;

      -- Load value into register 0
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "00000";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010011101";  -- Data to load
      wait for clk_period;

      -- Load value into register 1
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "00001";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010011100";  -- Data to load
      wait for clk_period;

      -- Load value into register 2
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "00010";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010011011";  -- Data to load
      wait for clk_period;

      -- Load value into register 3
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "00011";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010011010";  -- Data to load
      wait for clk_period;

      -- Load value into register 4
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "00100";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010011001";  -- Data to load
      wait for clk_period;

      -- Load value into register 5
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "00101";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010011000";  -- Data to load
      wait for clk_period;

      -- Load value into register 6
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "00110";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010010111";  -- Data to load
      wait for clk_period;

      -- Load value into register 7
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "00111";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010010110";  -- Data to load
      wait for clk_period;

      -- Load value into register 8
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "01000";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010010101";  -- Data to load
      wait for clk_period;

      -- Load value into register 9
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "01001";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010010100";  -- Data to load
      wait for clk_period;

      -- Load value into register 10
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "01010";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010010011";  -- Data to load
      wait for clk_period;

      -- Load value into register 11
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "01011";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010010010";  -- Data to load
      wait for clk_period;

      -- Load value into register 12
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "01100";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010010001";  -- Data to load
      wait for clk_period;

      -- Load value into register 13
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "01101";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010010000";  -- Data to load
      wait for clk_period;

      -- Load value into register 14
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "01110";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010001111";  -- Data to load
      wait for clk_period;

      -- Load value into register 15
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "01111";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010001110";  -- Data to load
      wait for clk_period;

      -- Load value into register 16
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "10000";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010001101";  -- Data to load
      wait for clk_period;

      -- Load value into register 17
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "10001";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010001100";  -- Data to load
      wait for clk_period;

      -- Load value into register 18
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "10010";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010001011";  -- Data to load
      wait for clk_period;

      -- Load value into register 19
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "10011";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010001010";  -- Data to load
      wait for clk_period;

      -- Load value into register 20
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "10100";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010001001";  -- Data to load
      wait for clk_period;

      -- Load value into register 21
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "10101";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010001000";  -- Data to load
      wait for clk_period;

      -- Load value into register 22
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "10110";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010000111";  -- Data to load
      wait for clk_period;

      -- Load value into register 23
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "10111";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010000110";  -- Data to load
      wait for clk_period;

      -- Load value into register 24
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "11000";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010000101";  -- Data to load
      wait for clk_period;

      -- Load value into register 25
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "11001";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010000100";  -- Data to load
      wait for clk_period;

      -- Load value into register 26
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "11010";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010000011";  -- Data to load
      wait for clk_period;

      -- Load value into register 27
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "11011";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010000010";  -- Data to load
      wait for clk_period;

      -- Load value into register 28
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "11100";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010000001";  -- Data to load
      wait for clk_period;

      -- Load value into register 29
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "11101";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001010000000";  -- Data to load
      wait for clk_period;

      -- Load value into register 30
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "11110";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001001111111";  -- Data to load
      wait for clk_period;

      -- Load value into register 31
      Reset_TB <= '0';
      wait for clk_period;
      RW_TB <= '0';  -- Enable write
      dr_TB <= "11111";  -- Register address in binary
      td_TB <= "0000";
      D_TB <= "00000001010101001101001001111110";  -- Data to load
      wait for clk_period;

    -- Test Case 32: temp register 1
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0001";
    D_TB <= "00000001010101001101001010111110";
    wait for clk_period;

-- Test Case 33: temp register 2
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0010";
    D_TB <= "00000001010101001101001010111101";
    wait for clk_period;

-- Test Case 34: temp register 3
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0011";
    D_TB <= "00000001010101001101001010111100";
    wait for clk_period;

-- Test Case 35: temp register 4
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0100";
    D_TB <= "00000001010101001101001010111011";
    wait for clk_period;

-- Test Case 36: temp register 5
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0101";
    D_TB <= "00000001010101001101001010111010";
    wait for clk_period;

-- Test Case 37: temp register 6
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0110";
    D_TB <= "00000001010101001101001010111001";
    wait for clk_period;

-- Test Case 38: temp register 7
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "0111";
    D_TB <= "00000001010101001101001010111000";
    wait for clk_period;

-- Test Case 39: temp register 8
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1000";
    D_TB <= "00000001010101001101001010110111";
    wait for clk_period;

-- Test Case 40: temp register 9
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1001";
    D_TB <= "00000001010101001101001010110110";
    wait for clk_period;

-- Test Case 41: temp register 10
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1010";
    D_TB <= "00000001010101001101001010110101";
    wait for clk_period;

-- Test Case 42: temp register 11
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1011";
    D_TB <= "00000001010101001101001010110100";
    wait for clk_period;

-- Test Case 43: temp register 12
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1100";
    D_TB <= "00000001010101001101001010110011";
    wait for clk_period;

-- Test Case 44: temp register 13
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1101";
    D_TB <= "00000001010101001101001010110010";
    wait for clk_period;

-- Test Case 45: temp register 14
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1110";
    D_TB <= "00000001010101001101001010110001";
    wait for clk_period;

-- Test Case 46: temp register 15
    Reset_TB <= '0';
    wait for clk_period;
    RW_TB <= '0';  -- Enable write
    dr_TB <= "00000";
    td_TB <= "1111";
    D_TB <= "00000001010101001101001010110000";
    wait for clk_period;

-- Register Selection
        
-- Test Case 47: select register 7 as the destination address

-- Test Case 48: select register 12 as the source-register A ( A address )

-- Test Case 49: select register 22 as the source-register B ( B address )

-- register operations

    -- Test Case 50: A + B + 1
    FS <= "00011"; 
    wait for operation_wait_time;
    
    -- Test Case 51: A + 1's Complement B 
    FS <= "00101"; 
    wait for operation_wait_time;
    
    -- Test Case 52: A + 1
    FS <= "00001";
    wait for operation_wait_time;
    
    -- Test Case 53: A 
    FS <= "00000";
    wait for operation_wait_time;
    
    -- Test Case 54: A + B
    FS <= "00010";
    wait for operation_wait_time;
    
    -- Test Case 55: A + B + 1
    FS <= "00011";
    wait for operation_wait_time;
    
    -- Test Case 56: A + 1's Complement B 
    FS <= "00101"; 
    wait for operation_wait_time;
    
    -- Test Case 57: A + 1's Complement B  + 1 
    FS <= "00101";
    wait for operation_wait_time;
    
    -- Test Case 58: A - 1 
    FS <= "00110"; 
    wait for operation_wait_time;
    
    -- Test Case 59: A AND B 
    FS <= "01000";
    wait for operation_wait_time;

    end process;
END simulation; 
