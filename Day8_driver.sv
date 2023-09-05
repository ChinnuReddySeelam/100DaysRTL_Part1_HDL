class driver;
  mailbox #(transaction) mbx;
  virtual RCA vif;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    transaction tr;
    forever begin
      mbx.get(tr);
      vif.A = tr.A;
      vif.B = tr.B;
      vif.Cin = tr.Cin;
      #1;
      tr.result = vif.result;
      tr.display();
    end
  endtask
endclass