# Колко коментара има във файла /etc/services ? Коментарите се маркират със символа #, след който всеки символ на реда се счита за коментар.

awk 'BEGIN {count = 0} $0 ~ "^.*#.*$" {count++} END {print count}' /etc/services
#или
grep -E '^.*#.*$' /etc/services | wc -l
