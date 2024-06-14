# Да се напише shell скрипт, който чете от стандартния вход име на файл и символен низ, 
# проверява дали низа се съдържа във файла и извежда на стандартния изход кода на завършване на командата с която сте проверили наличието на низа.
# NB! Символният низ може да съдържа интервал (' ') в себе си.

read -p "Enter first file name: " first

if [[ ! -f ${first} ]]; then
        echo "File ${first} does not exist."
        exit 1
fi

read -p "Enter second file name: " second

if [[ ! -f ${second} ]]; then
        echo "File ${second} does not exist."
        exit 1
fi

read -p "Enter output file name: " output

if [[ ! -f ${output} ]]; then
        touch ${output}
fi

paste "${first}" "${second}" | tr '\t' '\n' | sort > "${output}"
