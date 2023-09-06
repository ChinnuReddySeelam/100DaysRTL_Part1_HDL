module tb;
  A_C vif;
  A_C dut(vif);
  environment env;
  initial begin
    env=new(vif);
    env.gen.count=30;
    env.run();
  end
  initial begin
    $dumpfile("File.vcd");
    $dumpvars;
  end
endmodule
