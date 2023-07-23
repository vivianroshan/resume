param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]$file1,

    [Parameter(Mandatory=$true, Position=1)]
    [string]$file2
)

# Get the absolute paths of the files
$file1abs = Get-Item -Path $file1 -ErrorAction Stop | Select-Object -ExpandProperty FullName
# Run the Node.js script with the absolute paths as arguments
$nodeScriptPath = $PSScriptRoot+"\saveWebsiteAsPDF.js" # Replace with the actual path to your Node.js script
node $nodeScriptPath $file1abs $file2
