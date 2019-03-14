OUTPUT="build"
OPTIONS_FILE="options.txt"
OPTIONS=""

while read -r line ; do
    OPTIONS="$OPTIONS$line "
done < "$OPTIONS_FILE"

find . -name *.md -print0 | while IFS= read -r -d '' file; do
    DIRECTORY=$(dirname "$file")
    NAME=$(basename "$file" .md)
    if [ ! -d "$OUTPUT/$DIRECTORY" ]; then
        mkdir -p "$OUTPUT/$DIRECTORY"
    fi
    pandoc $(echo $OPTIONS | xargs) "$file" -o "$OUTPUT/$DIRECTORY/$NAME.pdf"
done
