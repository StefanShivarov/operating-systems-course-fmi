# Вземете факултетните номера на студентите (описани във файла
# <РЕПО>/exercises/data/mypasswd.txt) от СИ и ги запишете във файл si.txt сортирани.

cat /srv/fmi-os/exercises/data/mypasswd.txt | grep "/home/SI" | cut -d ':' -f 1 | cut -c 2- | grep -E -v '[a-zA-Z]' | sort -n > ~/si.txt
