# Изведете всички обикновени ("regular") файлове, които само преките поддиректории на /etc съдържат

find /etc -maxdepth 2 -mindepth 2 -type f
