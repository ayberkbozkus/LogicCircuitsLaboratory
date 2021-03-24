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

module and_gate(A,B,C);
    //Inputs
    input A,B;
    //Outputs
    output C;
    assign C = A&B;
endmodule

module and_gate2(A,B,C,D);
    //Inputs
    input A,B,C;
    //Outputs
    output D;
    
    assign D = A&B&C;
    
endmodule

module or_gate(A,B,C);
    //Inputs
    input A,B;
    //Outputs
    output C;
    assign C = A | B;
endmodule

module or_gate2(A,B,C,D);
    //Inputs
    input A,B,C;
    //Outputs
    output D;
    
    assign D = A | B | C;
    
endmodule

module not_gate(A,B);
    //Inputs
    input A;
    //Outputs
    output B;
    assign B = ~A;
endmodule

module nand_gate(A,B,C);
    //Inputs
    input A,B;
    //Outputs
    output C;
    assign C = ~(A&B);
endmodule

module nand_gate2(A,B,C,D);
    //Inputs
    input A,B,C;
    //Outputs
    output D;
    
    assign D = ~(A&B&C);
    
endmodule

// Part1

module part1(A,B,C,D,F1);
    //Inputs
    input A,B,C,D;
    
    //Outputs
    output F1;
    
    // Intermediate Wires
        wire NOTA;
        wire NOTB;
        wire NOTC;
        wire NOTD;
        wire NOTAANDNOTB;
        wire AANDNOTD;
        wire BANDNOTCANDD;
        wire OUTPUT;
    
    //(A'*B')+(A*D')+(B*C'*D')
    
    not_gate NOT1(.A(A),.B(NOTA)); // A'
    not_gate NOT2(.A(B),.B(NOTB)); // B'
    not_gate NOT3(.A(C),.B(NOTC)); // C'
    not_gate NOT4(.A(D),.B(NOTD)); // D'
    
    and_gate AND1(.A(NOTA),.B(NOTB),.C(NOTAANDNOTB)); // A'*B'
    and_gate AND2(.A(A),.B(NOTD),.C(AANDNOTD)); // A*D'
    and_gate2 AND4(.A(B),.B(NOTC),.C(D),.D(BANDNOTCANDD)); // B*C'*D
    
    or_gate2 OR2(.A(NOTAANDNOTB),.B(AANDNOTD),.C(BANDNOTCANDD),.D(OUTPUT)); // (A'*B')+(A*D')+(B*C'*D)
    
    assign F1 = OUTPUT;
    
endmodule

// Part2

module part2(A,B,C,D,F1);
    //Inputs
    input A,B,C,D;
    
    //Outputs
    output F1;
    
    // Intermediate Wires
        wire NOTA;
        wire NOTB;
        wire NOTC;
        wire NOTD;
        wire NOTANANDNOTB;
        wire ANANDNOTD;
        wire BNANDNOTCNANDD;
        wire OUTPUT;
        
        // ((A'*B')'*(A*D')'*(B*C'*D)')'

    nand_gate NANDA(.A(A),.B(A),.C(NOTA)); // A'
    nand_gate NANDB(.A(B),.B(B),.C(NOTB)); // B'
    nand_gate NANDC(.A(C),.B(C),.C(NOTC)); // C'
    nand_gate NANDD(.A(D),.B(D),.C(NOTD)); // D'
        
    nand_gate NAND1(.A(NOTA),.B(NOTB),.C(NOTANANDNOTB)); // (A'*B')'
    nand_gate NAND2(.A(A),.B(NOTD),.C(ANANDNOTD)); // (A*D')'
    nand_gate2 NAND3(.A(B),.B(NOTC),.C(D),.D(BNANDNOTCNANDD)); // (B*C'*D)'
        
    nand_gate2 NAND4(.A(NOTANANDNOTB),.B(ANANDNOTD),.C(BNANDNOTCNANDD),.D(OUTPUT)); // (A'*B')+(A*D')+(B*C'*D)
        
    assign F1 = OUTPUT;
    
endmodule

// Part3

module mux81(S0,S1,S2,D,F);

    //Inputs
    input S0,S1,S2,D;
    
    //Outputs
    output F;

    assign F = ((((!S0)&(!S1)&(!S2))&1'b1) |
                (((!S0)&(!S1)&( S2))&D)    |
                (((!S0)&( S1)&(!S2))&D)    |
                (((!S0)&( S1)&( S2))&1'b0) |
                ((( S0)&(!S1)&(!S2))&!D)   |
                ((( S0)&(!S1)&( S2))&1'b1) |
                ((( S0)&( S1)&(!S2))&1'b1)    |
                ((( S0)&( S1)&( S2))&!D));

endmodule

// Part4

module decoder38(A,B,C,F0,F1,F2,F3,F4,F5,F6,F7);

    //Inputs
    input A,B,C;
    
    //Outputs
    output F0,F1,F2,F3,F4,F5,F6,F7;

    assign F0 = ~A & ~B & ~C;
    assign F1 = ~A & ~B &  C;
    assign F2 = ~A &  B & ~C;
    assign F3 = ~A &  B &  C;
    assign F4 =  A & ~B & ~C;
    assign F5 =  A & ~B &  C;
    assign F6 =  A &  B & ~C;
    assign F7 =  A &  B &  C;

endmodule

module decoderf2(A,B,C,F);
    input A,B,C;
    output F;

    // Intermediate Wires
        wire F0,F1,F2,F3,F4,F5,F6,F7,OUTPUT;

    decoder38 decoder1(A,B,C,F0,F1,F2,F3,F4,F5,F6,F7);
    
    or_gate2 orgate1(F1,F3,F6,OUTPUT);

    assign F =  OUTPUT;

endmodule

module decoderf3(A,B,C,F);
    input A,B,C;
    output F;

    // Intermediate Wires
        wire F0,F1,F2,F3,F4,F5,F6,F7,OUTPUT;

        decoder38 decoder2(A,B,C,F0,F1,F2,F3,F4,F5,F6,F7);
    
    or_gate2 orgate2(F3,F4,F7,OUTPUT);

    assign F =  OUTPUT;

endmodule


module experiment2(A,B,C,D,F1,F2,F3,F4F2,F4F3);
    
    //Inputs
    input A,B,C,D;

    //Outputs
    output F1,F2,F3,F4F2,F4F3;
    
    // Intermediate Wires

        wire P1;
        wire P2;
        wire P3;
        wire P4F2;
        wire P4F3;

    //Part1 
    
    part1 PART1DESIGN(.A(A),.B(B),.C(C),.D(D),.F1(P1));
    assign F1 = P1;
    
    //Part2 
    
    part2 PART2DESIGN(.A(A),.B(B),.C(C),.D(D),.F1(P2));
    assign F2 = P2;
    
    //Part3
    
    mux81 PART3DESIGN(A,B,C,D,P3);
    assign F3 = P3;

    //Part4 
    
    decoderf2 PART3F2DESIGN(A,B,C,P4F2);
    decoderf3 PART3F3DESIGN(A,B,C,P4F3);
    assign F4F2 = P4F2;
    assign F4F3 = P4F3;
    
endmodule
    