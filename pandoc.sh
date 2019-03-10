OUTPUT="build"

find . -name *.md -print0 | while IFS= read -r -d '' file; do
    DIRECTORY=$(dirname "$file")
    NAME=$(basename "$file" .md)
    if [ ! -d "$OUTPUT/$DIRECTORY" ]; then
        mkdir -p "$OUTPUT/$DIRECTORY"
    fi
    pandoc "$file" -o "$OUTPUT/$DIRECTORY/$NAME.pdf"
done
