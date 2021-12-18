from typing import List, Tuple
from JackTokenizer import JackTokenizer
import sys
from os import path, listdir
if len(sys.argv) != 2:
    raise Exception('Usage: JackAnalyzer.py (file.jack|directory with .jack files)')


def get_paths(in_path) -> Tuple[List[str], List[str]]:
    if path.isdir(in_path):
        # get all paths to the .jack files in this directory
        file_paths = [path.join(in_path, f) for f in listdir(in_path)
                      if path.isfile(path.join(in_path, f)) and path.splitext(f)[1] == '.jack']

        out_paths = [file_path.replace('.jack', 'T.xml') for file_path in file_paths]
    else:
        file_paths = [in_path]
        out_paths = [in_path.replace('.jack', 'T.xml')]
    return (file_paths, out_paths)


input = sys.argv[1]
in_paths, out_paths = get_paths(input)

for inpath, outpath in zip(in_paths, out_paths):
    print(f'{inpath = }\n{outpath = }')

    with open(inpath) as infile:
        with open(outpath, 'w') as outfile:
            outfile.write('<tokens>\n')
            tokenizer = JackTokenizer(infile, outfile)
            while tokenizer.has_more_tokens():
                tokenizer.advance()

            outfile.write('</tokens>')
