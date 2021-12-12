   @256
   D=A
   @SP
   M=D
// call sys.init 0
   @0
   D=A
   @R13
   M=D
   @sys.init
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL1
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL1)
(GLOBAL_EQ)
   @R15
   M=D
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @EQ_TRUE
   D;JEQ
   D=0
   @EQ_PUSH_D
   0;JMP
(EQ_TRUE)
   D=-1
(EQ_PUSH_D)
   @SP
   A=M
   M=D
   @SP
   M=M+1
   @R15
   A=M
   0;JMP
(GLOBAL_LT)
   @R15
   M=D
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @LT_TRUE
   D;JLT
   D=0
   @LT_PUSH_D
   0;JMP
(LT_TRUE)
   D=-1
(LT_PUSH_D)
   @SP
   A=M
   M=D
   @SP
   M=M+1
   @R15
   A=M
   0;JMP
(GLOBAL_GT)
   @R15
   M=D
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @GT_TRUE
   D;JGT
   D=0
   @GT_PUSH_D
   0;JMP
(GT_TRUE)
   D=-1
(GT_PUSH_D)
   @SP
   A=M
   M=D
   @SP
   M=M+1
   @R15
   A=M
   0;JMP
(SAVE_CALLER_STATE)
   @SP
   A=M
   M=D
   @SP
   M=M+1
   @LCL
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   @ARG
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   @THAT
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
   @SP
   D=M
   @5
   D=D-A
   @R13
   D=D-M
   @ARG
   M=D
   @SP
   D=M
   @LCL
   M=D
   @R14
   A=M
   0;JMP
(RETURN)
   @LCL
   D=M
   @endframe
   M=D
   @5
   D=D-A
   A=D
   D=M
   @retAddr
   M=D
   @SP
   M=M-1
   A=M
   D=M
   @ARG
   A=M
   M=D
   @ARG
   D=M
   @SP
   M=D+1
   @endframe
   D=M
   @1
   D=D-A
   A=D
   D=M
   @THAT
   M=D
   @endframe
   D=M
   @2
   D=D-A
   A=D
   D=M
   @THIS
   M=D
   @endframe
   D=M
   @3
   D=D-A
   A=D
   D=M
   @ARG
   M=D
   @endframe
   D=M
   @4
   D=D-A
   A=D
   D=M
   @LCL
   M=D
   @retAddr
   A=M
   0;JMP
// New File: String
// function string.new 0
(string.new)
   @SP
   A=M
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call memory.alloc 1
   @1
   D=A
   @R13
   M=D
   @memory.alloc
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL2
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL2)
// pop pointer 0
   @SP
   M=M-1
   A=M
   D=M
   @THIS
   M=D
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT0
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT0)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @String.memory.alloc$if_true0
   D;JNE
// goto if_false0
   @String.memory.alloc$if_false0
   0;JMP
// label if_true0
(String.memory.alloc$if_true0)
// push constant 14
   @14
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL3
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL3)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(String.sys.error$if_false0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT0
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT0)
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$if_true1
   D;JNE
// goto if_false1
   @String.sys.error$if_false1
   0;JMP
// label if_true1
(String.sys.error$if_true1)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL4
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL4)
// pop this 1
   @1
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
// label if_false1
(String.array.new$if_false1)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 2
   @2
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
// Return
   @RETURN
   0;JMP
// function string.dispose 0
(string.dispose)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push this 0
   @0
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT1
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT1)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @String.array.new$if_true0
   D;JNE
// goto if_false0
   @String.array.new$if_false0
   0;JMP
// label if_true0
(String.array.new$if_true0)
// push this 1
   @1
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.dispose 1
   @1
   D=A
   @R13
   M=D
   @array.dispose
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL5
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL5)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(String.array.dispose$if_false0)
// push pointer 0
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call memory.dealloc 1
   @1
   D=A
   @R13
   M=D
   @memory.dealloc
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL6
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL6)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.length 0
(string.length)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.charat 0
(string.charat)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT1
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT1)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT2
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT2)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ0
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ0)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @String.memory.dealloc$if_true0
   D;JNE
// goto if_false0
   @String.memory.dealloc$if_false0
   0;JMP
// label if_true0
(String.memory.dealloc$if_true0)
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL7
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL7)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(String.sys.error$if_false0)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 1
   @1
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.setcharat 0
(string.setcharat)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT2
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT2)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT3
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT3)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ1
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ1)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$if_true0
   D;JNE
// goto if_false0
   @String.sys.error$if_false0
   0;JMP
// label if_true0
(String.sys.error$if_true0)
// push constant 16
   @16
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL8
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL8)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(String.sys.error$if_false0)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 1
   @1
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 2
   @2
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.appendchar 0
(string.appendchar)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 0
   @0
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ2
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ2)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$if_true0
   D;JNE
// goto if_false0
   @String.sys.error$if_false0
   0;JMP
// label if_true0
(String.sys.error$if_true0)
// push constant 17
   @17
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL9
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL9)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(String.sys.error$if_false0)
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 1
   @1
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 2
   @2
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
// Return
   @RETURN
   0;JMP
// function string.eraselastchar 0
(string.eraselastchar)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
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
// eq
   @RET_ADDRESS_EQ3
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ3)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$if_true0
   D;JNE
// goto if_false0
   @String.sys.error$if_false0
   0;JMP
// label if_true0
(String.sys.error$if_true0)
// push constant 18
   @18
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL10
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL10)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(String.sys.error$if_false0)
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 2
   @2
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.intvalue 5
(string.intvalue)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
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
// eq
   @RET_ADDRESS_EQ4
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ4)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$if_true0
   D;JNE
// goto if_false0
   @String.sys.error$if_false0
   0;JMP
// label if_true0
(String.sys.error$if_true0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// label if_false0
(String.sys.error$if_false0)
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
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 1
   @1
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 45
   @45
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ5
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ5)
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$if_true1
   D;JNE
// goto if_false1
   @String.sys.error$if_false1
   0;JMP
// label if_true1
(String.sys.error$if_true1)
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
// pop local 4
   @4
   D=A
   @index
   M=D
   @LCL
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
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label if_false1
(String.sys.error$if_false1)
// label while_exp0
(String.sys.error$while_exp0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT3
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT3)
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$while_end0
   D;JNE
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 1
   @1
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT4
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT4)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 9
   @9
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT4
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT4)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
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
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true2
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$if_true2
   D;JNE
// goto if_false2
   @String.sys.error$if_false2
   0;JMP
// label if_true2
(String.sys.error$if_true2)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 10
   @10
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.multiply 2
   @2
   D=A
   @R13
   M=D
   @math.multiply
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL11
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL11)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label if_false2
(String.math.multiply$if_false2)
// goto while_exp0
   @String.math.multiply$while_exp0
   0;JMP
// label while_end0
(String.math.multiply$while_end0)
// push local 4
   @4
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true3
   @SP
   M=M-1
   A=M
   D=M
   @String.math.multiply$if_true3
   D;JNE
// goto if_false3
   @String.math.multiply$if_false3
   0;JMP
// label if_true3
(String.math.multiply$if_true3)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// label if_false3
(String.math.multiply$if_false3)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.setint 4
(string.setint)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push this 0
   @0
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
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
// eq
   @RET_ADDRESS_EQ6
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ6)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @String.math.multiply$if_true0
   D;JNE
// goto if_false0
   @String.math.multiply$if_false0
   0;JMP
// label if_true0
(String.math.multiply$if_true0)
// push constant 19
   @19
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL12
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL12)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(String.sys.error$if_false0)
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL13
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL13)
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT5
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT5)
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @String.array.new$if_true1
   D;JNE
// goto if_false1
   @String.array.new$if_false1
   0;JMP
// label if_true1
(String.array.new$if_true1)
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
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// pop argument 1
   @1
   D=A
   @index
   M=D
   @ARG
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
// label if_false1
(String.array.new$if_false1)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// label while_exp0
(String.array.new$while_exp0)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT5
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT5)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @String.array.new$while_end0
   D;JNE
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 10
   @10
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.divide 2
   @2
   D=A
   @R13
   M=D
   @math.divide
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL14
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL14)
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 10
   @10
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.multiply 2
   @2
   D=A
   @R13
   M=D
   @math.multiply
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL15
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL15)
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 1
   @1
   D=A
   @index
   M=D
   @ARG
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
// goto while_exp0
   @String.math.multiply$while_exp0
   0;JMP
// label while_end0
(String.math.multiply$while_end0)
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true2
   @SP
   M=M-1
   A=M
   D=M
   @String.math.multiply$if_true2
   D;JNE
// goto if_false2
   @String.math.multiply$if_false2
   0;JMP
// label if_true2
(String.math.multiply$if_true2)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 45
   @45
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label if_false2
(String.math.multiply$if_false2)
// push this 0
   @0
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT6
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT6)
// if-goto if_true3
   @SP
   M=M-1
   A=M
   D=M
   @String.math.multiply$if_true3
   D;JNE
// goto if_false3
   @String.math.multiply$if_false3
   0;JMP
// label if_true3
(String.math.multiply$if_true3)
// push constant 19
   @19
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL16
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL16)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false3
(String.sys.error$if_false3)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// eq
   @RET_ADDRESS_EQ7
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ7)
// if-goto if_true4
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$if_true4
   D;JNE
// goto if_false4
   @String.sys.error$if_false4
   0;JMP
// label if_true4
(String.sys.error$if_true4)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 1
   @1
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 2
   @2
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
// goto if_end4
   @String.sys.error$if_end4
   0;JMP
// label if_false4
(String.sys.error$if_false4)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 2
   @2
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
// label while_exp1
(String.sys.error$while_exp1)
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT7
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT7)
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
// if-goto while_end1
   @SP
   M=M-1
   A=M
   D=M
   @String.sys.error$while_end1
   D;JNE
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 1
   @1
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push this 2
   @2
   D=A
   @index
   M=D
   @THIS
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop this 2
   @2
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
// goto while_exp1
   @String.sys.error$while_exp1
   0;JMP
// label while_end1
(String.sys.error$while_end1)
// label if_end4
(String.sys.error$if_end4)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.dispose 1
   @1
   D=A
   @R13
   M=D
   @array.dispose
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL17
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL17)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.newline 0
(string.newline)
   @SP
   A=M
// push constant 128
   @128
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.backspace 0
(string.backspace)
   @SP
   A=M
// push constant 129
   @129
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function string.doublequote 0
(string.doublequote)
   @SP
   A=M
// push constant 34
   @34
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// New File: Math
// function math.init 1
(math.init)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 16
   @16
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL18
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL18)
// pop static 1
   @SP
   M=M-1
   A=M
   D=M
   @Math.1
   M=D
// push constant 16
   @16
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL19
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL19)
// pop static 0
   @SP
   M=M-1
   A=M
   D=M
   @Math.0
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Math.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// label while_exp0
(Math.array.new$while_exp0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT8
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT8)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Math.array.new$while_end0
   D;JNE
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Math.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Math.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Math.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// goto while_exp0
   @Math.array.new$while_exp0
   0;JMP
// label while_end0
(Math.array.new$while_end0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function math.abs 0
(math.abs)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT9
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT9)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Math.array.new$if_true0
   D;JNE
// goto if_false0
   @Math.array.new$if_false0
   0;JMP
// label if_true0
(Math.array.new$if_true0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// pop argument 0
   @0
   D=A
   @index
   M=D
   @ARG
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
// label if_false0
(Math.array.new$if_false0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function math.multiply 5
(math.multiply)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT10
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT10)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT6
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT6)
// and
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT7
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT7)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT11
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT11)
// and
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 4
   @4
   D=A
   @index
   M=D
   @LCL
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
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.abs 1
   @1
   D=A
   @R13
   M=D
   @math.abs
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL20
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL20)
// pop argument 0
   @0
   D=A
   @index
   M=D
   @ARG
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
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.abs 1
   @1
   D=A
   @R13
   M=D
   @math.abs
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL21
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL21)
// pop argument 1
   @1
   D=A
   @index
   M=D
   @ARG
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
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT12
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT12)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true0
   D;JNE
// goto if_false0
   @Math.math.abs$if_false0
   0;JMP
// label if_true0
(Math.math.abs$if_true0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 0
   @0
   D=A
   @index
   M=D
   @ARG
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
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 1
   @1
   D=A
   @index
   M=D
   @ARG
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
// label if_false0
(Math.math.abs$if_false0)
// label while_exp0
(Math.math.abs$while_exp0)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT13
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT13)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$while_end0
   D;JNE
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Math.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
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
// eq
   @RET_ADDRESS_EQ8
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ8)
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
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true1
   D;JNE
// goto if_false1
   @Math.math.abs$if_false1
   0;JMP
// label if_true1
(Math.math.abs$if_true1)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Math.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// label if_false1
(Math.math.abs$if_false1)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 0
   @0
   D=A
   @index
   M=D
   @ARG
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
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp0
   @Math.math.abs$while_exp0
   0;JMP
// label while_end0
(Math.math.abs$while_end0)
// push local 4
   @4
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true2
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true2
   D;JNE
// goto if_false2
   @Math.math.abs$if_false2
   0;JMP
// label if_true2
(Math.math.abs$if_true2)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label if_false2
(Math.math.abs$if_false2)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function math.divide 4
(math.divide)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// eq
   @RET_ADDRESS_EQ9
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ9)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true0
   D;JNE
// goto if_false0
   @Math.math.abs$if_false0
   0;JMP
// label if_true0
(Math.math.abs$if_true0)
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL22
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL22)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(Math.sys.error$if_false0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT14
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT14)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT8
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT8)
// and
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT9
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT9)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT15
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT15)
// and
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.abs 1
   @1
   D=A
   @R13
   M=D
   @math.abs
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL23
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL23)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.abs 1
   @1
   D=A
   @R13
   M=D
   @math.abs
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL24
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL24)
// pop argument 0
   @0
   D=A
   @index
   M=D
   @ARG
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
// label while_exp0
(Math.math.abs$while_exp0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT16
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT16)
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// and
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$while_end0
   D;JNE
// push constant 32767
   @32767
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT17
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT17)
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true1
   D;JNE
// goto if_false1
   @Math.math.abs$if_false1
   0;JMP
// label if_true1
(Math.math.abs$if_true1)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT10
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT10)
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// if-goto if_true2
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true2
   D;JNE
// goto if_false2
   @Math.math.abs$if_false2
   0;JMP
// label if_true2
(Math.math.abs$if_true2)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label if_false2
(Math.math.abs$if_false2)
// label if_false1
(Math.math.abs$if_false1)
// goto while_exp0
   @Math.math.abs$while_exp0
   0;JMP
// label while_end0
(Math.math.abs$while_end0)
// label while_exp1
(Math.math.abs$while_exp1)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT11
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT11)
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
// if-goto while_end1
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$while_end1
   D;JNE
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT12
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT12)
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
// if-goto if_true3
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true3
   D;JNE
// goto if_false3
   @Math.math.abs$if_false3
   0;JMP
// label if_true3
(Math.math.abs$if_true3)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Math.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 1
   @Math.1
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 0
   @0
   D=A
   @index
   M=D
   @ARG
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
// label if_false3
(Math.math.abs$if_false3)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp1
   @Math.math.abs$while_exp1
   0;JMP
// label while_end1
(Math.math.abs$while_end1)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true4
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true4
   D;JNE
// goto if_false4
   @Math.math.abs$if_false4
   0;JMP
// label if_true4
(Math.math.abs$if_true4)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// label if_false4
(Math.math.abs$if_false4)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function math.sqrt 4
(math.sqrt)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT18
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT18)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.abs$if_true0
   D;JNE
// goto if_false0
   @Math.math.abs$if_false0
   0;JMP
// label if_true0
(Math.math.abs$if_true0)
// push constant 4
   @4
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL25
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL25)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(Math.sys.error$if_false0)
// push constant 7
   @7
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label while_exp0
(Math.sys.error$while_exp0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT13
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT13)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Math.sys.error$while_end0
   D;JNE
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Math.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.multiply 2
   @2
   D=A
   @R13
   M=D
   @math.multiply
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL26
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL26)
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT14
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT14)
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
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT19
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT19)
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
// and
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.multiply$if_true1
   D;JNE
// goto if_false1
   @Math.math.multiply$if_false1
   0;JMP
// label if_true1
(Math.math.multiply$if_true1)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// label if_false1
(Math.math.multiply$if_false1)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp0
   @Math.math.multiply$while_exp0
   0;JMP
// label while_end0
(Math.math.multiply$while_end0)
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function math.max 0
(math.max)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT15
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT15)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.multiply$if_true0
   D;JNE
// goto if_false0
   @Math.math.multiply$if_false0
   0;JMP
// label if_true0
(Math.math.multiply$if_true0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 1
   @1
   D=A
   @index
   M=D
   @ARG
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
// label if_false0
(Math.math.multiply$if_false0)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function math.min 0
(math.min)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT20
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT20)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Math.math.multiply$if_true0
   D;JNE
// goto if_false0
   @Math.math.multiply$if_false0
   0;JMP
// label if_true0
(Math.math.multiply$if_true0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 1
   @1
   D=A
   @index
   M=D
   @ARG
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
// label if_false0
(Math.math.multiply$if_false0)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// New File: Array
// function array.new 0
(array.new)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT16
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT16)
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
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Array.math.multiply$if_true0
   D;JNE
// goto if_false0
   @Array.math.multiply$if_false0
   0;JMP
// label if_true0
(Array.math.multiply$if_true0)
// push constant 2
   @2
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL27
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL27)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(Array.sys.error$if_false0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call memory.alloc 1
   @1
   D=A
   @R13
   M=D
   @memory.alloc
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL28
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL28)
// Return
   @RETURN
   0;JMP
// function array.dispose 0
(array.dispose)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// push pointer 0
   @THIS
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call memory.dealloc 1
   @1
   D=A
   @R13
   M=D
   @memory.dealloc
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL29
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL29)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// New File: Main
// function main.main 4
(main.main)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 18
   @18
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.new 1
   @1
   D=A
   @R13
   M=D
   @string.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL30
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL30)
// push constant 72
   @72
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL31
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL31)
// push constant 111
   @111
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL32
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL32)
// push constant 119
   @119
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL33
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL33)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL34
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL34)
// push constant 109
   @109
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL35
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL35)
// push constant 97
   @97
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL36
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL36)
// push constant 110
   @110
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL37
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL37)
// push constant 121
   @121
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL38
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL38)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL39
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL39)
// push constant 110
   @110
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL40
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL40)
// push constant 117
   @117
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL41
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL41)
// push constant 109
   @109
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL42
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL42)
// push constant 98
   @98
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL43
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL43)
// push constant 101
   @101
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL44
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL44)
// push constant 114
   @114
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL45
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL45)
// push constant 115
   @115
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL46
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL46)
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL47
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL47)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL48
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL48)
// call keyboard.readint 1
   @1
   D=A
   @R13
   M=D
   @keyboard.readint
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL49
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL49)
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL50
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL50)
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// label while_exp0
(Main.array.new$while_exp0)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT21
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT21)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Main.array.new$while_end0
   D;JNE
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.new 1
   @1
   D=A
   @R13
   M=D
   @string.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL51
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL51)
// push constant 69
   @69
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL52
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL52)
// push constant 110
   @110
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL53
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL53)
// push constant 116
   @116
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL54
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL54)
// push constant 101
   @101
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL55
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL55)
// push constant 114
   @114
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL56
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL56)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL57
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL57)
// push constant 116
   @116
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL58
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL58)
// push constant 104
   @104
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL59
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL59)
// push constant 101
   @101
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL60
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL60)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL61
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL61)
// push constant 102
   @102
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL62
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL62)
// push constant 105
   @105
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL63
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL63)
// push constant 114
   @114
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL64
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL64)
// push constant 115
   @115
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL65
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL65)
// push constant 116
   @116
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL66
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL66)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL67
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL67)
// push constant 110
   @110
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL68
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL68)
// push constant 117
   @117
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL69
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL69)
// push constant 109
   @109
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL70
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL70)
// push constant 98
   @98
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL71
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL71)
// push constant 101
   @101
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL72
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL72)
// push constant 114
   @114
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL73
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL73)
// push constant 58
   @58
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL74
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL74)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL75
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL75)
// call keyboard.readint 1
   @1
   D=A
   @R13
   M=D
   @keyboard.readint
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL76
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL76)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp0
   @Main.keyboard.readint$while_exp0
   0;JMP
// label while_end0
(Main.keyboard.readint$while_end0)
// push constant 16
   @16
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.new 1
   @1
   D=A
   @R13
   M=D
   @string.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL77
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL77)
// push constant 84
   @84
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL78
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL78)
// push constant 104
   @104
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL79
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL79)
// push constant 101
   @101
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL80
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL80)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL81
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL81)
// push constant 97
   @97
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL82
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL82)
// push constant 118
   @118
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL83
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL83)
// push constant 101
   @101
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL84
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL84)
// push constant 114
   @114
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL85
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL85)
// push constant 97
   @97
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL86
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL86)
// push constant 103
   @103
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL87
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL87)
// push constant 101
   @101
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL88
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL88)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL89
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL89)
// push constant 105
   @105
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL90
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL90)
// push constant 115
   @115
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL91
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL91)
// push constant 58
   @58
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL92
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL92)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL93
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL93)
// call output.printstring 1
   @1
   D=A
   @R13
   M=D
   @output.printstring
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL94
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL94)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.divide 2
   @2
   D=A
   @R13
   M=D
   @math.divide
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL95
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL95)
// call output.printint 1
   @1
   D=A
   @R13
   M=D
   @output.printint
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL96
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL96)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// New File: Keyboard
// function keyboard.init 0
(keyboard.init)
   @SP
   A=M
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function keyboard.keypressed 0
(keyboard.keypressed)
   @SP
   A=M
// push constant 24576
   @24576
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call memory.peek 1
   @1
   D=A
   @R13
   M=D
   @memory.peek
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL97
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL97)
// Return
   @RETURN
   0;JMP
// function keyboard.readchar 2
(keyboard.readchar)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
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
// call output.printchar 1
   @1
   D=A
   @R13
   M=D
   @output.printchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL98
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL98)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label while_exp0
(Keyboard.output.printchar$while_exp0)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// eq
   @RET_ADDRESS_EQ10
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ10)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT17
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT17)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Keyboard.output.printchar$while_end0
   D;JNE
// call keyboard.keypressed 0
   @0
   D=A
   @R13
   M=D
   @keyboard.keypressed
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL99
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL99)
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT18
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT18)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Keyboard.keyboard.keypressed$if_true0
   D;JNE
// goto if_false0
   @Keyboard.keyboard.keypressed$if_false0
   0;JMP
// label if_true0
(Keyboard.keyboard.keypressed$if_true0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// label if_false0
(Keyboard.keyboard.keypressed$if_false0)
// goto while_exp0
   @Keyboard.keyboard.keypressed$while_exp0
   0;JMP
// label while_end0
(Keyboard.keyboard.keypressed$while_end0)
// call string.backspace 0
   @0
   D=A
   @R13
   M=D
   @string.backspace
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL100
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL100)
// call output.printchar 1
   @1
   D=A
   @R13
   M=D
   @output.printchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL101
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL101)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.printchar 1
   @1
   D=A
   @R13
   M=D
   @output.printchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL102
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL102)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function keyboard.readline 5
(keyboard.readline)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 80
   @80
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.new 1
   @1
   D=A
   @R13
   M=D
   @string.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL103
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL103)
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.printstring 1
   @1
   D=A
   @R13
   M=D
   @output.printstring
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL104
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL104)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// call string.newline 0
   @0
   D=A
   @R13
   M=D
   @string.newline
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL105
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL105)
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// call string.backspace 0
   @0
   D=A
   @R13
   M=D
   @string.backspace
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL106
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL106)
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// label while_exp0
(Keyboard.string.backspace$while_exp0)
// push local 4
   @4
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Keyboard.string.backspace$while_end0
   D;JNE
// call keyboard.readchar 0
   @0
   D=A
   @R13
   M=D
   @keyboard.readchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL107
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL107)
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ11
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ11)
// pop local 4
   @4
   D=A
   @index
   M=D
   @LCL
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
// push local 4
   @4
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Keyboard.keyboard.readchar$if_true0
   D;JNE
// goto if_false0
   @Keyboard.keyboard.readchar$if_false0
   0;JMP
// label if_true0
(Keyboard.keyboard.readchar$if_true0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ12
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ12)
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Keyboard.keyboard.readchar$if_true1
   D;JNE
// goto if_false1
   @Keyboard.keyboard.readchar$if_false1
   0;JMP
// label if_true1
(Keyboard.keyboard.readchar$if_true1)
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.eraselastchar 1
   @1
   D=A
   @R13
   M=D
   @string.eraselastchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL108
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL108)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// goto if_end1
   @Keyboard.string.eraselastchar$if_end1
   0;JMP
// label if_false1
(Keyboard.string.eraselastchar$if_false1)
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL109
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL109)
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// label if_end1
(Keyboard.string.appendchar$if_end1)
// label if_false0
(Keyboard.string.appendchar$if_false0)
// goto while_exp0
   @Keyboard.string.appendchar$while_exp0
   0;JMP
// label while_end0
(Keyboard.string.appendchar$while_end0)
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function keyboard.readint 2
(keyboard.readint)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call keyboard.readline 1
   @1
   D=A
   @R13
   M=D
   @keyboard.readline
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL110
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL110)
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.intvalue 1
   @1
   D=A
   @R13
   M=D
   @string.intvalue
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL111
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL111)
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.dispose 1
   @1
   D=A
   @R13
   M=D
   @string.dispose
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL112
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL112)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// New File: Sys
// function sys.init 0
(sys.init)
   @SP
   A=M
// call memory.init 0
   @0
   D=A
   @R13
   M=D
   @memory.init
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL113
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL113)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// call math.init 0
   @0
   D=A
   @R13
   M=D
   @math.init
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL114
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL114)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// call output.init 0
   @0
   D=A
   @R13
   M=D
   @output.init
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL115
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL115)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// call keyboard.init 0
   @0
   D=A
   @R13
   M=D
   @keyboard.init
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL116
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL116)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// call main.main 0
   @0
   D=A
   @R13
   M=D
   @main.main
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL117
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL117)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// call sys.halt 0
   @0
   D=A
   @R13
   M=D
   @sys.halt
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL118
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL118)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function sys.halt 0
(sys.halt)
   @SP
   A=M
// label while_exp0
(Sys.sys.halt$while_exp0)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Sys.sys.halt$while_end0
   D;JNE
// goto while_exp0
   @Sys.sys.halt$while_exp0
   0;JMP
// label while_end0
(Sys.sys.halt$while_end0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function sys.wait 1
(sys.wait)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT22
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT22)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Sys.sys.halt$if_true0
   D;JNE
// goto if_false0
   @Sys.sys.halt$if_false0
   0;JMP
// label if_true0
(Sys.sys.halt$if_true0)
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL119
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL119)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(Sys.sys.error$if_false0)
// label while_exp0
(Sys.sys.error$while_exp0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT19
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT19)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Sys.sys.error$while_end0
   D;JNE
// push constant 50
   @50
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label while_exp1
(Sys.sys.error$while_exp1)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// gt
   @RET_ADDRESS_GT20
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT20)
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
// if-goto while_end1
   @SP
   M=M-1
   A=M
   D=M
   @Sys.sys.error$while_end1
   D;JNE
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp1
   @Sys.sys.error$while_exp1
   0;JMP
// label while_end1
(Sys.sys.error$while_end1)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 0
   @0
   D=A
   @index
   M=D
   @ARG
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
// goto while_exp0
   @Sys.sys.error$while_exp0
   0;JMP
// label while_end0
(Sys.sys.error$while_end0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function sys.error 0
(sys.error)
   @SP
   A=M
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.new 1
   @1
   D=A
   @R13
   M=D
   @string.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL120
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL120)
// push constant 69
   @69
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL121
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL121)
// push constant 82
   @82
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL122
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL122)
// push constant 82
   @82
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.appendchar 2
   @2
   D=A
   @R13
   M=D
   @string.appendchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL123
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL123)
// call output.printstring 1
   @1
   D=A
   @R13
   M=D
   @output.printstring
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL124
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL124)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.printint 1
   @1
   D=A
   @R13
   M=D
   @output.printint
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL125
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL125)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// call sys.halt 0
   @0
   D=A
   @R13
   M=D
   @sys.halt
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL126
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL126)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// New File: Output
// function output.init 0
(output.init)
   @SP
   A=M
// push constant 16384
   @16384
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop static 4
   @SP
   M=M-1
   A=M
   D=M
   @Output.4
   M=D
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
// pop static 2
   @SP
   M=M-1
   A=M
   D=M
   @Output.2
   M=D
// push constant 32
   @32
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
   @Output.1
   M=D
// push constant 0
   @0
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
   @Output.0
   M=D
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.new 1
   @1
   D=A
   @R13
   M=D
   @string.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL127
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL127)
// pop static 3
   @SP
   M=M-1
   A=M
   D=M
   @Output.3
   M=D
// call output.initmap 0
   @0
   D=A
   @R13
   M=D
   @output.initmap
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL128
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL128)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// call output.createshiftedmap 0
   @0
   D=A
   @R13
   M=D
   @output.createshiftedmap
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL129
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL129)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.initmap 0
(output.initmap)
   @SP
   A=M
// push constant 127
   @127
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL130
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL130)
// pop static 5
   @SP
   M=M-1
   A=M
   D=M
   @Output.5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL131
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL131)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 32
   @32
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL132
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL132)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 33
   @33
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL133
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL133)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 34
   @34
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 20
   @20
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL134
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL134)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 35
   @35
   D=A
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
// push constant 18
   @18
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 18
   @18
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 18
   @18
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 18
   @18
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 18
   @18
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 18
   @18
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL135
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL135)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 36
   @36
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL136
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL136)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 37
   @37
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 35
   @35
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 49
   @49
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL137
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL137)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 38
   @38
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL138
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL138)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 39
   @39
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL139
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL139)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 40
   @40
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL140
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL140)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 41
   @41
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL141
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL141)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 42
   @42
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL142
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL142)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 43
   @43
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL143
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL143)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 44
   @44
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL144
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL144)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 45
   @45
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL145
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL145)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 46
   @46
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL146
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL146)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 47
   @47
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
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
// push constant 0
   @0
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL147
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL147)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL148
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL148)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 49
   @49
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 14
   @14
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL149
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL149)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 50
   @50
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL150
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL150)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL151
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL151)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 52
   @52
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 16
   @16
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 26
   @26
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 25
   @25
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 60
   @60
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL152
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL152)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 53
   @53
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL153
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL153)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL154
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL154)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 55
   @55
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 49
   @49
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL155
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL155)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 56
   @56
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL156
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL156)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 57
   @57
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 62
   @62
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 14
   @14
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL157
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL157)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 58
   @58
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL158
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL158)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 59
   @59
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL159
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL159)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 60
   @60
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL160
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL160)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 61
   @61
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL161
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL161)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 62
   @62
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL162
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL162)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 64
   @64
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 59
   @59
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 59
   @59
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 59
   @59
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL163
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL163)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL164
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL164)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 65
   @65
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL165
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL165)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 66
   @66
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL166
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL166)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 67
   @67
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 35
   @35
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 35
   @35
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL167
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL167)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 68
   @68
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL168
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL168)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 69
   @69
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 35
   @35
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
// push constant 15
   @15
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
// push constant 35
   @35
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL169
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL169)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 70
   @70
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 35
   @35
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
// push constant 15
   @15
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
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL170
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL170)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 71
   @71
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 35
   @35
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 59
   @59
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 44
   @44
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL171
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL171)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 72
   @72
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL172
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL172)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 73
   @73
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL173
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL173)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 74
   @74
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 60
   @60
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 14
   @14
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL174
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL174)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 75
   @75
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL175
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL175)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 76
   @76
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 35
   @35
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL176
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL176)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 77
   @77
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 33
   @33
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL177
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL177)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 78
   @78
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 55
   @55
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 55
   @55
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 59
   @59
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 59
   @59
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL178
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL178)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 79
   @79
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL179
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL179)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 80
   @80
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL180
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL180)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 81
   @81
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 59
   @59
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL181
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL181)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 82
   @82
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL182
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL182)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 83
   @83
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL183
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL183)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 84
   @84
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 45
   @45
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL184
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL184)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 85
   @85
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL185
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL185)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 86
   @86
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL186
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL186)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 87
   @87
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 18
   @18
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL187
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL187)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 88
   @88
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL188
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL188)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 89
   @89
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL189
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL189)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 90
   @90
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 49
   @49
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 35
   @35
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL190
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL190)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 91
   @91
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL191
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL191)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 92
   @92
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32
   @32
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL192
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL192)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 93
   @93
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL193
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL193)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 94
   @94
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 8
   @8
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL194
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL194)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 95
   @95
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 63
   @63
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL195
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL195)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 96
   @96
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL196
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL196)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 97
   @97
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 14
   @14
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL197
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL197)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 98
   @98
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL198
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL198)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 99
   @99
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL199
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL199)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 100
   @100
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 60
   @60
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL200
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL200)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 101
   @101
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL201
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL201)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 102
   @102
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 38
   @38
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL202
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL202)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 103
   @103
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 62
   @62
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL203
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL203)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 104
   @104
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 55
   @55
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL204
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL204)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 105
   @105
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 14
   @14
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL205
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL205)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 106
   @106
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
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
// push constant 56
   @56
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL206
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL206)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 107
   @107
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL207
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL207)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 108
   @108
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 14
   @14
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL208
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL208)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 109
   @109
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 29
   @29
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 43
   @43
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 43
   @43
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 43
   @43
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 43
   @43
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL209
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL209)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 110
   @110
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 29
   @29
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL210
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL210)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 111
   @111
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL211
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL211)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 112
   @112
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 31
   @31
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL212
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL212)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 113
   @113
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 62
   @62
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL213
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL213)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 114
   @114
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 29
   @29
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 55
   @55
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 7
   @7
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL214
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL214)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 115
   @115
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL215
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL215)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 116
   @116
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 4
   @4
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 28
   @28
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL216
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL216)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 117
   @117
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 54
   @54
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL217
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL217)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 118
   @118
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL218
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL218)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 119
   @119
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 18
   @18
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL219
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL219)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 120
   @120
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 30
   @30
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL220
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL220)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 121
   @121
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 62
   @62
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 48
   @48
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 24
   @24
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 15
   @15
   D=A
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
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL221
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL221)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 122
   @122
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 27
   @27
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 51
   @51
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL222
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL222)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 123
   @123
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 56
   @56
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 7
   @7
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 56
   @56
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL223
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL223)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 124
   @124
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL224
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL224)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 125
   @125
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 7
   @7
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 56
   @56
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 12
   @12
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 7
   @7
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL225
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL225)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 126
   @126
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 38
   @38
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 45
   @45
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 25
   @25
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.create 12
   @12
   D=A
   @R13
   M=D
   @output.create
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL226
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL226)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.create 1
(output.create)
   @SP
   A=M
   D=0
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
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL227
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL227)
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 5
   @Output.5
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 2
   @2
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 2
   @2
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 3
   @3
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 3
   @3
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 4
   @4
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 4
   @4
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 5
   @5
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 5
   @5
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 6
   @6
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 7
   @7
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 7
   @7
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 8
   @8
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 8
   @8
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 9
   @9
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 9
   @9
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 10
   @10
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 10
   @10
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 11
   @11
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.createshiftedmap 4
(output.createshiftedmap)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 127
   @127
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL228
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL228)
// pop static 6
   @SP
   M=M-1
   A=M
   D=M
   @Output.6
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// label while_exp0
(Output.array.new$while_exp0)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 127
   @127
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT23
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT23)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Output.array.new$while_end0
   D;JNE
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 5
   @Output.5
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push constant 11
   @11
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call array.new 1
   @1
   D=A
   @R13
   M=D
   @array.new
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL229
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL229)
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 6
   @Output.6
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// label while_exp1
(Output.array.new$while_exp1)
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT24
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT24)
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
// if-goto while_end1
   @SP
   M=M-1
   A=M
   D=M
   @Output.array.new$while_end1
   D;JNE
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 256
   @256
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.multiply 2
   @2
   D=A
   @R13
   M=D
   @math.multiply
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL230
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL230)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp1
   @Output.math.multiply$while_exp1
   0;JMP
// label while_end1
(Output.math.multiply$while_end1)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// eq
   @RET_ADDRESS_EQ13
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ13)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Output.math.multiply$if_true0
   D;JNE
// goto if_false0
   @Output.math.multiply$if_false0
   0;JMP
// label if_true0
(Output.math.multiply$if_true0)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// goto if_end0
   @Output.math.multiply$if_end0
   0;JMP
// label if_false0
(Output.math.multiply$if_false0)
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// label if_end0
(Output.math.multiply$if_end0)
// goto while_exp0
   @Output.math.multiply$while_exp0
   0;JMP
// label while_end0
(Output.math.multiply$while_end0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.getmap 1
(output.getmap)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT25
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT25)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 126
   @126
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT21
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT21)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Output.math.multiply$if_true0
   D;JNE
// goto if_false0
   @Output.math.multiply$if_false0
   0;JMP
// label if_true0
(Output.math.multiply$if_true0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop argument 0
   @0
   D=A
   @index
   M=D
   @ARG
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
// label if_false0
(Output.math.multiply$if_false0)
// push static 2
   @Output.2
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Output.math.multiply$if_true1
   D;JNE
// goto if_false1
   @Output.math.multiply$if_false1
   0;JMP
// label if_true1
(Output.math.multiply$if_true1)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 5
   @Output.5
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// goto if_end1
   @Output.math.multiply$if_end1
   0;JMP
// label if_false1
(Output.math.multiply$if_false1)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 6
   @Output.6
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label if_end1
(Output.math.multiply$if_end1)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.drawchar 4
(output.drawchar)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.getmap 1
   @1
   D=A
   @R13
   M=D
   @output.getmap
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL231
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL231)
// pop local 2
   @2
   D=A
   @index
   M=D
   @LCL
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
// push static 1
   @Output.1
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label while_exp0
(Output.output.getmap$while_exp0)
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT26
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT26)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.getmap$while_end0
   D;JNE
// push static 2
   @Output.2
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.getmap$if_true0
   D;JNE
// goto if_false0
   @Output.output.getmap$if_false0
   0;JMP
// label if_true0
(Output.output.getmap$if_true0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 4
   @Output.4
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 256
   @256
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
// and
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// goto if_end0
   @Output.output.getmap$if_end0
   0;JMP
// label if_false0
(Output.output.getmap$if_false0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 4
   @Output.4
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
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
// and
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A&D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 3
   @3
   D=A
   @index
   M=D
   @LCL
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
// label if_end0
(Output.output.getmap$if_end0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 4
   @Output.4
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 2
   @2
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 3
   @3
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32
   @32
   D=A
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp0
   @Output.output.getmap$while_exp0
   0;JMP
// label while_end0
(Output.output.getmap$while_end0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.movecursor 0
(output.movecursor)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT27
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT27)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 22
   @22
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT22
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT22)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT28
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT28)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 63
   @63
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT23
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT23)
// or
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A|D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.getmap$if_true0
   D;JNE
// goto if_false0
   @Output.output.getmap$if_false0
   0;JMP
// label if_true0
(Output.output.getmap$if_true0)
// push constant 20
   @20
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL232
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL232)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(Output.sys.error$if_false0)
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// call math.divide 2
   @2
   D=A
   @R13
   M=D
   @math.divide
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL233
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL233)
// pop static 0
   @SP
   M=M-1
   A=M
   D=M
   @Output.0
   M=D
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 352
   @352
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call math.multiply 2
   @2
   D=A
   @R13
   M=D
   @math.multiply
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL234
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL234)
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Output.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
   @Output.1
   M=D
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Output.0
   D=M
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
// call math.multiply 2
   @2
   D=A
   @R13
   M=D
   @math.multiply
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL235
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL235)
// eq
   @RET_ADDRESS_EQ14
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ14)
// pop static 2
   @SP
   M=M-1
   A=M
   D=M
   @Output.2
   M=D
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.drawchar 1
   @1
   D=A
   @R13
   M=D
   @output.drawchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL236
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL236)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.printchar 0
(output.printchar)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.newline 0
   @0
   D=A
   @R13
   M=D
   @string.newline
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL237
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL237)
// eq
   @RET_ADDRESS_EQ15
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ15)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Output.string.newline$if_true0
   D;JNE
// goto if_false0
   @Output.string.newline$if_false0
   0;JMP
// label if_true0
(Output.string.newline$if_true0)
// call output.println 0
   @0
   D=A
   @R13
   M=D
   @output.println
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL238
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL238)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// goto if_end0
   @Output.output.println$if_end0
   0;JMP
// label if_false0
(Output.output.println$if_false0)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.backspace 0
   @0
   D=A
   @R13
   M=D
   @string.backspace
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL239
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL239)
// eq
   @RET_ADDRESS_EQ16
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ16)
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Output.string.backspace$if_true1
   D;JNE
// goto if_false1
   @Output.string.backspace$if_false1
   0;JMP
// label if_true1
(Output.string.backspace$if_true1)
// call output.backspace 0
   @0
   D=A
   @R13
   M=D
   @output.backspace
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL240
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL240)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// goto if_end1
   @Output.output.backspace$if_end1
   0;JMP
// label if_false1
(Output.output.backspace$if_false1)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.drawchar 1
   @1
   D=A
   @R13
   M=D
   @output.drawchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL241
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL241)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push static 2
   @Output.2
   D=M
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
// if-goto if_true2
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.drawchar$if_true2
   D;JNE
// goto if_false2
   @Output.output.drawchar$if_false2
   0;JMP
// label if_true2
(Output.output.drawchar$if_true2)
// push static 0
   @Output.0
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
   @Output.0
   M=D
// push static 1
   @Output.1
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
   @Output.1
   M=D
// label if_false2
(Output.output.drawchar$if_false2)
// push static 0
   @Output.0
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ17
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ17)
// if-goto if_true3
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.drawchar$if_true3
   D;JNE
// goto if_false3
   @Output.output.drawchar$if_false3
   0;JMP
// label if_true3
(Output.output.drawchar$if_true3)
// call output.println 0
   @0
   D=A
   @R13
   M=D
   @output.println
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL242
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL242)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// goto if_end3
   @Output.output.println$if_end3
   0;JMP
// label if_false3
(Output.output.println$if_false3)
// push static 2
   @Output.2
   D=M
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
// pop static 2
   @SP
   M=M-1
   A=M
   D=M
   @Output.2
   M=D
// label if_end3
(Output.output.println$if_end3)
// label if_end1
(Output.output.println$if_end1)
// label if_end0
(Output.output.println$if_end0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.printstring 2
(output.printstring)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.length 1
   @1
   D=A
   @R13
   M=D
   @string.length
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL243
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL243)
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// label while_exp0
(Output.string.length$while_exp0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT29
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT29)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Output.string.length$while_end0
   D;JNE
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.charat 2
   @2
   D=A
   @R13
   M=D
   @string.charat
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL244
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL244)
// call output.printchar 1
   @1
   D=A
   @R13
   M=D
   @output.printchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL245
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL245)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp0
   @Output.output.printchar$while_exp0
   0;JMP
// label while_end0
(Output.output.printchar$while_end0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.printint 0
(output.printint)
   @SP
   A=M
// push static 3
   @Output.3
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call string.setint 2
   @2
   D=A
   @R13
   M=D
   @string.setint
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL246
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL246)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push static 3
   @Output.3
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.printstring 1
   @1
   D=A
   @R13
   M=D
   @output.printstring
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL247
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL247)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.println 0
(output.println)
   @SP
   A=M
// push static 1
   @Output.1
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 352
   @352
   D=A
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Output.0
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
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
   @Output.1
   M=D
// push constant 0
   @0
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
   @Output.0
   M=D
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
// pop static 2
   @SP
   M=M-1
   A=M
   D=M
   @Output.2
   M=D
// push static 1
   @Output.1
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 8128
   @8128
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ18
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ18)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.printstring$if_true0
   D;JNE
// goto if_false0
   @Output.output.printstring$if_false0
   0;JMP
// label if_true0
(Output.output.printstring$if_true0)
// push constant 32
   @32
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
   @Output.1
   M=D
// label if_false0
(Output.output.printstring$if_false0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function output.backspace 0
(output.backspace)
   @SP
   A=M
// push static 2
   @Output.2
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.printstring$if_true0
   D;JNE
// goto if_false0
   @Output.output.printstring$if_false0
   0;JMP
// label if_true0
(Output.output.printstring$if_true0)
// push static 0
   @Output.0
   D=M
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
// gt
   @RET_ADDRESS_GT24
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT24)
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.printstring$if_true1
   D;JNE
// goto if_false1
   @Output.output.printstring$if_false1
   0;JMP
// label if_true1
(Output.output.printstring$if_true1)
// push static 0
   @Output.0
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
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
   @Output.0
   M=D
// push static 1
   @Output.1
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
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
   @Output.1
   M=D
// goto if_end1
   @Output.output.printstring$if_end1
   0;JMP
// label if_false1
(Output.output.printstring$if_false1)
// push constant 31
   @31
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
   @Output.0
   M=D
// push static 1
   @Output.1
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ19
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ19)
// if-goto if_true2
   @SP
   M=M-1
   A=M
   D=M
   @Output.output.printstring$if_true2
   D;JNE
// goto if_false2
   @Output.output.printstring$if_false2
   0;JMP
// label if_true2
(Output.output.printstring$if_true2)
// push constant 8128
   @8128
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
   @Output.1
   M=D
// label if_false2
(Output.output.printstring$if_false2)
// push static 1
   @Output.1
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 321
   @321
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
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
   @Output.1
   M=D
// label if_end1
(Output.output.printstring$if_end1)
// push constant 0
   @0
   D=A
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
   @Output.2
   M=D
// goto if_end0
   @Output.output.printstring$if_end0
   0;JMP
// label if_false0
(Output.output.printstring$if_false0)
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
// pop static 2
   @SP
   M=M-1
   A=M
   D=M
   @Output.2
   M=D
// label if_end0
(Output.output.printstring$if_end0)
// push constant 32
   @32
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call output.drawchar 1
   @1
   D=A
   @R13
   M=D
   @output.drawchar
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL248
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL248)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// New File: Memory
// function memory.init 0
(memory.init)
   @SP
   A=M
// push constant 0
   @0
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
   @Memory.0
   M=D
// push constant 2048
   @2048
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Memory.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 14334
   @14334
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 2049
   @2049
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Memory.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 2050
   @2050
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function memory.peek 0
(memory.peek)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Memory.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function memory.poke 0
(memory.poke)
   @SP
   A=M
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push static 0
   @Memory.0
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 1
   @1
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function memory.alloc 1
(memory.alloc)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// lt
   @RET_ADDRESS_LT30
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT30)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Memory.output.drawchar$if_true0
   D;JNE
// goto if_false0
   @Memory.output.drawchar$if_false0
   0;JMP
// label if_true0
(Memory.output.drawchar$if_true0)
// push constant 5
   @5
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL249
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL249)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false0
(Memory.sys.error$if_false0)
// push constant 2048
   @2048
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// label while_exp0
(Memory.sys.error$while_exp0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// lt
   @RET_ADDRESS_LT31
   D=A
   @GLOBAL_LT
   0;JMP
(RET_ADDRESS_LT31)
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
// if-goto while_end0
   @SP
   M=M-1
   A=M
   D=M
   @Memory.sys.error$while_end0
   D;JNE
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// goto while_exp0
   @Memory.sys.error$while_exp0
   0;JMP
// label while_end0
(Memory.sys.error$while_end0)
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 16379
   @16379
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT25
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT25)
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Memory.sys.error$if_true1
   D;JNE
// goto if_false1
   @Memory.sys.error$if_false1
   0;JMP
// label if_true1
(Memory.sys.error$if_true1)
// push constant 6
   @6
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// call sys.error 1
   @1
   D=A
   @R13
   M=D
   @sys.error
   D=A
   @R14
   M=D
   @RET_ADDRESS_CALL250
   D=A
   @SAVE_CALLER_STATE
   0;JMP
(RET_ADDRESS_CALL250)
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// label if_false1
(Memory.sys.error$if_false1)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// gt
   @RET_ADDRESS_GT26
   D=A
   @GLOBAL_GT
   0;JMP
(RET_ADDRESS_GT26)
// if-goto if_true2
   @SP
   M=M-1
   A=M
   D=M
   @Memory.sys.error$if_true2
   D;JNE
// goto if_false2
   @Memory.sys.error$if_false2
   0;JMP
// label if_true2
(Memory.sys.error$if_true2)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ20
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ20)
// if-goto if_true3
   @SP
   M=M-1
   A=M
   D=M
   @Memory.sys.error$if_true3
   D;JNE
// goto if_false3
   @Memory.sys.error$if_false3
   0;JMP
// label if_true3
(Memory.sys.error$if_true3)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 4
   @4
   D=A
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// goto if_end3
   @Memory.sys.error$if_end3
   0;JMP
// label if_false3
(Memory.sys.error$if_false3)
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push constant 3
   @3
   D=A
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// label if_end3
(Memory.sys.error$if_end3)
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// label if_false2
(Memory.sys.error$if_false2)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
// function memory.dealloc 2
(memory.dealloc)
   @SP
   A=M
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
   D=0
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push argument 0
   @0
   D=A
   @index
   M=D
   @ARG
   D=M
   @index
   A=D+M
   D=M
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 0
   @0
   D=A
   @index
   M=D
   @LCL
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
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop local 1
   @1
   D=A
   @index
   M=D
   @LCL
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
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
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
// eq
   @RET_ADDRESS_EQ21
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ21)
// if-goto if_true0
   @SP
   M=M-1
   A=M
   D=M
   @Memory.sys.error$if_true0
   D;JNE
// goto if_false0
   @Memory.sys.error$if_false0
   0;JMP
// label if_true0
(Memory.sys.error$if_true0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
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
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// goto if_end0
   @Memory.sys.error$if_end0
   0;JMP
// label if_false0
(Memory.sys.error$if_false0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// sub
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A-D
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
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// eq
   @RET_ADDRESS_EQ22
   D=A
   @GLOBAL_EQ
   0;JMP
(RET_ADDRESS_EQ22)
// if-goto if_true1
   @SP
   M=M-1
   A=M
   D=M
   @Memory.sys.error$if_true1
   D;JNE
// goto if_false1
   @Memory.sys.error$if_false1
   0;JMP
// label if_true1
(Memory.sys.error$if_true1)
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
   D=M
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
// add
   @SP
   M=M-1
   A=M
   D=M
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// goto if_end1
   @Memory.sys.error$if_end1
   0;JMP
// label if_false1
(Memory.sys.error$if_false1)
// push constant 1
   @1
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// push local 0
   @0
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push local 1
   @1
   D=A
   @index
   M=D
   @LCL
   D=M
   @index
   A=D+M
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
   @SP
   M=M-1
   A=M
   A=M
   D=A+D
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
// push that 0
   @0
   D=A
   @index
   M=D
   @THAT
   D=M
   @index
   A=D+M
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop temp 0
   @SP
   M=M-1
   A=M
   D=M
   @5
   M=D
// pop pointer 1
   @SP
   M=M-1
   A=M
   D=M
   @THAT
   M=D
// push temp 0
   @5
   D=M
   @SP
   A=M
   M=D
   @SP
   M=M+1
// pop that 0
   @0
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
// label if_end1
(Memory.sys.error$if_end1)
// label if_end0
(Memory.sys.error$if_end0)
// push constant 0
   @0
   D=A
   @SP
   A=M
   M=D
   @SP
   M=M+1
// Return
   @RETURN
   0;JMP
(END)
   @END
   0;JMP
