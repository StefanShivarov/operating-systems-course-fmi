# Направете списък с директориите на вашата файлова система, до които нямате достъп.
# Понеже файловата система може да е много голяма, търсете до 3 нива на дълбочина.

find / -maxdepth 3 -type d 2>&1 > /dev/null | cut -d ':' -f 2 | cut -c 5- | rev | cut -c 4- | rev > ~/forbidden-dirs.txt
cat ~/forbidden-dirs.txt
