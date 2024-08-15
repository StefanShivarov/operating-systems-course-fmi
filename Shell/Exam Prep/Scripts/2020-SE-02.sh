#!/bin/bash

if [[ ${#} -ne 1 ]]; then
        echo "Invalid number of arguments!"
fi

logFile=${1}

top3Sites=$(cat ${logFile} | cut -d ' ' -f 2 | sort | uniq -c | sort -nr | head -n 3 | sed -E 's/( )*[0-9]+ //')

for site in ${top3Sites}; do
        echo "${site} HTTP/2.0: $(grep ".*${site}.*HTTP/2.0" ${logFile} | wc -l) non-HTTP/2.0: $(grep "${site}" ${logFile} | grep -v "HTTP/2.0" | wc -l)"
        cat ${logFile} | grep ${site} | awk '{if($(NF-4)>=302) print $1}' | sort | uniq -c | sort -nr | sed -E 's/^( )*//'
done