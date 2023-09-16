script_parent_dirname="$(dirname "$(readlink -f "$0")")"
$script_parent_dirname/bin/html.sh resume.md resume.html
$script_parent_dirname/bin/pdf.sh resume.html resume.pdf
