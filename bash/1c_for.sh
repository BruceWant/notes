#!/bin/bash

for ((i = 1; i<=10; i+=1)); do
	echo $i
done



for i in `seq 1 10`; do
	echo $i
done

st="This is a sentence."

echo $st

for i in $st; do
	echo $i
done
