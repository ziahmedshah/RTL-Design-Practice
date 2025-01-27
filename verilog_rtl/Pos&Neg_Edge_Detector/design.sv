module pos_n_neg_edge_det ( 
  input a, b  ,         
  input clk,           
  output out
);           
  reg   a_delay, b_delay;                          

  always @ (posedge clk) begin
    a_delay <= a;
    b_delay <= b;
  end

  assign out = (a & ~a_delay) | (~b & b_delay);            
endmodule 
