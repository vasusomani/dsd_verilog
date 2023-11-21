//mealy 1010 overlapping
module mealy(i,clk,rst,y);
  input i,clk,rst;
  output reg y;
  parameter s0=2'b00;
  parameter s1=2'b01;
  parameter s2=2'b10;
  parameter s3=2'b11;
  reg [1:0]cs,ns;
  
  always @(posedge clk,posedge rst)
  begin
    if(rst) cs<=s0;
    else cs<=ns;
  end
  
  always @(cs,i)
  begin
    case(cs)
      s0:begin ns=i?s1:s0; y=0;end
      s1:begin ns=i?s1:s2; y=0;end
      s2:begin ns=i?s3:s0; y=0;end
      s3:begin ns=i?s1:s2; y=i?0:1;end
      default:begin ns=s0; y=0;end
    endcase
  end
endmodule

module mealy_tb;
  reg i,clk,rst;
  wire y;
  mealy FSM1(i,clk,rst,y);
  
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
    #50; $stop;
  end
endmodule
