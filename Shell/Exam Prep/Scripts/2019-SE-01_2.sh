#!/bin/bash

maxDigitSum=0
minNumWithMaxSum=
counter=0
while read -r line; do
        if [[ ${line} =~ ^-?[0-9]+$ ]]; then
                currSum=0
                unsignedNumCopy=$(echo "${line}" | tr -d '-')
                while [[ unsignedNumCopy -ne 0 ]]; do
                        currSum=$(( currSum + unsignedNumCopy % 10 ))
                        unsignedNumCopy=$(( unsignedNumCopy / 10 ))
                done

                if [[ ${currSum} -ge ${maxDigitSum} ]]; then
                        if [[ ${counter} -eq 0 ]]; then
                                minNumWithMaxSum=${line}
                        fi
                        maxDigitSum=${currSum}
                        if [[ ${line} -lt ${minNumWithMaxSum} ]]; then
                                minNumWithMaxSum=${line}
                        fi
                fi

                counter=$((counter + 1))
        fi
done < ${1:-/dev/stdin}

echo "${minNumWithMaxSum}"