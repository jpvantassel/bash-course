# Scripting

> Joseph P. Vantassel, The University of Texas at Austin

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/LICENSE.md)

## Setting up a shell script

```bash
#!/bin/bash

bash <script.sh>              # Send script to bash
./<script.sh>                 # Current directory is not part of path
```

## echo

`echo` can be used to print information to `stdout`.

```bash
echo statement                # Prints as it finds it (can be ambiguous)
echo 'statement'              # Not interpreted (like a string in other languages)
echo "statement"              # Strong quotes which is interpreted
```

## A Simple Script

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
