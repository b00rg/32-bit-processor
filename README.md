# 32-bit-processor
Simulating a 32-bit processor using VHDL, implemented at a gate level. 

This repository contains:
1. The vhdl simulation code (FILENAME.vhd)
2. The test bench code (FILENAME_TB.VHD)
3. The test documentation, which specifies how the code was testbenched (FILENAME_DOC.pdf)
4. The schematic generated using Vivado (FILENAME_Schematic.pdf)
5. The simulation waveform testbench with labelled cases as coded in the test bench (FILENAME_TD0X.png)
6. The propagation delay as per the simulation waveform testbench (FILENAME_TD0X.png).

The project is separated into four different folders:
1. The Register File, which includes all the components required to simulate the Register File (Register_File/RF_FILENAME)
2. The Functional Unit, which includes all the components required to simulate the Functional Unit (Functional_Unit/DP_FILENAME)
3. The Datapath, which includes all the components required to simulate the Datapath, combining the Register File and Functional Unit (Datapath/DP_FILENAME)
4. The Processor, which includes all the components necessary to simulate the 32 Bit Processor, including the Datapath (Processor/FILENAME)

The schematic of the final processor is as follows:

![32-bit-processor-diagram](https://github.com/user-attachments/assets/e3cb8e46-d9f1-41f0-bfda-30bf2fb6eb07)
