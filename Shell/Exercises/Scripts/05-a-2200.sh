# Направете си ваш псевдоним (alias) на полезна команда.

alias get_logged_people="who | cut -d ' ' -f 1 | xargs -I {} grep {} /etc/passwd | cut -d ':' -f 5 | cut -d ',' -f 1 | sort | uniq"
