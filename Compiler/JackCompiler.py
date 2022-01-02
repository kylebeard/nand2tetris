from typing import List, Tuple
from CompilationEngine import CompliationEngine
from JackTokenizer import JackTokenizer
import sys
from os import path, listdir
from VMWriter import VMWriter
if len(sys.argv) != 2:
    raise Exception(
        'Usage: JackCompiler.py (file.jack|directory with .jack files)')


def get_paths(in_path) -> Tuple[List[str], List[str]]:
    if path.isdir(in_path):
        # get all paths to the .jack files in this directory
        file_paths = [
            path.join(in_path, f)
            for f in listdir(in_path)
            if path.isfile(path.join(in_path, f))
            and path.splitext(f)[1] == '.jack']

        out_paths = [file_path.replace('.jack', '.vm')
                     for file_path in file_paths]
    else:
        file_paths = [in_path]
        out_paths = [in_path.replace('.jack', '.vm')]
    return (file_paths, out_paths)


in_paths, out_paths = get_paths(sys.argv[1])
for inpath, outpath in zip(in_paths, out_paths):
    print(f'Compiling {inpath}...')
    with open(inpath) as infile:
        with open(outpath, 'w') as outfile:
            tokenizer = JackTokenizer(infile)
            writer = VMWriter(outfile)
            engine = CompliationEngine(tokenizer, writer)
            engine.compile_class()
    print(f'done. Output is in {outpath}')
