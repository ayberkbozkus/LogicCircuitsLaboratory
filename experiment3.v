`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 23:00:43
// Design Name: 
// Module Name: experiment3
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

module and_gate3(A,B,C,OUT);
    //Inputs
    input A,B,C;
    //Outputs
    output OUT;
    assign OUT = A&B&C;
endmodule

module and_gate5(A,B,C,D,E,OUT);
    //Inputs
    input A,B,C,D,E;
    //Outputs
    output OUT;
    assign OUT = A&B&C&D&E;
endmodule

module or_gate(A,B,C);
    //Inputs
    input A,B;
    //Outputs
    output C;
    assign C = A | B;
endmodule

module or_gate6(A,B,C,D,E,F,OUT);
    //Inputs
    input A,B,C,D,E,F;
    //Outputs
    output OUT;
    assign OUT = A|B|C|D|E|F;
endmodule

module not_gate(A,B);
    //Inputs
    input A;
    //Outputs
    output B;
    assign B = ~A;
endmodule

module xor_gate(A,B,C);
    //Inputs
    input A,B;
    //Outputs
    output C;
    assign C = ~A&B | A&~B;
endmodule

module xor_gate_16bit(A,Cin,Output);
    //Inputs
    input [15:0] A;
    input Cin;
    //Outputs
    output [15:0] Output;

    xor_gate Sum(.A(A[0]),.B(Cin),.C(Output[0]));
    xor_gate Sum1(.A(A[1]),.B(Cin),.C(Output[1]));
    xor_gate Sum2(.A(A[2]),.B(Cin),.C(Output[2]));
    xor_gate Sum3(.A(A[3]),.B(Cin),.C(Output[3]));
    xor_gate Sum4(.A(A[4]),.B(Cin),.C(Output[4]));
    xor_gate Sum5(.A(A[5]),.B(Cin),.C(Output[5]));
    xor_gate Sum6(.A(A[6]),.B(Cin),.C(Output[6]));
    xor_gate Sum7(.A(A[7]),.B(Cin),.C(Output[7]));
    xor_gate Sum8(.A(A[8]),.B(Cin),.C(Output[8]));
    xor_gate Sum9(.A(A[9]),.B(Cin),.C(Output[9]));
    xor_gate Sum10(.A(A[10]),.B(Cin),.C(Output[10]));
    xor_gate Sum11(.A(A[11]),.B(Cin),.C(Output[11]));
    xor_gate Sum12(.A(A[12]),.B(Cin),.C(Output[12]));
    xor_gate Sum13(.A(A[13]),.B(Cin),.C(Output[13]));
    xor_gate Sum14(.A(A[14]),.B(Cin),.C(Output[14]));
    xor_gate Sum15(.A(A[15]),.B(Cin),.C(Output[15]));
    

endmodule

// Part2
module half_adder(A,B,C,S);
    //Inputs
    input A,B;
    
    //Outputs
    output C,S;
    
    //Intermediate Wires
        wire ANORB;
        wire AANDB;
    //S = A ⊕ B, C = A*B
    xor_gate Sum(.A(A),.B(B),.C(S));
    and_gate Carry(.A(A),.B(B),.C(C));
endmodule      
//Part3
module full_adder(A,B,Cin,Cout,S);
    //Inputs
    input A,B,Cin;
    
    //Outputs
    output Cout,S;

    //Intermediate Wires
    wire HA1S;
    wire HA1C;
    wire HA2C;
    
    // S = A ⊕ B ⊕ Cin, Cout = A*B + Cin(A ⊕ B)
    half_adder HA1(.A(A), .B(B), .C(HA1C), .S(HA1S));
    half_adder HA2(.A(HA1S), .B(Cin), .C(HA2C), .S(S));
    or_gate X(.A(HA1C), .B(HA2C), .C(Cout));
 endmodule

//Part4  
module four_bit_full_adder(A,B,Cin,Cout,S);
    //Inputs
    input [3:0] A;
    input [3:0] B;
    input Cin;
    //Outputs
    output [3:0] S;    
    output Cout;
    
    //Intermediate Wires
    wire [2:0] Carries;
    
    //four-bit-adder
    full_adder first(.A(A[0]),.B(B[0]),.Cin(Cin),.Cout(Carries[0]),.S(S[0]));
    full_adder second(.A(A[1]),.B(B[1]),.Cin(Carries[0]),.Cout(Carries[1]),.S(S[1]));
    full_adder third(.A(A[2]),.B(B[2]),.Cin(Carries[1]),.Cout(Carries[2]),.S(S[2]));
    full_adder fourth(.A(A[3]),.B(B[3]),.Cin(Carries[2]),.Cout(Cout),.S(S[3]));
endmodule

//Part5
module sixteen_bit_full_adder(A,B,Cin,Cout,S);
    input [15:0] A;
    input [15:0] B;
    input Cin;
    //Outputs
    output [15:0] S;    
    output Cout;
    
    //Intermediate Wires
        wire [2:0] Carries;
    
    //four-bit-adder
   four_bit_full_adder first(.A(A[3:0]),.B(B[3:0]),.Cin(Cin),.Cout(Carries[0]),.S(S[3:0]));
   four_bit_full_adder second(.A(A[7:4]),.B(B[7:4]),.Cin(Carries[0]),.Cout(Carries[1]),.S(S[7:4]));
   four_bit_full_adder third(.A(A[11:8]),.B(B[11:8]),.Cin(Carries[1]),.Cout(Carries[2]),.S(S[11:8]));
   four_bit_full_adder fourth(.A(A[15:12]),.B(B[15:12]),.Cin(Carries[2]),.Cout(Cout),.S(S[15:12]));
endmodule

//part6
module sixteen_bit_full_adder_subtractor(A,B,Cin,Cout,Output,S,flag);
    input [15:0] A;
    input [15:0] B;
    input Cin;
    input S;
    //Outputs
    output [15:0] Output;    
    output Cout;
    output flag;

    //Intermediate Wires
    wire Carries;
    wire [15:0]B_xor;
    wire NOTA;
    wire NOTB;
    wire NOTS;
    wire NOTCOUT;
    wire NOTCIN;
    wire NOTOUTPUT;
    wire and1;
    wire and2;
    wire and3;
    wire and4;
    wire and5;
    wire and6;
    

    xor_gate_16bit xor1(B[15:0],Cin,B_xor[15:0]);
    
     //four-bit-adder
    sixteen_bit_full_adder first(.A(A[15:0]),.B(B_xor[15:0]),.Cin(Cin),.Cout(Cout),.S(Output[15:0]));

    not_gate not1(A[15],NOTA);
    not_gate not2(B[15],NOTB);
    not_gate not3(S,NOTS);
    not_gate not4(Cout,NOTCOUT);
    not_gate not5(Cin,NOTCIN);
    not_gate not6(Output[15],NOTOUTPUT);

    and_gate3 and11(NOTS,NOTCIN,Cout,and1);
    and_gate3 and12(NOTS,Cin,NOTCOUT,and2);
    and_gate5 and13(S,NOTCIN,NOTA,NOTB,Output[15],and3);
    and_gate5 and14(S,NOTCIN,A[15],B[15],NOTOUTPUT,and4);
    and_gate5 and15(S,Cin,NOTA,B[15],Output[15],and5);
    and_gate5 and16(S,Cin,A[15],NOTB,NOTOUTPUT,and6);
    or_gate6 or1(and1,and2,and3,and4,and5,and6,flag);

endmodule


module part7(A,B,Cout,Output);
    input [15:0] A;
    input [15:0] B;
    //Outputs
    output [15:0] Output;    
    output Cout;
   
    //Intermediate Wires
    wire Carries1;
    wire Carries2;
    wire Csub = 1'b1;
    wire Cadd = 1'b0;
    wire [15:0] AB; 
    wire [15:0] AABB; 
    wire flag;
    wire CARRY1NOT;

    
     //four-bit-adder
    sixteen_bit_full_adder_subtractor first(.A(A[15:0]),.B(B[15:0]),.Cin(Csub),.Cout(Carries1),.Output(AB[15:0]),.flag(flag));
    not_gate NOT1(Carries1, CARRY1NOT);
    sixteen_bit_full_adder second(.A(AB[15:0]),.B(AB[15:0]),.Cin(CARRY1NOT),.Cout(Carries2),.S(AABB[15:0]));
    sixteen_bit_full_adder third(.A(A[15:0]),.B(AABB[15:0]),.Cin(Carries2),.Cout(Cout),.S(Output[15:0]));

endmodule

module experiment3 (A,B,M,N,Cin,X,Y,Sign,flag,halfadderout,halfadderoutput,fulladderout,fulladderoutput,fourbitadderout,fourbitoutput,sixteenOut,sixteenOutput,sixteensubtOut,sixteensubtOutput,part7Out,part7Output);

    input [15:0] A;
    input [15:0] B;
    input X,Y,Cin; //Half adder
    input [3:0] M;
    input [3:0] N;
    input Sign;
    
    output flag;
    output halfadderout;
    output halfadderoutput;
    output fulladderout;
    output fulladderoutput;
    output fourbitadderout;
    output [3:0]fourbitoutput;
    output sixteenOut;
    output [15:0] sixteenOutput;
    output sixteensubtOut;
    output [15:0] sixteensubtOutput;
    output part7Out;
    output [15:0] part7Output;

    half_adder halfadder(X,Y,halfadderout,halfadderoutput);
    full_adder full_adder(X,Y,Cin,fulladderout,fulladderoutput);
    four_bit_full_adder four_bit_full_adder(M,N,Cin,fourbitadderout,fourbitoutput);
    sixteen_bit_full_adder sixteen_bit_full_adder(A,B,Cin,sixteenOut,sixteenOutput);
    sixteen_bit_full_adder_subtractor sixteen_bit_full_adder_subtractor(A,B,Cin,sixteensubtOut,sixteensubtOutput,Sign,flag);
    part7 part7(A,B,part7Out,part7Output);
    
endmodule