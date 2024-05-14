# Да се изведат всички албуми, сортирани по година.

find ~/songs -mindepth 1 | cut -d '/' -f 6 | sed -E 's/.* \((.*)\).*/\1/g' | sort -t ',' -k 2nr | cut -d ',' -f 1
