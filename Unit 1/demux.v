//for df use ternary operator instead of switch case or if-else statements
module demux_beh(in,s,y);
  input in;
  input [1:0]s;
  output reg [3:0]y;
  always @(in,s)
  begin
    y=3'b000;
    case(s)
      2'b00:y[0]=in;
      2'b01:y[1]=in;
      2'b10:y[2]=in;
      2'b11:y[3]=in;
    endcase
  end
endmodule

module demux_tb;
  reg in;
  reg [1:0]s;
  wire [3:0]y;
  integer i;
  demux_beh Demux(in,s,y);
  
  initial
  begin
    for(i=2'b0;i<4;i=i+1)
    begin
      in=1;
      s=i;#10;
    end
  end
endmodule