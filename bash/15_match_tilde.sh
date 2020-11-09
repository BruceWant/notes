#!/bin/bash

# equal tilde =~ means match the regex of the right of it.
if [[ $1 =~ ^[1-9]+[0-9]*$ ]]; then
    echo "$1 is number"
else
    echo "$1 is not number"
fi
