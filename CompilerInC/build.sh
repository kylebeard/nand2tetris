#!/bin/bash
cd /Users/kyle/Documents/Programming/nand2tetris/CompilerInC || exit
clang++ -g -Wno-deprecated -Wno-c++11-compat-deprecated-writable-strings JackCompiler.c JackTokenizer.c LinkedList.c utils.c CompilationEngine.cpp -o JackCompiler
# ./JackCompiler ./test/Test.jack
