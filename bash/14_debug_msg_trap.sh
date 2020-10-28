#!/bin/bash
declare -t VARIABLE=value

trap "echo ARIABLE is being used here." DEBUG
VARIABLE=asldkf

