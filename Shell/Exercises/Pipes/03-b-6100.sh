# Отпечатайте последната цифра на UID на всички редове между 28-ми и 46-ред в /etc/passwd.

cat /etc/passwd | tail -n +28 | head -n 19 | cut -d ':' -f 3 | rev | cut -c 1
