module jkff(j,k,clk,rst,q,q_bar);
  input j,k,rst,clk;
  output reg q,q_bar;
  always @(posedge clk,posedge rst)
  begin
    if(rst)
      begin q=0;q_bar=1; end
    else
      begin
        case({j,k})
          2'b00: begin q=q;q_bar=q_bar; end
          2'b01: begin q=0;q_bar=1; end
          2'b10: begin q=1;q_bar=0; end
          2'b11: begin q=q_bar;q_bar=~q; end
        endcase
      end
  end
endmodule

module jkff_tb;
  reg j,k,clk,rst;
  wire q,q_bar;
  integer i;
  jkff JK(j,k,clk,rst,q,q_bar);
  
  always
  #5 clk=~clk;
  
  initial
  begin
    j=0;k=0;rst=1;clk=0;#10;
    for(i=2'b0;i<4;i=i+1)
    begin
      rst=0;
      {j,k}=i;#10;
    end
  end
endmodule