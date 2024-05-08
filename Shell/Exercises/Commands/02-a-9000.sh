# от предната задача: когато вече сте получили myetc с файлове, архивирайте всички от тях,
# които започват с 'c' в архив, който се казва c_start.tar;
# изтрийте директорията myetc и цялото и съдържание; изтрийте архива c_start.tar

tar -c -f c_start.tar $(find ~/myetc -mindepth 1 -iname 'c*')
rm -rf ~/myetc
rm ~/c_start.tar
