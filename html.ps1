param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$md_file,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$pdf_file
)

$md_file_abs = Get-Item -Path $md_file -ErrorAction Stop | Select-Object -ExpandProperty FullName
$pandoc_html = "./pandoc.html"
$temp_html = "./temp.html"

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
wsl.exe --exec pandoc $wslFilePath_md_file -o $pandoc_html

rm -r $temp_html

(cat.exe css.html && cat.exe $pandoc_html && echo.exe "</div> </body> </html>") >> $temp_html

npx prettier --write $temp_html

