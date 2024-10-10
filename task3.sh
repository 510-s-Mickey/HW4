#!/bin/bash

# First, use gawk to filter passengers in 2nd class who embarked at Southampton, ignoring the header
gawk -F, 'NR > 1 && $3 == 2 && $13 ~ /S/' titanic.csv | \
# Use sed to replace male with M, and female with F
sed -e 's/,male,/,M,/; s/,female,/,F,/' | \
# Use gawk to calculate the average age, only including non-empty values for the 7th column
tee >(gawk -F',' '$7 != "" {sum += $7; count++} END {if (count > 0) print "Average Age:", sum / count; else print "No passengers found."}') 

