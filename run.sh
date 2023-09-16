#!/bin/bash

script_parent_dirname="$(dirname "$(readlink -f "$0")")"
$script_parent_dirname/bin/html.sh $script_parent_dirname/resume.md $script_parent_dirname/resume.html
$script_parent_dirname/bin/pdf.sh $script_parent_dirname/resume.html $script_parent_dirname/resume.pdf
