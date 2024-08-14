#!/usr/bin/env bash

function help() {
  echo "ERROR: Insufficient arguments"
  echo "$0 <PEM-file> [user@]hostname"
}

if [ -z "$1" ] || [ -z "$2" ]; then
  help
  exit 1
fi

ssh -o IdentitiesOnly=yes -i "$@"

