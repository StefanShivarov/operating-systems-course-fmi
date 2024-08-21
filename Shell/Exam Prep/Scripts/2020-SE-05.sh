#!/bin/bash

[[ $# -ne 3 ]] && echo "Invalid amount of arguments! Expected 3!" && exit 1
[[ ! -f $1 || ! -f $2 ]] && echo "First two arguments must be existing files!" && exit 1
[[ ! -d $3 ]] && echo "Third argument must be an existing directory!" && exit 1

pwd_file=$1
config_file=$2
cfgdir=$3

valid_files=()
while read file; do
        username=$(basename "$file" | sed 's/\.cfg//')
        user_record=$(grep "$username:" "$pwd_file")
        if [[ -z "$user_record" ]]; then
                pass=$(pwgen 16 1)
                pass_hash=$(echo "$pass" | md5sum | cut -d ' ' -f 1)
                echo "$username $pass"
                echo "$username:$pass_hash" >> "$pwd_file"
        fi

        errors=$(egrep -v "^#.*|^\{ [a-z;-]* \};$|^$" "$file" -n)
        if [[ ! -z "$errors" ]]; then
                echo "Error in $(basename "$file"):"
                echo "${errors}" | sed -E 's/^(.+)$/Line \1/'
        else
                valid_files+=("$file")
        fi

done < <(find "$cfgdir" -mindepth 1 -type f -name "*.cfg")

cat "${valid_files[@]}" > "$config_file"