module SPRAM_tb;
  // Parameters
  parameter AddrWidth = 4;
  parameter DataWidth = 32;
  parameter Depth = 16;
  // Signals
  reg clk;
  reg [AddrWidth-1:0] addr;
  wire [DataWidth-1:0] data;
  reg [DataWidth-1:0] Tbdata;
  reg cs, wr, rd;
  // Instantiate the SPRAM module
  SPRAM #(AddrWidth, DataWidth, Depth) uut (
    .clk(clk),
    .addr(addr),
    .data(data),
    .cs(cs),
    .wr(wr),
    .rd(rd)
  );
  // Clock generation
  always begin
    #5 clk = ~clk;
  end
  assign data=~rd?Tbdata:'hz;
  // Initialize signals
  initial begin
    clk = 0;
    addr = 0;
    cs = 0;
    wr = 0;
    rd = 0;
    Tbdata = 0;
    end
  initial begin 
  #10;
  for(int i=0;i<10;i++) begin 
  cs=1;wr=1;rd=0;
  addr=i;Tbdata=$random();#10;
  $display("addr=%b,cs=%b,wr=%b,rd=%b,data=%b",addr,cs,wr,rd,data);
  end
  #10;
  for(int i=0;i<10;i++) begin 
  cs=1;wr=0;rd=1;
  addr=i;Tbdata=$random();#10;
  $display("addr=%b,cs=%b,wr=%b,rd=%b,data=%b",addr,cs,wr,rd,data);
  end
  $finish();
  end
endmodule