library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CPU_PC_22336157 is
    Port (
      Displacement : in STD_LOGIC_VECTOR(31 downto 0); 
      Clock, Reset, PL, PI : in STD_LOGIC;                     
      InstAdd : out STD_LOGIC_VECTOR(31 downto 0)
    );
end CPU_PC_22336157;

architecture Behavioral of CPU_PC_22336157 is
  constant AND_gate_delay : Time := 8 ns;
  constant OR_gate_delay : Time := 2 ns;

  component CPU_Mux2_32Bit_22336157 is   
    Port (
        I0, I1 : in STD_LOGIC_VECTOR(31 downto 0);  
        S : in STD_LOGIC;                      
        Y : out STD_LOGIC_VECTOR(31 downto 0)  
    );
  end component;

  component DP_RippleCarryAdder32Bit_22336157 is
    Port (
        A, B : in STD_LOGIC_VECTOR(31 downto 0);
        C_IN : in STD_LOGIC; 
        SUM : out STD_LOGIC_VECTOR(31 downto 0);
        C_OUT : out STD_LOGIC; 
        V : out STD_LOGIC
    );
  end component;

  component RF_Register32Bit_22336157 is
    Port (
        D : in STD_LOGIC_VECTOR(31 downto 0);
        Load : in STD_LOGIC;
        CLK : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(31 downto 0)
    );
  end component;

  signal PL_PI_Mux_Out, AdderToInstAdd, AdderToResetMux, ResetMuxToPC : STD_LOGIC_VECTOR(31 downto 0);
  signal PCLoad0, PCLoad : STD_LOGIC;

begin
  PL_PI_Mux : CPU_Mux2_32Bit_22336157 Port map(
    I0 => Displacement, 
    I1 => x"00000001", 
    S => PI, 
    Y => PL_PI_Mux_Out
  );

  Adder : DP_RippleCarryAdder32Bit_22336157 Port map(
    A => AdderToInstAdd, 
    B => PL_PI_Mux_Out, 
    C_IN => '0', 
    SUM => AdderToResetMux, 
    C_OUT => open, 
    V => open
  ); 

  ResetMux : CPU_Mux2_32Bit_22336157 Port map(
    I0 => AdderToResetMux, 
    I1 => (others => '0'),  -- Default reset to zero
    S => Reset, 
    Y => ResetMuxToPC
  );

  PCLoad0 <= Reset or PL after OR_gate_delay;
  PCLoad <= PCLoad0 or PI after OR_gate_delay;

  PC : RF_Register32Bit_22336157 Port map(
    CLK => Clock, 
    D => ResetMuxToPC, 
    Load => PCLoad, 
    Reset => Reset, 
    Q => AdderToInstAdd
  );

  InstAdd <= AdderToInstAdd;

end Behavioral;
