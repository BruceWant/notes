#!/bin/bash

for element in first second third
do
	echo "Element: $element"
done



for element in $(ls)
do
	echo "Element: $element"
done
