// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop static 0
   @SP
   M=M-1
   A=M
   D=M
   @test_static.0
   M=D
// push constant 2
   @2
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop static 1
   @SP
   M=M-1
   A=M
   D=M
   @test_static.1
   M=D
// push static 0
   @test_static.0
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @test_static.1
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// add
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
   D=D+M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop static 2
   @SP
   M=M-1
   A=M
   D=M
   @test_static.2
   M=D
(END)
   @END
   0;JMP
