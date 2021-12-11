// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 2
   @2
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// and
   @SP
   M=M-1
   A=M
   D=M
   @arg1
   M=D
   @SP
   M=M-1
   A=M
   D=M
   @arg1
   D=D&M
   @SP
   A=M
   M=D
   @SP
   M=M+1
(END)
   @END
   0;JMP
