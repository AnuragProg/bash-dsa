#!/bin/bash

declare -a arr=(10 8 9 5 1)

selection_sort() {
    local -n _arr=$1

    for (( i=0; i<${#arr[@]}; i++ )); do
        min_idx=$i
        for (( j=$i; j<${#arr[@]}; j++ )); do
            if [ ${arr[$j]} -lt ${arr[$min_idx]} ]; then
                min_idx=$j
            fi
        done

        temp=${arr[$min_idx]}
        arr[$min_idx]=${arr[$i]}
        arr[$i]=$temp
    done
}

selection_sort arr
echo "sorted array =" ${arr[@]}
