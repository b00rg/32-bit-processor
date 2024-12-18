----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Emma Burgess
-- 
-- Create Date: 17.12.2024 16:20:03
-- Design Name: 
-- Module Name: CPU_CAR_22336157 - Behavioral
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

entity CPU_CAR_22336157 is
    Port (Address : in  std_logic_vector(16 downto 0);
          Clock : in std_logic;
          Reset : in std_logic;
          LoadAdd : in std_logic;
          CMAdd : out std_logic_vector (16 downto 0)
         );
end CPU_CAR_22336157;

architecture Behavioral of CPU_CAR_22336157 is

component CPU_JKFlipFlop_22336157 is
    Port (K : in std_logic;
          J : in std_logic;
          Clock : in std_logic;
          Reset : in std_logic;
          Q : out std_logic;
          Q_not : out std_logic );
end component;

signal K00,J00,K01,J01,K02,J02,K03,J03,K04,J04,K05,J05,K06,J06,K07,J07,K08,J08,K09,J09,K10,J10,K11,J11,K12,J12,K13,J13,K14,J14,K15,J15,K16,J16 : std_logic;
signal QSum0,QSum1,QSum2,QSum3,QSum4,QSum5,QSum6,QSum7,QSum8,QSum9,QSum10,QSum11,QSum12,QSum13,QSum14,QSum15,QSum16 : std_logic; 
signal CMAdd_T, Not_Address, Not_Address_Reset, Address_Reset : std_logic_vector (16 downto 0); 
signal Q_Sum_Toggle16,QSum_Toggle1,QSum_Toggle2,QSum_Toggle3,QSum_Toggle4,QSum_Toggle5,QSum_Toggle6,QSum_Toggle7,QSum_Toggle8,QSum_Toggle9,QSum_Toggle10,QSum_Toggle11,QSum_Toggle12,QSum_Toggle13,QSum_Toggle14,QSum_Toggle15,QSum_Toggle16 : std_logic; 
signal Toggle, Load : std_logic;


   constant AND_gate_delay : Time := 8ns;      -- least significant digit 6 = 5 + 1
   constant NAND_gate_delay : Time := 6ns;     -- next more significant digit 3 = 2 + 1
   constant OR_gate_delay : Time := 2ns;       -- next more significant digit 8 = 7 + 1
   constant NOR_gate_delay : Time := 7ns;      -- next more significant digit 6 = 5 + 1
   constant XOR_gate_delay : Time := 4ns;      -- next more significant digit 4 = 3 + 1
   constant XNOR_gate_delay : Time := 4ns;     -- next more significant digit 4 = 3 + 1
   constant NOT_gate_delay : Time := 3ns;      -- next more significant digit 7 = 6 + 1
begin


JKFLipFlop00 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J00,
                K => K00,
                Reset => Reset,
                Q => CMAdd_T(0)
                
            );
JKFLipFlop01 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J01,
                K => K01,
                Reset => Reset,
                Q => CMAdd_T(1)
           
            );
JKFLipFlop02 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J02,
                K => K02,
                Reset => Reset,
                Q => CMAdd_T(2)
               
            );
JKFLipFlop03 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J03,
                K => K03,
                Reset => Reset,
                Q => CMAdd_T(3)
           
            );
JKFLipFlop04 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J04,
                K => K04,
                Reset => Reset,
                Q => CMAdd_T(4)
           
            );
JKFLipFlop05 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J05,
                K => K05,
                Reset => Reset,
                Q => CMAdd_T(5)
           
            );
JKFLipFlop06 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J06,
                K => K06,
                Reset => Reset,
                Q => CMAdd_T(6)
             
            );
JKFLipFlop07 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J07,
                K => K07,
                Reset => Reset,
                Q => CMAdd_T(7)
              
            );
JKFLipFlop08 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J08,
                K => K08,
                Reset => Reset,
                Q => CMAdd_T(8)
              
            );
JKFLipFlop09 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J09,
                K => K09,
                Reset => Reset,
                Q => CMAdd_T(9)
               
            );
JKFLipFlop10 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J10,
                K => K10,
                Reset => Reset,
                Q => CMAdd_T(10)
               
            );
JKFLipFlop11 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J11,
                K => K11,
                Reset => Reset,
                Q => CMAdd_T(11)
          
            );
JKFLipFlop12 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J12,
                K => K12,
                Reset => Reset,
                Q => CMAdd_T(12)
  
            );
JKFLipFlop13 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J13,
                K => K13,
                Reset => Reset,
                Q => CMAdd_T(13)
           
            );
JKFLipFlop14 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J14,
                K => K14,
                Reset => Reset,
                Q => CMAdd_T(14)
               
            );
JKFLipFlop15 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J15,
                K => K15,
                Reset => Reset,
                Q => CMAdd_T(15)
            
            );
JKFLipFlop16 : CPU_JKFlipFlop_22336157 Port Map
            (   Clock => Clock,
                J => J16,
                K => K16,
                Reset => Reset,
                Q => CMAdd_T(16)
            );

CMADD <= CMAdd_T;

QSum0 <= CMAdd_t(0) and CMAdd_t(1) after AND_gate_delay;
QSum1 <= QSum0 and CMAdd_t(2) after AND_gate_delay;
QSum2 <= QSum1 and CMAdd_t(3) after AND_gate_delay;
QSum3 <= QSum2 and CMAdd_t(4) after AND_gate_delay;
QSum4 <= QSum3 and CMAdd_t(5) after AND_gate_delay;
QSum5 <= QSum4 and CMAdd_t(6) after AND_gate_delay;
QSum6 <= QSum5 and CMAdd_t(7) after AND_gate_delay;
QSum7 <= QSum6 and CMAdd_t(8) after AND_gate_delay;
QSum8 <= QSum7 and CMAdd_t(9) after AND_gate_delay;
QSum9 <= QSum8 and CMAdd_t(10) after AND_gate_delay;
QSum10 <= QSum9 and CMAdd_t(11) after AND_gate_delay;
QSum11 <= QSum10 and CMAdd_t(12) after AND_gate_delay;
QSum12 <= QSum11 and CMAdd_t(13) after AND_gate_delay;
QSum13 <= QSum12 and CMAdd_t(14) after AND_gate_delay;
QSum14 <= QSum13 and CMAdd_t(15) after AND_gate_delay;
QSum15 <= QSum14 and CMAdd_t(16) after AND_gate_delay;

Toggle <= not LoadAdd after NOT_gate_delay;
Load <= not Toggle after NOT_gate_delay;

QSum_Toggle1 <= Toggle and CMAdd_t(0) after AND_gate_delay;
QSum_Toggle2 <= Toggle and QSum0 after AND_gate_delay;
QSum_Toggle3 <= Toggle and QSum1 after AND_gate_delay;
QSum_Toggle4 <= Toggle and QSum2 after AND_gate_delay;
QSum_Toggle5 <= Toggle and QSum3 after AND_gate_delay;
QSum_Toggle6 <= Toggle and QSum4 after AND_gate_delay;
QSum_Toggle7 <= Toggle and QSum5 after AND_gate_delay;
QSum_Toggle8 <= Toggle and QSum6 after AND_gate_delay;
QSum_Toggle9 <= Toggle and QSum7 after AND_gate_delay;
QSum_Toggle10 <= Toggle and QSum8 after AND_gate_delay;
QSum_Toggle11 <= Toggle and QSum9 after AND_gate_delay;
QSum_Toggle12 <= Toggle and QSum10 after AND_gate_delay;
QSum_Toggle13 <= Toggle and QSum11 after AND_gate_delay;
QSum_Toggle14 <= Toggle and QSum12 after AND_gate_delay;
QSum_Toggle15 <= Toggle and QSum13 after AND_gate_delay;
QSum_Toggle16 <= Toggle and QSum14 after AND_gate_delay;

Not_Address(0) <= not Address(0) after NOT_gate_delay;
Not_Address(1) <= not Address(1) after NOT_gate_delay;
Not_Address(2) <= not Address(2) after NOT_gate_delay;
Not_Address(3) <= not Address(3) after NOT_gate_delay;
Not_Address(4) <= not Address(4) after NOT_gate_delay;
Not_Address(5) <= not Address(5) after NOT_gate_delay;
Not_Address(6) <= not Address(6) after NOT_gate_delay;
Not_Address(7) <= not Address(7) after NOT_gate_delay;
Not_Address(8) <= not Address(8) after NOT_gate_delay;
Not_Address(9) <= not Address(9) after NOT_gate_delay;
Not_Address(10) <= not Address(10) after NOT_gate_delay;
Not_Address(11) <= not Address(11) after NOT_gate_delay;
Not_Address(12) <= not Address(12) after NOT_gate_delay;
Not_Address(13) <= not Address(13) after NOT_gate_delay;
Not_Address(14) <= not Address(14) after NOT_gate_delay;
Not_Address(15) <= not Address(15) after NOT_gate_delay;
Not_Address(16) <= not Address(16) after NOT_gate_delay;

Not_Address_Reset(0) <= Not_Address(0) and Load after AND_gate_delay;
Not_Address_Reset(1) <= Not_Address(1) and Load after AND_gate_delay;
Not_Address_Reset(2) <= Not_Address(2) and Load after AND_gate_delay;
Not_Address_Reset(3) <= Not_Address(3) and Load after AND_gate_delay;
Not_Address_Reset(4) <= Not_Address(4) and Load after AND_gate_delay;
Not_Address_Reset(5) <= Not_Address(5) and Load after AND_gate_delay;
Not_Address_Reset(6) <= Not_Address(6) and Load after AND_gate_delay;
Not_Address_Reset(7) <= Not_Address(7) and Load after AND_gate_delay;
Not_Address_Reset(8) <= Not_Address(8) and Load after AND_gate_delay;
Not_Address_Reset(9) <= Not_Address(9) and Load after AND_gate_delay;
Not_Address_Reset(10) <= Not_Address(10) and Load after AND_gate_delay;
Not_Address_Reset(11) <= Not_Address(11) and Load after AND_gate_delay;
Not_Address_Reset(12) <= Not_Address(12) and Load after AND_gate_delay;
Not_Address_Reset(13) <= Not_Address(13) and Load after AND_gate_delay;
Not_Address_Reset(14) <= Not_Address(14) and Load after AND_gate_delay;
Not_Address_Reset(15) <= Not_Address(15) and Load after AND_gate_delay;
Not_Address_Reset(16) <= Not_Address(16) and Load after AND_gate_delay;

Address_Reset(0) <= Address(0) and Load after AND_gate_delay;
Address_Reset(1) <= Address(1) and Load after AND_gate_delay;
Address_Reset(2) <= Address(2) and Load after AND_gate_delay;
Address_Reset(3) <= Address(3) and Load after AND_gate_delay;
Address_Reset(4) <= Address(4) and Load after AND_gate_delay;
Address_Reset(5) <= Address(5) and Load after AND_gate_delay;
Address_Reset(6) <= Address(6) and Load after AND_gate_delay;
Address_Reset(7) <= Address(7) and Load after AND_gate_delay;
Address_Reset(8) <= Address(8) and Load after AND_gate_delay;
Address_Reset(9) <= Address(9) and Load after AND_gate_delay;
Address_Reset(10) <= Address(10) and Load after AND_gate_delay;
Address_Reset(11) <= Address(11) and Load after AND_gate_delay;
Address_Reset(12) <= Address(12) and Load after AND_gate_delay;
Address_Reset(13) <= Address(13) and Load after AND_gate_delay;
Address_Reset(14) <= Address(14) and Load after AND_gate_delay;
Address_Reset(15) <= Address(15) and Load after AND_gate_delay;
Address_Reset(16) <= Address(16) and Load after AND_gate_delay;

J00 <= Address_Reset(0) or Toggle after OR_gate_delay;
J01 <= Address_Reset(1) or QSum_Toggle1 after OR_gate_delay;
J02 <= Address_Reset(2) or QSum_Toggle2 after OR_gate_delay;
J03 <= Address_Reset(3) or QSum_Toggle3 after OR_gate_delay;
J04 <= Address_Reset(4) or QSum_Toggle4 after OR_gate_delay;
J05 <= Address_Reset(5) or QSum_Toggle5 after OR_gate_delay;
J06 <= Address_Reset(6) or QSum_Toggle6 after OR_gate_delay;
J07 <= Address_Reset(7) or QSum_Toggle7 after OR_gate_delay;
J08 <= Address_Reset(8) or QSum_Toggle8 after OR_gate_delay;
J09 <= Address_Reset(9) or QSum_Toggle9 after OR_gate_delay;
J10 <= Address_Reset(10) or QSum_Toggle10 after OR_gate_delay;
J11 <= Address_Reset(11) or QSum_Toggle11 after OR_gate_delay;
J12 <= Address_Reset(12) or QSum_Toggle12 after OR_gate_delay;
J13 <= Address_Reset(13) or QSum_Toggle13 after OR_gate_delay;
J14 <= Address_Reset(14) or QSum_Toggle14 after OR_gate_delay;
J15 <= Address_Reset(15) or QSum_Toggle15 after OR_gate_delay;
J16 <= Address_Reset(16) or QSum_Toggle16 after OR_gate_delay;

K00 <= Not_Address_Reset(0) or Toggle after OR_gate_delay;
K01 <= Not_Address_Reset(1) or QSum_Toggle1 after OR_gate_delay;
K02 <= Not_Address_Reset(2) or QSum_Toggle2 after OR_gate_delay;
K03 <= Not_Address_Reset(3) or QSum_Toggle3 after OR_gate_delay;
K04 <= Not_Address_Reset(4) or QSum_Toggle4 after OR_gate_delay;
K05 <= Not_Address_Reset(5) or QSum_Toggle5 after OR_gate_delay;
K06 <= Not_Address_Reset(6) or QSum_Toggle6 after OR_gate_delay;
K07 <= Not_Address_Reset(7) or QSum_Toggle7 after OR_gate_delay;
K08 <= Not_Address_Reset(8) or QSum_Toggle8 after OR_gate_delay;
K09 <= Not_Address_Reset(9) or QSum_Toggle9 after OR_gate_delay;
K10 <= Not_Address_Reset(10) or QSum_Toggle10 after OR_gate_delay;
K11 <= Not_Address_Reset(11) or QSum_Toggle11 after OR_gate_delay;
K12 <= Not_Address_Reset(12) or QSum_Toggle12 after OR_gate_delay;
K13 <= Not_Address_Reset(13) or QSum_Toggle13 after OR_gate_delay;
K14 <= Not_Address_Reset(14) or QSum_Toggle14 after OR_gate_delay;
K15 <= Not_Address_Reset(15) or QSum_Toggle15 after OR_gate_delay;
K16 <= Not_Address_Reset(16) or QSum_Toggle16 after OR_gate_delay;




end Behavioral;
