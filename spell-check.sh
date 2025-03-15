# Get all pages
lynx -realm http:/localhost:1313/ -traversal -crawl http://localhost:1313/this-is-rob/

# Get all words
for page in lnk*.dat; do
    # 1. Upper to lower case
    # 2. Replace hyphens with spaces
    # 3. Remove links
    # 4. Replace all remaining non alpha or ' characters with space
    # 5. Replcae all spaces with a newline
    # 6. Append to words.txt
    cat $page \
        | tr '[:upper:]' '[:lower:]' \
        | tr '-' ' ' \
        | sed -e 's/\[[^][]*\]//g' \
        | tr -cs '[:alpha:]' ' ' \
        | sed 's/\s\+/\n/g' \
        >> words.txt
done

# Order words and remove duplicates
sort words.txt \
    | uniq \
    > unique_words.txt

# Spell check
sort -u /usr/share/dict/words | 
comm -23 unique_words.txt - |
# Remove ignored words
comm -23 - spell-check-ignore.txt

# Clean up
rm -f lnk*.dat traverse*.dat traverse.errors reject.dat words.txt unique_words.txt