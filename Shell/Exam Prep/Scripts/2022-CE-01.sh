#!/bin/bash

[[ $# -ne 3 ]] && echo "Invalid amount of arguments! Expected 3!" && exit 1
[[ ! $1 =~ ^[0-9]+\.?[0-9]*$ ]] && echo "First argument must be a number!" && exit 1
[[ ! $2 =~ [a-zA-Z] ]] && echo "Second argument must be a symbol!" && exit 1
[[ ! $3 =~ [a-zA-Z] ]] && echo "Third argument must be a symbol!" && exit 1

base_csv="base.csv"
prefix_csv="prefix.csv"

while read line; do
        [[ $(echo $line | awk -F ',' '{print NF}') -ne 3 ]] && echo "Invalid csv file!" && exit 1
done < "$base_csv"

while read line; do
        [[ $(echo $line | awk -F ',' '{print NF}') -ne 3 ]] && echo "Invalid csv file!" && exit 1
done < "$prefix_csv"

number=$1
prefix=$2
unit=$3

decimal=$(grep ",$prefix," "$prefix_csv" | cut -d ',' -f 3)
read unit_name measure <<< "$(grep ",$unit," "$base_csv" | awk -F ',' '{printf("%s %s", $1, $3)}')"

result=$(echo "$number * $decimal" | bc | sed 's/^\./0\./')
echo "$result $unit ($measure, $unit_name)"