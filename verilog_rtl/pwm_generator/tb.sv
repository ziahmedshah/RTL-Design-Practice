`timescale 1ns / 1ps

module pwm_generator_tb;
    // Testbench signals
    reg clk;                // Clock signal
    reg rst;                // Reset signal
    reg [7:0] duty;         // Duty cycle
    wire pwm_out;           // PWM output

    // Instantiate PWM module
    pwm_generator uut (
        .clk(clk),
        .rst(rst),
        .duty(duty),
        .pwm_out(pwm_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Generate 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        duty = 0;
        #10 rst = 0;          // Release reset

        // Test case 1: 25% duty cycle
        duty = 8'd4;         // 25% of 255
        #100;                 // Wait for some time

        // Test case 2: 50% duty cycle
        duty = 8'd128;        // 50% of 255
        #100;

        // Test case 3: 75% duty cycle
        duty = 8'd192;        // 75% of 255
        #100;

        // Test case 4: 100% duty cycle
        duty = 8'd255;        // Always HIGH
        #100;

        // Test case 5: 0% duty cycle
        duty = 8'd0;          // Always LOW
        #100;

        // End simulation
        $stop;
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
endmodule
