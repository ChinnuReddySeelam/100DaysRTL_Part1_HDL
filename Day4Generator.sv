class generator;
  transaction tr;
  int count;
  event sconext;
  event done;
  mailbox (transaction) mbx;
  mailbox (transaction) mbxref;
  function new(mailbox (transaction) mbx,mailbox (transaction) mbxref);
    this.mbx=mbx;
    this.mbxref=mbxred;
  endfunction
  task run();
    repeat (count) begin
      for(int i=0;i<10;i++) begin
        mbx.put(tr.copy);
        mbxref.put(tr.copy);
        tr.display("Gen");
        @(sconext);
      end
    end
    ->done
  endtask
endclass