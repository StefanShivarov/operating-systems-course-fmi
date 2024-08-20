#!/bin/bash

[[ ${#} -ne 1 ]] && echo "Expected 1 argument!" && exit 1

N=${1}
arr=(A Bb B C Db D Eb E F Gb G Ab)

function find_index() {
        for index in "${!arr[@]}"; do
                if [[ "${arr[${index}]}" == "${1}" ]]; then
                        echo ${index}
                        return
                fi
        done
        echo -1
}

function replace_chord() {
        local chord=${1}
        local note=$(echo "${chord}" | grep -E -o '^[A-G][b]?')
        local rest=$(echo "${chord}" | sed "s/^${note}//")
        local index=$(find_index "${note}")

        if [[ ${index} -ne -1 ]]; then
                local replacementIndex=$(( (index + N) % ${#arr[@]} ))
                echo "${arr[${replacementIndex}]}${rest}"
        else
                echo "${chord}"
        fi
}

while read -r line; do

        while read -r match; do
                chord=$(echo ${match} | tr -d '[]')
                [[ -z "${chord}" ]] && break
                escapedMatch=$(echo "${match}" | sed 's/[[]/\\[/g; s/[]]/\\]/g')
                line=$(echo "${line}" | sed "s/${escapedMatch}/<$(replace_chord ${chord})>/")
        done <<< $(echo "${line}" | grep -o -E '\[([A-G][b]?[a-z0-9]*)\]')
        echo ${line} | tr '<' '[' | tr '>' ']'
done < /dev/stdin