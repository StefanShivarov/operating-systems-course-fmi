# Намерете колко физическа памет заемат осреднено всички процеси на потребителската група root. Внимавайте, когато групата няма нито един процес.

ps -g root -o group,drs | awk '{print $2}' | awk '{sum += $1; counter += 1} END {printf("%.2f\n", sum/counter)}'
