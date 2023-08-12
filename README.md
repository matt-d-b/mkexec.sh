# mkexec.sh

> #### _Simple bash script to make something (a file) executable._
> * _make_ (`mk...`) + _executable_ (`...exec`)

## Overview

Takes one or more arguments/options to make one or more file-items executable within a shell enviroment.

## Install

<!--! FIX ME -->
### Quick, one-liner install

```sh
curl https://github.com/matt-d-b/...
```

<!--! FIX ME -->
### From source

```sh
git clone https://github.com/...
mv mkexec.sh ~/bin/mkexec
chmod +x mkexec
```
<!--! FIX ME -->
## Usage

```sh
mkexec [OPTS] [ARGS]
# where [ARGS] is a FILE or SERIES OF FILES...
# or [OPTS] is ONE of the following:
#   -h, --help,
#   -v, --version,
#   -c, --current-directory
#   -d, --directory
#       WHILE : [ARGS] is a DIRECTORY (PATH)
#   -R, --recursive
#       WITH : =d, --directory [PATH]
#              -c, --current-directory
#
```