
from typing import TextIO
from Segment import Segment
from ArithmeticCommand import ArithmeticCommand


class VMWriter:
    """Virtual Machine Writer for project 11 of nand2tetris course"""

    def __init__(self, out: TextIO) -> None:
        self.out = out

    def push(self, segment: Segment, index: int) -> None:
        self.write(f'push {segment.value} {index}')

    def pop(self, segment: Segment, index) -> None:
        self.write(f'pop {segment.value} {index}')

    def arithmetic(self, command: ArithmeticCommand) -> None:
        self.write(f'{command.value}')

    def label(self, label: str) -> None:
        self.write(f'label {label}')

    def goto(self, label: str) -> None:
        self.write(f'goto {label}')

    def if_goto(self, label: str) -> None:
        self.write(f'if-goto {label}')

    def call(self, name: str, nargs: int) -> None:
        self.write(f'call {name} {nargs}')

    def function(self, name: str, nlocals: int) -> None:
        self.write(f'function {name} {nlocals}')

    def return_(self) -> None:
        self.write('return')

    def write(self, line: str) -> None:
        self.out.write(line + '\n')
