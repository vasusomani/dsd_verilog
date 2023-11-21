//moore overlapping 1010
module moore(i,clk,rst,y);
  input i,clk,rst;
  output reg y;
  reg [2:0]cs,ns;
  parameter s0=3'b000;
  parameter s1=3'b001;
  parameter s2=3'b010;
  parameter s3=3'b011;
  parameter s4=3'b100;
 
always @(posedge clk,posedge rst)
 
begin
 
  if(rst) cs<=s0;
 
  else cs<=ns;
 
end
 
 
always @(cs,i)
 
begin
 
  case(cs)
      s0:ns=i?s1:s0;
      s1:ns=i?s1:s2;
      s2:ns=i?s3:s0;
      s3:ns=i?s1:s4;
      s4:ns=i?s3:s0;
      default:ns=s0;
    endcase
  end
  
  always @(cs)
  begin
    $display(cs);
    if(cs==s4) y=1;
    else y=0;
  end
endmodule

module moore_tb;
  reg i,clk,rst;
  wire y;
  moore FSM2(i,clk,rst,y);
  
  always
  #5 clk=~clk;
  
  initial
  begin
    rst=1;clk=0;i=1;#10;
    
    rst=0;#10;
    i=0;#10;
    i=1;#10;
    i=0;#10;
    i=1;#10;
    i=0;#10;
    i=1;#10;
    i=0;#10;
    i=1;#10;
  end
endmodule