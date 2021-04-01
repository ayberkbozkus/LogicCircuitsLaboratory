`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2021 23:48:13
// Design Name: 
// Module Name: experiment1
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


// Part1
module and_gate(A,B,C);
    //Inputs
    input A,B;
    //Outputs
    output C;
    assign C = A&B;
endmodule

module or_gate(A,B,C);
    //Inputs
    input A,B;
    //Outputs
    output C;
    assign C = A | B;
endmodule

module not_gate(A,B);
    //Inputs
    input A;
    //Outputs
    output B;
    assign B = ~A;
endmodule



module experiment1(
    //Inputs
    input A,
    input B,
    input C,
    input D,
    //Outputs
    output F1,
    output F2,
    output DUALITY,
    output F3,
    output NOTF3,
    output F4
    );
    
    // Intermediate Wires
        wire AANDB;
        wire AORB;
        wire AORNOTB;
        wire AORA;
        wire NOTA;
        wire NOTAANDC;
        wire NOTC;
        wire NOTD;
        wire NOTCANDD;
        wire CANDNOTD;
        wire NOTAORNOTB;
        wire AORNOTC;
    
    //Part2    
    and_gate AND1(.A(A),.B(B),.C(AANDB)); // a*b
    or_gate OR1(.A(A),.B(AANDB),.C(F1)); // a+(a*b)
    
    or_gate OR2(.A(A),.B(B),.C(AORB));
    not_gate NOT1(.A(B),.B(NOTB));
    or_gate OR3(.A(A),.B(NOTB),.C(AORNOTB));
    and_gate AND2(.A(AORB),.B(AORNOTB),.C(F2));
    
    // Part 3
    // (a+a)*(a+b)
    or_gate OR4(.A(A),.B(A),.C(AORA));
    and_gate AND3(.A(AORA),.B(AORB),.C(DUALITY));
    
    // Part 4
    // (a*b)+(a'*c)
    not_gate NOT2(.A(A),.B(NOTA));
    and_gate AND4(.A(NOTA),.B(C),.C(NOTAANDC));
    or_gate OR5(.A(AANDB),.B(NOTAANDC),.C(F3));
    
    // Demorgan (a'+b')*(a+c')
    
    or_gate OR6(.A(NOTA),.B(NOTB),.C(NOTAORNOTB));
    or_gate OR7(.A(A),.B(NOTC),.C(AORNOTC));
    and_gate AND5(.A(NOTAORNOTB),.B(AORNOTC),.C(NOTF3));
    
    // Part 5
    // (c'*d) + (c*d')
    not_gate NOT5(.A(C),.B(NOTC));
    not_gate NOT6(.A(D),.B(NOTD));
    and_gate AND6(.A(NOTC),.B(D),.C(NOTCANDD));
    and_gate AND7(.A(C),.B(NOTD),.C(CANDNOTD));
    or_gate OR8(.A(NOTCANDD),.B(CANDNOTD),.C(F4));
    
endmodule
