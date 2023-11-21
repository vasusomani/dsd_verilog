//mod-10 counter
module modn(q,clk,rst);
  input clk,rst;
  output reg [3:0]q;
  always @(posedge clk,posedge rst)
  begin
    if(rst) q<=4'b0;
    else if(q==9) q<=4'b0;
    else q<=q+1;
  end
endmodule

module modn_tb;
  reg clk,rst;
  wire [3:0]q;
  modn C4(q,clk,rst);
  
  always
  #5 clk=~clk;
  
  initial
  begin
  rst=1;clk=0;#10;
  rst=0;#200;
  $stop;
  end
endmodule 