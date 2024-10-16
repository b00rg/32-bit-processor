----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.10.2024 11:56:43
-- Design Name: 
-- Module Name: RF_Test_RegisterFile_32_15_22336157_TB - Simulation
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

ENTITY RF_Testbench_RegisterFile_32_15_22336157 IS
END RF_Testbench_RegisterFile_32_15_22336157;

ARCHITECTURE behavior OF RF_Testbench_RegisterFile_32_15_22336157 IS 

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
    constant CLK_period : time := 10 ns;

BEGIN

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
        
        -- Write StudentID to Register 0
        D_Test <= StudentID;
        DR_Test <= "00000"; -- Register 0
        RW_Test <= '1'; -- Write enable
        wait for CLK_period;

        -- Write StudentID + 1 to Register 1
        D_Test <= StudentID + 1;
        DR_Test <= "00001"; -- Register 1
        wait for CLK_period;

        -- Write StudentID + 2 to Register 2
        D_Test <= StudentID + 2;
        DR_Test <= "00010"; -- Register 2
        wait for CLK_period;

        -- Write StudentID + 3 to Register 3
        D_Test <= StudentID + 3;
        DR_Test <= "00011"; -- Register 3
        wait for CLK_period;

        -- Continue for other registers if needed ...

        -- Read back from the registers and confirm values
        RW_Test <= '0'; -- Disable write, enable read
        
        -- Read Register 0
        SA_Test <= "00000";
        wait for CLK_period;

        -- Read Register 1
        SA_Test <= "00001";
        wait for CLK_period;

        -- Read Register 2
        SA_Test <= "00010";
        wait for CLK_period;

        -- Read Register 3
        SA_Test <= "00011";
        wait for CLK_period;

        -- Perform register transfers on Port A and Port B
        -- Example of Port A operations
        A_B_DataIN_Test <= "00"; -- Select input from port A
        SA_Test <= "00000"; -- Source register 0
        wait for CLK_period;
        
        SA_Test <= "00001"; -- Source register 1
        wait for CLK_period;
        
        SA_Test <= "00010"; -- Source register 2
        wait for CLK_period;

        -- Example of Port B operations
        SB_Test <= "00011"; -- Source register 3
        wait for CLK_period;

        SB_Test <= "00010"; -- Source register 2
        wait for CLK_period;

        -- Test completed
        wait;
    end process;

END;
