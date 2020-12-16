#!/bin/bash


var="This is a sentence"

# method 1:
echo $var | cut -d ' ' -f1
echo $var | cut -d ' ' -f2


# method 2:
vars=($var)
echo ${vars[0]} ${vars[1]}
