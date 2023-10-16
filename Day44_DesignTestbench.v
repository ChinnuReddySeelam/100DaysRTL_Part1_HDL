module SPRAM_tb;
  // Parameters
  parameter AddrWidth = 4;
  parameter DataWidth = 32;
  parameter Depth = 16;
  // Signals
  reg clk;
  reg [AddrWidth-1:0] addr1, addr2;
  reg [DataWidth-1:0] Wrdata1, Wrdata2;
  wire [DataWidth-1:0] Rddata1, Rddata2;
  reg cs, wr1, rd1, wr2, rd2;
  // Instantiate the SPRAM module
  SPRAM #(
    .AddrWidth(AddrWidth),
    .DataWidth(DataWidth),
    .Depth(Depth)
  ) dut (
    .clk(clk),
    .addr1(addr1),
    .addr2(addr2),
    .Wrdata1(Wrdata1),
    .Wrdata2(Wrdata2),
    .Rddata1(Rddata1),
    .Rddata2(Rddata2),
    .cs(cs),
    .wr1(wr1),
    .rd1(rd1),
    .wr2(wr2),
    .rd2(rd2)
  );
  // Clock generation
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end
  // Initialize signals
  initial begin
    clk = 0;
    addr1 = 4'b0;
    addr2 = 4'b0;
    Wrdata1 = 32'b0;
    Wrdata2 = 32'b0;
    cs = 0;
    wr1 = 0;
    rd1 = 0;
    wr2 = 0;
    rd2 = 0;
end
   initial begin
    #10;cs=1;wr1=1;wr2=1;
    for(int i=0;i<10;i++) begin 
    addr1 =i;
    addr2 =15-i;
    Wrdata1 = $random();
    Wrdata2 = $random();#10;
    end
    #10;cs=1;wr1=0;wr2=0;rd1=1;rd2=1;
    for(int i=0;i<10;i++) begin 
    addr1 =i;
    addr2 =15-i;#10;
    end
    $finish;
  end

endmodule
