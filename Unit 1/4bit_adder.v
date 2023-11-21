module full_adder_beh(x,y,z,S,C);
  input x,y,z;
  output reg S,C;
  always @(x,y,z)
  begin
    {C,S}=x+y+z;
  end
endmodule

module four_bit_adder(a,b,cin,S,C);
  input [3:0]a,b;
  input cin;
  output [3:0]S,C;
  full_adder_beh FA1(a[0],b[0],cin,S[0],C[0]);
  full_adder_beh FA2(a[1],b[1],C[0],S[1],C[1]);
  full_adder_beh FA3(a[2],b[2],C[1],S[2],C[2]);
  full_adder_beh FA4(a[3],b[3],C[2],S[3],C[3]);
endmodule

module four_bit_adder_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]S,C;
four_bit_adder Adder(a,b,cin,S,C);
initial
begin
cin=0;
a=4'b0110;
b=4'b1100;
#10
a=4'b1010;
b=4'b0110;
#10
a=4'b0010;
b=4'b1000;
#10
a=4'b1111;
b=4'b0010;
#10 $stop;
end
endmodule