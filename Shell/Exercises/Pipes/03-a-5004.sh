# Изведете целите редове от /etc/passwd за хората от 03-a-5003

cut -d ':' -f 5 /etc/passwd | cut -d ',' -f 1 | grep -E '^[а-яА-Яa-zA-Z]+ [а-яА-Яa-zA-Z]{0,7}$' | xargs -I {} grep -w '{}' /etc/passwd
