#!/bin/bash

if [[ $# != 2 ]]; then
        echo "Invalid amount of params!"
        exit 1
fi

if [[ ! -e $1 || ! -e $2 ]]; then
        echo "File does not exist!"
        exit 1
fi

biggerFile=
if [[ $(grep "$1" $1 | wc -l) -gt $(grep "$2" $2 | wc -l) ]]; then
        biggerFile=$1
else
        biggerFile=$2
fi

cut "${biggerFile}" -d '-' -f 2 | sed 's/ //' | sort > "${biggerFile}.songs"

exit 0
