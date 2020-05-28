#! /bin/sh

hsh clone "git/simple_package/.git" || test_fail "clone failed"

echo "new file content" > "new file"

hsh add "simple_package" "new file" || test_fail "add failed"

hsh status "simple_package" --short 
hsh status "simple_package" --short | grep -q "^ *A *\"new file\"$" || test_fail "file not added"

