`timescale 1ns / 1ps

module divide_by_3_tb;
    reg [15:0] din;            // Input for division
    wire [14:0] result;        // Quotient
    wire [1:0] remainder;      // Remainder

    // Instantiate the module
    divide_by_3 uut (
        .din(din),
        .result(result),
        .remainder(remainder)
    );

    // Test sequence
    initial begin
        // Header for display output
        $display("Time\t din\t\t Result\t\t Remainder");
        $display("-------------------------------------------------");

        // Test case 1: Divide 16 by 3
        din = 16'd16;
        #10 $display("%0t\t %0d\t\t %0d\t\t %0d", $time, din, result, remainder);

        // Test case 2: Divide 100 by 3
        din = 16'd100;
        #10 $display("%0t\t %0d\t\t %0d\t\t %0d", $time, din, result, remainder);

        // Test case 3: Divide 7 by 3
        din = 16'd7;
        #10 $display("%0t\t %0d\t\t %0d\t\t %0d", $time, din, result, remainder);

        // Test case 4: Divide 2 by 3
        din = 16'd2;
        #10 $display("%0t\t %0d\t\t %0d\t\t %0d", $time, din, result, remainder);

        // Test case 5: Divide 0 by 3
        din = 16'd0;
        #10 $display("%0t\t %0d\t\t %0d\t\t %0d", $time, din, result, remainder);

        $stop; // End simulation
    end
endmodule
