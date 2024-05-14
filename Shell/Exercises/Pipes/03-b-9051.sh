# Използвайки файл population.csv, намерете колко е общото население на света
# през 2008 година. А през 2016?

cat ~/population.csv | awk -F ',' 'BEGIN {sum = 0} $3 == 2008 {sum += $4} END {print sum}'
cat ~/population.csv | awk -F ',' 'BEGIN {sum = 0} $3 == 2016 {sum += $4} END {print sum}'
