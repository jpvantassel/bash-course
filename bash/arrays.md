# Arrays

> Joseph P. Vantassel, The University of Texas at Austin

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/LICENSE.md)

Arrays are not widely used in `bash` however they can be quite useful
especially while performing loop operations.

There are two types of arrays in `bash`:

- __Indexed Arrays__: Vector array, where indices are integers [0..N], and
- __Associative Arrays__: Similar to maps or dictionaries in other languages.
Each entry is a key-value pair. The order is not guaranteed.

## Indexed Arrays

```bash
array=(e0 e1 e2)                          # Create an array with three entires.
echo ${array[1]}   # -> e1                # Index array.
echo ${array[@]}   # -> e0 e1 e2          # View array - as words.
echo ${#array[@]}  # -> 3                 # Array size.
echo ${!array[@]}  # -> 0 1 2             # View array indices.
array[1]=spam                             # Replace entry.
array+=(e3 e4)                            # Append to array.
echo ${#array[@]}  # -> 5                 # Echo array's size.
echo ${!array[@]}  # -> 0 1 2 3 4         # View array indices.
unset array[1]                            # Delete entry.
unset array                               # Delete entire array.
```

## Associative Arrays

```bash
declare -A assoc_array                    # Need to declare associative arrays.
assoc_array=([k0]=e0 [k1]=e1)             # Add two entries.
echo ${assoc_array[@]}     # -> e0 e1     # View array values.
echo ${!assoc_array[@]}    # -> k0 k1     # View array keys.
echo ${assoc_array["k0"]}  # -> e0        # View corresponding value.
```

## Sources

[bash arrays](https://linuxconfig.org/how-to-use-arrays-in-bash-script)
