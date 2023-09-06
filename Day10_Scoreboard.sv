class scoreboard;
  transaction tr;
  transaction trref;
  mailbox (transaction) mbx;
  mailbox (transaction) mbxref;
  function new(mailbox (transaction) mbx,mailbox (transaction) mbxref);
    this.mbx=mbx;
    this.mbxref=mbxref;
    tr=new();
  endfunction
  task run();
    mbx.get(tr);
    mbx.get(trref);
    tr.display("TRA");
    if(tr.result==trref.result && tr.overflow)
      $display("Data is matched");
    else $display("Data is not matched");
  endtask    
endclass