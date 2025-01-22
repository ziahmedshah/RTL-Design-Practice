module mux(
    input a, b,
    input sel,
    output x
);

    assign x = (sel) ? a : b;
endmodule 
