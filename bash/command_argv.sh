#!/bin/bash

# command: bash -x command_line.sh 55 169

# This script prints a message about your weight if you give it your
# weight in kilos and height in centimeters.

weight="$1"
height="$2"
total="$#"
idealweight=$[$height - 110]

if [ $weight -le $idealweight ] ; then
  echo "You should eat a bit more fat."
else
  echo "You should eat a bit more fruit."
fi
