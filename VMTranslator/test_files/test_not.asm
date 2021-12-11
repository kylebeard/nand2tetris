// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// not
   @SP
   M=M-1
   A=M
   D=M
   D=!D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// not
   @SP
   M=M-1
   A=M
   D=M
   D=!D
   @SP
   A=M
   M=D
   @SP
   M=M+1
(END)
   @END
   0;JMP
