# Изведете командата на най-стария процес

ps -eo comm --sort=etime | tail -n 1
