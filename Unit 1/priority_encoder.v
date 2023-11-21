module priority_encoder_beh(en,in,y);
  input [7:0]in;
  input en;
  output reg [2:0]y;
  always @(en,in)
  begin
    if(en==1)
      begin
        if(in[7]==1)
            y=3'b000;
        else if(in[6]==1)
            y=3'b001;
        else if(in[5]==1)
            y=3'b010;
        else if(in[4]==1)
            y=3'b011;
        else if(in[3]==1)
            y=3'b100;
        else if(in[2]==1)
            y=3'b101;
        else if(in[1]==1)
            y=3'b110;
        else if(in[0]==1)
            y=3'b111;
        else
          y=3'bzzz;
      end
    else
      y=3'bzzz;//If en==0 => There is a high impedance value
  end
endmodule

module priority_encoder_tb;
  reg en;
  reg [7:0]in;
  wire [2:0]y;
  integer i=0;
  priority_encoder_beh PE1(en,in,y);
  
  initial
  begin
    for(i=8'b0;i<256;i=i+1)
    begin
      en=1;
      in=i;#5;
    end
  end
endmodule
  
  


