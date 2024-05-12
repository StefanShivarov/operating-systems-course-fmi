# Намерете само Group ID-то си от файлa /etc/passwd.

awk -v username=$(whoami) -F ':' '$0 ~ ("^.*" username ".*$") {print $4}' /etc/passwd
# или
grep $(whoami) /etc/passwd | cut -d ':' -f 4
