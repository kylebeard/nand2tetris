#!/bin/bash
cd /Users/kyle/Documents/Programming/nand2tetris/CompilerInC || exit
clang -g JackCompiler.c JackTokenizer.c LinkedList.c utils.c -o JackCompiler
# ./JackCompiler
