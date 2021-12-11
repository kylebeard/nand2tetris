
from typing import List, TextIO
from Commands import CommandType
from Commands import Arithmetic
from Segments import Segments


class CodeWriter:
    """Code writer for VM code"""
    segment_map = {
        'local': 'LCL',
        'argument': 'ARG',
        'this': 'THIS',
        'that': 'THAT',
        0: 'THIS',  # pointer segment - 0 accesses this, 1 accesses that
        1: 'THAT'
    }

    def __init__(self, file: TextIO) -> None:
        self.file = file
        self.TEMP_BASE = 5  # temp segment base address
        self.input_filename = ""
        # we need a different return address label for every function call
        self.call_count = 0
        self.func_call_stack: List[str] = []

        self._eq_label = 'GLOBAL_EQ'
        self._lt_label = 'GLOBAL_LT'
        self._gt_label = 'GLOBAL_GT'
        self._eq_count = 0
        self._lt_count = 0
        self._gt_count = 0

        self._save_caller_state_label = 'SAVE_CALLER_STATE'
        self._return_label = 'RETURN'

        # self._write_global_routines()

    def _write_global_routines(self):
        self._write_init()
        self._write_global_comparison_routines()
        self._write_save_caller_state_routine()
        self._write_return_routine()

    def set_filename(self, filename: str):
        """Sets the filename that we are currently reading from"""
        self.file.write(f'// New File: {filename}\n')
        self.input_filename = filename

    def _write_init(self):
        """writes the intial bootstrap code setting SP to 256 & calling sys.init"""
        self._writeln('@256')
        self._writeln('D=A')
        self._writeln('@SP')
        self._writeln('M=D')
        self._writeln('@sys.init')
        self._writeln('0;JMP')

    def _write_save_caller_state_routine(self):
        """
        Writes code to save the caller's state when we come across a call command.
        The return adress of the caller must be in the D register when jumping to this code
        The number of arguments the function takes must be in R13
        The address of the function must be in R14
        """
        self._write_label(self._save_caller_state_label)

        self._push_D_onto_stack()  # push return address onto the stack

        # push LCL,ARG,THIS,THAT onto stack
        for seg in ['@LCL', '@ARG', '@THIS', '@THAT']:
            self._writeln(seg)
            self._writeln('D=M')
            self._push_D_onto_stack()

        # reposition ARG segment for callee (ARG = SP-5-nArgs)
        self._writeln('@SP')
        self._writeln('D=M')
        self._writeln('@5')
        self._writeln('D=D-A')  # D = SP-5
        self._writeln('@R13')
        self._writeln('D=D-M')  # D = D-nArgs
        self._writeln('@ARG')
        self._writeln('M=D')  # ARG = D

        # reposition LCL to equal SP
        self._writeln('@SP')
        self._writeln('D=M')
        self._writeln('@LCL')
        self._writeln('M=D')

        # goto function
        self._writeln('@R14')
        self._writeln('A=M')
        self._writeln('0;JMP')

    def _write_global_comparison_routines(self):
        # sourcery skip: class-extract-method
        """Writes global routines for EQ, LT, and GT. Assumes Return address will be D register

        pops first element into D, then second into A and does D=A-D
        doing second_element - first_element
        which means:
            - second_element < first_element when D < 0
            - second_element > first_element when D > 0
            - second_element = first_element when D = 0
        If jump_condition is true, true will be pushed onto the stack

        """
        for cmp in ['EQ', 'LT', 'GT']:
            label = ''
            match cmp:
                case 'LT':
                    label = 'GLOBAL_LT'
                case 'GT':
                    label = 'GLOBAL_GT'
                case 'EQ':
                    label = 'GLOBAL_EQ'

            self._write_label(label)
            # save return address
            self._writeln('@R15')
            self._writeln('M=D')

            true_branch = f"{cmp}_TRUE"
            push_d_branch = f"{cmp}_PUSH_D"

            self._pop_stack_to_D()
            self._pop_stack_to_A()
            self._writeln('D=A-D')
            self._writeln(f'@{true_branch}')
            # jump to true branch if jump_condition is met
            self._writeln(f'D;J{cmp}')  # jump conditions are JEQ, JLT, JGT
            self._writeln('D=0')  # otherwise set D to false
            self._writeln(f'@{push_d_branch}')
            self._writeln('0;JMP')  # and jump to push D branch
            self._write_label(true_branch)  # true branch start
            self._writeln('D=-1')
            self._write_label(push_d_branch)  # push D branch start
            self._push_D_onto_stack()

            self._writeln('@R15')
            self._writeln('A=M')
            self._writeln('0;JMP')

    def _write_return_routine(self):
        """"""
        self._write_label(self._return_label)
        endframe = '@endframe'
        ret_addr = '@retAddr'

        # endframe = LCL
        self._writeln('@LCL')
        self._writeln('D=M')
        self._writeln(endframe)
        self._writeln('M=D')

        # get callers return address and put in retAddr
        self._writeln('@5')
        self._writeln('D=D-A')  # D contains address of LCL segment, -5 is where the ret addr of caller is stored
        self._writeln('A=D')
        self._writeln('D=M')
        self._writeln(ret_addr)
        self._writeln('M=D')

        # *ARG = pop() - sets return value for caller
        self._pop_stack_to_D()
        self._writeln('@ARG')
        self._writeln('A=M')
        self._writeln('M=D')

        # reposition SP for caller to ARG + 1
        self._writeln('@ARG')
        self._writeln('D=M')
        self._writeln('@SP')
        self._writeln('M=D+1')

        # restore segments
        for i, seg in enumerate(['THAT', 'THIS', 'ARG', 'LCL']):
            self._writeln(endframe)
            self._writeln('D=M')
            self._writeln(f'@{i+1}')
            self._writeln('D=D-A')  # endframe-1 contains callers THAT segment addres,-2 THIS, etc.
            self._writeln('A=D')
            self._writeln('D=M')
            self._writeln(f'@{seg}')
            self._writeln('M=D')

        # goto return address
        self._writeln(ret_addr)
        self._writeln('A=M')
        self._writeln('0;JMP')

    ###################### Arithmetic Commands ###################################

    def write_arithmetic(self, command: str) -> None:
        """
        Writes to the output file the assembly code that
        implements the given command.

        For binary operand command (sub,gt,lt, etc.)
        the first element goes on the right e.g.
        calling sub you pop the top of the stack into arg1
        then pop again into arg2 and take arg2 - arg1 NOT arg1 - arg2
        """

        self.file.write(f'// {command}\n')

        if command == Arithmetic.ADD:
            self._write_binary_op('+')
        elif command == Arithmetic.SUB:
            self._write_binary_op('-')
        elif command == Arithmetic.AND_:
            self._write_binary_op('&')
        elif command == Arithmetic.OR_:
            self._write_binary_op('|')
        elif command == Arithmetic.NOT_:
            self._write_unary_op('!')
        elif command == Arithmetic.NEG:
            self._write_unary_op('-')
        elif command == Arithmetic.EQ:
            self._write_comparison(f'RET_ADDRESS_EQ{self._eq_count}', self._eq_label)
            self._eq_count += 1
        elif command == Arithmetic.LT:
            self._write_comparison(f'RET_ADDRESS_LT{self._lt_count}', self._lt_label)
            self._lt_count += 1
        elif command == Arithmetic.GT:
            self._write_comparison(f'RET_ADDRESS_GT{self._gt_count}', self._gt_label)
            self._gt_count += 1

    def _write_unary_op(self, op: str):
        self._pop_stack_to_D()
        self._writeln(f'D={op}D')
        self._push_D_onto_stack()

    def _write_binary_op(self, op: str):
        """writes assembly for a binary operation"""
        self._pop_stack_to_D()
        self._pop_stack_to_A()
        self._writeln(f'D=A{op}D')

        self._push_D_onto_stack()

    def _write_comparison(self, return_label, cmp_label):
        self._writeln(f'@{return_label}')
        self._writeln('D=A')
        self._writeln(f'@{cmp_label}')
        self._writeln('0;JMP')
        self._write_label(return_label)
    ##############################################################################

    # pylint: disable=unsubscriptable-object
    def write_push_pop(self, command_type: CommandType, segment: str, index: int):
        # write command to file for debugging
        self.file.write(f'// {command_type.value} {segment} {index}\n')

        if command_type == CommandType.PUSH:
            self._write_push(segment, index)
        elif command_type == CommandType.POP:
            self._write_pop(segment, index)

    ######################## PUSH commands #######################################
    def _write_push(self, segment: str, index: int):
        """convert push command to hack assembly"""
        # Generalized push command:
        # addr=SEGMENT+i; *SP=*addr; SP++
        if segment == Segments.constant:
            self._write_push_constant(index)
        elif segment in [Segments.local, Segments.argument, Segments.this, Segments.that]:
            self._write_push_lcl_arg_this_that(segment, index)
        elif segment == Segments.temp:
            self._write_push_temp(index)
        elif segment == Segments.pointer:
            self._write_push_pointer(index)
        elif segment == Segments.static:
            self._write_push_static(index)

    def _write_push_lcl_arg_this_that(self, segment: str, index: int):
        # sourcery skip: extract-duplicate-method
        """Push a value from local, argument, this or that onto the stack"""
        # store value at RAM[(*segment) + i] in D register
        self._writeln(f'@{index}')
        self._writeln('D=A')
        self._writeln('@index')
        self._writeln('M=D')
        self._writeln(f'@{self.segment_map[segment]}')
        self._writeln('D=M')
        self._writeln('@index')
        self._writeln('A=D+M')
        self._writeln('D=M')
        # push it onto the stack
        self._push_D_onto_stack()

    def _write_push_temp(self, index: int):
        """convert push temp index into assembly"""
        self._writeln(f'@{self.TEMP_BASE + index}')  # go to addr
        self._writeln('D=M')  # store value there in D, and...
        self._push_D_onto_stack()

    def _write_push_pointer(self, index: int):
        """translate push pointer index command"""
        self._writeln(f'@{self.segment_map[index]}')
        self._writeln('D=M')
        self._push_D_onto_stack()

    def _write_push_static(self, index: int):
        """translate push static index"""
        self._writeln(f'@{self.input_filename}.{index}')
        self._writeln('D=M')
        self._push_D_onto_stack()

    def _write_push_constant(self, index: int):
        # save index
        self._writeln('@' + str(index))
        self._writeln('D=A')
        self._push_D_onto_stack()

    ###################### POP commands ##########################################
    def _write_pop(self, segment: str, index: int):
        """translate pop commands"""
        if segment in [Segments.local, Segments.argument, Segments.this, Segments.that]:
            self._write_pop_lcl_arg_this_that(segment, index)
        elif segment == Segments.temp:
            self._write_pop_temp(index)
        elif segment == Segments.pointer:
            self._write_pop_pointer(index)
        elif segment == Segments.static:
            self._write_pop_static(index)

    def _write_pop_lcl_arg_this_that(self, segment: str, index: int):
        """write pop for local, argument, this, that"""
        # addr=segment+index
        self._writeln(f'@{index}')
        self._writeln('D=A')
        self._writeln('@index')
        self._writeln('M=D')
        self._writeln(f'@{self.segment_map[segment]}')
        self._writeln('D=M')
        self._writeln('@index')
        self._writeln('D=D+M')
        self._writeln('@addr')
        self._writeln('M=D')
        # SP--
        self._dec_sp()
        # *addr=*SP
        self._writeln('A=M')
        self._writeln('D=M')
        self._writeln('@addr')
        self._writeln('A=M')
        self._writeln('M=D')

    def _write_pop_temp(self, index: int):
        """translate pop temp index command"""
        self._pop_stack_to_D()
        self._writeln(f'@{self.TEMP_BASE + index}')
        self._writeln('M=D')

    def _write_pop_pointer(self, index: int):
        """translate `pop pointer index` """
        self._pop_stack_to_D()
        self._writeln(f'@{self.segment_map[index]}')
        self._writeln('M=D')

    def _write_pop_static(self, index: int):
        """translate pop static index"""
        self._pop_stack_to_D()
        self._writeln(f'@{self.input_filename}.{index}')
        self._writeln('M=D')

    ##############################################################################

    def write_label(self, label: str):
        """translates vm label to assembly"""
        self.file.write(f'// label {label}\n')

        full_label = self._translate_label(label)
        self._write_label(full_label)

    def write_goto(self, label: str):
        """translates vm goto command to assembly"""
        self.file.write(f'// goto {label}\n')

        full_label = self._translate_label(label)
        self._writeln(f'@{full_label}')
        self._writeln('0;JMP')

    def write_if_goto(self, label: str):
        """translate vm if-goto to assembly"""
        self.file.write(f'// if-goto {label}\n')

        full_label = self._translate_label(label)
        self._pop_stack_to_D()
        self._writeln(f'@{full_label}')
        self._writeln('D;JNE')

    def _translate_label(self, label):
        """Get the fully qualified label for the current context.
        label -> CurrentInputFilename.currentFunction$label"""
        full_label = self.input_filename
        if self.func_call_stack:
            full_label += f'.{self.func_call_stack[-1]}'

        full_label += f'${label}'
        return full_label

    def write_function(self, name: str, numVars: int):
        """translate vm function command to assembly"""
        self.file.write(f'// function {name} {numVars}\n')

        self._write_label(name)
        self._writeln('@SP')
        self._writeln('A=M')
        for _ in range(numVars):
            self._writeln('D=0')
            self._push_D_onto_stack()

    def write_call(self, name: str, numArgs: int):
        """translate vm call command to assembly"""
        self.file.write(f'// call {name} {numArgs}\n')

        self.call_count += 1

        # put numArgs into R13
        self._writeln(f'@{numArgs}')
        self._writeln('D=A')
        self._writeln('@R13')
        self._writeln('M=D')

        # put function adress into R14
        self._writeln(f'@{name}')
        self._writeln('D=A')
        self._writeln('@R14')
        self._writeln('M=D')

        ret_addr_label = f'RET_ADDRESS_CALL{self.call_count}'
        # put return address into D register (the actual label is written below)
        self._writeln(f'@{ret_addr_label}')
        self._writeln('D=A')

        # jump to global routine
        self._writeln(f'@{self._save_caller_state_label}')
        self._writeln('0;JMP')

        # write the label for the return address
        self._write_label(ret_addr_label)

        self.func_call_stack.append(name)

    def write_return(self):
        """translate vm return command to assembly"""
        self.file.write('// Return\n')

        # jump to the global return routine
        self._writeln(
            f'@{self._return_label}',
            '0;JMP'
        )

    ##################### Utility methods ########################################

    def _pop_stack_to_D(self):
        """pops the stack into the D register"""
        self._dec_sp()
        # deref SP (D=*SP)
        self._writeln('A=M')
        self._writeln('D=M')

    def _pop_stack_to_A(self):
        """Pop stack to A register"""
        self._dec_sp()
        self._writeln('A=M')
        self._writeln('A=M')

    def _push_D_onto_stack(self):
        """pushes value in D register onto the stack"""
        self._writeln('@SP')
        self._writeln('A=M')
        self._writeln('M=D')
        # SP++
        self._inc_sp()

    def _inc_sp(self):
        """Increment SP - Should always leave SP selected in A"""
        self._writeln('@SP')
        self._writeln('M=M+1')

    def _dec_sp(self):
        """Decrement SP - Should always leave SP selected in A"""
        self._writeln('@SP')
        self._writeln('M=M-1')

    def _writeln(self, *commands: str):
        for command in commands:
            self.file.write(f'   {command}\n')

    def _write_label(self, label: str):
        self.file.write(f'({label})\n')

    def write_end_loop(self):
        self._write_label('END')
        self._writeln('@END')
        self._writeln('0;JMP')


if __name__ == "__main__":
    """  """
    for i, seg in enumerate(['THAT', 'THIS', 'ARG', 'LCL']):
        print(i, seg)
