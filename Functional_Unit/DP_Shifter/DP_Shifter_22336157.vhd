----------------------------------------------------------------------------------                                                  
-- Company:                                                                                                                         
-- Engineer: Emma Burgess                                                                                                           
--                                                                                                                                  
-- Create Date: 06.10.2022 22:19:50                                                                                                 
-- Design Name:                                                                                                                     
-- Module Name: DP_Shifter_22336157 - Behavioral                                                                                    
-- Project Name:                                                                                                                    
-- Target Devices:                                                                                                                  
-- Tool Versions:                                                                                                                   
-- Description:                                                                                                                     
-- This module performs a bypass, logical right shift, or logical left shift on                                                     
-- input B, based on the selection signals S1 and S2.                                                                               
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
                                                                                                                                    
entity DP_Shifter_22336157 is                                                                                                       
    Port (                                                                                                                          
        B : in STD_LOGIC_VECTOR(31 downto 0);                                                                                       
        S1, S2 : in STD_LOGIC;                                                                                                      
        G : out STD_LOGIC_VECTOR(31 downto 0);                                                                                      
        C : out STD_LOGIC                                                                                                           
    );                                                                                                                              
end DP_Shifter_22336157;                                                                                                            
                                                                                                                                    
architecture Behavioral of DP_Shifter_22336157 is                                                                                   
    component DP_Mux3_1Bit                                                                                                          
        Port (                                                                                                                      
            B, SLB, SRB : in STD_LOGIC;     -- 1 bit inputs                                                                         
            S0, S1 : in STD_LOGIC;         -- Selection Signals                                                                     
            Y : out STD_LOGIC              -- 1 bit output                                                                          
        );                                                                                                                          
    end component;                                                                                                                  
                                                                                                                                    
    component DP_ShifterCFlagMux2_1Bit_22336157                                                                                     
    Port (MSB, LSB, S1, S2  : in STD_LOGIC ;                                                                                        
  C : out STD_LOGIC );                                                                                                              
  end component;                                                                                                                    
                                                                                                                                    
      component DP_Mux3_1Bit_22336157                                                                                               
    port (B, SLB, SRB, S1, S2 : in STD_LOGIC;                                                                                       
        Y : out STD_LOGIC);                                                                                                         
    end component;                                                                                                                  
                                                                                                                                    
                                                                                                                                    
    -- Propagation Delay according to Student ID                                                                                    
    constant AND_gate_delay : Time := 6 ns;                                                                                         
    constant NAND_gate_delay : Time := 3 ns;                                                                                        
    constant OR_gate_delay : Time := 8 ns;                                                                                          
    constant NOR_gate_delay : Time := 6 ns;                                                                                         
    constant XOR_gate_delay : Time := 4 ns;                                                                                         
    constant XNOR_gate_delay : Time := 4 ns;                                                                                        
    constant NOT_gate_delay : Time := 7 ns;                                                                                         
                                                                                                                                    
                                                                                                                                    
begin                                                                                                                               
    -- Implement the logic for G based on S1 and S2                                                                                 
    BIT0: DP_Mux3_1Bit PORT MAP (B=> B(0), SLB => B(1), SRB => '0', S0 => S1, S1 => S2, Y => G(0));                                 
    BIT1: DP_Mux3_1Bit PORT MAP (B=> B(1), SLB => B(2), SRB => B(0), S0 => S1, S1 => S2, Y => G(1));                                
    BIT2: DP_Mux3_1Bit PORT MAP (B=> B(2), SLB => B(3), SRB => B(1), S0 => S1, S1 => S2, Y => G(2));                                
    BIT3: DP_Mux3_1Bit PORT MAP (B=> B(3), SLB => B(4), SRB => B(2), S0 => S1, S1 => S2, Y => G(3));                                
    BIT4: DP_Mux3_1Bit PORT MAP (B=> B(4), SLB => B(5), SRB => B(3), S0 => S1, S1 => S2, Y => G(4));                                
    BIT5: DP_Mux3_1Bit PORT MAP (B=> B(5), SLB => B(6), SRB => B(4), S0 => S1, S1 => S2, Y => G(5));                                
    BIT6: DP_Mux3_1Bit PORT MAP (B=> B(6), SLB => B(7), SRB => B(5), S0 => S1, S1 => S2, Y => G(6));                                
    BIT7: DP_Mux3_1Bit PORT MAP (B=> B(7), SLB => B(8), SRB => B(6), S0 => S1, S1 => S2, Y => G(7));                                
    BIT8: DP_Mux3_1Bit PORT MAP (B=> B(8), SLB => B(9), SRB => B(7), S0 => S1, S1 => S2, Y => G(8));                                
    BIT9: DP_Mux3_1Bit PORT MAP (B=> B(9), SLB => B(10), SRB => B(8), S0 => S1, S1 => S2, Y => G(9));                               
    BIT10: DP_Mux3_1Bit PORT MAP (B=> B(10), SLB => B(11), SRB => B(9), S0 => S1, S1 => S2, Y => G(10));                            
    BIT11: DP_Mux3_1Bit PORT MAP (B=> B(11), SLB => B(12), SRB => B(10), S0 => S1, S1 => S2, Y => G(11));                           
    BIT12: DP_Mux3_1Bit PORT MAP (B=> B(12), SLB => B(13), SRB => B(11), S0 => S1, S1 => S2, Y => G(12));                           
    BIT13: DP_Mux3_1Bit PORT MAP (B=> B(13), SLB => B(14), SRB => B(12), S0 => S1, S1 => S2, Y => G(13));                           
    BIT14: DP_Mux3_1Bit PORT MAP (B=> B(14), SLB => B(15), SRB => B(13), S0 => S1, S1 => S2, Y => G(14));                           
    BIT15: DP_Mux3_1Bit PORT MAP (B=> B(15), SLB => B(16), SRB => B(14), S0 => S1, S1 => S2, Y => G(15));                           
    BIT16: DP_Mux3_1Bit PORT MAP (B=> B(16), SLB => B(17), SRB => B(15), S0 => S1, S1 => S2, Y => G(16));                           
    BIT17: DP_Mux3_1Bit PORT MAP (B=> B(17), SLB => B(18), SRB => B(16), S0 => S1, S1 => S2, Y => G(17));                           
    BIT18: DP_Mux3_1Bit PORT MAP (B=> B(18), SLB => B(19), SRB => B(17), S0 => S1, S1 => S2, Y => G(18));                           
    BIT19: DP_Mux3_1Bit PORT MAP (B=> B(19), SLB => B(20), SRB => B(18), S0 => S1, S1 => S2, Y => G(19));                           
    BIT20: DP_Mux3_1Bit PORT MAP (B=> B(20), SLB => B(21), SRB => B(19), S0 => S1, S1 => S2, Y => G(20));                           
    BIT21: DP_Mux3_1Bit PORT MAP (B=> B(21), SLB => B(22), SRB => B(20), S0 => S1, S1 => S2, Y => G(21));                           
    BIT22: DP_Mux3_1Bit PORT MAP (B=> B(22), SLB => B(23), SRB => B(21), S0 => S1, S1 => S2, Y => G(22));                           
    BIT23: DP_Mux3_1Bit PORT MAP (B=> B(23), SLB => B(24), SRB => B(22), S0 => S1, S1 => S2, Y => G(23));                           
    BIT24: DP_Mux3_1Bit PORT MAP (B=> B(24), SLB => B(25), SRB => B(23), S0 => S1, S1 => S2, Y => G(24));                           
    BIT25: DP_Mux3_1Bit PORT MAP (B=> B(25), SLB => B(26), SRB => B(24), S0 => S1, S1 => S2, Y => G(25));                           
    BIT26: DP_Mux3_1Bit PORT MAP (B=> B(26), SLB => B(27), SRB => B(25), S0 => S1, S1 => S2, Y => G(26));                           
    BIT27: DP_Mux3_1Bit PORT MAP (B=> B(27), SLB => B(28), SRB => B(26), S0 => S1, S1 => S2, Y => G(27));                           
    BIT28: DP_Mux3_1Bit PORT MAP (B=> B(28), SLB => B(29), SRB => B(27), S0 => S1, S1 => S2, Y => G(28));                           
    BIT29: DP_Mux3_1Bit PORT MAP (B=> B(29), SLB => B(30), SRB => B(28), S0 => S1, S1 => S2, Y => G(29));                           
    BIT30: DP_Mux3_1Bit PORT MAP (B=> B(30), SLB => B(31), SRB => B(29), S0 => S1, S1 => S2, Y => G(30));                           
    BIT31: DP_Mux3_1Bit PORT MAP (B=> B(31), SLB => '0', SRB => B(30), S0 => S1, S1 => S2, Y => G(31));                             
                                                                                                                                    
    CFlagMux :  DP_ShifterCFlagMux2_1Bit_22336157 PORT MAP (                                                                        
        LSB => B(0),          -- Input from LSB                                                                                     
        MSB => B(31),         -- Input from MSB                                                                                     
        S1 => S1,             -- Selection signal                                                                                   
        S2 => S2,                                                                                                                   
        C => C                -- Carry output                                                                                       
    );                         -- No shift, carry is zero                                                                           
                                                                                                                                    
end Behavioral;                                                                                                                     
