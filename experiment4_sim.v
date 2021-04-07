`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 01:47:09
// Design Name: 
// Module Name: experiment3_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module experiment4_sim();

//inputs
reg SS,SR,SES,SER,SEE,D,Clock,clk,load;
reg [15:0] I;
//outputs
wire SQ,SQn,SEQ,SEQn,DQ,DQn,shift_out;

experiment4 uut(SS,SR,SQ,SQn,SES,SER,SEE,SEQ,SEQn,D,Clock,DQ,DQn,I,clk,load,shift_out);

initial begin
  clk=1;
     forever #10 clk = ~clk;  
end 

always begin
I=16'b0000000100000001; load=1; SS=1; SR=1; SES=1; SER=1; SEE=1; D=1; Clock=1; #20;
               load=0; SS=1; SR=1; SES=1; SER=1; SEE=1; D=1; Clock=1; #180;
I=16'b0001000100010001; load=1; SS=1; SR=0; SES=1; SER=0; SEE=1; D=1; Clock=0; #20;
               load=0; SS=1; SR=0; SES=1; SER=0; SEE=1; D=1; Clock=0; #180;
I=16'b1010101010101010; load=1; SS=0; SR=1; SES=0; SER=1; SEE=1; D=0; Clock=1; #20;
               load=0; SS=0; SR=1; SES=0; SER=1; SEE=1; D=0; Clock=1; #180;
I=16'b1100000000000000; load=1; SS=0; SR=0; SES=0; SER=0; SEE=1; D=0; Clock=0; #20;
               load=0; SS=0; SR=0; SES=0; SER=0; SEE=1; D=0; Clock=0; #180;
I=16'b1000000000000000; load=1; SS=1; SR=1; SES=1; SER=1; SEE=0; D=1; Clock=1; #20;
               load=0; SS=1; SR=1; SES=1; SER=1; SEE=0; D=1; Clock=1; #180;
I=16'b1110000000000000; load=1; SS=1; SR=0; SES=1; SER=0; SEE=0; D=1; Clock=0; #20;
               load=0; SS=1; SR=0; SES=1; SER=0; SEE=0; D=1; Clock=0; #180;
I=16'b0000000000011111; load=1; SS=0; SR=1; SES=0; SER=1; SEE=0; D=0; Clock=1; #20;
               load=0; SS=0; SR=1; SES=0; SER=1; SEE=0; D=0; Clock=1; #180;
end
endmodule