#!/usr/bin/bash

file_name=test_file

# 1. IFS= (or IFS='') prevents leading/trailing whitespace
#   from being trimmed
# 2. -r prevents backslash escapes from being interpreted
while IFS='' read -r line; do
  # The following two lines do not print the same formatting.
  echo $line >> test_file_copy
  echo "$line" >> test_file_copy
  #printf '%s\n' "$line"
done < "$file_name"

