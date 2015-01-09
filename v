#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Synopsis: $0 [opts] file-or-dir-path" 1>&2
  exit 1
fi

FILE_OR_DIR="${@: -1}"
if [ -z "$FILE_OR_DIR" ]; then
  echo "Unable to determine file-or-dir-path" 1>&2
  exit 1
fi

if [ -d "$FILE_OR_DIR" ]; then
  # Presence of the file /etc/issue implies Linux. Another way to detect is to
  # inspect the value of $OSTYPE.
  if [ -f /etc/issue ]; then  # then assume Linux
    COLOR="--color=auto"
  else
    COLOR="-G"
  fi
  ls $COLOR -l "$@"
elif [ -f "$FILE_OR_DIR" ]; then
  less "$@"
else
  echo "$FILE_OR_DIR is neither directory not file" 1>&2
  exit 1
fi

