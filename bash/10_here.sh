#!/bin/bash
another_script=./while.sh
echo "On which topic do you want advice?"
cat << topics
politics
startrek
kernelnewbies
sports
bofh-excuses
magic
love
literature
drugs
education
topics

echo
echo -n "Make your choice: "
read topic
echo
echo "Free advice on the topic of $topic: "
echo
$another_script $topic
echo
