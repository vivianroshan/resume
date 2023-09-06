
# Get the absolute paths of the files
file1abs=$(realpath "$1")

# Run the Node.js script with the absolute paths as arguments
nodeScriptPath="$(dirname "$0")/saveWebsiteAsPDF.js" # Replace with the actual path to your Node.js script
realpath `node "$nodeScriptPath" "file://$file1abs" "$2"`

