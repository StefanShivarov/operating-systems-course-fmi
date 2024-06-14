#!/bin/bash

echo $(grep -E '^([^:]*:){4}([а-яА-Я ]*а),{4}I.*$' /etc/passwd | cut -d ':' -f 1 | cut -c 3-4 | sort -n | uniq -c | sort -nr | head -n 1)
