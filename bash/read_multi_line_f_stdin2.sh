#!/bin/bash

# var=`cat`
# var=$(</dev/stdin)

# echo "$var"


# second ways
readarray -t arr
# Do something...
echo ${arr[@]}

unset arr

#declare -p arr


