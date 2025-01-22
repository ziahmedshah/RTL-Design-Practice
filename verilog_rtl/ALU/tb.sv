module tb_ALU;

  logic [31:0] A, B;
  logic [3:0] op_code;
  logic [4:0] shift_amount;
  logic [31:0] result;
  logic zero;

  // Instantiate the ALU
  ALU uut (
    .A(A),
    .B(B),
    .op_code(op_code),
    .shift_amount(shift_amount),
    .result(result),
    .zero(zero)
  );

  initial begin
    // Display header for simulation output
    $display("Time\t\t A\t\t B\t OpCode\t ShiftAmt\t Result\t Zero");

    // Test ADD operation (A + B)
    A = 32'd5;
    B = 32'd3;
    op_code = 4'b0000; // ADD
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);
    
    // Test SUBTRACT operation (A - B)
    A = 32'd10;
    B = 32'd4;
    op_code = 4'b0001; // SUBTRACT
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);

    // Test AND operation (A & B)
    A = 32'hA;
    B = 32'hB;
    op_code = 4'b0010; // AND
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);

    // Test OR operation (A | B)
    op_code = 4'b0011; // OR
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);

    // Test XOR operation (A ^ B)
    op_code = 4'b0100; // XOR
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);

    // Test SHIFT RIGHT operation
    A = 32'd32;
    shift_amount = 5'd2;
    op_code = 4'b0101; // SHIFT RIGHT
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);

    // Test SHIFT LEFT operation
    op_code = 4'b0110; // SHIFT LEFT
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);

    // Test BARREL SHIFT LEFT operation
    op_code = 4'b0111; // BARREL SHIFT LEFT
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);

    // Test BARREL SHIFT RIGHT operation
    op_code = 4'b1000; // BARREL SHIFT RIGHT
    #10;
    $display("%0t\t %d\t %d\t %d\t %d\t %d\t %b", $time, A, B, op_code, shift_amount, result, zero);

    // End the simulation
    $finish;
  end

endmodule
