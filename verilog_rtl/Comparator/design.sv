module comparator (
    input wire a, b, c,
    output reg greater, less, equal
);

    always @(*) begin
        // Default assignments
        greater = 0;
        less = 0;
        equal = 0;

        if (a > b) 
            greater = 1;
        else if (a < b)
            less = 1;
        else
            equal = 1; // a == b
    end

endmodule
