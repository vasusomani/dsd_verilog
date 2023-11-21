module up_down(q,up_down,clk,rst);
  input up_down,clk,rst;
  output reg [3:0]q;
  always @(posedge clk,posedge rst)
  begin
    if(rst) q<=4'b1011;
    else if(up_down) q<=q+1;
    else q<=q-1;
  end
endmodule

module up_down_tb;
  reg up_down,clk,rst;
  wire [3:0]q;
  up_down C3(q,up_down,clk,rst);
  
  always
  #5 clk=~clk;
  
  initial
  begin
    rst=1;clk=0;up_down=1;#10;
    
    rst=0;#50;
    up_down=0;
    #200;
    $stop;
  end
endmodule
    
      
      
