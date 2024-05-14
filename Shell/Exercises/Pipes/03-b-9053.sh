# Използвайки файл population.csv, намерете коя държава има най-много население през 2016. А коя е с най-малко население?

cat ~/population.csv | grep ',2016,' | cut -d '"' -f 3 | sort -t ',' -k 4nr | head -n 1 |  cat ~/population.csv | grep ',2016,' | cut -d '"' -f 3 | sort -t ',' -k 4nr | head -n 1 | cut-d ',' -f 1

cat ~/population.csv | grep ',2016,' | cut -d '"' -f 3 | sort -t ',' -k 4nr | head -n 1 |  cat ~/population.csv | grep ',2016,' | cut -d '"' -f 3 | sort -t ',' -k 4nr | tail -n 1 | cut-d ',' -f 1
