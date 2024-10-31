----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2024 13:47:07
-- Design Name: 
-- Module Name: DP_FunctionalUnit_22336157 - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DP_FunctionalUnit_22336157 is
    Port ( B, A : in STD_LOGIC_VECTOR(31 downto 0);
        FS : in STD_LOGIC_VECTOR(4 downto 0);
        C, N, Z, V : out STD_LOGIC; 
        F : out STD_LOGIC_VECTOR(31 downto 0));
end DP_FunctionalUnit_22336157;



architecture Behavioral of DP_FunctionalUnit_22336157 is
    component DP_ArithmeticLogicUnit_22336157 
        Port ( A, B :  in STD_LOGIC_VECTOR(31 downto 0) ; 		
            S0, S1, S2, C_IN : in STD_LOGIC; 			
            G : out STD_LOGIC_VECTOR(31 downto 0);		
        C, V : out STD_LOGIC);
    end component;
    
    component DP_Shifter_22336157                                                                                                       
        Port (B : in STD_LOGIC_VECTOR(31 downto 0);                                                                                       
            S1, S2 : in STD_LOGIC;                                                                                                      
            G : out STD_LOGIC_VECTOR(31 downto 0);                                                                                      
            C : out STD_LOGIC);                                                                                                                              
    end component;    
    
    component CPU_Mux2_32Bit_22336157
    Port ( I0, I1 : in STD_LOGIC_VECTOR(31 downto 0);  -- 32-bit inputs
        S      : in STD_LOGIC;                      -- single select bit
        Y      : out STD_LOGIC_VECTOR(31 downto 0));  -- 32-bit output);
    end component;
    
    component DP_CFlagMux2_1Bit_22336157
      Port (I0 , I1 , S : in STD_LOGIC ;
            Y : out STD_LOGIC );
    end component;
    
    component DP_ZeroDetection_22336157 
    Port (
input_vector : in  STD_LOGIC_VECTOR(31 downto 0);  -- 31-bit input vector
        zero_flag    : out STD_LOGIC      );                       -- 1-bit output flag
    end component;

    signal shifterCOUT, ALUCOUT, ALUVOUT: STD_LOGIC;
    signal shifterGOUT, ALUGOUT, MuxFOUT: STD_LOGIC_VECTOR(31 downto 0); 
begin
    shifter : DP_Shifter_22336157 Port Map(B=>B, S1 => FS(2), S2 => FS(3), C => shifterCOUT, G => shifterGOUT);
    ALU : DP_ArithmeticLogicUnit_22336157 Port Map(A=>A, B=>B, C_IN=>FS(0), S0=>FS(1), S1 => FS(2), S2 => FS(3), C => C, G => G, V=>V);
    MuxF : CPU_Mux2_32Bit_22336157 Port Map(I0 => ALUGOUT, I1 => shifterGOUT, S => FS(4), Y=> MuxFOUT);
    C_Flag : DP_CFlagMux2_1Bit_22336157 Port Map(I0 => ALUCOUT, I1 => shifterCOUT, S => FS(4), Y => C);
    Z_Flag : DP_ZeroDetection_22336157  Port Map(input_vector => MuxFOUT, output_vector => Z); 
    F <= MuxFOUT;
    N <= MuxFOUT(31);
end Behavioral;
