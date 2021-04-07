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


module experiment3_sim();
    reg [15:0] A;
    reg [15:0] B;
    reg X,Y,Cin; //Half adder
    reg [3:0] M;
    reg [3:0] N;
    reg Sign;
    
    
    wire flag;
    wire halfadderout;
    wire halfadderoutput;
    wire fulladderout;
    wire fulladderoutput;
    wire fourbitadderout;
    wire [3:0]fourbitoutput;
    wire sixteenOut;
    wire [15:0] sixteenOutput;
    wire sixteensubtOut;
    wire [15:0] sixteensubtOutput;
    wire part7Out;
    wire [15:0] part7Output;
    
    experiment3 uut(A,B,M,N,Cin,X,Y,Sign,flag,halfadderout,halfadderoutput,fulladderout,fulladderoutput,fourbitadderout,fourbitoutput,sixteenOut,sixteenOutput,sixteensubtOut,sixteensubtOutput,part7Out,part7Output);
    
    initial begin
         A = 16'd29; B = 16'd3;Sign = 1'b0; X = 1'b0; Y = 1'b0; Cin = 1'b0; M = 3'b001; N = 3'b001; #10
         A = 16'd103; B = 16'd145;Sign = 1'b1; X = 1'b1; Y = 1'b0; Cin = 1'b1; M = 3'b101; N = 3'b011; #10 //
         A = 16'd202; B = 16'd97;Sign = 1'b0; X = 1'b0; Y = 1'b1; Cin = 1'b1; M = 3'b111; N = 3'b101; #10
         A = 16'd21; B = 16'd83;Sign = 1'b1; X = 1'b1; Y = 1'b1; Cin = 1'b0; M = 3'b010; N = 3'b010;#10
         #10 $finish;
     end
     
endmodule