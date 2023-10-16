module barrel_shifter_left_testbench;
    reg [7:0] data;
    reg [2:0] amt;
    reg ctrl;
    wire [7:0] out;
    string Type;
    barrel_shifter_multi uut(data,amt,ctrl,out);
    initial begin
    for (int i=0;i<10;i++) begin
    data=$random();
    amt=$random();
    ctrl=$random();#10;
    if(ctrl) Type="Left";
    else Type ="right" ;
    $display("Type=%s,data=%b,amt=%b,ctrl=%b,out=%b",Type,data,amt,ctrl,out);
    end
    $finish();
    end
endmodule