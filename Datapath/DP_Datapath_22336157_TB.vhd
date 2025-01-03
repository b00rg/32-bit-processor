----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 20.09.2023 14:53:59
-- Design Name: 
-- Module Name: DP_Datapath_22336157_TB - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY DP_Datapath_22336157_TB IS
END DP_Datapath_22336157_TB;

ARCHITECTURE simulation OF DP_Datapath_22336157_TB IS

    -- Component Declaration for the Unit Under Test (UUT)

component DP_Datapath_22336157 is
    Port (
      IR_IN, DATA_IN         :  in STD_LOGIC_VECTOR(31 downto 0); 
      MB, MD, RW, Reset, clock      : in STD_LOGIC;                     
      DR, FS, SA, SB         : in STD_LOGIC_VECTOR(4 downto 0);
      TA, TB, TD             : in STD_LOGIC_VECTOR(3 downto 0);
      DATA_OUT, ADD          : out STD_LOGIC_VECTOR(31 downto 0);  
      C, N, V, Z             : out STD_LOGIC
    );
end component;

    -- Signals Declaration
    signal RW, MB, clock, MD : std_logic := '0';                     -- Read/Write signal
    signal Reset  : std_logic := '0';                  -- Reset signal
    signal DR  : std_logic_vector(4 downto 0) := (others => '0'); -- 5-bit destination register address
    signal IR_IN, Data_IN : std_logic_vector(31 downto 0) := (others => '0'); -- 32-bit data input
    signal sa, sb, fs : std_logic_vector(4 downto 0) := (others => '0'); 
    signal ta, tD , tb : std_logic_vector(3 downto 0) := (others => '0'); 
    signal DATA_OUT, ADD : std_logic_vector(31 downto 0) := (others => '0');  -- Selection/control inputs
    signal C, N, V, Z : std_logic; 
    -- Clock period definition
    constant clk_period : time := 400 ns;
    constant period : time := 1000ns; 
    constant operation_wait_time : time := 1000 ns;
  constant StudentID : STD_LOGIC_VECTOR (27 downto 0) := x"154D29D";

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: DP_Datapath_22336157 Port Map(
        IR_IN => IR_IN, DATA_IN => DATA_IN,
        MB => MB, MD => MD , RW => RW , Reset => Reset,       
        FS => FS , SA => SA, SB => SB,
        TA => TA, TB => TB, TD => TD ,
        DATA_OUT => DATA_OUT, ADD => ADD,
        C => C, N => N, V => V, Z => Z, clock => clock, DR => DR
      );
      
  -- Clock generation without a process      
    clock <= not clock after clk_period / 2;    -- Stimulus process
    stim_proc: process
    begin
      Reset  <= '1';
      MD <= '1'; 
      wait for clk_period;
      -- Load value into register 0
      Reset  <= '0';
      wait for clk_period;
      RW  <= '0';  -- Enable write
      DR  <= "00000";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010011101";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      wait for clk_period*2;

      -- Load value into register 1
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';      -- Enable write
      DR  <= "00001";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010011100";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "00001";
      sb <= "00001"; 
      wait for clk_period*2;

      -- Load value into register 2
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "00010";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010011011";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "00010";
      sb <= "00010"; 
      wait for clk_period*2;

      -- Load value into register 3
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "00011";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010011010";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "00011";
      sb <= "00011";
      wait for clk_period*2;

      -- Load value into register 4
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "00100";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010011001";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "00100";
      sb <= "00100"; 
      wait for clk_period*2;

      -- Load value into register 5
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "00101";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010011000";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "00101";
      sb <= "00101"; 
      wait for clk_period*2;

      -- Load value into register 6
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "00110";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010010111";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "00110";
      sb <= "00110"; 
      wait for clk_period*2;

      -- Load value into register 7
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "00111";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010010110";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "00111";
      sb <= "00111"; 
      wait for clk_period*2;

      -- Load value into register 8
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "01000";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010010101";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "01000";
      sb <= "01000"; 
      wait for clk_period*2;

      -- Load value into register 9
      Reset  <= '0';
      wait for clk_period;
      RW  <= '0';  -- Enable write
      DR  <= "01001";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010010100";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "01001";
      sb <= "01001";
      wait for clk_period*2; 

      -- Load value into register 10
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "01010";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010010011";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "01010";
      sb <= "01010"; 
      wait for clk_period*2;

      -- Load value into register 11
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "01011";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010010010";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "01011";
      sb <= "01011";
      wait for clk_period*2; 

      -- Load value into register 12
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "01100";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010010001";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "01100";
      sb <= "01100";
      wait for clk_period*2; 

      -- Load value into register 13
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "01101";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010010000";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "01101";
      sb <= "01101";
      wait for clk_period*2; 

      -- Load value into register 14
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "01110";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010001111";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "01110";
      sb <= "01110";
      wait for clk_period*2; 

      -- Load value into register 15
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "01111";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010001110";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "01111";
      sb <= "01111"; 
      wait for clk_period*2; 

      -- Load value into register 16
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "10000";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010001101";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "10000";
      sb <= "10000"; 
      wait for clk_period*2; 

      -- Load value into register 17
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "10001";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010001100";  -- Data to load
      wait for clk_period*2;
      RW <= '1'; 
      sa <= "10001";
      sb <= "10001";
      wait for clk_period*2; 

      -- Load value into register 18
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "10010";  -- Register address in binary
      TD <= "0000";
      DATA_IN  <= "00000001010101001101001010001011";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "10010";
      sb <= "10010";
      wait for clk_period*2; 

      -- Load value into register 19
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "10011";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010001010";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "10011"; 
      sb <= "10011"; 
      wait for clk_period*2;

      -- Load value into register 20
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "10100";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010001001";  -- Data to load
      wait for clk_period*2;
      RW <= '1'; 
      sa <= "10100";
      sb <= "10100";
      wait for clk_period; 

      -- Load value into register 21
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "10101";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010001000";  -- Data to load
      wait for clk_period*2;
      RW <= '1'; 
      sa <= "10101";
      sb <= "10101";
      wait for clk_period*2;

      -- Load value into register 22
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "10110";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010000111";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "10110"; 
      sb <= "10110"; 
      wait for clk_period*2;

      -- Load value into register 23
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "10111";  -- Register address in binary
      TD <= "0000";
      DATA_IN<= "00000001010101001101001010000110";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "10111";
      sb <= "10111";
      wait for clk_period*2;

      -- Load value into register 24
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "11000";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010000101";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "11000";
      sb <= "11000";
      wait for clk_period*2;

      -- Load value into register 25
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "11001";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010000100";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "11001";
      sb <= "11001";
      wait for clk_period*2; 

      -- Load value into register 26
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "11010";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010000011";  -- Data to load
      wait for clk_period*2;
      RW <= '1'; 
      sa <= "11010";
      sb <= "11010";
      wait for clk_period*2; 

      -- Load value into register 27
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "11011";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010000010";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "11010";
      sb <= "11010";
      wait for clk_period*2;

      -- Load value into register 28
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "11100";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010000001";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "11100";
      sb <= "11100";
      wait for clk_period*2;

      -- Load value into register 29
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "11101";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001010000000";  -- Data to load
      wait for clk_period*2;
      RW <= '1';
      sa <= "11101";
      sb <= "11101";
      wait for clk_period*2; 

      -- Load value into register 30
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "11110";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001001111111";  -- Data to load
      wait for clk_period*2;
      RW <= '1'; 
      sa <= "11110";
      sb <= "11110";
      wait for clk_period*2; 

      -- Load value into register 31
      Reset  <= '0';
      wait for clk_period*2;
      RW  <= '0';  -- Enable write
      DR  <= "11111";  -- Register address in binary
      TD <= "0000";
      DATA_IN <= "00000001010101001101001001111110";  -- Data to load
      wait for clk_period*2;
      RW <= '1'; 
      sa <= "11111"; 
      sb <= "11111"; 
      wait for clk_period*2; 

    -- Test Case 32: temp register 1
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "0001";
    DATA_IN <= "00000001010101001101001010111110";
    wait for clk_period*2;
    RW <= '1';
    sa <= "00000";
    sb <= "00000"; 
    ta <= "0001";
    tb <= "0001"; 

    wait for clk_period*2;

-- Test Case 33: temp register 2
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "0010";
    DATA_IN <= "00000001010101001101001010111101";
    wait for clk_period*2;
    RW <= '1';
    ta <= "0010";
    tb <= "0010";
    wait for clk_period*2; 

-- Test Case 34: temp register 3
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "0011";
    DATA_IN <= "00000001010101001101001010111100";
    wait for clk_period*2;
    ta <= "0011";
    tb <= "0011"; 
    wait for clk_period*2;

-- Test Case 35: temp register 4
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "0100";
    DATA_IN <= "00000001010101001101001010111011";
    wait for clk_period*2;
    RW <= '1';
    ta <= "0100";
    tb <= "0100"; 
    wait for clk_period*2; 

-- Test Case 36: temp register 5
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "0101";
    DATA_IN <= "00000001010101001101001010111010";
    wait for clk_period*2;
    RW <= '1';
    ta <= "0101";
    tb <= "0101"; 
    wait for clk_period;

-- Test Case 37: temp register 6
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "0110";
    DATA_IN  <= "00000001010101001101001010111001";
    wait for clk_period*2;
    RW <= '1';
    ta <= "0110";
    tb <= "0110"; 
    wait for clk_period*2; 

-- Test Case 38: temp register 7
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "0111";
    DATA_IN <= "00000001010101001101001010111000";
    wait for clk_period*2;
    RW <= '1';
    ta <= "0111";
    tb <= "0111"; 
    wait for clk_period*2;

-- Test Case 39: temp register 8
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "1000";
    DATA_IN  <= "00000001010101001101001010110111";
    wait for clk_period*2;
    RW <= '1';
    ta <= "1000";
    tb <= "1000"; 
    wait for clk_period*2; 

-- Test Case 40: temp register 9
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "1001";
    DATA_IN <= "00000001010101001101001010110110";
    wait for clk_period*2;
    RW <= '1';
    ta <= "1001";
    tb <= "1001"; 
    wait for clk_period*2; 

-- Test Case 41: temp register 10
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "1010";
    DATA_IN <= "00000001010101001101001010110101";
    wait for clk_period*2;
    RW <= '1';
    ta <= "1010";
    tb <= "1010"; 
    wait for clk_period*2; 

-- Test Case 42: temp register 11
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "1011";
    DATA_IN <= "00000001010101001101001010110100";
    wait for clk_period*2;
    RW <= '1';
    ta <= "1011";
    tb <= "1011"; 
    wait for clk_period*2; 

-- Test Case 43: temp register 12
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "1100";
    DATA_IN <= "00000001010101001101001010110011";
    wait for clk_period*2;
    RW <= '1';
    ta <= "1100";
    tb <= "1100"; 
    wait for clk_period*2; 

-- Test Case 44: temp register 13
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "1101";
    DATA_IN <= "00000001010101001101001010110010";
    wait for clk_period*2;
    RW <= '1';
    ta <= "1101";
    tb <= "1101"; 
    wait for clk_period*2; 

-- Test Case 45: temp register 14
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "1110";
    DATA_IN <= "00000001010101001101001010110001";
    wait for clk_period*2;
    RW <= '1';
    ta <= "1110";
    tb <= "1110"; 
    wait for clk_period*2; 

-- Test Case 46: temp register 15
    Reset  <= '0';
    wait for clk_period*2;
    RW  <= '0';  -- Enable write
    DR  <= "00000";
    TD <= "1111";
    DATA_IN <= "00000001010101001101001010110000";
    wait for clk_period*2;
    RW <= '1';
    ta <= "1111"; 
    tb <= "1111"; 
    wait for clk_period*2; 

-- Register Selection
        
-- Test Case 47: select register 7 as the destination address

    TD <= "0000";
    TA <= "0000";
    TB <= "0000"; 
    wait for clk_period*2;

-- Test Case 48: select register 12 as the source-register A ( A address )
    DR  <= "00111";
    sa <= "01100";

-- Test Case 49: select register 22 as the source-register B ( B address )
    sb <= "10110";
    
    MB <= '0';
    MD <= '0';
    RW <= '1';

-- register operations
    -- Test Case 50: A OR B
    FS <= "01010";
    wait for operation_wait_time; 
    
    -- Test Case 51: A XOR B
    FS <= "01100";
    wait for operation_wait_time; 
    
    -- Test Case 52: A AND B
    FS <= "01000";
    wait for operation_wait_time;
    
    -- Test Case 53: B
    FS <= "10000";
    wait for operation_wait_time;
    
    -- Test Case 54: A - 1 
    FS <= "00110"; 
    wait for operation_wait_time;
    
    -- Test case 55: slB
    FS <= "11000"; 
    wait for operation_wait_time; 
    
    -- Test case 56: A + 1's complement B + 1 
    FS <= "00101";
    wait for operation_wait_time;

    -- Test case 57: A (FS=00111)
    FS <= "00111";
    wait for operation_wait_time;
    
    -- Test case 58: A + 1's complement B 
    FS <= "00100"; 
    wait for operation_wait_time;
    
    -- Test case 59: srB 
    FS <= "10100";
    wait for operation_wait_time; 
    
    -- Test case 60: A + B + 1
    FS <= "00011"; 
    wait for operation_wait_time;
    
    -- Test case 61: 1's c A 
    FS <= "01110";
    wait for operation_wait_time;
    
    -- Test case 62: A + B
    FS <= "00010";
    wait for operation_wait_time;
    
    -- Test case 63: FS = 0000
    FS <= "00000"; 
    wait for operation_wait_time;
    
    -- Test case 64: A + 1
    FS <= "00001";
    wait for operation_wait_time; 
    
    MB <= '1';
   -- Test Case 65: A OR B (Mux B constant in) 
    FS <= "01010";
    wait for operation_wait_time; 
    
        -- Test Case 66: A XOR B
    MB <= '0'; 
    FS <= "01100";
    wait for operation_wait_time; 
    
    -- Test Case 67: A AND B
    MB <= '0';
    FS <= "01000";
    wait for operation_wait_time;
    
    -- Test Case 68: B
    MB <= '0'; 
    FS <= "10000";
    wait for operation_wait_time;
    
     -- Test case 69: slB
    FS <= "11000"; 
    wait for operation_wait_time; 
    
    -- Test case 70: A + 1's complement B + 1 
    FS <= "00101";
    wait for operation_wait_time;

 -- Test case 71: A + 1's complement B 
    FS <= "00100"; 
    wait for operation_wait_time;
    
    -- Test case 72: srB 
    FS <= "10100";
    wait for operation_wait_time; 
    
    -- Test case 73: A + B + 1
    FS <= "00011"; 
    wait for operation_wait_time;
    
     -- Test case 74: A + B
    FS <= "00010";
    wait for operation_wait_time;
    
    end process;
END simulation; 
