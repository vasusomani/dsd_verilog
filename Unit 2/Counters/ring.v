module ring(q,clk,rst);
  input clk,rst;
  output reg [3:0]q;
  always @(posedge clk, posedge rst)
  begin
    if(rst) q=4'b1011;
    else
      begin
        q<= q>>1;
        q[3]<=q[0];
      end
  end
endmodule

module ring_tb;
  reg clk,rst;
  wire [3:0]q;
  ring C1(q,clk,rst);
  
  always
  #5 clk=~clk;
  
  initial
  begin
    rst=1;clk=1;#10;
    rst=0;#200;
    $stop;
  end
endmodule
