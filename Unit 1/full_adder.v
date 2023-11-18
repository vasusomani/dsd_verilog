module full_adder_gate(x,y,z,S,C);
  input x,y,z;
  output S,C;
  wire w1,w2,w3;
  xor(w1,x,y);
  xor(S,w1,z);
  and(w2,w1,z);
  and(w3,x,y);
  or(S,w2,w3);
endmodule

module full_adder_df(x,y,z,S,C);
  input x,y,z;
  output S,C;
  assign S = x^y^z;
  assign C = ((x^y)&z)|(x&y);
endmodule

module full_adder_beh(x,y,z,S,C);
  input x,y,z;
  output reg S,C;
  always @(x,y,z)
  begin
    //{C,S}=x+y+z;
    S=x^y^z;
    C=(x&y)|(y&z)|(z&x);
  end
endmodule

module fa_tb;
  reg x,y,z;
  wire S,C;
  integer i;
  full_adder_df FA(x,y,z,S,C);
  initial
  begin
    for(i=3'b0;i<8;i=i+1)
    begin
      {x,y,z}=i;#10;
    end
    {x,y,z}=3'b0;
  end
endmodule
