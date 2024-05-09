# Изведете броя на байтовете в /etc/passwd.
# Изведете броя на символите в /etc/passwd.
# Изведете броя на редовете  в /etc/passwd.

cat /etc/passwd | wc --bytes
cat /etc/passwd | wc --chars
cat /etc/passwd | wc --lines
