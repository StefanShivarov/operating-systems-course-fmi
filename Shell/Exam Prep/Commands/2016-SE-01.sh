#!/bin/bash

regex='^[^a-w]*[02468]+[^a-w]*$'

echo "$(grep -E ${regex} ${1} | wc -l)"