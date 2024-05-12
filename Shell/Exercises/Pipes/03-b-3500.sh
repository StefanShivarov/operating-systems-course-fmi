# Колко файлове в /bin са 'shell script'-oве? (Колко файлове в дадена директория са ASCII text?)

find /bin/ -type f -exec file {} \; | grep -E '^.*shell script.*$' | wc -l
find /bin/ -type f -exec file {} \; | grep -E '^.*ASCII.*$' | wc -l
