#!/bin/bash

if [[ $# -ne 1 ]]; then
        echo "Invalid amount of params!"
        exit 1
fi

if [[ ! -d ${1} ]]; then
        echo "${1} is not a directory!"
        exit 2
fi

for file in $(find ${1} -type l 2> /dev/null | xargs -I{} readlink {}); do
        if [[ ! -e ${file} ]]; then
                echo ${file}
        fi
done
