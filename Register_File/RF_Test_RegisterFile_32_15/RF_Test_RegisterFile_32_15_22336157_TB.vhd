----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 16.10.2024 11:56:43
-- Design Name: 
-- Module Name: RF_RegisterFile_32_15_22336157_TB - Simulation
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

ENTITY RF_Test_RegisterFile_32_15_22336157_TB IS
END RF_Test_RegisterFile_32_15_22336157_TB;

ARCHITECTURE simulation OF RF_Test_RegisterFile_32_15_22336157_TB IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT RF_Test_RegisterFile_32_15_22336157
    PORT(
        DR_Test : IN STD_LOGIC_VECTOR (4 downto 0); 
        RW_Test : IN STD_LOGIC; 
        SA_Test : IN STD_LOGIC_VECTOR(4 downto 0);
        SB_Test : IN STD_LOGIC_VECTOR(4 downto 0);
        CLK_Test : IN STD_LOGIC;
        Reset_Test : IN STD_LOGIC;
        TB_Test : IN STD_LOGIC_VECTOR (3 downto 0);
        TA_Test : IN STD_LOGIC_VECTOR (3 downto 0);
        TD_Test : IN STD_LOGIC_VECTOR (3 downto 0);
        A_B_DataIN_Test : IN STD_LOGIC_VECTOR (1 downto 0);
        D_Test : IN STD_LOGIC_VECTOR(31 downto 0)
    );
    END COMPONENT;

    -- Test signals
    signal DR_Test : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal RW_Test : STD_LOGIC := '0';
    signal SA_Test : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal SB_Test : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal CLK_Test : STD_LOGIC := '0';
    signal Reset_Test : STD_LOGIC := '1'; -- Start with reset active
    signal TB_Test : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal TA_Test : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal TD_Test : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal A_B_DataIN_Test : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    signal D_Test : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

    constant StudentID : STD_LOGIC_VECTOR(31 downto 0) := x"0154D29D"; -- Student ID 22336157

    -- Clock period definition
    constant clk_period : time := 400 ns;
    constant period : time := 1000ns; 

BEGIN 
    CLK_Test <= not CLK_Test after clk_period / 2;
    -- Instantiate the Unit Under Test (UUT)
    uut: RF_Test_RegisterFile_32_15_22336157 PORT MAP (
        DR_Test => DR_Test,
        RW_Test => RW_Test,
        SA_Test => SA_Test,
        SB_Test => SB_Test,
        CLK_Test => CLK_Test,
        Reset_Test => Reset_Test,
        TB_Test => TB_Test,
        TA_Test => TA_Test,
        TD_Test => TD_Test,
        A_B_DataIN_Test => A_B_DataIN_Test,
        D_Test => D_Test
    );

    -- Clock process definitions
    CLK_Process :process
    begin
        CLK_Test <= '0';
        wait for CLK_period/2;
        CLK_Test <= '1';
        wait for CLK_period/2;
    end process;

    -- Stimulus process
    Stimulus: process
    begin	

            reset_Test <= '1';
        wait for clk_period;
        
-- Test Case 0: register 0
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010011101";
    wait for clk_period;
    RW_Test <= '1';
    wait for clk_period*2;
    
-- Test Case 1: register 1
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00001";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010011110";
    wait for clk_period;
    RW_Test <= '1';
    sa_Test <="00001";
    sb_Test <= "00001";
    wait for period;

-- Test Case 2: register 2
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00010";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010011111";
    wait for clk_period;
    RW_Test <= '1';
    sa_Test <="00010";
    sb_Test <= "00010";
    wait for period;

-- Test Case 3: register 3
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00011";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010100000";
    wait for clk_period;
    RW_Test <= '1';
    sa_Test <="00011";
    sb_Test <="00011";
    wait for period;

-- Test Case 4: register 4
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00100";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010100001";
    wait for clk_period;
    RW_Test <= '1';
    sa_Test <="00100";
    sb_Test <= "00100";
    wait for period;

-- Test Case 5: register 5
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00101";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010100010";
    wait for clk_period;
    RW_Test <= '1';
    sa_Test <="00101";
    sb_Test <= "00101";
    wait for period;

-- Test Case 6: register 6
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00110";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010100011";
    wait for clk_period;
    RW_Test <= '1';
    sa_Test <="00110";
    sb_Test <= "00110";
    wait for period;

-- Test Case 7: register 7
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00111";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010100100";
    wait for clk_period;
    RW_Test <= '1';
    sa_Test <="00111";
    sb_Test <= "00111";
    wait for period;

-- Test Case 8: register 8
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "01000";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010100101";
    wait for clk_period;
    RW_Test <= '1';
    sa_Test <="01000";
    sb_Test <= "01000";
    wait for period;
-- Test Case 9: register 9
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "01001";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010100110";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <="01001";
    sb_Test <="01001";
    wait for period;

-- Test Case 10: register 10
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "01010";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010100111";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "01010";
    sb_Test <= "01010";
    wait for period;

-- Test Case 11: register 11
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "01011";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010101000";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "01011";
    sb_Test <="01011";
    wait for period;

-- Test Case 12: register 12
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "01100";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010101001";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "01100";
    sb_Test <="01100";
    wait for period;

-- Test Case 13: register 13
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "01101";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010101010";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "01101";
    sb_Test <="01101";
    wait for period;

-- Test Case 14: register 14
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "01110";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010101011";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "01110";
    sb_Test <="01110";
    wait for period;

-- Test Case 15: register 15
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "01111";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010101100";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "01111";
    sb_Test <="01111";
    wait for period;

-- Test Case 16: register 16
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "10000";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010101101";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "10000";
    sb_Test <="10000";
    wait for period;


-- Test Case 17: register 17
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "10001";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010101110";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "10001";
    sb_Test <="10001";
    wait for period;

-- Test Case 18: register 18
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "10010";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010101111";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <=  "10010";
    sb_Test <= "10010";
    wait for period;

-- Test Case 19: register 19
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "10011";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010110000";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <=  "10011";
    sb_Test <= "10011";
    wait for period;

-- Test Case 20: register 20
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "10100";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010110001";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <=   "10100";
    sb_Test <=  "10100";
    wait for period;

-- Test Case 21: register 21
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "10101";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010110010";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <=  "10101";
    sb_Test <=  "10101";
    wait for period;
-- Test Case 22: register 22
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "10110";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010110011";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <=  "10110";
    sb_Test <= "10110";
    wait for period;

-- Test Case 23: register 23
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "10111";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010110100";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "10111";
    sb_Test <="10111";
    wait for period;


-- Test Case 24: register 24
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "11000";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010110101";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "11000";
    sb_Test <="11000";
    wait for period;

-- Test Case 25: register 25
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "11001";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010110110";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "11001";
    sb_Test <="11001";
    wait for period;

-- Test Case 26: register 26
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "11010";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010110111";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "11010";
    sb_Test <="11010";
    wait for period;


-- Test Case 27: register 27
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "11011";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010111000";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "11011";
    sb_Test <="11011";
    wait for period;

-- Test Case 28: register 28
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "11100";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010111001";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "11100";
    sb_Test <="11100";
    wait for period;


-- Test Case 29: register 29
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "11101";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010111010";
    wait for clk_period;
        RW_Test <= '1';
    sa_Test <= "11101";
    sb_Test <="11101";
    wait for period;

-- Test Case 30: register 30
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "11110";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010111011";
    wait for clk_period;
       RW_Test <= '1';
    sa_Test <= "11110";
    sb_Test <="11110";
    wait for period;

-- Test Case 31: register 31
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "11111";
    td_Test <= "0000";
    D_Test <= "00000001010101001101001010111100";
    wait for clk_period;
       RW_Test <= '1';
    sa_Test <=  "11111";
    sb_Test <= "11111";
    wait for period;

-- Test Case 32: register 1
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "0001";
    SA_Test <= "00000";
    SB_Test <= "00000"; 
    D_Test <= "00000001010101001101001010111110";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "0001";
    Tb_Test <= "0001";
    wait for period;

-- Test Case 33: register 2
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "0010";
    D_Test <= "00000001010101001101001010111111";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "0010";
    Tb_Test <= "0010";
    wait for period;

-- Test Case 34: register 3
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "0011";
    D_Test <= "00000001010101001101001011000000";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "0011";
    Tb_Test <= "0011";
    wait for period;

-- Test Case 35: register 4
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "0100";
    D_Test <= "00000001010101001101001011000001";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "0100";
    Tb_Test <= "0100";
    wait for period;

-- Test Case 36: register 5
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "0101";
    D_Test <= "00000001010101001101001011000010";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <="0101";
    Tb_Test <= "0101";
    wait for period;

-- Test Case 37: register 6
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "0110";
    D_Test <= "00000001010101001101001011000011";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "0110";
    Tb_Test <= "0110";
    wait for period;

-- Test Case 38: register 7
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "0111";
    D_Test <= "00000001010101001101001011000100";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "0111";
    Tb_Test <= "0111";
    wait for period;

-- Test Case 39: register 8
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "1000";
    D_Test <= "00000001010101001101001011000101";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "1000";
    Tb_Test <= "1000";
    wait for period;

-- Test Case 40: register 9
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "1001";
    D_Test <= "00000001010101001101001011000110";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "1001";
    Tb_Test <= "1001";
    wait for period;

-- Test Case 41: register 10
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "1010";
    D_Test <= "00000001010101001101001011000111";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "1010";
    Tb_Test <= "1010";
    wait for period;

-- Test Case 42: register 11
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "1011";
    D_Test <= "00000001010101001101001011001000";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "1011";
    Tb_Test <= "1011";
    wait for period;

-- Test Case 43: register 12
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "1100";
    D_Test <= "00000001010101001101001011001001";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "1100";
    Tb_Test <= "1100";
    wait for period;

-- Test Case 44: register 13
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "1101";
    D_Test <= "00000001010101001101001011001010";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "1101";
    Tb_Test <= "1101";
    wait for period;

-- Test Case 45: register 14
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "1110";
    D_Test <= "00000001010101001101001011001011";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "1110";
    Tb_Test <= "1110";
    wait for period;

-- Test Case 46: register 15
    Reset_Test <= '0';
    wait for clk_period;
    RW_Test <= '0';  -- Enable write
    dr_Test <= "00000";
    td_Test <= "1111";
    D_Test <= "00000001010101001101001011001100";
    wait for clk_period;
    RW_Test <= '1';
    ta_Test <= "1111";
    Tb_Test <= "1111";
    wait for period; 
    
    -- Test Case 47: perm to perm (A) 
    
     A_B_DataIN_Test <= "00"; --(Select A)
    TD_Test <= "0000"; --(Disable temp)
    DR_Test <= "00011"; --(Move into 3)
    TA_Test <= "0000";
    SA_Test <= "00101"; --(Select from 5)
    SB_Test <= "00000";   
    wait for period;       
    
 -- Test case 48: Perm to Temp
     A_B_DataIN_Test <= "00"; --(Select A)
    TD_Test <= "0001"; --(Enable Temp and move into Temp 1)
    TA_Test <= "0101";
    SB_Test <= "00000";    
    wait for period;    
    
-- Test case 49: Temp to Perm
    A_B_DataIN_Test <= "00"; --(Select A)
    TD_Test <= "0000"; -- (Disable Temp)
    DR_Test <= "00011"; --(Move into Perm 3)
    TA_Test <= "0010"; --(Select from Temp 2)
    SB_Test <= "00000";         
    wait for period;
    
-- Test case 50: Temp to Temp
    A_B_DataIN_Test <= "00"; --(Select A)
    TD_Test <= "0011"; --(Enable Temp and move into Temp 3)
    TA_Test <= "0101"; --(Select from Temp 5)
    SB_Test <= "00000";
    wait for period;
    
    
-- Test case 51: perm to perm (B)
         A_B_DataIN_Test <= "01"; --(Select B)
    TD_Test <= "0000"; --(Disable temp)
    DR_Test <= "00011"; --(Move into 3)
    TA_Test <= "0000";
    SA_Test <= "00000";  
    SB_Test <= "00101"; --(Select from 5)
 
    wait for period;       
    
 -- Test case 52: Perm to Temp
    TD_Test <= "0001"; --(Enable Temp and move into Temp 1)
    TA_Test <= "0000";
    SB_Test <= "00101"; --(Select from 5)
    wait for period;    
    
-- Test case 53: Temp to Perm
    A_B_DataIN_Test <= "00"; --(Select A)
    TD_Test <= "0000"; -- (Disable Temp)
    DR_Test <= "00101"; --(Move into Perm 3)
    TB_Test <= "0010"; --(Select from Temp 2)      
    wait for period;
    
-- Test case 54: Temp to Temp
    A_B_DataIN_Test <= "00"; --(Select A)
    TD_Test <= "0011"; --(Enable Temp and move into Temp 3)
    TB_Test <= "0101"; --(Select from Temp 5)
    wait for period;
      

      wait for period; 
    end process;

END simulation;

