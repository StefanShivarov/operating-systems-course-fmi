# Копирайте всички файлове от /etc, които могат да се четат от всички,
# в директория myetc в home директорията ви. Направете такава, ако нямате.

mkdir ~/myetc
cp -r $(find /etc -mindepth 1 -perm -a+r) ~/myetc
