#!/bin/bash

declare -a arr=(10 8 9 5 1)

merge() {
    local start=$1
    local mid=$2
    local end=$3

    local left=()
    local right=()
    
    for (( i=$start; i<=$mid; i++ )); do
        left+=(${arr[$i]})
    done
    for (( i=$mid+1; i<=$end; i++ )); do
        right+=(${arr[$i]})
    done

    local idx=$start
    local i=0
    local j=0
    # while (( i<${#left[@]} )) && (( j<${#right[@]} )); do
    while (( i<${#left[@]} )) && (( j<${#right[@]} )); do
        if (( left[i] < right[j] )); then
            arr[$idx]=${left[$i]}
            (( i++ ))
        else
            arr[$idx]=${right[$j]}
            (( j++ ))
        fi
        (( idx++ ))
    done
        
    while (( i<${#left[@]} )); do
        arr[$idx]=${left[$i]}
        (( i++ ))
        (( idx++ ))
    done
    while (( j<${#right[@]} )); do
        arr[$idx]=${right[$j]}
        (( j++ ))
        (( idx++ ))
    done
}

merge_sort(){
    local start=$1
    local end=$2

    if (( start >= end )); then
        return
    fi

    local mid=$(( start + (end-start)/2 ))
    merge_sort $start $mid
    merge_sort $((mid+1)) $end

    merge $start $mid $end
}

merge_sort 0 $((${#arr[@]}))
echo ${arr[@]}
