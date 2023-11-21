module siso(si,clk,rst,so);
  input si,clk,rst;
  output so;
  reg [3:0]q;
  
  always @(posedge clk,posedge rst)
  begin
    if(rst) q<=4'b0;
    else
      begin
        q<= q>>1;
        q[3]<=si;
      end
  end
  assign so=q[0];
endmodule

module siso_tb;
  reg si,clk,rst;
  wire so;
  siso s1(si,clk,rst,so);
  
  always
  #5 clk=~clk;
  
  initial
  begin
  si=0;clk=0;rst=1;#10;
  rst=0;
  
  si=1;#10;
  si=0;#10;
  si=1;#10;
  si=0;#10;
  si=0;#10;
  si=1;#10;
end
endmodule