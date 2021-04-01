`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2021 09:34:51
// Design Name: 
// Module Name: experiment1_sim
// Project Name: 
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

module experiment2_sim(

    );
    
    reg a;
    reg b;
    reg c;
    reg d;
    //Outputs
    wire f1;
    wire f2;
    wire f3;
    wire f4f2;
    wire f4f3;
   
    
    experiment2 uut(.A(a),.B(b),.C(c),.D(d),.F1(f1),.F2(f2),.F3(f3),.F4F2(f4f2),.F4F3(f4f3));
    
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