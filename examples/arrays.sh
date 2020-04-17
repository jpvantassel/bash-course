#!/bin/bash

array=(entry1 entry2 entry3)        # Create an array with three entires.
echo ${#array[@]}                   # --> 3 Echo array size.
array[1]=spam                       # Replace the second entry with spam.
echo ${array[@]}                    # Echo entire array - as words.
echo ${array[*]}                    # Echo entire array - as single word.
array+=(entry4 entry5)              # Append two new entries to the list.
echo ${#array[@]}                   # --> 5 Echo arrays new size.
echo ${!array[@]}                   # View array indices.
unset array[1]                      # Delete first entry


declare -A assoc_array                    # Have to declare associative arrays.
assoc_array=([key1]=entry1 [key2]=entry2) # Add two entries.
echo ${!assoc_array[@]}                   # View array keys.
echo ${assoc_array["key1"]}               # --> entry1 View corresponding value.
