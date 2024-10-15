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
    signal CLK : std_logic := '0';
    signal RW : std_logic := '0';                     -- Read/Write signal
    signal Reset : std_logic := '0';                  -- Reset signal
    signal DR : std_logic_vector(4 downto 0) := (others => '0'); -- 5-bit destination register address
    signal D : std_logic_vector(31 downto 0) := (others => '0'); -- 32-bit data input
    signal sa, sb : std_logic_vector(4 downto 0) := (others => '0'); 
    signal ta, td, tb : std_logic_vector(3 downto 0) := (others => '0'); 
    signal a, b : std_logic_vector(31 downto 0) := (others => '0');  -- Selection/control inputs

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
        reset <= '1';
        wait for clk_period*2; 
        -- Test Case 1: register 0
        Reset <= '0';
        wait for clk_period*2; 
        RW <= '0';  -- Enable write
        dr <= "00000"; 
        td <= "0000";       
        D <= "00000000000000000000000000000010";  -- Write 1 to register 0
        wait for clk_period;
        
        RW <= '1';
        wait for clk_period*2; 
        dr <= "00000"; 
        D <= "00000000000000000000000000000001";
        wait for clk_period;

        wait;
    end process;

END simulation;
