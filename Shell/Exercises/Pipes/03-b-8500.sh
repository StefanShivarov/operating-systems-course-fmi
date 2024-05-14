# За всяка група от /etc/group изпишете "Hello, <група>", като ако това е вашата група, напишете "Hello, <група> - I am here!".

cat /etc/group | cut -d ':' -f 1 | awk -v group=$(id -gn) '{if ($1==group) {print "Hello, "$1" - I am here!"} else {print "Hello, "$1} }'
