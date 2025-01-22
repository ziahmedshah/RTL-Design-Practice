`timescale 1ns / 1ps

module counter_8bit_tb;
  reg clk;
  reg rst;
  reg [1:0] c;
  reg [7:0] din;
  wire [7:0] dout;

  // Instantiate the counter module
  counter_8bit uut (
    .clk(clk),
    .rst(rst),
    .c(c),
    .din(din),
    .dout(dout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns clock period
  end

  // Test sequence
  initial begin
    rst = 1; din = 8'b0; c = 2'b00;
    #10 rst = 0;

    // Test case 1: Load data
    c = 2'b00; din = 8'd25; #10;

    // Test case 2: Increment by 1
    c = 2'b01; #10;

    // Test case 3: Decrement by 1
    c = 2'b10; #10;

    // Test case 4: Reset to 0
    c = 2'b11; #10;

    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
endmodule
