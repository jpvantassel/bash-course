# Variables

> Joseph P. Vantassel, The University of Texas at Austin

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/LICENSE.md)

## Strings

Bash treats nearly everything as a string (i.e., plain text). unless you
explicitly tell it to treat it as something else (e.g., integer).

So here are a few things you can do with strings ...

### Concatenation

```bash
#!/bin/bash
a="Ta"                          # Define string Ta
b="Da"                          # Define string Da
c=$a$b                          # Define concatenation of a and b
echo $c                         # Show the concatenation-> TaDa
```

### Slicing Strings by Position

We can slice a string using indices. Using syntex like
`${string:<start>:<number>}` where `string` is our string variable, `start` is
the first element we wish to include (counting from zero), and `number` is the
number of elements we wish to have in our sliced string. Note that start can be
negative, meaning we count from the back of the string.

```bash
#!/bin/bash
string="This is a long string"  # Define a String

echo ${string:0:4}              # Echo the first 4 characters of string
# --> This

echo ${string: -6}              # Echo the last 6 characters. Note the space!
# --> string
```

Find the length of a string is easy with the `#` operator. It can also be useful
when we don't know (or care to count it manually) how long our string is for
slicing.

```bash
#!/bin/bash
string="This is a long string"  # Define a String

echo ${#string}                 # Echo the length of the String
# --> 21

echo ${string:0:${#string}-7}   # Echo the string minus the last 7 characters
# --> This is a long
```

### Slicing Strings By Pattern

Slicing a string using a pattern a.k.a. parameter expansion is an extremely
versatile tool, so be sure to pay special attention here.

```bash
#!/bin/bash
x=abcABC123ABCabc

echo ${x#a*b}                   # Delete shortest match from front
# --> cABC123ABCabc

echo ${x##a*b}                  # Delete longest match from front
# --> c

echo ${x%b*c}                   # Delete shortest match from back
# --> abcABC123ABCabc

echo ${x%%b*c}                  # Delete longest match from back
# --> a
```

A more practical example.

```bash
#!/bin/bash
file=/user/johndoe/c/interesting/info.txt

path=${file%/*}                 # Delete everything after and including the last "/"
echo ${path}
# --> /user/.../interesting

name=${file##*/}                # Delete everything before and including the last "/"
echo ${name}
# --> info.txt

end=${name##*.}                 # Delete everything before and including the last "."
echo ${end}
# --> txt

short=${name%%.*}               # Delete everything after and including the last "."
echo ${short}
# --> info
```

#### Replacing Text

```bash
#!/bin/bash
string="This is a long string"  # Define a String
echo ${string/i/!}              # Replace first instance of i with !
# --> Th!s is a long string

echo ${string//i/!}             # Replace all instances of i with !
# --> Th!s !s a long str!ng

echo ${string/#T/B}             # Replace T at start of string with B
# --> Bhis is a long string

echo ${string/%ng/foo}          # Replace ng at end of string with foo
# --> This is a long strifoo

echo ${string/s*/blah}          # Replace s followed by char(s) blah
# --> Thiblah
```

<!-- ### Command Substitution -> TODO
```bash
cdir=$(pwd)
#     |___|  -> runs commands
#   |______| -> specifies to variable
``` -->

## Additional Information

### Declaration

You may declare variables, however it is not required. As stated previously
almost everything will be treated like a string unless you tell Bash otherwise
explicitly.

```bash
declare -i                      # Declare as integer
declare -r                      # Declare as readonly
declare -l                      # Declare as lowercase
declare -u                      # Declare as UPPPERCASE
declare -a                      # Declare an indexed array
declare -A                      # Declare an associative array
```

### Some Useful Default variables

```bash
echo $HOME                      # Echo home directory
echo $PWD                       # Echo current working directory
echo $MACHTYPE                  # Echo machine type
echo $SECONDS                   # Echo seconds since program started
echo $BASH_VERSION              # Echo bash version
```

## Sources

[string manipulation](http://tldp.org/LDP/abs/html/string-manipulation.html)
