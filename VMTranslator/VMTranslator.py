""" Main file for VM Translator from Nand2Tetris"""
from typing import TextIO
from VMParser import Parser
from Commands import CommandType
from CodeWriter import CodeWriter
from Segments import Segments
from os import path, listdir

"""
VMTranslator:
    - take in files as well as directories
Parser: DONE
    - if-goto, goto, label, call, function, return


"""


def main(in_file: TextIO, writer: CodeWriter):
    parser = Parser(in_file)
    while parser.has_more_commands():
        parser.advance()
        cmd_t = parser.command_type()
        if cmd_t in [CommandType.PUSH, CommandType.POP]:
            validate_push_pop(parser)
            writer.write_push_pop(cmd_t, parser.arg1(), int(parser.arg2()))

        elif cmd_t == CommandType.ARITHMETIC:
            writer.write_arithmetic(parser.arg1())

        elif cmd_t == CommandType.LABEL:
            writer.write_label(parser.arg1())

        elif cmd_t == CommandType.GOTO:
            writer.write_goto(parser.arg1())

        elif cmd_t == CommandType.IF_GOTO:
            writer.write_if_goto(parser.arg1())

        elif cmd_t == CommandType.FUNCTION:
            writer.write_function(parser.arg1(), int(parser.arg2()))

        elif cmd_t == CommandType.CALL:
            writer.write_call(parser.arg1(), int(parser.arg2()))

        elif cmd_t == CommandType.RETURN:
            writer.write_return()


def validate_push_pop(parser: Parser):
    if parser.arg1() not in Segments.values:
        raise ValueError(
            f"Invalid segment in command: {parser.current_command}", f"Valid segments: {Segments.values}")

    try:
        index = int(parser.arg2())
    except ValueError:
        print(
            f'Invalid index in command {parser.current_command} - The index must be a non-negative integer')
        raise

    if sign(index) == -1:
        raise ValueError(
            f"Invalid index in command: {parser.current_command}. The index must be a non-negative integer")

    if parser.command_type() == CommandType.POP and parser.arg1() == Segments.constant:
        raise ValueError(
            f'Invalid command: {parser.current_command}. Cannot pop to constant segment.')

    if parser.arg1() == Segments.temp and index > 7:
        raise ValueError(
            f'Invalid command: {parser.current_command}. temp segment index must be between 0 and 7.')

    if parser.arg1() == Segments.pointer and index not in [0, 1]:
        raise ValueError(
            f'Invalid command: {parser.current_command}. pointer segment uses index 0 for accessing `this`, and index 1 for accessing `that`.')


def sign(x: int):
    return (x > 0) - (x < 0)


def get_paths(in_path):
    if path.isdir(in_path):
        # get all paths to the .vm files in this directory
        file_paths = [path.join(in_path, f) for f in listdir(in_path)
                      if path.isfile(path.join(in_path, f)) and path.splitext(f)[1] == '.vm']

        dirname = path.split(in_path)[1]
        out_path = path.join(in_path, dirname + '.asm')
    else:
        file_paths = [in_path]
        out_path = path.splitext(in_path)[0] + '.asm'
    return (file_paths, out_path)


if __name__ == "__main__":
    test_files = '/Users/kyle/Documents/Programming/nand2tetris/VMTranslator/test_files'
    proj8_path = '/Users/kyle/Documents/Programming/nand2tetris/Project9JackApps/MyStats'

    simple = f'{proj8_path}'

    in_path = f'{simple}'
    (vm_file_paths, out_path) = get_paths(in_path)

    print(f'{vm_file_paths = }\n{out_path = }')

    with open(out_path, 'w') as out_file:
        writer = CodeWriter(out_file)
        for file_path in vm_file_paths:
            input_filename = path.splitext(path.basename(file_path))[0]
            writer.set_filename(input_filename)

            with open(file_path, 'r') as in_file:
                main(in_file, writer)

        writer.write_end_loop()
