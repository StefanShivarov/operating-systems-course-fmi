# Използвайки файл population.csv, намерете през коя година в България има най-много население.

cat ~/population.csv | grep 'Bulgaria' | sort -t ',' -k 4nr | head -n 1 | cut -d ',' -f 3
