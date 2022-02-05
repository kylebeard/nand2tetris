#!/bin/bash
cd /Users/kyle/Documents/Programming/nand2tetris/CompilerInC || exit
clang -g JackCompiler.c JackTokenizer.c LinkedList.c utils.c CompilationEngine.c -o JackCompiler
# ./JackCompiler ./test/Test.jack
