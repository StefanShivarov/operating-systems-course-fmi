#!/bin/bash

if [[ ${#} -ne 2 ]]; then
        echo "Invalid amount of parameters!"
fi

if [[ ! -d ${2} ]]; then
        echo "The parameter you provided is not a valid directory!"
fi

csvFile=${1}
logsDir=${2}

touch ${csvFile}
echo "hostname,phy,vlans,hosts,failover,VPN-3DES-AES,peers,VLAN Trunk Ports,license,SN,key" > ${csvFile}
while read file; do
        hostname=$(basename ${file} | sed 's/.log//')
        data=$(cat ${file} | tail -n +2 | sed -E 's/(This platform has a[n]?)(.*)/\1:\2/' | sed -E 's/ license[.]$//' | cut -d ':' -f 2 | cut -c 2- | tr '\n' ',' | sed 's/.$//')
        echo "${data}" >> ${csvFile}
done < <(find ${logsDir} -mindepth 1 -type f | grep -E '.*\.log$')