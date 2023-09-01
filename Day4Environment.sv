class environment;
  generator gen;
  scoreboard sco;
  monitor mon;
  driver drv;
  event next;
  mailbox #(transaction) gdmbx; ///gen - drv
  mailbox #(transaction) msmbx;  /// mon - sco
  mailbox #(transaction) mbxref; ///// gen -> sco
  virtual clk_Div_if vif;
  function new(virtual clk_Div_if vif);
    gdmbx=new();
    msmbx=new();
    mbxref=new();
    gen=new(gdmbx,mbxref);
    sco=new(msmbx,mbxref);
    this.vif=vif;
    drv.vif=this.vif;
    mon.vif=this.vif;
    gen.sconext=next;
    sco.sconext=next;
  endfunction
  task pre_test();
    drv.reset();
  endtask
  task test();
  fork
    gen.run();
    drv.run();
    mon.run();
    sco.run();
  join_any
  endtask
  task post_test();
    wait(gen.done.triggered);  
    $finish();
  endtask
  task run();
    pre_test();
    test();
    post_test();
  endtask
endclass