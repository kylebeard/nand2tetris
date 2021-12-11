""" Parser for VM Code """
from typing import List, TextIO
from Commands import CommandType, Arithmetic


class Parser:
    """
    Parser for VM Code
    """

    def __init__(self, file: TextIO) -> None:
        self.file = file
        self.current_command: str
        self.command_parts: List[str] = []

    def has_more_commands(self) -> bool:
        """ Whether or not there are any more commands in the input file """

        # save current position in file so `advance()` will have access to it
        pos = self.file.tell()
        line = self.file.readline().strip(" \t")

        # ignore comments and newlines
        while (line.startswith("//") or line == "\n"):
            pos = self.file.tell()
            line = self.file.readline().strip(" \t")

        if line == "":  # EOF
            return False

        self.file.seek(pos)
        return True

    def advance(self) -> None:
        """
        Reads the next command from the input and makes it the current
        command. Should be called only if `has_more_commands()` is True
        """
        line = self.file.readline()
        comment = line.find('//')
        if comment != -1:
            line = line[:comment]

        self.current_command = line.strip().lower()
        # so 'push constant 7' == 'push   contant 7'
        parts = self.current_command.split(" ")
        self.command_parts = list(filter(lambda x: x != "", parts))

    def command_type(self) -> CommandType:
        """ 
        Returns the type of the current command 
        e.g. Aritmetic, Push, Function, etc.
        """
        if self.current_command is None:
            raise ValueError('No current Command')

        command = self.command_parts[0]

        return CommandType.getCommandType(command)

    def arg1(self) -> str:
        """
        Returns the first argument of the current command.
        Arithmetic: the command itself (add, sub, etc.)
        Should not be called is command is Return
        """
        if self.command_type() == CommandType.RETURN:
            raise ValueError("return commands have no arugments")

        if len(self.command_parts) == 1:
            return self.command_parts[0]
        else:
            return self.command_parts[1]

    def arg2(self) -> str:
        """
        Returns the second argument of the current command.
        Should only be called for PUSH, POP, FUNCTION, CALL
        """
        valid = [CommandType.PUSH, CommandType.POP,
                 CommandType.FUNCTION, CommandType.CALL]
        if self.command_type() not in valid:
            raise ValueError(f'{self.command_type} does not have a second argument.')

        return self.command_parts[2]


if __name__ == '__main__':
    cmd = 'p l 0 //a comment'
    comment = cmd.find('//')
    print(comment)
    if comment != -1:
        cmd = cmd[:comment]
    print(cmd)
