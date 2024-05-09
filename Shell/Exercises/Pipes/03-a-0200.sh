# Сортирайте /etc/passwd лексикографски по поле UserID.

# без pipe
sort /etc/passwd -t ':' -k 3
# с pipe
cat /etc/passwd | sort -t ':' -k 3