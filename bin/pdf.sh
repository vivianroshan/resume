
# Get the absolute paths of the files
file1abs=$(realpath "$1")

# Run the Node.js script with the absolute paths as arguments
export NODE_PATH="$(npm root -g)"
nodeScriptPath="$(dirname "$0")/saveWebsiteAsPDF.js"
realpath `node "$nodeScriptPath" "file://$file1abs" "$2"`

