# Scratch

> Joseph P. Vantassel

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/Licence.md)

## About

This file includes code snippets, references, and/or ideas on various topics.
These topics may eventually be included in the bash tutorial, but for now are
too disorganized or incomplete to be included.

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