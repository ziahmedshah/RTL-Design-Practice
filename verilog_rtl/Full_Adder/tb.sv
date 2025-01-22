module tb_full_adder ();
    reg a,b,cin;
    reg sum, cout;

    initial begin
        a = 0; b = 0; cin = 0;
        a = 0; b = 0; cin = 1;
        a = 0; b = 1; cin = 0;
        a = 0; b = 1; cin = 1;
        a = 1; b = 0; cin = 0;
        a = 1; b = 0; cin = 1;
        a = 1; b = 1; cin = 0;
        a = 1; b = 1; cin = 1;
    end
endmodule
