module tff(t,clk,rst,q,q_bar);
  input t,clk,rst;
  output reg q,q_bar;
  always @(posedge clk,posedge rst)
  begin
    if(rst) begin q=0;q_bar=1; end
    else
    begin
      if(t==0) begin q=q;q_bar=q_bar; end
      else begin q=~q;q_bar=~q_bar; end
    end
  end
endmodule

module tff_tb;
  reg t,clk,rst;
  wire q,q_bar;
  tff T(t,clk,rst,q,q_bar);
  
  always
  #5 clk=~clk;
  
  initial
  begin
    t=0;rst=1;clk=0;#10;
    rst=0;
    t=0;#10;
    t=1;#10;
  end
endmodule
     
