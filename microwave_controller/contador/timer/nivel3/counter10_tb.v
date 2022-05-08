`include "counter10.v"

module tb_10();
  reg clk,rst;
  wire [3:0]count;
  counter10 c1(clk,rst,count);
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial
  begin
    rst = 0;
    #5 rst = 1;
    #10 rst = 0;
    #200 $finish;
  end
  initial 
    $monitor("%d%d",clk,count);
  initial
  begin
    $dumpfile("counter10.vcd"); 
    $dumpvars;
  end
endmodule
