// push constant 5
   @5
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 5
   @5
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @CMP_TRUE0
   D;JEQ
   D=0
   @CMP_PUSH_D0
   0;JMP
(CMP_TRUE0)
   D=-1
(CMP_PUSH_D0)
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @CMP_TRUE1
   D;JEQ
   D=0
   @CMP_PUSH_D1
   0;JMP
(CMP_TRUE1)
   D=-1
(CMP_PUSH_D1)
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 103
   @103
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 11
   @11
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @CMP_TRUE2
   D;JEQ
   D=0
   @CMP_PUSH_D2
   0;JMP
(CMP_TRUE2)
   D=-1
(CMP_PUSH_D2)
   @SP
   A=M
   M=D
   @SP
   M=M+1
(END)
   @END
   0;JMP
