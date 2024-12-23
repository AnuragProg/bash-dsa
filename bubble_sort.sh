#!/bin/bash

declare -a arr=(10 8 9 5 1)

bubble_sort(){
    local -n _arr=$1

    for (( i=0; i<${#arr[@]}; i++ )); do
        for (( j=0; j<${#arr[@]}-1; j++ )); do
            if [ ${arr[$j]} -gt ${arr[$j+1]} ]; then 
                temp=${arr[$j]}
                arr[$j]=${arr[$j+1]}
                arr[$j+1]=$temp
            fi
        done
    done
}

bubble_sort arr
echo "sorted array =" ${arr[@]}
