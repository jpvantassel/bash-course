#!/bin/bash

# Indexed Arrays

array=(e0 e1 e2)                        # Create an array with three entires.
echo ${array[1]}   # -> e1              # Index array.
echo ${array[@]}   # -> e0 e1 e2        # View array - as words.
echo ${#array[@]}  # -> 3               # Array size.
echo ${!array[@]}  # -> 0 1 2           # View array indices.
array[1]=spam                           # Replace entry.
array+=(e3 e4)                          # Append to array.
echo ${#array[@]}  # -> 5               # Echo array's size.
echo ${!array[@]}  # -> 0 1 2 3 4       # View array indices.
unset array[1]                          # Delete entry.
unset array                             # Delete entire array.

# Associative Arrays

declare -A assoc_array                    # Need to declare associative arrays.
assoc_array=([k0]=e0 [k1]=e1)             # Add two entries.
echo ${assoc_array[@]}     # -> e0 e1     # View array values.
echo ${!assoc_array[@]}    # -> k0 k1     # View array keys.
echo ${assoc_array["k0"]}  # -> e0        # View corresponding value.
