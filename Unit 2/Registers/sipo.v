module sipo(si,clk,rst,q);
  input si,clk,rst;
  output reg [3:0]q;
  
  always @(posedge clk,posedge rst)
  begin
    if(rst)
      q<=4'b0;
    else
      q <= q>>1;
      q[3] <= si;
  end
endmodule

module sipo_tb;
  reg si,clk,rst;
  wire [3:0]q;
  sipo s2(si,clk,rst,q);
  
  always
  #5 clk=~clk;
  
  initial
  begin  
  si=0;rst=1;clk=0;#10;
  
  rst=0;
  si=1;#10;
  si=0;#10;
  si=1;#10;
  si=1;#10;
  si=0;#10;
  end
endmodule

  
  
