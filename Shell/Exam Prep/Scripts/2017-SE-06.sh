#!/bin/bash

if [[ "$EUID" -ne 0 ]]; then
        echo "You must run this script as root!"
        exit 1
fi

root_total=0

while read uid pid rss; do
        $(( root_total += rss ))
done < <(ps -u 0 -o uid,pid,rss)


while read username uid homedir; do

        if [[ ! -e $homedir || $(stat ${homedir} -c "%U") != ${username} || $(stat ${homedir} -c "%a" | cut -c 1) -lt 4 ]]; then
                user_sum=0
                while read pid rss; do
                        $(( usersum += rss ))
                done < <(ps -u ${uid} -o pid,rss)

                if [[ ${user_sum} -gt ${root_total} ]]; then
                        killall "${uid}"
                fi
        fi

done < <(cat /etc/passwd | awk -F ':' '{print $1 " " $3 " " $6}')
