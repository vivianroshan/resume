param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$md_file,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$html_file
)

$md_file_abs = Get-Item -Path $md_file -ErrorAction Stop | Select-Object -ExpandProperty FullName

function ConvertTo-WSLPath {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$WindowsPath
    )
    
    if ($WindowsPath -match '^([A-Za-z]):(.*)$') {
        $drive = $matches[1]
        $path = $matches[2] -replace '\\', '/'
        $drive=$drive.ToLower()
        $wslPath = "/mnt/$drive$path"
        return $wslPath
    } else {
        Write-Error "Invalid Windows file path: $WindowsPath"
    }
}
$wslFilePath_md_file = ConvertTo-WSLPath -WindowsPath $md_file_abs
$pandoc_html = $PSScriptRoot+"\pandoc.html"
$wslFilePath_pandoc_html = ConvertTo-WSLPath -WindowsPath $pandoc_html

wsl.exe --exec pandoc $wslFilePath_md_file -o $wslFilePath_pandoc_html

if (Test-Path -Path $html_file -PathType Leaf) {
    rm -r $html_file
}

(cat.exe $PSScriptRoot/css.html && cat.exe $pandoc_html && echo.exe "</div> </body> </html>") >> $html_file

npx prettier --write $html_file

