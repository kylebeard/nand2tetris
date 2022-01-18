#! /bin/bash
n2t=/Users/kyle/Documents/Programming/nand2tetris
cd $n2t/projects/12 || exit
jack() {
    python3 $n2t/Compiler/JackCompiler.py "$1"
}
jack Math.jack && jack Memory.jack && jack Screen.jack && jack Output.jack && jack Keyboard.jack && jack String.jack && jack Array.jack && jack Sys.jack
cp Math.vm Memory.vm Screen.vm Output.vm Keyboard.vm String.vm Array.vm Sys.vm ./MathTest
cp Math.vm Memory.vm Screen.vm Output.vm Keyboard.vm String.vm Array.vm Sys.vm ./ArrayTest
cp Math.vm Memory.vm Screen.vm Output.vm Keyboard.vm String.vm Array.vm Sys.vm ./KeyboardTest
cp Math.vm Memory.vm Screen.vm Output.vm Keyboard.vm String.vm Array.vm Sys.vm ./MemoryTest
cp Math.vm Memory.vm Screen.vm Output.vm Keyboard.vm String.vm Array.vm Sys.vm ./OutputTest
cp Math.vm Memory.vm Screen.vm Output.vm Keyboard.vm String.vm Array.vm Sys.vm ./ScreenTest
cp Math.vm Memory.vm Screen.vm Output.vm Keyboard.vm String.vm Array.vm Sys.vm ./StringTest
cp Math.vm Memory.vm Screen.vm Output.vm Keyboard.vm String.vm Array.vm Sys.vm ./SysTest
