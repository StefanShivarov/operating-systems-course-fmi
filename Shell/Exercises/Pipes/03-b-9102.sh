# Да се изведат само имената на песните.

find ~/songs -mindepth 1 | cut -d '/' -f 6 | cut -d '-' -f 2 | cut -c 2- | cut -d '(' -f 1
# или
find ~/songs -mindepth 1 | cut -d '/' -f 6 | sed -E 's/.* - (.*) \(.*/\1/g'
