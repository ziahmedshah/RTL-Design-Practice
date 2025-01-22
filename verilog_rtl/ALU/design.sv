module ALU (
  input logic [31:0] A,             // First operand
  input logic [31:0] B,             // Second operand
  input logic [3:0] op_code,        // Operation code (4 bits)
  input logic [4:0] shift_amount,   // Shift amount for shift operations
  output logic [31:0] result,       // ALU result
  output logic zero                 // Zero flag (1 if result is 0)
);

  always_comb begin
    case (op_code)
      4'b0000: result = A + B;               // ADD
      4'b0001: result = A - B;               // SUBTRACT
      4'b0010: result = A & B;               // AND
      4'b0011: result = A | B;               // OR
      4'b0100: result = A ^ B;               // XOR
      4'b0101: result = A >> shift_amount;   // SHIFT RIGHT
      4'b0110: result = A << shift_amount;   // SHIFT LEFT
      4'b0111: result = A <<< shift_amount;  // BARREL SHIFT LEFT (circular shift)
      4'b1000: result = A >>> shift_amount;  // BARREL SHIFT RIGHT (circular shift)
      default: result = 32'b0;               // Default case (0 result)
    endcase
    zero = (result == 32'b0);                // Set zero flag if result is 0
  end

endmodule
