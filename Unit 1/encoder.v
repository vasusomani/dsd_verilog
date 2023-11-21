module encoder4x2_df(in,y1,y2);
  input [3:0]in;
  output y1,y2;
  assign y1 = in[0]|in[1];
  assign y2 = in[0]|in[2];
endmodule

module encode_tb;
  reg [3:0]in;
  wire y1,y2;
  encoder4x2_df E1(in,y1,y2);
  initial
  begin
    in = 4'b1000;#10;
    in = 4'b0100;#10;
    in = 4'b0010;#10;
    in = 4'b0001;
  end
endmodule
  
  