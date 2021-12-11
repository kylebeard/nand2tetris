// push constant 2050
   @2050
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop pointer 0
   @SP
   M=M-1
   A=M
   D=M
   @THIS
   M=D
// push constant 3010
   @3010
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 0
   @0
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   D=D+M
   @addr
   M=D
   @SP
   M=M-1
   A=M
   D=M
   @addr
   A=M
   M=D
// push constant 2
   @2
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 3
   @3
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   D=D+M
   @addr
   M=D
   @SP
   M=M-1
   A=M
   D=M
   @addr
   A=M
   M=D
// push constant 3020
   @3020
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop pointer 0
   @SP
   M=M-1
   A=M
   D=M
   @THIS
   M=D
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 0
   @0
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   D=D+M
   @addr
   M=D
   @SP
   M=M-1
   A=M
   D=M
   @addr
   A=M
   M=D
// push pointer 0
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push pointer 1
   @THAT
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
(END)
   @END
   0;JMP
