# да приемем, че файловете, които съдържат C код, завършват на `.c` или `.h`.
# Колко на брой са те в директорията `/usr/include`?
# Колко реда C код има в тези файлове?

find /usr/include | grep -E '.*\.[ch]$'
find /usr/include | grep -E '.*\.[ch]$' | xargs -I {} wc -l {} | cut -d ' ' -f 1 | awk 'BEGIN {sum = 0} {sum += $1} END {print sum}'
