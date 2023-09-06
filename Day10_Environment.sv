class environment;
  transaction tr;
  driver drv;
  generator gen;
  monitor mon;
  scoreboard scr;
  event next;
  virtual A_C vif;
  mailbox #(transaction) gdmbx;
  mailbox #(transaction) msmbx;
  mailbox #(transaction) mbxref;
  function new(virtual A_C vif);
    gdmbx=new();
    msmbx=new();
    msmbx=new();
    gen=new(gdmax,mbxref);
    sco=new(msmbx,mbxref);
    this.vif=vif;
    drv.vif=vif;
    sco.vif=vif;
    gen.sconext=next;
    sco.sconext=next;
  endfunction
  task pretest();
    ;//No need
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
endclass