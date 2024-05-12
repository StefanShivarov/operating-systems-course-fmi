# Копирайте <РЕПО>/exercises/data/emp.data във вашата home директория.
 cp /srv/fmi-os/exercises/data/emp.data ~

# Посредством awk, използвайки копирания файл за входнни данни, изведете:

# - общия брой редове
cat ~/emp.data | awk 'END {print NR}'

# - третия ред
cat ~/emp.data | awk 'NR == 3 {print $0}'

# - последното поле от всеки ред
cat ~/emp.data | awk '{print $NF}'

# - последното поле на последния ред
cat ~/emp.data | awk 'END {print $NF}'

# - всеки ред, който има повече от 4 полета
cat ~/emp.data | awk 'NF > 4 {print}'

# - всеки ред, чието последно поле е по-голямо от 4
cat ~/emp.data | awk '$NF > 4 {print}'

# - общия брой полета във всички редове
cat ~/emp.data | awk 'BEGIN {i = 0} {i += NF} END {print i}'

# - броя редове, в които се среща низът Beth
cat ~/emp.data | awk 'BEGIN {i = 0} $0 ~ /^.*Beth.*$/ {i++} END {print i}'

# - най-голямото трето поле и редът, който го съдържа
cat ~/emp.data | awk 'BEGIN {max = 0; row = ""} $3 > max {max = $3; row = $0} END {printf max" "row"\n"}'

# - всеки ред, който има поне едно поле
cat ~/emp.data | awk 'NF >= 1 {print}'

# - всеки ред, който има повече от 17 знака
cat ~/emp.data | awk '$0 ~ /^..{17,}$/ {print}'
cat ~/emp.data | awk 'length($0) > 17 {print}'

# - броя на полетата във всеки ред и самият ред
cat ~/emp.data | awk '{printf(NF" "$0"\n")}'

# - първите две полета от всеки ред, с разменени места
cat ~/emp.data | awk '{printf($2"\t"$1"\n")}'

# - всеки ред така, че първите две полета да са с разменени места
cat ~/emp.data | awk '{temp = $2; $2 = $1; $1 = temp; print}'

# - всеки ред така, че на мястото на първото поле да има номер на реда
cat ~/emp.data | awk '{$1 = NR; print}'

# - всеки ред без второто поле
cat ~/emp.data | awk '{$2 = ""; print}'

# - за всеки ред, сумата от второ и трето поле
cat ~/emp.data | awk '{printf("%.2f\n", $2 + $3)}'

# - сумата на второ и трето поле от всеки ред
cat ~/emp.data | awk 'BEGIN {sum = 0} {sum += $2 + $3} END {print sum}'
