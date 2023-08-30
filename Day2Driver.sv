class driver;
  transaction tr;
  mailbox (transaction) mbx;
  virtual clkDiv_if vif;
  function new(mailbox (transaction) mbx);
    this.mbx=mbx;
  endfunction
  task reset();
    vif.rst<=1'b1;
    repeat (5) @(posedge vif.clk);
    vif.rst<=0;
    @(posedge vif.clk);
    $display("[DRV]:Reset Done");
  endtask
  task run();
    forever begin
      mbx.get(tr);
      vif.en<=tr.en;
      tr.display("DRV");
      @(posedge vif.clk);
    end
  endtask
  
endclass