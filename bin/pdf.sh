
# Get the absolute paths of the files
file1abs=$(realpath "$1")
file2abs=$(realpath "$2")

# Run the Node.js script with the absolute paths as arguments
nodeScriptPath="$(dirname "$0")/saveWebsiteAsPDF.js" # Replace with the actual path to your Node.js script
node "$nodeScriptPath" "file://$file1abs" "$file2abs"

