#!/bin/bash
cd ~/Documents/Programming/nand2tetris/CompilerInClojure || exit
textComparer=~/Documents/Programming/nand2tetris/tools/TextComparer.sh

test_path=./test
p10path=../projects/10

dirs=("ArrayTest" "ExpressionLessSquare" "Square")
# dirs=("ExpressionLessSquare")
for dir in "${dirs[@]}"; do
    echo "running $test_path/$dir"
    # ./JackCompiler $test_path/"$dir"
    for file in "$test_path"/"$dir"/*.xml; do
        compareFile=$p10path/$dir/${file##*/}
        echo "Comparing" "$dir"/"${file##*/}"
        $textComparer "$file" "$compareFile"
    done
done
