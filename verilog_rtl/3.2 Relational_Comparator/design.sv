module comparator_rel (
  input [7:0] a,  
  input [7:0] b,  
  output reg EQ,  // Equality output
  output reg GT,  // Greater-than output
  output reg LT   // Less-than output
);

  always @(*) begin
    EQ = 0;
    GT = 0;
    LT = 0;
    if (a == b) begin
      EQ = 1;
      GT = 0;
      LT = 0;
    end else if (a > b) begin
      EQ = 0;
      GT = 1;
      LT = 0;
    end else begin
      EQ = 0;
      GT = 0;
      LT = 1;
    end
  end

endmodule
