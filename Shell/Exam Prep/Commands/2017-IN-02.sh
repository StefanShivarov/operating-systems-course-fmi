#!/bin/bash

emptyFilesInCurrentDir=$(find . -size 0)
largestFiles=$(find ~ -printf "%s %p\n" | sort -nr | head -n 5 | cut -d ' ' -f 2)

for file in ${largestFiles}; do
        rm -i ${file}
done

for file in ${emptyFilesInCurrentDir}; do
        rm -i ${file}
done
