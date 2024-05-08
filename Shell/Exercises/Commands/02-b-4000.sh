# Копирайте най-малкия файл от тези, намиращи се в /etc, в home директорията си.

cp $(wc -c $(find /etc -type f 2> /dev/null) 2>/dev/null | sort -n | head -n 1 | tr -s ' ' | cut -d '' -f 3) ~
