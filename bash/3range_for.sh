#!/bin/bash

for i in {1..10}
do
	echo $i
done

echo +++++++++++++++++

stringName="a b c d e f"
# $stringName should not being quoted
for str in $stringName
do
    echo $str
done
