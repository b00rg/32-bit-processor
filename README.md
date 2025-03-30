# 32-bit-processor
This project simulates a 32-bit processor using VHDL, implemented at the gate level. The goal is to provide a comprehensive simulation environment for understanding and testing a 32-bit processor's functionality.

### Repository Contents:
1. VHDL Simulation Code: The main VHDL code for simulating the processor (FILENAME.vhd).
2. Testbench Code: VHDL code used to validate the processor's functionality (FILENAME_TB.vhd).

3. Test Documentation: Detailed documentation outlining how the testbench was structured and executed (FILENAME_DOC.pdf).

4. Generated Schematic: The schematic of the processor generated using Vivado (FILENAME_Schematic.pdf).

5. Simulation Waveform: A waveform generated from the testbench, labeled with various test cases (FILENAME_TD0X.png).

6. Propagation Delay Information: A detailed waveform showing the propagation delay from the simulation (FILENAME_TD0X.png).

### Project Structure
The project is organized into four primary folders, each containing the components necessary for simulating specific parts of the processor:
1. Register File: Contains components required to simulate the Register File (Register_File/RF_FILENAME).
2. Functional Unit: Includes components necessary for simulating the Functional Unit (Functional_Unit/DP_FILENAME).
3. Datapath: Contains the components that combine the Register File and Functional Unit to simulate the full Datapath (Datapath/DP_FILENAME).
4. Processor: Integrates the Datapath, Register File, and Functional Unit to simulate the complete 32-bit processor (Processor/CPU_FILENAME).

---

The schematic of the final processor is as follows:

![32-bit-processor-diagram](https://github.com/user-attachments/assets/e3cb8e46-d9f1-41f0-bfda-30bf2fb6eb07)
