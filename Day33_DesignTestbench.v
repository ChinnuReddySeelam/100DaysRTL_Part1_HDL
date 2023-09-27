module tb;
    reg clk;
    reg rst;
    wire [3:0]q;
    ripplecounter dut(clk,rst,q);
    initial
      clk = 0;
    always
      #5 clk = ~clk;
    initial
       begin
         rst = 1;
         #15 rst = 0;
         #180 rst = 1;
         #10 rst = 1;
         #20 $finish;
        $monitor("time=%g,rst=%b,clk=%b,q=%d",$time,rst,clk,q);
        end
endmodule