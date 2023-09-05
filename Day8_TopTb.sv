module tb;
   RCA_IF vif();
   RCA dut (vif);
   environment env;
    initial begin
      env = new(vif);
      env.gen.count = 30;
      env.run();
    end  
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end  
  endmodule
 