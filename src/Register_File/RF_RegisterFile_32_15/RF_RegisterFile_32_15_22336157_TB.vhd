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
        -- Test Case 1: register 0
        Reset_TB <= '0';
        wait for clk_period; 
        RW_TB <= '0';  -- Enable write
        dr_TB <= "00000"; 
        td_TB <= "0000";       
        D_TB <= x"00000001"; 
        wait for clk_period;
        RW_TB  <= '1';
        wait;
    end process;

END simulation;
