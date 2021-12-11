// push constant 5
   @5
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// neg
   @SP
   M=M-1
   A=M
   D=M
   D=-D
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
// neg
   @SP
   M=M-1
   A=M
   D=M
   D=-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 255
   @255
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// neg
   @SP
   M=M-1
   A=M
   D=M
   D=-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
(END)
   @END
   0;JMP
