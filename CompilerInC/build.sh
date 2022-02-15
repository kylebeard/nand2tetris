#!/bin/bash
cd /Users/kyle/Documents/Programming/nand2tetris/CompilerInC || exit
clang++ -g -std=c++2a -Wno-writable-strings -Wno-deprecated -Wno-c++11-compat-deprecated-writable-strings JackCompiler.cpp JackTokenizer.cpp LinkedList.cpp utils.cpp CompilationEngine.cpp -o JackCompiler
# ./JackCompiler ./test/Test.jack
