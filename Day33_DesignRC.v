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