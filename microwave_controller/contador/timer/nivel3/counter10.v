module counter10(clk,rst,count);
  input clk,rst;

  output reg [3:0]count;

  always@(posedge clk)
begin
    if(rst == 1 || count == 9)
      count <= 0;
    else
      count <= count + 1;
  end
endmodule
  
