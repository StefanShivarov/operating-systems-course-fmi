# Изведете всички обикновени ("regular") файлове, които /etc и нейните преки поддиректории съдържат.

find /etc -maxdepth 2 -mindepth 1 -type f
