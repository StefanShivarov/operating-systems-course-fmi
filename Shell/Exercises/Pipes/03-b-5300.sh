# Намерете броя на уникалните символи, използвани в имената на потребителите от
# /etc/passwd.

cat /etc/passwd | cut -d ':' -f 5 | cut -d ',' -f 1 | sed 's/./&\n/g' | sort | uniq | wc -l
