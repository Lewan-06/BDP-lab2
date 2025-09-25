#!/usr/bin/env bash
# This program should take an fileIn as first parameter
# It takes the input text file and outputs the 5 most common word bigrams (https://en.wikipedia.org/wiki/Bigram) in the file.
# Your solution should be case insensitive.
#
# example: when `./bigrams.sh ../data/myBook/01-chapter1.txt' is ran the output should look like this:
#   3 the     little
#   3 little  blind
#   3 blind   text
#   2 the     word
#   2 the     copy

file="$1"

cat "$file" | sed 's/[^a-zA-Z0-9 ]//g' |  awk '{for(i=1;i<NF;i++) print $i " "  $(i + 1)}' | tr [A-Z] [a-z] | sort | uniq -c | sort -r | head -n 5
