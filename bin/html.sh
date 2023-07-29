#!/bin/zsh

md_file_abs=$(realpath "$1")

pandoc_html="${0:a:h}/pandoc.html"

pandoc "$1" -o "$pandoc_html"

(cat "$0:a:h/css.html" && cat "$pandoc_html" && echo "</div> </body> </html>") > "$2"

if [[ -f "$pandoc_html" ]]; then
    rm -r "$pandoc_html"
fi
