`timescale 1ns / 1ps

module two_bit_shifter_tb;

    reg CLK;          // Clock signal
    reg SHL;          // Shift Left control signal
    reg SHR;          // Shift Right control signal
    reg Load;         // Load control signal
    reg [7:0] din;    // 8-bit input data
    wire [7:0] dout;  // 8-bit output data

    // Instantiate the two_bit_shifter module
    two_bit_shifter uut (
        .CLK(CLK),
        .SHL(SHL),
        .SHR(SHR),
        .Load(Load),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always begin
        CLK = 0;
        #5 CLK = 1;
        #5;
    end

    initial begin
        // Test case 1: Load data into dout
        Load = 1; SHL = 0; SHR = 0; din = 8'b10101010;
        #10;
        $display("Load: dout = %b", dout);

        // Test case 2: Shift left
        Load = 0; SHL = 1; SHR = 0;
        #10;
        $display("Shift Left: dout = %b", dout);

        // Test case 3: Shift right
        Load = 0; SHL = 0; SHR = 1;
        #10;
        $display("Shift Right: dout = %b", dout);

        // Test case 4: Shift left again
        Load = 0; SHL = 1; SHR = 0;
        #10;
        $display("Shift Left Again: dout = %b", dout);

        // Test case 5: Shift right again
        Load = 0; SHL = 0; SHR = 1;
        #10;
        $display("Shift Right Again: dout = %b", dout);

        $stop; // End simulation
    end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
  end
endmodule
