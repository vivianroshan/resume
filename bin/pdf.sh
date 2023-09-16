#!/bin/bash

export NODE_PATH="$(npm root -g)"
nodeScriptPath="$(dirname "$0")/saveWebsiteAsPDF.js"
realpath `node "$nodeScriptPath" "file://$1" "$2"`

