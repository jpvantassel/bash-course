# Bash Basics

> Joseph Vantassel, The University of Texas at Austin

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/Licence.md)

## Command Line Basics

```bash
man <command>               # Display manual information for command
man bash                    # Display manual on bash
echo $BASH_VERSION          # Echo bash version number to screen
ls -l                       # List directory contents (-l is for long listing)
rmdir <dirname>             # Remove directory
clear                       # Clear terminal
cat <file>                  # Concatenate file(s) and print to stdout
head <file>                 # Show the first few lines of a file
tail <file>                 # Show the last few lines of a file
more <file>                 # Show entire file page by page
```

### Tilde

```bash
~                           # Variable for home directory (e.g. cd ~)
~-                          # Variable for previous directory
```

### Brace Expansion

Below is an example script illustrating the usefulness of brace expansion.

```bash
#!/bin/bash
mkdir 0_examples
cd 0_examples
touch {1,2,3}.foo             # Simple array
touch {5..10}.bar             # Array with the interpolation done for you
touch {20..15..2}.spam        # Different steps
touch {01..10}.num            # Append zero to start
touch {A..Z..5}.letter        # Also works for letters
```

Note that brace expansion is inclusive. Meaning `{1..3}` will produce `1 2 3`.

### Pipes

Pipes allow you to string together `bash` commands/tools for more complex
behavior.

```bash
ls | more                     # List out current directory, page by page.

touch {1..10}.txt             # Create 10 files
ls -l *.txt | wc -l           # List contents by line, then count by line
```

### Redirects

Redirects allow you to capture stdout and stderr from a command and
pass it somewhere else (e.g., to a log file).

```bash
ls > file.ouput               # Pass only stdout to file.output
ls 2> file.error              # Pass only stderr to file.error
ls &> file.both               # Pass both stdout and stderr to file.both
ls &> dev/null                # Ignore stdout and stderr
```

All of the above commands will start a new file (i.e., overwrite). If you
want to append to the file replace `>` with `>>`.

### File Permissions

Each file has a permission (e.g., read, write, and execute).

```bash
chmod [ugoa][+-=][rwxst]      # [ugoa] User, Group, Other, All
# [+=-] Add, Equal, Remove
# [rwxst] Read, Write, Execute, Set User/Group ID on Execute, Restricted deletion flag or sticky bit.
```

Can also use binaries to set the permissions

```bash
# _ _ _ ---> Treat like binary, so use numbers 0 to 7
# r w x
chmod 777                     # chmod a+rwx
chmod 700                     # chmod a-rwx, chmod u+rwxs
chmod 710                     # chmod u=rwx, chmod g+
```

### grep

grep is a command line tool for finding patterns in plain text. grep
stands for (globally search a reguar expression and print).

```bash
grep <find> <filename>        # Searches a particular filename
grep <find> *                 # Search all files in the current directory
grep <find> -r *              # Search all files recursively

grep -i <find> <filename>     # Case insensitive
grep -e <find> <filename>     # Find regular expression
```

To learn more about regular expressions see
[regexone](https://regexone.com/) for an excellent tutorial.

<!-- ### awk
TODO
```bash
```` -->

## Scripting Basics

### Setting up a shell script

```bash
#!/bin/bash

bash <script.sh>              # Send script to bash
./<script.sh>                 # Current directory is not part of path
```

### echo

`echo` can be used to print information to `stdout`.

```bash
echo statement                # Prints as it finds it (can be ambiguous)
echo 'statement'              # Not interpreted (like a string in other languages)
echo "statement"              # Strong quotes which is interpreted
```

### Variables

May declare variables, but it is not required.

```bash
declare -i                    # Declare as integer
declare -r                    # Declare as readonly
declare -l                    # Declare as lowercase
declare -u                    # Declare as UPPPERCASE
```

Some standard variables.

```bash
echo $HOME                    # Echo home directory
echo $PWD                     # Echo current working directory
echo $MACHTYPE                # Echo machine type
echo $SECONDS                 # Echo seconds since program started
echo $BASH_VERSION            # Echo bash version
```

Simple script

```bash
#/bin/bash
echo $HOME                    # Echo home directory
echo $PWD                     # Echo current working directory
echo $MACHTYPE                # Echo machine type
echo $SECONDS                 # Echo seconds
echo $BASH_VERSION            # Echo bash version
touch {1..10000}.txt
rm *.txt
echo $SECONDS
touch {1..10000}.txt
rm *.txt
echo $SECONDS
```

### Strings

Bash treats nearly everything as a string (i.e., plain text). unless you
explicitly tell it to treat it as something else (e.g., integer).

#### Concatenation

```bash
#!/bin/bash
a="Ta"                        # Define string Ta
b="Da"                        # Define string Da
c=$a$b                        # Define concatenation of a and b
echo $c                       # Show the concatenation
```

#### Slicing Strings by Position

```bash
#!/bin/bash
string="This is a long string"# Define a String

# Length of string
echo ${#string}               # Echo the length of the String

# String Slicing
# ${string:START:NUMBER} -> START can be negative
echo ${string:0:4}            # Echo the first 4 characters of the String
echo ${string:0:${#string}-6} # Echo the string minus the last 6 characters
echo ${string: -6}            # Echo the last 6 characters -> Note the space!
```

#### Slicing Strings By Pattern (Parameter Expansion)

```bash
#!/bin/bash
x=abcABC123ABCabc
echo ${x%b*c}   # --> abcABC123ABCabc Delete shortest match from back
echo ${x%%b*c}  # --> a               Delete longest match from back
echo ${x#a*b}   # --> cABC123ABCabc   Delete shortest match from front
echo ${x##a*b}  # --> c               Delete longest match from front
```

A more practical example.

```bash
#!/bin/bash
file=/user/johndoe/c/interesting/info.txt    # We have the path to our file
path=${file%/*}                              # Return file path
echo ${path}   # --> /user/.../interesting
name=${file##*/}                             # Delete file path, leave file name
echo ${name}   # --> info.txt
end=${name##*.}
echo ${end}    # --> txt
short=${name%%.*}
echo %{short}   # --> info
```

#### Replacing Text

```bash
#!/bin/bash
string="This is a long string" # Define a String
echo ${string/i/!}             # Replace first instance of i with !
echo ${string//i/!}            # Replace all instances of i with !
echo ${string/#T/B}            # Replace T at start of string with B
echo ${string/%ng/foo}         # Replace ng at end of string with foo
echo ${string/s*/blah}         # Replace s followed by char(s) blah
```

<!-- ### Command Substitution -> TODO
```bash
cdir=$(pwd)
#     |___|  -> runs commands
#   |______| -> specifies to variable
``` -->

### Arithmetic Operations

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

### Comparison Operations

Perform comparisons between two variables.

#### String Comparisons

`[[ A symbol B ]]` <-- Note the spaces, FALSE==1, TRUE==-0!

Symbols

- __<__  <-- Less than
- __>__  <-- Greater than
- __<=__ <-- Less than or equal to
- __>=__ <-- Greater than or equal to
- __==__ <-- Equal
- __!=__ <-- Not equal

#### Integer Comparison

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

## Styling

### Coloring Text

You can color and style text in Bash shell for error messages etcetra.

Here is a simple example:

```Bash
#!/bin/bash
echo -e '\033[34;42;4m Blue on Green \033[0m'
```

- `-e` informs echo that the following string contains an escape sequence.
- `\033` is the escape string other options include `\e`, `\x1B`.
- `[34;42;4m` denotes the formating 34=foreground, 42=background, 4=format.
- `Blue on Green` denotes the text to be formatted.
- `\033` is again an escape string.
- `[0m` is a formatting string to return later text to default.

Some more example:

```bash
#!/bin/bash
echo -e '\e[90;49mGray on Black\e[0m'
echo -e '\e[34;100mBlue on Gray\e[0m'
echo -e '\033[38;34;4mUnderlined Blue on Black\033[0m'
echo -e '\e[34;100;5mBlinking Blue on Gray\e[0m'
```

A full list of coloring and styling options can be found
[here](https://misc.flogisoft.com/bash/tip_colors_and_formatting).

## Character Usage

Bash uses many of the same characters for different that only become obvious
based on their context. This section will include commonly used characters and
what they may be used for. This is certainly not an exhaustive list.

### Braces { }

Braces can be used to:

- Delimit variables unambiguously. `a="Ta"; b="Da"; ab="Foo"; c=${a}${b} not c=ab`.
- Slice strings: `lstring="This That These"; this=${lstring:0:4}`.
- Make substitutions, like `sed`
- Use a default value.
- Brace expansion.

### Parentheses ( )

Parentheses __( )__ can be used to:

- Define an array of values. `x=( 1 2 3 4 5 6 ); echo ${x[3]}`.

Double Parentheses __(( ))__ creates a sub-shell and can be used to:

- Define arithmetic operations.
- Allow omission of dollar signs on integer Variables.
- Allow the inclusion of spaces around operators.
- `a=5; b=10; c=$(( a * b )); echo ${c}`

### Bracket [ ]

Brackets __[ ]__ can be used to:

- Define an if conditions. `x=1; if [[ x -lt 5 ]]; then echo "..."; fi`.
- Call a program name.

Double Brackets __[[ ]]__ is very similar to single brackets __[ ]__, but double
brackets __[[ ]]__ are a bash built-in and are therefore saver and less general
than single brackets __[ ]__ and should generally be preferred. A more thorough
discussion code be found [here](http://mywiki.wooledge.org/BashFAQ/031).

## Sources

[chmod](https://ss64.com/bash/chmod.html)

[string manipulation](http://tldp.org/LDP/abs/html/string-manipulation.html)

[color and styling](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
