# Във file2 (inplace) подменете всички малки букви с главни.

sed -i -E 's/([a-z])/\U\1/g' ~/dir5/file2
