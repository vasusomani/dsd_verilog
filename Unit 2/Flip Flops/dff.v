module dff(d,clk,rst,q,q_bar);
  input d,clk,rst;
  output reg q,q_bar;
  always @(posedge clk,posedge rst)
  if(rst)
    begin
      q=0;q_bar=1;
    end
  else
    begin 
      q=d;
      q_bar=~d;
    end
endmodule

module dff_tb;
  reg d,clk,rst;
  wire q,q_bar;
  dff DFF(d,clk,rst,q,q_bar);
  
  always
  #5 clk=~clk;
  
  initial
  begin
    d=0;rst=1;clk=0;#10;
    rst=0;
    d=0;#10;
    d=1;#10;
  end
endmodule
  