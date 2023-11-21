module pipo(in,load,clk,rst,q);
  input load,clk,rst;
  input [3:0]in;
  output reg [3:0]q;
  always @(posedge clk,posedge rst)
  begin
    if(rst)
      q<=4'b0;
    else
      begin
        if(load)
          q<=in;
        else
          q<=q;
      end
  end
endmodule

module pipo_tb;
  reg load,clk,rst;
  reg [3:0]in;
  wire [3:0]q;
  pipo R3(in,load,clk,rst,q);
  
  always
  #5 clk=~clk;
  
  initial
  begin
  load=1;clk=0;rst=1;in=4'b1101;#10;
  
  rst=0;#10;
  load=0;#40;
  load=1; in=4'b1001;#10;
  load=0;
end
endmodule
