#!/bin/bash

if [[ ${#} -ne 2 ]]; then
        echo "Invalid number of parameters!"
        exit 1
fi

inputFile=${1}
outputFile=${2}

colsCount=$(cat ${inputFile}| head -n 1 | awk -F ',' '{print NF}')

declare -A arr
while read line; do

        if [[ ! "${line}" =~ ^[0-9]+(,[^,]*){$((colsCount - 1))}$ ]]; then
                echo "Invalid csv file!"
                exit
        fi

        id=$(echo ${line} | cut -d ',' -f 1)
        fieldsText=$(echo ${line} | cut -d ',' -f 2-)

        if [[ ! -v arr[${fieldsText}] || arr[${fieldsText}] -gt ${id} ]]; then
                arr[${fieldsText}]=${id}
        fi

done < ${inputFile}

for str in ${!arr[@]}; do
        echo "${arr[${str}]},${str}" >> ${outputFile}
done