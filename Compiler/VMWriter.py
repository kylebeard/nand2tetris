
from typing import TextIO
from Segment import Segment
from ArithmeticCommand import ArithmeticCommand


class VMWriter:
    """Virtual Machine Writer for project 11 of nand2tetris course"""

    def __init__(self, out: TextIO) -> None:
        """
        Creates a new output vm file
        and prepares it for writing.
        """
        self.out = out

    def write_push(self, segment: Segment, index: int) -> None:
        """Writes VM Push command"""
        self.write(f'push {segment.value} {index}')

    def write_pop(self, segment: Segment, index) -> None:
        """Writes VM pop command"""
        self.write(f'pop {segment.value} {index}')

    def write_arithmetic(self, command: ArithmeticCommand) -> None:
        """Writes VM arithmetic-logic command"""
        self.write(f'{command.value}')

    def write_label(self, label: str) -> None:
        """Writes VM label command"""
        self.write(f'label {label}')

    def write_goto(self, label: str) -> None:
        """Writes VM goto command"""
        self.write(f'goto {label}')

    def write_if(self, label: str) -> None:
        """Writes VM if-goto command"""
        self.write(f'if-goto {label}')

    def write_call(self, name: str, nargs: int) -> None:
        """Writes VM call command"""
        self.write(f'call {name} {nargs}')

    def write_function(self, name: str, nlocals: int) -> None:
        """Writes VM Push command"""
        self.write(f'function {name} {nlocals}')

    def write_return(self) -> None:
        """Writes VM return command"""
        self.write('return')

    def close(self) -> None:
        """closes outfile"""
        self.out.close()

    def write(self, line: str) -> None:
        self.out.write(line + '\n')
