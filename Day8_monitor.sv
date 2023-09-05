class monitor;
  mailbox #(transaction) mbx;
  virtual RCA vif;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    transaction tr;
    forever begin
      tr = new();
      tr.A = vif.A;
      tr.B = vif.B;
      tr.Cin = vif.Cin;
      tr.result = vif.result;
      mbx.put(tr);
      tr.display();
      #1;
    end
  endtask
endclass