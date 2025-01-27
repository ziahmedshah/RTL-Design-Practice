module divide_by_3 (
    input wire [15:0] din,       // dividend
    output reg [14:0] result,    // quotient
    output reg [1:0] remainder   // remainder
);
    integer temp_din;            // temporary variable for calculations

    always @(*) begin
         result = 15'd0;
        temp_din = din;

        while (temp_din >= 3) begin
            temp_din = temp_din - 3;
            result = result + 1;
        end
        remainder = temp_din[1:0];
    end
endmodule
