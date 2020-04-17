# Mathmatical Operations

> Joseph P. Vantassel, The University of Texas at Austin

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/LICENSE.md)

## Arithmetic Operations

Bash can perform some limited integer arithmetic operations. Do not use `bash`
for floating point arithmetic or serious scientific computations. Although there
are libraries for handling floating point calculations in `bash` such as `bc`
which you can pipe to if its absolutely necessary (e.g., `echo 1/3 | bc -l`).
This, however, is strongly not recommended.

```bash
#!/bin/bash
val=23
echo $val       # --> val=23

val=$((++val))  # Pre-increment does effect assigned value
echo $val       # --> val=24

val=$((--val))  # Pre-decrement does effect assigned value
echo $val       # --> val=23

aa=$((val++))   # Post-increment does not effect assigned value
echo $aa        # --> aa=23
echo $val       # --> val=24

bb=$((val--))   # Post-decrement does not effect assigned value
echo $bb        # --> bb=24
echo $val       # --> val=23  

val=$((val+=3))
echo $val       # --> val=26

val=$((val/=2))
echo $val       # --> val=13

val=$((val*=4))
echo $val       # --> val=52

val=$((val-=2))
echo $val       # --> val=50
```

## Comparison Operations

Perform comparisons between two variables.

### String Comparisons

`[[ A symbol B ]]` <-- Note the spaces, FALSE==1, TRUE==-0!

Symbols

- __<__  <-- Less than
- __>__  <-- Greater than
- __<=__ <-- Less than or equal to
- __>=__ <-- Greater than or equal to
- __==__ <-- Equal
- __!=__ <-- Not equal

### Integer Comparison

`[[ A symbol B ]]` <-- Note the spaces, FALSE==1, TRUE==-0!

Symbols

- __-lt__  <-- Less than
- __-gt__  <-- Greater than
- __-le__ <-- Less than or equal to
- __-ge__ <-- Greater than or equal to
- __-eq__ <-- Equal
- __-ne__ <-- Not equal

More Complex Conditions

Symbols

- __&&__  <-- And
- __||__  <-- Or
- __!__   <-- Not
- __-z__  <-- Null?
- __-n__  <--Not null?

<!-- ```bash
#!/bin/bash
MakeAnExample="TODO"
``` -->
