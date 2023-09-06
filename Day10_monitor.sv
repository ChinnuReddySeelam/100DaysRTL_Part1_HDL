class monitor;
  transaction tr;
  mailbox (transaction) mbx;
  virtula A_S vif;
  function new(mailbox (transaction) mbx);
    this.mbx=mbx;
  endfunction
  task run;
    forever begin
    mbx.put(tr);
    tr.result=vif.result;
    #10;
    end
  endtask
endclass