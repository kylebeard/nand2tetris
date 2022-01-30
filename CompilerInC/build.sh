#!/bin/bash
cd /Users/kyle/Documents/Programming/nand2tetris/CompilerInC || exit
gcc JackCompiler.c JackTokenizer.c LinkedList.c utils.c -o JackCompiler -ggdb
# ./JackCompiler
