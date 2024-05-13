# Намерете броя на символите, различни от буквата 'а' във файла /etc/passwd

cat /etc/passwd | sed 's/a//g' | wc -m
