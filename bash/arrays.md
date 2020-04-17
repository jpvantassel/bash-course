# Arrays

> Joseph P. Vantassel, The University of Texas at Austin

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/LICENSE.md)

Arrays are not widely used in `bash` however they can be quite useful
especially while performing loop operations.

There are two types of arrays in `bash`:

- __Indexed Arrays__: Vector array, where indices are integers [0..N].
- __Associative Arrays__: Similar to maps or dictionaries in other languages.
Each entry is a key-value pair. The order is not guaranteed.

## Indexed Arrays

```bash
array=(entry1 entry2 entry3)        # Create an array with three entires.
echo ${#array[@]}                   # --> 3 Echo array size.
array[1]=spam                       # Replace the second entry with spam.
echo ${array[@]}                    # Echo entire array - as words.
echo ${array[*]}                    # Echo entire array - as single word.
array+=(entry4 entry5)              # Append two new entries to the list.
echo ${#array[@]}                   # --> 5 Echo arrays new size.
echo ${!array[@]}                   # View array indices.
unset array[1]                      # Delete first entry
unset array                         # Delete the entire array
```

## Associative Arrays

```bash
declare -A assoc_array                    # Have to declare associative arrays.
assoc_array=([key1]=entry1 [key2]=entry2) # Add two entries.
echo ${!assoc_array[@]}                   # View array keys.
echo ${assoc_array["key1"]}               # --> entry1 View corresponding value.
```

## Sources

[bash arrays](https://linuxconfig.org/how-to-use-arrays-in-bash-script)
