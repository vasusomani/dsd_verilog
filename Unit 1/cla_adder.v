module cla_adder(a,b,cin,S,cout);
  input [3:0] a,b;
  input cin;
  output [3:0]S;
  output cout;
  wire [3:0]g,p,c;
  
  assign p=a^b;
  assign g=a&b; 
  
  assign c[0]=cin;
  assign c[1]=g[0]|(p[0]&cin);
  assign c[2]=g[1]|(p[1]&c[1]);
  assign c[3]=g[2]|(p[2]&c[2]);
  assign cout=g[3]|(p[3]&c[3]);
  assign S = p^c;
endmodule

module cla_tb;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] S;
  wire cout;
  cla_adder CA(a,b,cin,S,cout);
  initial
  begin
    cin=0;
    a=6;
    b=10;
    #10;
    a=9;
    b=14;
    #10;
    a=15;
    b=3;
    #10;
    a=4;
    b=1;
    $stop;
  end
endmodule