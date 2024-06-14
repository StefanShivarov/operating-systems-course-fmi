#!/bin/bash

if [[ ! -f ${1} ]]; then
        echo "File ${1} does not exist!"
        exit 1
fi

echo "$(cat ${1} | cut -c 12- | awk 'BEGIN {count=0} {count++} {printf("%d. %s\n", count, $0)}' | sort -t ' ' -k 2)"
