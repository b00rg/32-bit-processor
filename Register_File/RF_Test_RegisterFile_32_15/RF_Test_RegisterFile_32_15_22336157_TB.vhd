----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

ARCHITECTURE behavior OF RF_Test_RegisterFile_32_15_22336157_TB IS 

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
    constant CLK_period : time := 500 ns;

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

        -- Hold reset for a few cycles
        wait for 20 ns;
        Reset_Test <= '0'; -- Deassert reset

        -- Loading Registers via RF_Mux3_32Bit
        -- Register00 = StudentID, Register01 = StudentID + 1, Register02 = StudentID + 2...
        
    Reset_Test <= '0';
-- Test Case 0: write to register 0
-- Test Case 0: write to register 0
    D_Test <= "00000001010101001101001010011101";
    dr_Test <= "00000";
    wait for clk_period;

-- Test Case 1: write to register 1
    D_Test <= "00000001010101001101001010011110";
    dr_Test <= "00001";
    wait for clk_period;

-- Test Case 2: write to register 2
    D_Test <= "00000001010101001101001010011111";
    dr_Test <= "00010";
    wait for clk_period;

-- Test Case 3: write to register 3
    D_Test <= "00000001010101001101001010100000";
    dr_Test <= "00011";
    wait for clk_period;

-- Test Case 4: write to register 4
    D_Test <= "00000001010101001101001010100001";
    dr_Test <= "00100";
    wait for clk_period;

-- Test Case 5: write to register 5
    D_Test <= "00000001010101001101001010100010";
    dr_Test <= "00101";
    wait for clk_period;

-- Test Case 6: write to register 6
    D_Test <= "00000001010101001101001010100011";
    dr_Test <= "00110";
    wait for clk_period;

-- Test Case 7: write to register 7
    D_Test <= "00000001010101001101001010100100";
    dr_Test <= "00111";
    wait for clk_period;

-- Test Case 8: write to register 8
    D_Test <= "00000001010101001101001010100101";
    dr_Test <= "01000";
    wait for clk_period;

-- Test Case 9: write to register 9
    D_Test <= "00000001010101001101001010100110";
    dr_Test <= "01001";
    wait for clk_period;

-- Test Case 10: write to register 10
    D_Test <= "00000001010101001101001010100111";
    dr_Test <= "01010";
    wait for clk_period;

-- Test Case 11: write to register 11
    D_Test <= "00000001010101001101001010101000";
    dr_Test <= "01011";
    wait for clk_period;

-- Test Case 12: write to register 12
    D_Test <= "00000001010101001101001010101001";
    dr_Test <= "01100";
    wait for clk_period;

-- Test Case 13: write to register 13
    D_Test <= "00000001010101001101001010101010";
    dr_Test <= "01101";
    wait for clk_period;

-- Test Case 14: write to register 14
    D_Test <= "00000001010101001101001010101011";
    dr_Test <= "01110";
    wait for clk_period;

-- Test Case 15: write to register 15
    D_Test <= "00000001010101001101001010101100";
    dr_Test <= "01111";
    wait for clk_period;

-- Test Case 16: write to register 16
    D_Test <= "00000001010101001101001010101101";
    dr_Test <= "10000";
    wait for clk_period;

-- Test Case 17: write to register 17
    D_Test <= "00000001010101001101001010101110";
    dr_Test <= "10001";
    wait for clk_period;

-- Test Case 18: write to register 18
    D_Test <= "00000001010101001101001010101111";
    dr_Test <= "10010";
    wait for clk_period;

-- Test Case 19: write to register 19
    D_Test <= "00000001010101001101001010110000";
    dr_Test <= "10011";
    wait for clk_period;

-- Test Case 20: write to register 20
    D_Test <= "00000001010101001101001010110001";
    dr_Test <= "10100";
    wait for clk_period;

-- Test Case 21: write to register 21
    D_Test <= "00000001010101001101001010110010";
    dr_Test <= "10101";
    wait for clk_period;

-- Test Case 22: write to register 22
    D_Test <= "00000001010101001101001010110011";
    dr_Test <= "10110";
    wait for clk_period;

-- Test Case 23: write to register 23
    D_Test <= "00000001010101001101001010110100";
    dr_Test <= "10111";
    wait for clk_period;

-- Test Case 24: write to register 24
    D_Test <= "00000001010101001101001010110101";
    dr_Test <= "11000";
    wait for clk_period;

-- Test Case 25: write to register 25
    D_Test <= "00000001010101001101001010110110";
    dr_Test <= "11001";
    wait for clk_period;

-- Test Case 26: write to register 26
    D_Test <= "00000001010101001101001010110111";
    dr_Test <= "11010";
    wait for clk_period;

-- Test Case 27: write to register 27
    D_Test <= "00000001010101001101001010111000";
    dr_Test <= "11011";
    wait for clk_period;

-- Test Case 28: write to register 28
    D_Test <= "00000001010101001101001010111001";
    dr_Test <= "11100";
    wait for clk_period;

-- Test Case 29: write to register 29
    D_Test <= "00000001010101001101001010111010";
    dr_Test <= "11101";
    wait for clk_period;

-- Test Case 30: write to register 30
    D_Test <= "00000001010101001101001010111011";
    dr_Test <= "11110";
    wait for clk_period;

-- Test Case 31: write to register 31
    D_Test <= "00000001010101001101001010111100";
    dr_Test <= "11111";
    wait for clk_period;

-- Test Case 32: write to register 32
    D_Test <= "00000001010101001101001010111101";
    dr_Test <= "100000";
    wait for clk_period;

-- Test Case 33: write to register 33
    D_Test <= "00000001010101001101001010111110";
    dr_Test <= "100001";
    wait for clk_period;

-- Test Case 34: write to register 34
    D_Test <= "00000001010101001101001010111111";
    dr_Test <= "100010";
    wait for clk_period;

-- Test Case 35: write to register 35
    D_Test <= "00000001010101001101001011000000";
    dr_Test <= "100011";
    wait for clk_period;

-- Test Case 36: write to register 36
    D_Test <= "00000001010101001101001011000001";
    dr_Test <= "100100";
    wait for clk_period;

-- Test Case 37: write to register 37
    D_Test <= "00000001010101001101001011000010";
    dr_Test <= "100101";
    wait for clk_period;

-- Test Case 38: write to register 38
    D_Test <= "00000001010101001101001011000011";
    dr_Test <= "100110";
    wait for clk_period;

-- Test Case 39: write to register 39
    D_Test <= "00000001010101001101001011000100";
    dr_Test <= "100111";
    wait for clk_period;

-- Test Case 40: write to register 40
    D_Test <= "00000001010101001101001011000101";
    dr_Test <= "101000";
    wait for clk_period;

-- Test Case 41: write to register 41
    D_Test <= "00000001010101001101001011000110";
    dr_Test <= "101001";
    wait for clk_period;

-- Test Case 42: write to register 42
    D_Test <= "00000001010101001101001011000111";
    dr_Test <= "101010";
    wait for clk_period;

-- Test Case 43: write to register 43
    D_Test <= "00000001010101001101001011001000";
    dr_Test <= "101011";
    wait for clk_period;

-- Test Case 44: write to register 44
    D_Test <= "00000001010101001101001011001001";
    dr_Test <= "101100";
    wait for clk_period;

-- Test Case 45: write to register 45
    D_Test <= "00000001010101001101001011001010";
    dr_Test <= "101101";
    wait for clk_period;

-- Test Case 46: write to register 46
    D_Test <= "00000001010101001101001011001011";
    dr_Test <= "101110";
    wait for clk_period;

-- Test Case 47: write to register 47
    D_Test <= "00000001010101001101001011001100";
    dr_Test <= "101111";
    wait for clk_period;

        A_B_DataIN_Test <= "00";
-- Test Case 32A: select input from port A, source register 0
    SA_Test <= "00000";
    wait for CLK_period;
-- Test Case 32B: select input from port B, source register 0
    SB_Test <= "00000";
    wait for clk_period;

-- Test Case 33A: select input from port A, source register 1
    SA_Test <= "00001";
    wait for CLK_period;
-- Test Case 33B: select input from port B, source register 1
    SB_Test <= "00001";
    wait for clk_period;

-- Test Case 34A: select input from port A, source register 2
    SA_Test <= "00010";
    wait for CLK_period;
-- Test Case 34B: select input from port B, source register 2
    SB_Test <= "00010";
    wait for clk_period;

-- Test Case 35A: select input from port A, source register 3
    SA_Test <= "00011";
    wait for CLK_period;
-- Test Case 35B: select input from port B, source register 3
    SB_Test <= "00011";
    wait for clk_period;

-- Test Case 36A: select input from port A, source register 4
    SA_Test <= "00100";
    wait for CLK_period;
-- Test Case 36B: select input from port B, source register 4
    SB_Test <= "00100";
    wait for clk_period;

-- Test Case 37A: select input from port A, source register 5
    SA_Test <= "00101";
    wait for CLK_period;
-- Test Case 37B: select input from port B, source register 5
    SB_Test <= "00101";
    wait for clk_period;

-- Test Case 38A: select input from port A, source register 6
    SA_Test <= "00110";
    wait for CLK_period;
-- Test Case 38B: select input from port B, source register 6
    SB_Test <= "00110";
    wait for clk_period;

-- Test Case 39A: select input from port A, source register 7
    SA_Test <= "00111";
    wait for CLK_period;
-- Test Case 39B: select input from port B, source register 7
    SB_Test <= "00111";
    wait for clk_period;

-- Test Case 40A: select input from port A, source register 8
    SA_Test <= "01000";
    wait for CLK_period;
-- Test Case 40B: select input from port B, source register 8
    SB_Test <= "01000";
    wait for clk_period;

-- Test Case 41A: select input from port A, source register 9
    SA_Test <= "01001";
    wait for CLK_period;
-- Test Case 41B: select input from port B, source register 9
    SB_Test <= "01001";
    wait for clk_period;

-- Test Case 42A: select input from port A, source register 10
    SA_Test <= "01010";
    wait for CLK_period;
-- Test Case 42B: select input from port B, source register 10
    SB_Test <= "01010";
    wait for clk_period;

-- Test Case 43A: select input from port A, source register 11
    SA_Test <= "01011";
    wait for CLK_period;
-- Test Case 43B: select input from port B, source register 11
    SB_Test <= "01011";
    wait for clk_period;

-- Test Case 44A: select input from port A, source register 12
    SA_Test <= "01100";
    wait for CLK_period;
-- Test Case 44B: select input from port B, source register 12
    SB_Test <= "01100";
    wait for clk_period;

-- Test Case 45A: select input from port A, source register 13
    SA_Test <= "01101";
    wait for CLK_period;
-- Test Case 45B: select input from port B, source register 13
    SB_Test <= "01101";
    wait for clk_period;

-- Test Case 46A: select input from port A, source register 14
    SA_Test <= "01110";
    wait for CLK_period;
-- Test Case 46B: select input from port B, source register 14
    SB_Test <= "01110";
    wait for clk_period;

-- Test Case 47A: select input from port A, source register 15
    SA_Test <= "01111";
    wait for CLK_period;
-- Test Case 47B: select input from port B, source register 15
    SB_Test <= "01111";
    wait for clk_period;

-- Test Case 48A: select input from port A, source register 16
    SA_Test <= "10000";
    wait for CLK_period;
-- Test Case 48B: select input from port B, source register 16
    SB_Test <= "10000";
    wait for clk_period;

-- Test Case 49A: select input from port A, source register 17
    SA_Test <= "10001";
    wait for CLK_period;
-- Test Case 49B: select input from port B, source register 17
    SB_Test <= "10001";
    wait for clk_period;

-- Test Case 50A: select input from port A, source register 18
    SA_Test <= "10010";
    wait for CLK_period;
-- Test Case 50B: select input from port B, source register 18
    SB_Test <= "10010";
    wait for clk_period;

-- Test Case 51A: select input from port A, source register 19
    SA_Test <= "10011";
    wait for CLK_period;
-- Test Case 51B: select input from port B, source register 19
    SB_Test <= "10011";
    wait for clk_period;

-- Test Case 52A: select input from port A, source register 20
    SA_Test <= "10100";
    wait for CLK_period;
-- Test Case 52B: select input from port B, source register 20
    SB_Test <= "10100";
    wait for clk_period;

-- Test Case 53A: select input from port A, source register 21
    SA_Test <= "10101";
    wait for CLK_period;
-- Test Case 53B: select input from port B, source register 21
    SB_Test <= "10101";
    wait for clk_period;

-- Test Case 54A: select input from port A, source register 22
    SA_Test <= "10110";
    wait for CLK_period;
-- Test Case 54B: select input from port B, source register 22
    SB_Test <= "10110";
    wait for clk_period;

-- Test Case 55A: select input from port A, source register 23
    SA_Test <= "10111";
    wait for CLK_period;
-- Test Case 55B: select input from port B, source register 23
    SB_Test <= "10111";
    wait for clk_period;

-- Test Case 56A: select input from port A, source register 24
    SA_Test <= "11000";
    wait for CLK_period;
-- Test Case 56B: select input from port B, source register 24
    SB_Test <= "11000";
    wait for clk_period;

-- Test Case 57A: select input from port A, source register 25
    SA_Test <= "11001";
    wait for CLK_period;
-- Test Case 57B: select input from port B, source register 25
    SB_Test <= "11001";
    wait for clk_period;

-- Test Case 58A: select input from port A, source register 26
    SA_Test <= "11010";
    wait for CLK_period;
-- Test Case 58B: select input from port B, source register 26
    SB_Test <= "11010";
    wait for clk_period;

-- Test Case 59A: select input from port A, source register 27
    SA_Test <= "11011";
    wait for CLK_period;
-- Test Case 59B: select input from port B, source register 27
    SB_Test <= "11011";
    wait for clk_period;

-- Test Case 60A: select input from port A, source register 28
    SA_Test <= "11100";
    wait for CLK_period;
-- Test Case 60B: select input from port B, source register 28
    SB_Test <= "11100";
    wait for clk_period;

-- Test Case 61A: select input from port A, source register 29
    SA_Test <= "11101";
    wait for CLK_period;
-- Test Case 61B: select input from port B, source register 29
    SB_Test <= "11101";
    wait for clk_period;

-- Test Case 62A: select input from port A, source register 30
    SA_Test <= "11110";
    wait for CLK_period;
-- Test Case 62B: select input from port B, source register 30
    SB_Test <= "11110";
    wait for clk_period;

-- Test Case 63A: select input from port A, source register 31
    SA_Test <= "11111";
    wait for CLK_period;
-- Test Case 63B: select input from port B, source register 31
    SB_Test <= "11111";
    wait for clk_period;

        -- Test completed
        wait;
    end process;

END ;
