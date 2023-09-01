module tb;
  reg clk,rst;
  wire div2,div4,div8,div16;
  ClockDividerBy2n Dut(.rst(0),.clk(clk),.en(1),.div2(div2),.div4(div4),.div8(div8),.div16(div16));
  initial clk=0;
  always #5 clk=~clk;
  environment env;
  initial begin
    env=new(vif);
    env.gen.count=30;
    env.run();
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule