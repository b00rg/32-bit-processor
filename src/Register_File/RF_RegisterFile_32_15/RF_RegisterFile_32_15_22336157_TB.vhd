module tb_top_module;
    // Inputs
    reg [4:0] DR;        // Destination register (5-bit)
    reg [3:0] TD;        // Temporary destination (4-bit)
    reg [4:0] SA;        // Source register A (5-bit)
    reg [4:0] SB;        // Source register B (5-bit)
    reg [3:0] TA;        // Temporary source A (4-bit)
    reg [3:0] TB;        // Temporary source B (4-bit)
    reg RW;              // Read/Write signal
    reg CLK;             // Clock signal
    reg reset;           // Reset signal
    reg [31:0] D;        // Data input (32-bit)

    // Outputs
    wire [31:0] A;       // Output A from Mux16_A
    wire [31:0] B;       // Output B from Mux16_B

    // Internal signals (can add more as necessary for module interconnections)

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;  // Toggle clock every 5 time units
    end

    // Instantiate top-level module
    top_module uut (
        .DR(DR), .TD(TD), .SA(SA), .SB(SB), .TA(TA), .TB(TB), 
        .RW(RW), .CLK(CLK), .reset(reset), .D(D), .A(A), .B(B)
    );

    // Testbench stimulus
    initial begin
        // Initialize inputs
        DR = 5'b00000;
        TD = 4'b0000;
        SA = 5'b00000;
        SB = 5'b00000;
        TA = 4'b0000;
        TB = 4'b0000;
        RW = 0;          // Initially in Read mode
        reset = 1;       // Assert reset
        D = 32'h00000000; // Clear data input

        // Wait for a few clock cycles
        #10 reset = 0;   // Deassert reset

        // Test 1: Write to register 0
        RW = 1;          // Enable Write mode
        DR = 5'b00001;   // Destination register 1
        TD = 4'b0001;    // Temporary register 1
        D = 32'hDEADBEEF; // Data to write
        #10;

        // Test 2: Read from register 1
        RW = 0;          // Set to Read mode
        SA = 5'b00001;   // Source register A = 1
        SB = 5'b00001;   // Source register B = 1
        TA = 4'b0001;    // Temporary source A
        TB = 4'b0001;    // Temporary source B
        #10;

        // Check outputs A and B
        $display("Output A: %h", A);  // Should output DEADBEEF
        $display("Output B: %h", B);  // Should output DEADBEEF
        #10;

        // Add more tests here for different register and temporary register combinations

        $stop;           // Stop simulation
    end
endmodule
