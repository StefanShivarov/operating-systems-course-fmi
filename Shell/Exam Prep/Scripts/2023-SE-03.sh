#!/bin/bash

[[ $# -ne 1 ]] && echo "Invalid number of arguments!" && exit 1
[[ ! -d $1 ]] && echo "Argument should be an existing directory!" && exit 1

files=$(find "$1" -mindepth 1 -type f)
files_count=$(echo "$files" | wc -l)

declare -A files_with_more_than_3_count
declare -A total_count

function check_words_from_file() {
        local file=$1

        while read word_info; do

                local count=$(echo "$word_info" | cut -d ' ' -f 1)
                local word=$(echo "$word_info" | cut -d ' ' -f  2)

                [[ $count -ge 3 ]] && files_with_more_than_3_count[$word]=$((${files_with_more_than_3_count[$word]} + 1))

                total_count[$word]=$((${total_count[$word]} + count))

        done < <(cat "$file" | tr ' ' '\n' | egrep '^[a-z]*$' | sort | uniq -c | sort -nr | sed -E 's/^[ ]*//')
}

for file in $files; do
        check_words_from_file $file
done

output=""
for word in "${!total_count[@]}"; do
        # echo "$word : ${files_with_more_than_3_count[$word]}")
        [[ ${files_with_more_than_3_count[$word]} -ge $((files_count / 2)) ]] && output+="$word:${total_count[$word]}\n"
done

echo -e "$output" | egrep '^.+' | sort -nr -t ':' -k 2 | cut -d ':' -f 1