#!/bin/bash
cd ~/Documents/Programming/nand2tetris/Compiler/JackAnalyzer || exit
textComparer=~/Documents/Programming/nand2tetris/tools/TextComparer.sh

test_path=./test
p10path=../../projects/10

dirs=("ArrayTest" "ExpressionLessSquare" "Square")
for dir in "${dirs[@]}"; do
    # python3 JackAnalyzer.py $test_path/"$dir"
    for file in "$test_path"/"$dir"/*.xml; do
        compareFile=$p10path/$dir/${file##*/}
        echo "Comparing" "$dir"/"${file##*/}"
        $textComparer "$file" "$compareFile"
    done
done
