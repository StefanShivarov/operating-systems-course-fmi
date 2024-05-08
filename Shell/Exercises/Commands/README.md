| Task        | Description |
|-|-|
| [02-a-0100](https://github.com/StefanShivarov/operating-systems-course-fmi/blob/main/Shell/Exercises/Commands/02-a-0100.sh)   | Направете копие на файла /etc/passwd във вашата home директория под името my_passwd. |
| [02-a-0500](https://github.com/StefanShivarov/operating-systems-course-fmi/blob/main/Shell/Exercises/Commands/02-a-0500.sh)   | Направете директория practice-test в home директорията ви. Вътре направете директория test1. Можете ли да направите тези две неща наведнъж? Разгледайте нужната man страница. След това създайте празен файл вътре, който да се казва test.txt, преместете го в practice-test чрез релативни пътища. |
| 02-a-0600   | Създайте директорията practice/01 във вашата home директория. Създайте 3 файла в нея - f1, f2, f3. Копирайте файловете f1, f2, f3 от директорията practice/01/ в директория dir1, намираща се във вашата home директория. Ако нямате такава, създайте я. |
| 02-a-0601   | Нека файлът f2 бъде преместен в директория dir2, намираща се във вашата home директория и бъде преименуван на numbers. |
| 02-a-1200   | Отпечатайте имената на всички директории в директорията /home. |
| 02-a-4000   | Създайте файл permissions.txt в home директорията си. За него дайте единствено - read права на потребителя създал файла, write and exec на групата, read and exec на всички останали. Направете го и с битове, и чрез "буквички". |
| 02-a-4100   | За да намерите какво сте правили днес: намерете всички файлове в home директорията ви, които са променени в последния 1 час. |
| 02-a-5000   | Копирайте /etc/services в home директорията си. Прочетете го с командата cat. (Ако този файл го няма, прочетете с cat произволен текстов файл напр. /etc/passwd) |
| 02-a-5200   | Създайте symlink на файла /etc/passwd в home директорията ви (да се казва например passwd_symlink). |
| 02-a-5400   | Изведете всички обикновени ("regular") файлове, които /etc и нейните преки поддиректории съдържат |
| 02-a-5401   | Изведете само първите 5 реда от /etc/services |
| 02-a-5402   | Изведете всички обикновени ("regular") файлове, които само преките поддиректории на /etc съдържат |
| 02-a-5403   | Изведете всички преки поддиректории на /etc |
| 02-a-5500   | Създайте файл, който да съдържа само последните 10 реда от изхода на 02-a-5403 |
| 02-a-5501   | Изведете обикновените файлове по-големи от 42 байта в home директорията ви |
| 02-a-5504   | па или за останалите(o=w) |
| 02-a-5505   | Изведете всички файлове, които са по-нови от practice/01/f1 ( би трябвало да е създаден като част от по-ранна задача ). |
| 02-a-5506   | Изтрийте файловете в home директорията си по-нови от practice/01/f3 (подайте на rm опция -i за да може да изберете само тези които искате да изтриете). |
| 02-a-6000   | Намерете файловете в /bin, които могат да се четат, пишат и изпълняват от всички. |
| 02-a-8000   | Копирайте всички файлове от /etc, които могат да се четат от всички, в директория myetc в home директорията ви. Направете такава, ако нямате. |
| 02-a-9000   | от предната задача: когато вече сте получили myetc с файлове, архивирайте всички от тях, които започват с 'c' в архив, който се казва c_start.tar; изтрийте директорията myetc и цялото и съдържание; изтрийте архива c_start.tar |
| 02-a-9500   | Използвайки едно извикване на командата find, отпечатайте броя на редовете във всеки обикновен файл в /etc директорията. |
| 02-b-4000   | Копирайте най-малкия файл от тези, намиращи се в /etc, в home директорията си. |