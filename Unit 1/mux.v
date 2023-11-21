module mux41_df(i,s,y);
  input [3:0]i;
  input [1:0]s;
  output y;
  assign y = (s==2'b00)?(i[0]):((s==2'b01)?(i[1]):((s==2'b10)?(i[2]):(i[3])));
endmodule;

module mux41_beh(i,s,y);
  input [3:0]i;
  input [1:0]s;
  output reg y;
  always @(i,s)
  begin
    case(s)
      2'b00:y=i[0];
      2'b01:y=i[1];
      2'b10:y=i[2];
      2'b11:y=i[3];
      default:y=1'bx;
    endcase
  end
endmodule

module mux41_tb;
  reg [3:0]i;
  reg [1:0]s;
  wire y;
  integer j;
  mux41_beh Mux(i,s,y);
  
  initial
  begin
    for(j=4'b0;j<16;j=j+1)
    begin
      i=j;
      s=2'b00;#5;
      s=2'b01;#5;
      s=2'b10;#5;
      s=2'b11;#5;
    end
  end
endmodule
