module half_adder_gate(x,y,S,C);
  input x,y;
  output S,C;
  xor(S,x,y);
  and(C,x,y);
endmodule

module half_adder_df(x,y,S,C);
  input x,y;
  output S,C;
  assign S = x^y;
  assign C = x&y;
endmodule

module half_adder_beh(x,y,S,C);
  input x,y;
  output reg S,C;
  always @(x,y)
  begin
    {S,C}=(x+y);
  end
endmodule

module ha_tb;
 reg x,y;
 wire S,C;
 integer i;
 half_adder_beh HA(x,y,S,C);
 initial 
 begin
   for(i=2'b00;i<4;i=i+1)
   begin
     {x,y}=i;#10;
   end
   {x,y}=2'b00;
 end
 endmodule