#!/usr/bin/env bash

###
# Start CLJS REPL using Node.js
#

clj \
  -Sdeps '{:deps {org.clojure/clojurescript {:mvn/version "1.12.42"}}}' \
  -M -m cljs.main --repl-env node

