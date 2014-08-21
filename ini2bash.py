#!/usr/bin/env python

"""
Read STDIN parsing it as an INI file configuration and emit the same
as a BASH 4 map. Usage in BASH 4 scripts:
    declare -A config=`cat cfg.ini | ./ini2bash.py database`
    echo ${config["dbname"]}
"""

import sys
import ConfigParser


def parse_ini():
    config = ConfigParser.RawConfigParser()
    config.readfp(sys.stdin)
    return config


def emit_bashmap(config, section):
    print '(',
    for pair in config.items(sys.argv[1]):
        k, v = pair
        print '["%s"]="%s"' % (k, v),
    print ')'


def main():
    if len(sys.argv) != 2:
        print 'Synopsis: cat <filename>.ini | %s <section>' % sys.argv[0]
        print 'Example: cat /path/to/cfg.ini | %s database' % sys.argv[0]
        sys.exit(1)
    config = parse_ini()
    emit_bashmap(config, sys.argv[1])

if __name__ == "__main__":
    main()
