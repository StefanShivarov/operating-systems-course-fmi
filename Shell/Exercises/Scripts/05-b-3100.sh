#!/bin/bash
# Да се напише shell скрипт, който приканва потребителя да въведе низ - потребителско име на потребител от системата - 
# след което извежда на стандартния изход колко активни сесии има потребителят в момента.

read -p "Enter username: " username

if ! grep -q $username /etc/passwd ; then
        echo "No user with username ${username} exists!"
        exit 1
fi

activeSessions=$(who | grep $username | wc -l)
echo "Active sessions for $username: $activeSessions"
