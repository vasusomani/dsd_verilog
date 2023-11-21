module decoder2x4_df(en,i1,i2,y);
  input en,i1,i2;
  output [3:0]y;
  assign y[0] = (en)&(~i1)&(~i2);
  assign y[1] = (en)&(~i1)&(i2);
  assign y[2] = (en)&(i1)&(~i2);
  assign y[3] = (en)&(i1)&(i2);
endmodule

module decoder_tb;
  reg en,i1,i2;
  wire [3:0]y;
  integer i;
  
  decoder2x4_df D1(en,i1,i2,y);
  initial
  begin
    for(i=3'b000;i<8;i=i+1)
    begin
      {en,i1,i2}=i;#10;
    end
    {en,i1,i2}=3'b000;
  end
endmodule