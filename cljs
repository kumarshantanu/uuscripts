#!/usr/bin/env bash

###
# Start CLJS REPL using Node.js
#

target="$1"
if [ -z "$1" ]; then
  target="node"
fi

function nodeRepl {
  clj \
    -Sdeps '{:deps {org.clojure/clojurescript {:mvn/version "1.12.42"}}}' \
    -M -m cljs.main --repl-env node
}

function browserRepl {
  clj \
    -Sdeps '{:deps {org.clojure/clojurescript {:mvn/version "1.12.42"}}}' \
    -M --main cljs.main --repl-opts "{:launch-browser false}" --repl
}

function help {
  echo "Synopsis:  %0 [node|browser]"
  echo "Target must be 'node' (default) or 'browser'"
}

case "$target" in
"browser") browserRepl;;
"node") nodeRepl;;
*) help;;
esac

