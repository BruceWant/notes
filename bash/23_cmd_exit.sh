#!/bin/bash


echo "test cmd exit status."
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Error"
else
    echo "Ok"
fi

echo "2.test cmd exit status."
retVal=$?
if [ $retVal -eq 0 ]; then
    echo "exit with 0. Ok"
else
    echo "Error"
fi
