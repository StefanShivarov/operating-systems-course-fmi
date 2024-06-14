#!/bin/bash
# Да се напише shell скрипт, който чете от стандартния вход имената на 3 файла,
# обединява редовете на първите два (man paste), подрежда ги по азбучен ред и резултата записва в третия файл.

read -p "Enter first file name: " first

if [[ ! -f ${first} ]]; then
        echo "File ${first} does not exist."
        exit 1
fi

read -p "Enter second file name: " second

if [[ ! -f ${second} ]]; then
        echo "File ${second} does not exist."
        exit 1
fi

read -p "Enter output file name: " output

if [[ ! -f ${output} ]]; then
        touch ${output}
fi

paste "${first}" "${second}" | tr '\t' '\n' | sort > "${output}"
