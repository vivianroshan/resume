param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$md_file,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$html_file
)

$md_file_abs = Get-Item -Path $md_file -ErrorAction Stop | Select-Object -ExpandProperty FullName

$pandoc_html = $PSScriptRoot+"\pandoc.html"

pandoc $md_file -o $pandoc_html

if (Test-Path -Path $html_file -PathType Leaf) {
    rm -r $html_file
}

(Get-Content -Path $PSScriptRoot/css.html && Get-Content -Path $pandoc_html && Write-Output "</div> </body> </html>") >> $html_file

if (Test-Path -Path $pandoc_html -PathType Leaf) {
    rm -r $pandoc_html
}

