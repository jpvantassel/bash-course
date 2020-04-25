# Getting Started

> Joseph P. Vantassel, The University of Texas at Austin

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/LICENSE.md)

## The Shell

Before jumping into the Bourne Again Shell (Bash), let's cover the basic
terminology and clear up any misconceptions.

_What is the shell?_ The shell is the interface between the user and the kernel.
Think of the shell as a program which translates human-understandable commands
to computer-understandable commands. The user interacts with the shell using
the terminal either directly by typing commands or indirectly by executing
shell scripts (i.e., written and reusable shell instructions).

_What is the kernel?_ The kernel is part of the operating system that manages
the computer's CPU(s), memory, and devices. Users generally do not interact with
the kernel directly, but rather use the shell as an intermediary.

_What is Bash?_ Bash is a type of shell. There are many different shells from
which to choose, however Bash is by far the most popular.

In summary, the user interacts through the terminal with the shell. This shell
is most typically the Bourne Again Shell (Bash), though it does not have to be.
The shell translates the user commands into instructions to the kernel. The
kernel then manages the low-level operations which include the computer's
CPU(s), memory, and devices.

## Command Line Basics

```bash
man <command>               # Display manual information for command
man bash                    # Display manual on bash
echo $BASH_VERSION          # Print bash version number to screen
ls -l                       # List directory contents (-l is for long listing)
rmdir <dirname>             # Remove directory
clear                       # Clear terminal
cat <file>                  # Concatenate file(s) and print to stdout
head <file>                 # Show the first few lines of a file
tail <file>                 # Show the last few lines of a file
more <file>                 # Show entire file page by page
```

## The Tilde

```bash
~                           # Variable for home directory (e.g. cd ~)
~-                          # Variable for previous directory
```

## Brace Expansion

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

## Pipes

Pipes allow you to string together `bash` commands/tools for more complex
behavior.

```bash
ls | more                     # List out current directory, page by page.

touch {1..10}.txt             # Create 10 files
ls -l *.txt | wc -l           # List contents by line, then count by line
```

## Redirects

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

## File Permissions

Each file has a permission (e.g., read, write, and execute).

```bash
chmod [ugoa][+-=][rwxst]
# [ugoa] User, Group, Other, All
# [+=-] Add, Equal, Remove
# [rwxst] Read, Write, Execute, Set ID on Execute, Restricted deletion flag.
```

Can also use binaries to set the permissions

```bash
# _ _ _ ---> Treat like binary, so use numbers 0 to 7
# r w x
chmod 777                     # chmod a+rwx
chmod 700                     # chmod a-rwx, chmod u+rwxs
chmod 710                     # chmod u=rwx, chmod g+
```

## grep

grep is a command line tool for finding patterns in plain text. grep
stands for (globally search a regular expression and print).

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

## Sources

[chmod](https://ss64.com/bash/chmod.html)

[redirects](https://askubuntu.com/questions/420981/how-do-i-save-terminal-output-to-a-file)
