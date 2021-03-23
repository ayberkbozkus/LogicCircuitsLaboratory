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
    input A;
    input B;
    input C;
    input D;
    
    //Outputs
    output F1;
    
    // Intermediate Wires
        wire NOTA;
        wire NOTB;
        wire NOTC;
        wire NOTD;
        wire NOTAANDNOTB;
        wire AANDNOTD;
        wire BANDNOTCANDNOTD;
        wire OUTPUT;
    
    //(A'*B')+(A*D')+(B*C'*D')
    
    not_gate NOT1(.A(A),.B(NOTA)); // A'
    not_gate NOT2(.A(B),.B(NOTB)); // B'
    not_gate NOT3(.A(C),.B(NOTC)); // C'
    not_gate NOT4(.A(D),.B(NOTD)); // D'
    
    and_gate AND1(.A(NOTA),.B(NOTB),.C(NOTANOTB)); // A'*B'
    and_gate AND2(.A(A),.B(NOTD),.C(AANDNOTD)); // A*D'
    and_gate2 AND4(.A(B),.B(NOTC),.C(NOTD),.D(BANDNOTCANDNOTD)); // B*C'*D'
    
    or_gate2 OR2(.A(NOTANOTB),.B(AANDNOTD),.C(BANDNOTCANDNOTD),.D(OUTPUT)); // (A'*B')+(A*D')+(B*C'*D')
    
    assign F1 = OUTPUT;
    
endmodule

// Part2

module part2(A,B,C,D,F1);
    //Inputs
    input A;
    input B;
    input C;
    input D;
    
    //Outputs
    output F1;
    
    // Intermediate Wires
        wire NOTA;
        wire NOTB;
        wire NOTC;
        wire NOTD;
        wire NOTANANDNOTB;
        wire ANANDNOTD;
        wire BNANDNOTCNANDNOTD;
        wire OUTPUT;
        
        // ((A'*B')'*(A*D')'*(B*C'*D')')'
        
    not_gate NOT1(.A(A),.B(NOTA)); // A'
    not_gate NOT2(.A(B),.B(NOTB)); // B'
    not_gate NOT3(.A(C),.B(NOTC)); // C'
    not_gate NOT4(.A(D),.B(NOTD)); // D'
        
    nand_gate NAND1(.A(NOTA),.B(NOTB),.C(NOTANANDNOTB)); // (A'*B')'
    nand_gate NAND2(.A(A),.B(NOTD),.C(ANANDNOTD)); // (A*D')'
    nand_gate2 NAND3(.A(B),.B(NOTC),.C(NOTD),.D(BNANDNOTCNANDNOTD)); // (B*C'*D')'
        
    nand_gate2 NAND4(.A(NOTANANDNOTB),.B(ANANDNOTD),.C(BNANDNOTCNANDNOTD),.D(OUTPUT)); // (A'*B')+(A*D')+(B*C'*D')
        
    assign F1 = OUTPUT;
    
endmodule

// Part3

module part3(A,B);
    //Inputs
    input A;
    //Outputs
    output B;
    assign B = ~A;
endmodule

// Part4

module part4(A,B);
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
    output F3,
    output F4
    );
        wire P1;
        wire P2;
        wire P3;
        wire P4;
    //Part1 
    
    part1 PART1DESIGN(.A(A),.B(B),.C(C),.D(D),.F1(P1)); // D'
    assign F1 = P1;
    
    //Part2 
    
    part2 PART2DESIGN(.A(A),.B(B),.C(C),.D(D),.F1(P2)); // D'
    assign F2 = P2;
    
    //Part3
    
    
    //Part4 
    
    
    
endmodule