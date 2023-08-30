class generator;
    transaction tr;
    mailbox (transaction) mbx;
    mailbox (transaction) mbxref;
    int count;
    event sconex;
    event done;

    function new(mailbox (transaction) mbx, mailbox (transaction) mbxref);
        this.mbx = mbx;
        this.mbxref = mbxref;
        tr = new();
    endfunction

    task run();
        repeat (count) begin
            for (int i = 0; i < 10; i++) begin
                assert(tr.randomize()) else $error("[GEN]:Randomization Failed");
                mbx.put(tr.copy);
                mbxref.put(tr.copy);
                tr.display("GEN");
                @(sconex);
            end
        end
        -> done;
    endtask
endclass;
