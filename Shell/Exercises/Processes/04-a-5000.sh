# Намерете командите на 10-те най-стари процеси в системата.

ps -eo comm --sort=etime | tail -n 10 | tac
