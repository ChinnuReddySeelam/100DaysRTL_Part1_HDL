class scoreboard;
  mailbox #(transaction) mbx;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    transaction tr;
    transaction tr_ref;
    forever begin
      mbx.get(tr);
      mbx.get(tr_ref);
      tr.display();
      tr_ref.display();
      if (tr.result === tr_ref.result)
        $display("Score: PASS");
      else
        $display("Score: FAIL");
      #1;
    end
  endtask
endclass
