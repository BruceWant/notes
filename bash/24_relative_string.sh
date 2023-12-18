!#/bin/sh

#In the following script, we take two strings in s1 and s2, and compare them to check if they are equal.
s1="apple"
s2="apple"
 
if [ $s1 = $s2 ];
then
    echo "Strings are equal."
else
    echo "String are not equal."
fi

#In the following script, we take two strings in s1 and s2, and compare them to check if s1 is greater than s2.
s1="banana"
s2="apple"

if [ $s1 \> $s2 ];
then
    echo "$s1 is greater than $s2."
else
    echo "$s1 is not greater than $s2."
fi


# In the following script, we take two strings in s1 and s2, and compare them to check if s1 is less than s2.
s1="banana"
s2="mango"

if [ $s1 \< $s2 ];
then
    echo "$s1 is less than $s2."
else
    echo "$s1 is not less than $s2."
fi


# Let us use elif statement to put all the above three comparisons together.
s1="banana"
s2="mango"

if [ $s1 = $s2 ];
then
    echo "Both the strings are equal."
elif [ $s1 \> $s2 ];
then
    echo "$s1 is greater than $s2."
elif [ $s1 \< $s2 ];
then
    echo "$s1 is less than $s2."
fi

