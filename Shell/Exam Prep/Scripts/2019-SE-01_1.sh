#!/bin/bash

maxAbsValue=0
numbers=""
while read -r line; do
        if [[ ${line} =~ ^-?[0-9]+$ ]]; then
                numbers+="${line} "
                currAbsValue=$(echo ${line} | tr -d '-')

                if [[ ${currAbsValue} -gt ${maxAbsValue} ]]; then
                        maxAbsValue=${currAbsValue}
                fi

        fi
done < ${1:-/dev/stdin}

smallestNum=$(echo "${numbers}" | tr ' ' '\n' | sort -n | uniq | head -n 1)
biggestNum=$(echo "${numbers}" | tr ' ' '\n' | sort -nr | uniq | head -n 1)

[[ $(echo "${smallestNum}" | tr -d '-') -eq ${maxAbsValue} ]] && echo "${smallestNum}"
[[ $(echo "${biggestNum}" | tr -d '-') -eq ${maxAbsValue} ]] && echo "${biggestNum}"