#!/usr/bin/env bash

# Run this script with sudo
# See: https://bbs.archlinux.org/viewtopic.php?id=298056
# Run `free -h` to know how much memory/cache is free
echo 3 > /proc/sys/vm/drop_caches

