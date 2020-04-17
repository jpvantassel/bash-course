# Styling

> Joseph P. Vantassel, The University of Texas at Austin

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://github.com/jpvantassel/bash-course/blob/master/LICENSE.md)

## Coloring Text

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

## Sources

[color and styling](https://misc.flogisoft.com/bash/tip_colors_and_formatting)
