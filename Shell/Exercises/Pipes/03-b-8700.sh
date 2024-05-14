# 1. Изведете GID-овете на 5-те най-големи групи спрямо броя потребители, за които
# съответната група е основна (primary).
cat /etc/passwd | cut -d ':' -f 4 | sort -n | uniq -c | sort -nr | head -n 5 | awk '{print $2}'

# 2. (*) Изведете имената на съответните групи.
cat /etc/passwd | cut -d ':' -f 4 | sort -n | uniq -c | sort -nr | head -n 5 | awk '{print $2}' | xargs -I {} grep :{}: /etc/group | cut -d ':' -f 1
