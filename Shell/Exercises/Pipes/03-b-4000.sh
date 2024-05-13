# Създайте следната файлова йерархия в home директорията ви:
# dir5/file1
# dir5/file2
# dir5/file3

# Посредством vi въведете следното съдържание:
# file1:
# 1
# 2
# 3

# file2:
# s
# a
# d
# f

# file3:
# 3
# 2
# 1
# 45
# 42
# 14
# 1
# 52

mkdir ~/dir5
vim ~/dir5/file1
vim ~/dir5/file2
vim ~/dir5/file3

# Изведете на екрана:
# 	* статистика за броя редове, думи и символи за всеки един файл
printf "file1 lines: $(cat ~/dir5/file1 | wc -l), words: $(cat ~/dir5/file1 | wc -w), symbols: $(cat ~/dir5/file1 | wc -c)\n"
printf "file2 lines: $(cat ~/dir5/file2 | wc -l), words: $(cat ~/dir5/file2 | wc -w), characters: $(cat ~/dir5/file2 | wc -m)\n"
printf "file3 lines: $(cat ~/dir5/file3 | wc -l), words: $(cat ~/dir5/file3 | wc -w), characters: $(cat ~/dir5/file3 | wc -m)\n"

# 	* статистика за броя редове и символи за всички файлове
printf "all files lines: $(cat ~/dir5/file{1,2,3} | wc -l), characters: $(cat ~/dir5/file{1,2,3} | wc -m)\n"
