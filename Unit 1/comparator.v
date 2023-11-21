//For df directly use assign
module comparator_beh(A,B,AgB,AlB,AeB);
  input [1:0]A,B;
  output reg AgB,AlB,AeB;
  always @(A,B)
  begin
    AgB = (A[0]&(~B[1])&(~B[0]))|(A[1]&A[0]&(~B[0]))|(A[1]&(~B[1]));
    AeB = (~A[1]&~A[0]&~B[1]&~B[0])|(~A[1]&A[0]&~B[1]&B[0])|(A[1]&A[0]&B[1]&B[0])|(A[1]&~A[0]&B[1]&~B[0]);
    AlB = (~A[1]&B[1])|(~A[0]&B[1]&B[0])|(~A[1]&~A[0]&B[0]);
  end
endmodule

//Shortcut Method
module comparator_beh_symbol(A,B,AgB,AlB,AeB);
  input [1:0]A,B;
  output reg AgB,AlB,AeB;
  always @(A,B)
  begin
    AgB=0;AeB=0;AlB=0;
    if(A>B)
      AgB=1;
    else if(A==B)
      AeB=1;
    else
      AlB=1;
    end
endmodule  

module comparator_tb;
  reg [1:0]A,B;
  wire AgB,AlB,AeB;
  integer i;
  comparator_beh_symbol C1(A,B,AgB,AlB,AeB);
  
  initial
  begin
    for(i=4'b0;i<16;i=i+1)
    begin
      {A,B}=i;#10;
    end
  end
endmodule
  
  
//For 4bit comparator
module comparator_4bit_beh_symbol(A,B,AgB,AlB,AeB);
  input [3:0]A,B;
  output reg AgB,AlB,AeB;
  always @(A,B)
  begin
    AgB=0;AeB=0;AlB=0;
    if(A>B)
      AgB=1;
    else if(A==B)
      AeB=1;
    else
      AlB=1;
  end
endmodule