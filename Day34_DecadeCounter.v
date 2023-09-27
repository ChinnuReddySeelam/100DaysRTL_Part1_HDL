module decade_counter(clk, rst, q);
  input clk, rst;
  output [3:0] q;
  wire q31_condition;
  // Detect when q[3] and q[1] are both 1
  assign q31_condition = (q[3] == 1'b1) && (q[1] == 1'b1);
  // Ripple counter with reset controlled by q31_condition
  ripplecounter ripple_inst(.clk(clk), .rst(rst || q31_condition), .q(q));
endmodule
module ripplecounter(clk,rst,q); //Ripple counter using T flipflop
  input clk,rst;
  output [3:0]q;
  tff tf1(q[0],clk,rst);
  tff tf2(q[1],q[0],rst);
  tff tf3(q[2],q[1],rst);
  tff tf4(q[3],q[2],rst);
endmodule
module tff(q,clk,rst); //T flipflop using D-flipflop always in toggling mode
  input clk,rst;
  output q;
  wire d;
  dff df1(q,d,clk,rst);
  not n1(d,q);
endmodule
module dff(q,d,clk,rst); //D-flipflop
  input d,clk,rst;
  output q;
  reg q;
  always @(negedge clk or posedge rst)
   begin
    if(rst) q=1'b0;
    else q=d;
   end
endmodule
