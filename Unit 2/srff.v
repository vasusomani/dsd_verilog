module srff(s,r,clk,rst,q,q_bar);
  input s,r,clk,rst;
  output reg q,q_bar;
  always @(posedge clk, posedge rst)
  begin
    if(rst)
      begin
        q<=0;
        q_bar=1;
      end
    else
      begin
        case({s,r})
          2'b00: begin q<=q;q_bar=q_bar; end
          2'b01: begin q<=0;q_bar=1; end
          2'b10: begin q<=1;q_bar=0; end
          2'b11: begin q<=1'bx;q_bar=1'bx; end
        endcase
      end
  end
endmodule

module srff_tb;
  reg s,r,clk,rst;
  wire q,q_bar;
  integer i;
  srff SR(s,r,clk,rst,q,q_bar);
  
  always
  #5 clk=~clk; //toggles the clk signal every 5 time units
  
  initial
  begin
    r=0;s=0;clk=0;rst=1;#10;
    
    for(i=2'b0;i<4;i=i+1)
    begin
      rst=0;#10;
      {s,r}=i;#10;
    end
  end
endmodule
    