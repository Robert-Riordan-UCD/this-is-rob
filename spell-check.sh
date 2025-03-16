# Clean before running
rm -f lnk*.dat traverse*.dat reject.dat words.txt unique_words.txt

# Get all pages
lynx -realm http:/localhost:1313/ -traversal -crawl http://localhost:1313/this-is-rob/

# Get all words
for page in lnk*.dat; do
    # 1. Upper to lower case
    # 2. Replace hyphens with spaces
    # 3. Remove links
    # 4. Replace Hugos ’ with '
        # NOTE: ’ is not '. Hugos inverted comma is not the one on my keyboard which was a nightmare to figure out
    # 5. Replace all remaining non alpha or ' characters with space
    # 6. Replace all spaces with a newline
    # 7. Remove all stray ' introduced when I remove Hugos ’
    # 8. Append to words.txt
    cat $page \
        | tr '[:upper:]' '[:lower:]' \
        | tr '-' ' ' \
        | sed -e 's/\[[^][]*\]//g' \
        | tr -s "’" "'" \
        | tr -cs "[:alpha:]'" ' ' \
        | sed 's/\s\+/\n/g' \
        | sed "s/^\w*'$//g" \
        >> words.txt
done

# Order words and remove duplicates
sort words.txt \
    | uniq \
    > unique_words.txt

# Spell check
cat /usr/share/dict/words \
    | tr '[:upper:]' '[:lower:]' \
    | sort -u \
    | comm -23 unique_words.txt - \
    | comm -23 - spell-check-ignore.txt \
    > spelling_errors.log

echo "Errors logged in        spelling_errors.log"
echo "Broken links logged in  traverse.errors"

# Clean up
rm -f lnk*.dat traverse*.dat reject.dat words.txt unique_words.txt