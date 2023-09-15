#!/bin/bash

md_file_abs=$(realpath "$1")

script_parent_dirname="$(dirname "$(readlink -f "$0")")"
pandoc_html="$script_parent_dirname/pandoc.html"

pandoc "$1" -o "$pandoc_html"

(cat "$script_parent_dirname/css.html" && cat "$pandoc_html" && echo "</div> </body> </html>") > "$2"

if [[ -f "$pandoc_html" ]]; then
    rm -r "$pandoc_html"
fi
