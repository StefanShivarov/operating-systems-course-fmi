#!/bin/bash
# Да се напише shell скрипт, който приканва потребителя да въведе пълното име на директория 
# и извежда на стандартния изход подходящо съобщение за броя на всички файлове и всички директории в нея.

read -p "Enter full directory path: " directory

if [[ ! -d ${directory} ]] ; then
    echo "No such directory exists!"
    exit 1
fi

filesCount=$(find "${directory}" -mindepth 1 -type f 2>&1 | wc -l)
directoriesCount=$(find "${directory}" -mindepth 1 -type d 2>&1 | wc -l)

echo "Files count: ${filesCount}"
echo "Directories count: ${directoriesCount}"
