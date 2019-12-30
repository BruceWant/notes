#!/bin/bash

# var=`cat`
# var=$(</dev/stdin)

# echo "$var"


# second ways
#readarray -t arr
# Do something...

#declare -p arr



declare -a arr

read -a arr

echo
element_count=${#arr[@]}
# element_count=${#arr[*]} work also.
# The "@" variable allows word splitting with quotes
#+ (extracts variables separated by whitespace).
#
#  This corresponds to the behavior of "$@" and "$*"
#+ in positional parameters.

index=0

while [ "$index" -lt "$element_count" ]
do 
	echo ${arr[$index]}
	#    ${arr[index]} also works becasue it's within ${...} brackets.
	let "index = $index + 1"
	# or:
	#    ((index++))
done

# Again, list all the elements in the array, but using a more elegant method.
echo ${arr[@]}		# echo ${arr[*]} also works.

echo

unset arr		# Delete entire array.

exit 0
