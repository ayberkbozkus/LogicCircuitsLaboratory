`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 09:34:51
// Design Name: 
// Module Name: experiment1_sim
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


module experiment1_sim(

    );
    
    reg a;
    reg b;
    reg c;
    reg d;
    //Outputs
    wire f1;
    wire f2;
    wire duality;
    wire f3;
    wire notf3;
    wire f4;
   
    
    experiment1 uut(.A(a),.B(b),.C(c),.D(d),.F1(f1),.F2(f2),.DUALITY(duality),.F3(f3),.NOTF3(notf3),.F4(f4));
    
    initial begin
        a=0; b=0; c=0; d=0; #10;
        a=0; b=0; c=0; d=1; #10;
        a=0; b=0; c=1; d=0; #10;
        a=0; b=0; c=1; d=1; #10;
        a=0; b=1; c=0; d=0; #10;
        a=0; b=1; c=0; d=1; #10;
        a=0; b=1; c=1; d=0; #10;
        a=0; b=1; c=1; d=1; #10;
        a=1; b=0; c=0; d=0; #10;
        a=1; b=0; c=0; d=1; #10;
        a=1; b=0; c=1; d=0; #10;
        a=1; b=0; c=1; d=1; #10;
        a=1; b=1; c=0; d=0; #10;
        a=1; b=1; c=0; d=1; #10;
        a=1; b=1; c=1; d=0; #10;
        a=1; b=1; c=1; d=1; #10;
    end
    
    
endmodule
