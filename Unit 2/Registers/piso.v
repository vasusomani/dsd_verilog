module piso(in,load,clk,rst,so);
  input load,clk,rst;
  input [3:0]in;
  output so;
  reg [3:0]q;
  
  always @(posedge clk,posedge rst)
  begin
    if(rst) q<=4'b0;
    else
      begin
        if(load)
          q<=in;
        else
          q<= q>>1;
      end
  end
  assign so=q[0];
endmodule

module piso_tb;
  reg load,clk,rst;
  reg [3:0]in;
  wire so;
  piso R4(in,load,clk,rst,so);
  
  always
  #5 clk=~clk;
  
  initial
  begin
    load=1;clk=0;rst=1;in=1101;#10;
    
    rst=0;#10;
    load=0;#40;
    load=1;in=1001;#10;
    load=0;
  end
endmodule
    
    
      
          