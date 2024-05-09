# Изведете колко потребители не изпозват /bin/bash за login shell според /etc/passwd

cat /etc/passwd | cut -d ':' -f 7 | grep -v /bin/bash | wc -l
