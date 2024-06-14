#!/bin/bash
#Имате компилируем (a.k.a няма синтактични грешки) source file на езика C. Напишете shell script, който да покaзва колко е дълбоко най-дълбокото nest-ване (влагане).
#Примерен .c файл:

#include <stdio.h>

#int main(int argc, char *argv[]) {

#  if (argc == 1) {
#		printf("There is only 1 argument");
#	} else {
#		printf("There are more than 1 arguments");
#	}

#	return 0;
#}
#Тук влагането е 2, понеже имаме main блок, а вътре в него if блок.

if [[ ! -f ${1} ]]; then
        echo "File ${1} does not exist!"
        exit 1
fi

maxNesting=0
counter=0

while read ch; do
        if [[ ${ch} == '{' ]]; then
                $(( counter++ ))
        else
                if [[ ${maxNesting} -lt ${counter} ]]; then
                        maxNesting=${counter}
                fi
                $(( counter-- ))
        fi
done < <( grep -E -o '[{}]' "${1}" )

echo "The deepest nesting is ${maxNesting} levels deep."
