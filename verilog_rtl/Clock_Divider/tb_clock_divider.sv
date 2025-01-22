`timescale 1ns/1ps

module tb_clock_divider;
  // Parameters
  parameter WIDTH = 8;
  // Testbench signals
  logic clk;
  logic rst;
  logic [WIDTH-1:0] div;
  logic clk_out;
  
  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 100 MHz clock (10ns period)
  
  // DUT instance
  pwm_generator #(.WIDTH(WIDTH)) dut (
    .clk(clk),
    .rst(rst),
    .div(div),
    .clk_out(clk_out)
  );
  
  // Stimulus
  initial begin
    // Initialization
    rst = 1;
    div = 0;
    #20; // Wait for reset to propagate
    rst = 0;
    div = 8'd2; // Set 25% duty cycle
    #200;
    div = 8'd4; // Set 25% duty cycle
    #200;
    div = 8'd6; // Set 25% duty cycle
    #200;
    div = 8'd8; // Set 25% duty cycle
    #200;
    $finish;
  end

  // Monitor
  initial begin
    $monitor("Time: %0t | Reset: %0b | Duty Cycle: %0d | CLK Out: %0b", 
             $time, rst, div, clk_out);
  end
  
  // Dump waveform for simulation
  initial begin
    $dumpfile("pwm_generator.vcd");
    $dumpvars(0, tb_pwm_generator);
  end

endmodule
