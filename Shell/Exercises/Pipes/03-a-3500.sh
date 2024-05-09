# Изпишете всички usernames от /etc/passwd с главни букви.

cat /etc/passwd | cut -d ':' -f 1 | tr a-z A-Z
# или
cat /etc/passwd | cut -d ':' -f 1 | sed -E 's/[a-z]/\U&/g'
