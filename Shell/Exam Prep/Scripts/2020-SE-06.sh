#!/bin/bash

if [[ ${#} -ne 3 ]]; then
        echo "Invalid number of arguments!"
        exit 1
fi

if [[ ! -f ${1} ]]; then
        echo "First argument must be an existing file!"
        exit 1
fi

configFile=${1}
key=${2}
value=${3}

if [[ ! ${key} =~ [a-zA-Z0-9_]+ ]]; then
        echo "Invalid key!"
        exit 1
fi

if [[ ! ${value} =~ [a-zA-Z0-9_]+ ]]; then
        echo "Invalid value!"
        exit 1
fi

while read lineWithNumber; do
        lineNumber=$(echo "${lineWithNumber}" | awk -F ':' '{print $1}')
        line=$(echo "${lineWithNumber}" | awk -F ':' '{print $2}')
        if [[ ${line} =~ ^\s*#\s*.* || -z ${line} ]]; then
                continue
        fi

        keyValuePair=$(echo "${line}" | sed -E 's/\s+/ /g' | sed -E 's/\s*=\s*/=/' | sed -E 's/(.*)#.*/\1/' | sed -E 's/^\s+(.*)\s+$/\1/')
        currentKey=$(echo "${keyValuePair}" | awk -F '=' '{print $1}')
        currentValue=$(echo "${keyValuePair}" | awk -F '=' '{print $2}')

        if [[ ${currentKey} == ${key} && ${currentValue} != ${value} ]]; then
                sed -i -E "${lineNumber} s/(.*)/# \\1 # edited at $(date) by $(whoami)/" "${configFile}"
                if [[ $(cat ${configFile} | wc -l) == ${lineNumber} ]]; then
                        echo "${key} = ${value} # added at $(date) by $(whoami)" >> "${configFile}"
                        exit 0
                else
                        sed -i -E "$(( lineNumber + 1))i ${key} = ${value} # added at $(date) by $(whoami)" "${configFile}"
                        exit 0
                fi
        fi

done < <(cat "${configFile}" | awk '{print NR ":" $0}')

echo "${key} = ${value} # added at $(date) by $(whoami)" >> "${configFile}"