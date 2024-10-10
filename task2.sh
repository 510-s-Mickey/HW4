#!/bin/bash

printf "%-12s %-10s %-s\n" "CSC510_Count" "FileSize" "FileName"
grep -l "sample" dataset1/* | xargs -I {} sh -c 'count=$(grep -o "CSC510" "{}" | wc -l);
if [ $count -ge 3 ]; then
  printf "%-12d %-10d %-s\n" "$count" "$(stat -c%s "{}")" "{}";
fi' | uniq | \
sort -t, -k1,1nr -k2,2nr | \
sed -E 's/file_/filtered_/'
