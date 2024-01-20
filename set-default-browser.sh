#!/usr/bin/env bash

# Switch default browser - Ubuntu/Linux only

set -e

function switchBrowser() {
  installed=$(find /usr | grep -i .desktop | grep \
    -e chrome -e brave -e firefox -e opera -e edge -e chromium)
  declare -A browsers
  for a in $installed; do
    local browserFile=$(basename $a)
    local browserName=$(basename $a ".desktop")
    browsers[$browserName]=$browserFile
  done
  local browserNames=${!browsers[@]}
  local browserFiles=${browsers[@]}
  #exit 1
  current=$(xdg-settings get default-web-browser)
  local opts=( )
  for a in $browserNames; do
    opts+=( "$a" )
  done
  local input=$(zenity --title="Switch Browser to" \
                       --window-icon=question \
                       --text="Current:\n$current" \
                       --height=400 \
                       --list --column="Options" "${opts[@]}")
  if [ ! -z "$input" ]; then
    local browserFile=${browsers[$input]}
    if [ ! -z "$browserFile" ]; then
      xdg-settings set default-web-browser $browserFile
      echo "Selected: $browserFile"
    fi
  else
    return 1
  fi
}


while true; do
  switchBrowser || exit
done
