# Scratch

> Joseph P. Vantassel

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/Licence.md)

## About

This file includes code snippets, references, and/or ideas on various topics.
These topics may eventually be included in the bash tutorial, but for now are
too disorganized or incomplete to be included.

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


## To get the current date

```bash
echo $(date)  # Note () not {}
```

[Getting the Current Date](https://www.cyberciti.biz/faq/unix-linux-getting-current-date-in-bash-ksh-shell-script/)

## Parentheses vs Braces

Braces are for variable dis-ambiguation.

Parenthesis are to evaluate the entry (e.g., $(date)) and is equivalent to the now depricated back ticks (e.g., `date`).

[Stack Overflow: ${} and $()](https://stackoverflow.com/questions/27472540/difference-between-and-in-bash/27472808)

[Stack Overflow: Backticks vs braces](https://stackoverflow.com/questions/22709371/backticks-vs-braces-in-bash)

## rsync

[Protect Folders on Destination](https://unix.stackexchange.com/questions/278561/how-to-tell-rsync-not-to-delete-some-folders-at-destination)

[Exclude Files / Folders](https://www.thegeekstuff.com/2011/01/rsync-exclude-files-and-folders/)