#!/bin/bash
# Да се напише shell скрипт, който приема точно един параметър и проверява дали подаденият му параметър се състои само от букви и цифри.

read -p "Enter string: " str
regex='^[a-zA-Z0-9]*$'

if [[ $str =~ $regex ]] ; then
        echo "Yes"
else
        echo "No"
fi
